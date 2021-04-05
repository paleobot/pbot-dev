# pbot_client
Codebase and initial design documents for pbot client. Some example design documents can be found for the [geomapmaker toolbar](https://github.com/azgs/geomapmaker/blob/master/README.md) and the [ADEPT frontend](https://github.com/ngds/ADEPT_frontend/blob/main/README.md).

> Note that the ADEPT frontend example repo is private.

## How to format Git-flavoured markdown
1. https://guides.github.com/features/mastering-markdown/

## Exporting/Importing the db
This is from #13.

To export a db to a cypher file:
1) Find your database on disk. The easiest way to do this is to click the three dots for your db in the GUI, then click Terminal. This will open something that looks like a cmd shell on Windows and a bash shell on Ubuntu in the directory for your database. Copy this path.
2) Under that path is a conf directory. Go in there and add a file called apoc.conf with this line in it: 
```
apoc.export.file.enabled=true
```
3) Now start that db and open it in Neo4J Browser. Execute some version of this (details here: https://neo4j.com/labs/apoc/4.1/export/cypher/). This creates the file all.cypher in the import directory of your db:
```
CALL apoc.export.cypher.all("all.cypher", {
	format: "cypher-shell",
	useOptimizations: {type: "UNWIND_BATCH", unwindBatchSize: 20}
})
YIELD file, batches, source, format, nodes, relationships, properties, time, rows, batchSize
RETURN file, batches, source, format, nodes, relationships, properties, time, rows, batchSize;
```

To actually use this file to populate another db:
1) Create the db in Neo4J Desktop, and install the APOC plugin. Find it on disk, as in step (1) above.
2) In the conf directory, add a file called apoc.conf with this line:
```
apoc.import.file.enabled=true
```
3) Copy the all.cypher file into the import directory of this new database.
4) Start the new db and open it in Neo4J Browser. Execute some version of this (some details here: https://neo4j.com/labs/apoc/4.1/cypher-execution/run-cypher-scripts/):
```
CALL apoc.cypher.runFile("all.cypher")
```
5) Verify that the db looks the way you expect.

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

```
//If you want to see more nodes in your Neo4J Browser than it lets you by default (300)
:config initialNodeDisplay: 1000
```
