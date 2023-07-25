MATCH
    (p:PreservationMode)
DETACH DELETE 
    p;

//Preservation Modes

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Body"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Trace"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Permineralization"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Cast"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Mold/impression"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Adpression/compression"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Recrystallized"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Concretion"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Charcoalification"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (pMode:PreservationMode { name: "Coalified"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        pMode.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (pMode)-[:ELEMENT_OF]->(public);

    
