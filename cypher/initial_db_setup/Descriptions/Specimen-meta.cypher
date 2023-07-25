//Organs

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Root"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Shoot / Axis / Wood"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Pollen / Spore"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Inflorescence / Flower"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Infructescence / Fruit"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Ovuliferous (seed) Cone"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Staminate (pollen) Cone"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Seed"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Cuticle"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Other"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (organ:Organ { type: "Unknown"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (organ)-[:ELEMENT_OF]->(public);

    
//Features
MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (feature:Feature { name: "cuticle/epidermal features"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        feature.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (feature)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (feature:Feature { name: "wood anatomy (secondary growth)"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        feature.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (feature)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (feature:Feature { name: "internal anatomy"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        feature.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (feature)-[:ELEMENT_OF]->(public);

MATCH
	(person:Person {given: "Ellen", surname: "Currano"}),
	(public:Group {name: "public"})
MERGE
    (feature:Feature { name: "trace fossils (e.g., insect damage)"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        feature.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime()
MERGE
    (feature)-[:ELEMENT_OF]->(public);

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

    
