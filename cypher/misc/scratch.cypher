//Delete everything
	MATCH (n)
	DETACH DELETE n

Find Characters that have substates:
	MATCH (c:Character)-[r:STATE_OF*2..10]-(s:State) RETURN c

Show Character and states/substates for Characters with substates:
	MATCH (c:Character)-[:STATE_OF*2..10]-(:State)
	WITH c.characterID AS c_id
	MATCH (character:Character {characterID: c_id})-[state_of:STATE_OF*1..10]-(state:State)
	RETURN character,state_of,state

Show Character and states/substates for Characters with substates, separated by Schema:
	MATCH (c:Character)-[:STATE_OF*2..10]-(:State)
	WITH c.characterID AS c_id
	MATCH (character:Character {characterID: c_id})-[state_of:STATE_OF*1..10]-(state:State),
	(character)-[character_of:CHARACTER_OF]->(schema:Schema)
	RETURN character,state_of,state,character_of,schema


???
	MATCH (c:Character)-[:STATE_OF*2..10]-(:State)
	WITH c.characterID AS c_id
	MATCH (character:Character {characterID: c_id})-[state_of:STATE_OF*1..10]-(state:State),
	(character)-[character_of:CHARACTER_OF]->(schema:Schema),
    (schema)<-[cited_by:CITED_BY]-(reference:Reference)
	RETURN character,state_of,state,character_of,schema,reference

//Show entire Schema (10 deep on States should be plenty)
	MATCH
		(schema:Schema {title: "Cornell, 2009"}),
		(character:Character)-[character_of:CHARACTER_OF]->(schema),
		(state:State)-[state_of:STATE_OF*1..10]->(character)
	RETURN schema, character_of, character, state_of, state

Show OTU complex:
	MATCH
		(otu:OTU {name: 'Cornus hyperborea'})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (ci)-[hasState:HAS_STATE]->(state:State)
	RETURN
		otu, defined_by, characterInstance, instanceOf, character, hasState, state

	MATCH
		(otu:OTU {name: 'Archeampelos acerifolia'})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (characterInstance)-[hasState:HAS_STATE]->(state:State)
	RETURN
		otu, defined_by, characterInstance, instanceOf, character, hasState, state

To add specimens to above:
	MATCH
		(otu:OTU {name: 'Cornus hyperborea'})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (characterInstance)-[hasState:HAS_STATE]->(state:State),
		(otu)<-[exampleOf:EXAMPLE_OF]-(specimen:Specimen)
	RETURN
		otu, defined_by, characterInstance, instanceOf, character, hasState, state, exampleOf, specimen

	MATCH
		(otu:OTU {name: 'Chaetoptelea microphylla'})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (characterInstance)-[hasState:HAS_STATE]->(state:State),
		(otu)<-[exampleOf:EXAMPLE_OF]-(specimen:Specimen)
	RETURN
		otu, defined_by, characterInstance, instanceOf, character, hasState, state, exampleOf, specimen

	MATCH
		(otu:OTU {name: 'Archeampelos acerifolia'})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (characterInstance)-[hasState:HAS_STATE]->(state:State),
		(otu)<-[exampleOf:EXAMPLE_OF]-(specimen:Specimen)
	RETURN
		otu, defined_by, characterInstance, instanceOf, character, hasState, state, exampleOf, specimen

To look at specimens:
	MATCH
		(specimen:Specimen)-[r]-(n)
	RETURN
		specimen, r, n

To look at specific specimen:
	MATCH
		(specimen:Specimen)-[EXAMPLE_OF]->(otu:OTU {name: 'Cornus hyperborea'}),
		(specimen)-[r]-(n)
	RETURN
		specimen, r, n, otu

match
	(otu:OTU {name: 'Cornus hyperborea'})-[DEFINED_BY*1..100]-(characterInstance:CharacterInstance)
return
	otu, characterInstance





//Test a new specimen Description complex against existing Description complexes using a Jaccard comparison on the States
MATCH
	(specimen:Specimen {name:"68"})-[:DESCRIBED_BY]->(otu1:OTU)-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character), (characterInstance)-[hasState:HAS_STATE]->(state:State)
WITH
	//otu1, collect([characterInstance, instanceOf, character, hasState, state]) AS description1
	specimen, otu1, collect(id(state)) AS description1
MATCH
    (otu2:OTU)-[defined_by2:DEFINED_BY]->(characterInstance2:CharacterInstance)-[instanceOf2:INSTANCE_OF]->(character2:Character), (characterInstance2)-[hasState2:HAS_STATE]->(state2:State),
	(specimen2:Specimen)-[]->(otu2)
WHERE
    otu1 <> otu2
WITH
    specimen, otu1, description1,
	CASE otu2.name
		WHEN null THEN specimen2.name
		ELSE otu2.name
	END AS otu2Name,
	collect(id(state2)) AS description2
RETURN specimen.name AS from,
       otu2Name AS to,
       gds.alpha.similarity.jaccard(description1, description2) AS similarity
ORDER BY similarity DESC

//The same as above, but paying attention to Laminar Ratio values.
//This is a little contrived. I add a 1 to the toList. Then, depending on whether the ratio is within valid range of the OTU, 
//I add either a 0 or 1 to the fromList. This approach will run aground as soon as we have more than one quantitative character.
//But it's a start.
MATCH //First, gather data for Description complexes other than the new one
	(toDescription:Description)-[toDefinedBy:DEFINED_BY]->(toCharacterInstance:CharacterInstance)-[toInstanceOf:INSTANCE_OF]->(toCharacter:Character), 
	(toCharacterInstance)-[toHasState:HAS_STATE]->(toState:State),
	(toSpecimen:Specimen)-->(toDescription) //only needed to get name of specimen Descriptions
WHERE
	toSpecimen.name <> "68"
WITH
	CASE toDescription.name
		WHEN null THEN toSpecimen.name
		ELSE toDescription.name
	END AS toName,
	COLLECT(DISTINCT id(toState)) + [1] AS toDescriptionSet, //List of all State node ids. A 1 is added representing the Laminar Ratio
	COLLECT(DISTINCT CASE toCharacter.name
        WHEN "Laminar L:W Ratio" THEN toFloat(split(toHasState.value, ":")[0])/toFloat(split(toHasState.value,":")[1])
        ELSE null
    END) AS lamRatiosCrunched //Aggregate the Laminar Ratio values (since they could be a range), crunching them to float values
MATCH //Second, gather data for the new Description complex
	(fromSpecimen:Specimen {name:"68"})-[:DESCRIBED_BY]->(fromSpecimenDescription:Description)-[fromDefinedBy:DEFINED_BY]->(fromCharacterInstance:CharacterInstance)-[fromInstanceOf:INSTANCE_OF]->(fromCharacter:Character),
	(fromCharacterInstance)-[fromHasState:HAS_STATE]->(fromState:State)
WITH
	toName, 
	toDescriptionSet, 
	lamRatiosCrunched,
	fromSpecimen, 
	COLLECT(id(fromState)) AS tmpFromDescriptionSet, //list of State node ids.
	COLLECT(DISTINCT CASE fromCharacter.name
        WHEN "Laminar L:W Ratio" THEN toFloat(split(fromHasState.value, ":")[0])/toFloat(split(fromHasState.value,":")[1])
        ELSE null
    END) AS fromLamValue //The Laminar Ratio of the new specimen, crunched to a float value. This must be aggregated in a list in order for other aggregations to work properly.
WITH
	toName, 
	toDescriptionSet, 
	fromSpecimen, 
	tmpFromDescriptionSet,
	CASE 
        WHEN size(lamRatiosCrunched) = 1 AND fromLamValue[0] = lamRatiosCrunched[0] THEN 1
        WHEN size(lamRatiosCrunched) = 2 AND fromLamValue[0] >= lamRatiosCrunched[0] AND fromLamValue[0] <= lamRatiosCrunched[1] THEN 1
        ELSE 0
    END AS lamCompareResult //If the Lam Ratio of the new specimen is legal, this will be 1. If not, 0.
WITH
	toName, 
	toDescriptionSet, 
	fromSpecimen.name AS fromName, 
	tmpFromDescriptionSet + lamCompareResult AS fromDescriptionSet //Add the comparison result to the list of State ids
RETURN fromName,
       toName,
       gds.alpha.similarity.jaccard(fromDescriptionSet, toDescriptionSet) AS similarity
ORDER BY similarity DESC





//Specimen Description complex
MATCH
    (specimen:Specimen {name: "68"})-[describedBy:DESCRIBED_BY]->(description:Description )-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character)
RETURN
    specimen, describedBy, description, definedBy, characterInstance, instanceOf, character, hasState, state

//Accepted OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character)
RETURN
    otuDescription, definedBy, characterInstance, instanceOf, character, hasState, state

//Prospective OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character),
    (otuDescription)<-[candidateFor:CANDIDATE_FOR]-(cCharacterInstance:CharacterInstance)-[cHasState:HAS_STATE]-(cState:State),
    (cCharacterInstance)-[cInstanceOf:INSTANCE_OF]-(cCharacter:Character)
RETURN
    otuDescription, definedBy, characterInstance, instanceOf, character, hasState, state, candidateFor, cCharacterInstance, cHasState, cState, cInstanceOf, cCharacter


//Creating EXAMPLE_OF relationship automatically from Jaccard comparison. This needs more verification.
MATCH
	(specimen:Specimen {name:"77"})-[:DESCRIBED_BY]->(specimenDescription:Description)-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character),
	(characterInstance)-[hasState:HAS_STATE]->(state:State)
WITH
	//otu1, collect([characterInstance, instanceOf, character, hasState, state]) AS description1
	specimen, specimenDescription, collect(id(state)) AS fromDescriptionSet
MATCH
    (otuDescription:Description)-[defined_by2:DEFINED_BY]->(characterInstance2:CharacterInstance)-[instanceOf2:INSTANCE_OF]->(character2:Character), (characterInstance2)-[hasState2:HAS_STATE]->(state2:State),
	(specimen2:Specimen)-[r]->(otuDescription)
WHERE
    specimenDescription <> otuDescription and r.inferenceMethod is null
WITH
    specimen, fromDescriptionSet,
	otuDescription,
	collect(id(state2)) AS toDescriptionSet
WITH specimen, //I was surprised chaining WITHs like this works this way
       otuDescription,
       gds.alpha.similarity.jaccard(fromDescriptionSet, toDescriptionSet) AS similarity
ORDER BY similarity DESC
LIMIT 1 //take top result
MATCH
	(person:Person {given: "Douglas", surname: "Meredith"})
MERGE
	(specimen)-[ex:EXAMPLE_OF {inferenceMethod: "Jaccard on states present", inferenceValue: similarity, entered_by: person.personID}]->(otuDescription)
	ON CREATE SET
		ex.timestamp = datetime();



//Run nodeSimilarity compare on anonymous cypher projection mapping Description directly to States.
//Not sure if this is useful in any way, but wanted to figure out how to do it.
CALL gds.nodeSimilarity.stream({
	nodeQuery: "MATCH (n) WHERE n:Description OR n:CharacterInstance OR n:State RETURN id(n) as id",
	relationshipQuery: "MATCH (n:Description)-[h:DEFINED_BY]->(:CharacterInstance)-[c:HAS_STATE]->(s:State) RETURN id (n) as source, id(s) as target"
})
YIELD node1, node2, similarity
RETURN 
	gds.util.asNode(node1).name  AS From,
	gds.util.asNode(node2).name AS To,
	similarity
ORDER BY similarity DESCENDING, From, To

//Same thing but patching up the null names in specimen Descriptions
CALL gds.nodeSimilarity.stream({
	nodeQuery: "MATCH (n) WHERE n:Description OR n:CharacterInstance OR n:State RETURN id(n) as id",
	relationshipQuery: "MATCH (n:Description)-[h:DEFINED_BY]->(:CharacterInstance)-[c:HAS_STATE]->(s:State) RETURN id (n) as source, id(s) as target"
})
YIELD node1, node2, similarity
WITH
	gds.util.asNode(node1) AS n1,
	gds.util.asNode(node2) AS n2,
	similarity
OPTIONAL MATCH (n1)<-[:DESCRIBED_BY]-(specimen1:Specimen)
OPTIONAL MATCH (n2)<-[:DESCRIBED_BY]-(specimen2:Specimen)
RETURN
	CASE
		WHEN n1.name is null THEN specimen1.name
		ELSE n1.name
	END AS From,
	CASE
		WHEN n2.name is null THEN specimen2.name
		ELSE n2.name
	END AS To,
	similarity
ORDER BY similarity DESCENDING, From, To