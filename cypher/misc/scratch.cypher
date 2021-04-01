Delete everything
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

Show entire Schema
	MATCH
		(schema:Schema {schemaID: '768feb86-19c4-4932-bc5e-08eb8bb8e5ad'}),
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





//Test a new specimen OTU against existing OTUs using a Jaccard comparison on the States
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
    //otu1, description1, otu2, collect([characterInstance2, instanceOf2, character2, hasState2, state2]) AS description2
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


//Accepted OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character)
RETURN
    otuDescription, defined_by, characterInstance, instanceOf, character, hasState, state


//Prospective OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character),
    (otuDescription)<-[candidateFor:CANDIDATE_FOR]-(cCharacterInstance:CharacterInstance)-[cHasState:HAS_STATE]-(cState:State),
    (cCharacterInstance)-[cInstanceOf:INSTANCE_OF]-(cCharacter:Character)
RETURN
    otuDescription, defined_by, characterInstance, instanceOf, character, hasState, state, candidateFor, cCharacterInstance, cHasState, cState, cInstanceOf, cCharacter


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
