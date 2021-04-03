# pbot_client
Codebase and initial design documents for pbot client. Some example design documents can be found for the [geomapmaker toolbar](https://github.com/azgs/geomapmaker/blob/master/README.md) and the [ADEPT frontend](https://github.com/ngds/ADEPT_frontend/blob/main/README.md).

> Note that the ADEPT frontend example repo is private.

## How to format Git-flavoured markdown
1. https://guides.github.com/features/mastering-markdown/

## Some useful queries for the PBOT graph database

```
//Delete everything (think very hard before you do this)
MATCH (n)
DETACH DELETE n
```

```
//Show entire Schema (10 deep on States should be plenty)
MATCH
	(schema:Schema {title: "Cornell, 2009"})<-[characterOf:CHARACTER_OF]-(character:Character)<-[stateOf:STATE_OF*1..10]-(state:State)
RETURN
    schema, characterOf, character, stateOf, state
```

```
//Show Specimen Description complex
MATCH
    (specimen:Specimen {name: "68"})-[describedBy:DESCRIBED_BY]->(description:Description )-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character)
RETURN
    specimen, describedBy, description, definedBy, characterInstance, instanceOf, character, hasState, state
```

```
//Show Accepted OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character)
RETURN
    otuDescription, definedBy, characterInstance, instanceOf, character, hasState, state
```

```
//Show Prospective OTU Description complex
MATCH
    (otuDescription:Description {name: "Cornus hyperborea"})-[definedBy:DEFINED_BY]->(characterInstance:CharacterInstance)-[hasState:HAS_STATE]->(state:State),
    (characterInstance)-[instanceOf:INSTANCE_OF]-(character:Character),
    (otuDescription)<-[candidateFor:CANDIDATE_FOR]-(cCharacterInstance:CharacterInstance)-[cHasState:HAS_STATE]-(cState:State),
    (cCharacterInstance)-[cInstanceOf:INSTANCE_OF]-(cCharacter:Character)
RETURN
    otuDescription, definedBy, characterInstance, instanceOf, character, hasState, state, candidateFor, cCharacterInstance, cHasState, cState, cInstanceOf, cCharacter
```

```
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
```
