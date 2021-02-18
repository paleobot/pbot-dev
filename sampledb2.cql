//!!!!!!!!!!NOTE: You must add the APOC plugin to the db you plan to install this in.

// People/Person/Users are the highest level of independence in the db schema (at least at this moment) so they get created first
// Should there be a metadata log for who enters the enterers?
// My current philosophy as to what should be a node as opposed to a property of a node is that if the propetry is something that you want to have metadata
// of its own, then it should be a new node. If not, then it should be a property - i.e., properties should be terminal information.
// So, in this case, whether a user is an Admin should be signified by attachment to an Admin node rather than it being stated as a property of the Person node.
CREATE (:Person {
    personid: apoc.create.uuid(),
    given: 'Andrew',
    surname: 'Zaffos',
    email: 'azaffos@arizona.edu',
    orcid: '0000-0002-4731-6091'
    }), 
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Scott',
    surname: 'Wing',
    email: 'wing@si.edu',
    orcid: '0000-0002-2954-8905'
    }),      
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Amanda',
    surname: 'Ash'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Leo',
    surname: 'Hickey'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Kirk',
    surname: 'Johnson'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Dori',
    surname: 'Contreras',
    email: 'dori.contreras@perotmuseum.org',
    orcid: '0000-0001-6820-7364'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Ellen',
    surname: 'Curranno',
    email: 'ecurrano@uwyo.edu',
    orcid: '0000-0002-5242-8573'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Beth',
    surname: 'Ellis'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'John',
    surname: 'Mitchell'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Douglas',
    surname: 'Daly',
    email: 'ddaly@nybg.org'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Peter',
    surname: 'Wilf',
    email: 'pwilf@psu.edu',
    orcid: '0000-0001-6813-1937'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Claire',
    surname: 'Cleveland',
    email: 'clairecleveland@psu.edu',
    orcid: '0000-0002-0403-3243'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Simon',
    surname: 'Goring',
    email: 'simon.j.goring@gmail.com',
    orcid: '0000-0002-2700-4605'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Douglas',
    surname: 'Meredith',
    email: 'douglasm@arizona.edu'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Rebecca',
    surname: 'Koll',
    email: 'rebecca.koll@perotmuseum.org',
    orcid: '0000-0001-5601-6632'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Shanan',
    surname: 'Peters',
    email: 'peters@geology.wisc.edu',
    orcid: '0000-0002-3346-4317'
    }),
    (:Person {
    personid: apoc.create.uuid(),
    given: 'Mark',
    surname: 'Uhen',
    email: 'muhen@gmu.edu',
    orcid: '0000-0002-2689-0801'
    });

// Create two new references as Andrew Zaffos 
MATCH (person:Person {given: 'Andrew', surname: 'Zaffos'})
CREATE (:Reference {
      refid: apoc.create.uuid(),
      title: 'Manual of Leaf Architecture - Morphological description and categorization of dicotyledonous and net-veined monocotyledonous angiosperms',
      year: '1999', 
      publisher: 'Smithsonian Institution',
      doi:'10.13140/2.1.3674.5282'
      })-[:ENTERED_BY {timestamp: datetime()}]->(person),
      (:Reference {
      refid: apoc.create.uuid(),
      title: 'Manual of Leaf Architecture',
      year: '2009',
      publisher: 'Cornell University Press'
      })-[:ENTERED_BY {timestamp: datetime()}]->(person);
      
// Assign authors to the Smithsonian (1999) reference
UNWIND ['Ash', 'Ellis','Wing','Hickey','Johnson','Wilf'] as lastname
MATCH (person:Person {surname: lastname}), (reference:Reference {publisher: 'Cornell University Press'})
CREATE (reference)-[:AUTHORED_BY {order: 1}]->(person);

// Assign authors to the Cornell (2009) reference
UNWIND ['Ellis','Wing','Hickey','Johnson','Wilf', 'Mitchell','Daly'] as lastname
MATCH (person:Person {surname: lastname}), (reference:Reference {publisher: 'Cornell University Press'})
CREATE (reference)-[:AUTHORED_BY {order: 1}]->(person);

// Create two new schemas to go with the references above as Andrew Zaffos
MATCH (person:Person {given: 'Andrew', surname: 'Zaffos'})
CREATE (:Schema {
      schemaid: apoc.create.uuid(),
      title: 'Smithsonian',
      year: '1999'
      })-[:ENTERED_BY {timestamp: datetime()}]->(person),
      (:Schema {
      refid: apoc.create.uuid(),
      title: 'Cornell',
      year: '2009'
      })-[:ENTERED_BY {timestamp: datetime()}]->(person);
      
MATCH (schema:Schema {title: 'Smithsonian'}), (reference:Reference {publisher: 'Smithsonian Institution'})
CREATE (reference)-[:CITED_BY]->(schema);

MATCH (schema:Schema {title: 'Cornell'}), (reference:Reference {publisher: 'Cornell University Press'})
CREATE (reference)-[:CITED_BY]->(schema);

// Assign authors to the Smithsonian schema
UNWIND ['Ash', 'Ellis','Wing','Hickey','Johnson','Wilf'] as lastname
MATCH (person:Person {surname: lastname}), (schema:Schema {title: 'Smithsonian'})
CREATE (schema)-[:AUTHORED_BY {order: 1}]->(person);

// Assign authors to the Cornell schema
UNWIND ['Ellis','Wing','Hickey','Johnson','Wilf', 'Mitchell','Daly'] as lastname
MATCH (person:Person {surname: lastname}), (schema:Schema {title: 'Cornell'})
CREATE (schema)-[:AUTHORED_BY {order: 1}]->(person);

// Identify as user Rebecca Koll and add a chracter "leaf attachement" to reference and also specify the enterer relationship
// Note that characters and states refer to the Smithsonian (1999) Manual of leaf architecture 
// This is not an exhaustive list
MATCH (person:Person {given: 'Rebecca', surname: 'Koll'}), (schema:Schema {title: 'Smithsonian'})
CREATE 
    (character:Character {charid: apoc.create.uuid(), name: 'Leaf Attachment'})-[:CHARACTER_OF]->(schema),
	(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state1:State {stateid: apoc.create.uuid(), name: 'alternate', definition: 'one leaf at each node'})-[:STATE_OF]->(character),
	(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state2:State {stateid: apoc.create.uuid(), name: 'opposite', definition: 'two leaves at each node'})-[:STATE_OF]->(character), 
	(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state3:State {stateid: apoc.create.uuid(), name: 'whorled', definition: 'three or more leaves at each node'})-[:STATE_OF]->(character),
	(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state4:State {stateid: apoc.create.uuid(), name: 'decussate', definition: 'each leaf attached at 90 from those above and below (can be opposite or alternate)'})-[:STATE_OF]->(character),
	(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person);

MATCH (person:Person {given: 'Rebecca', surname: 'Koll'}), (schema:Schema {title: 'Smithsonian'})
CREATE 
    (character:Character {charid: apoc.create.uuid(), name: 'Leaf Organization'})-[:CHARACTER_OF]->(schema),
	(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state1:State {stateid: apoc.create.uuid(), name: 'simple', definition: 'consisting of a single lamina'})-[:STATE_OF]->(character),
	(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state2:State {stateid: apoc.create.uuid(), name: 'compound', definition: 'a leaf with separate subunits'})-[:STATE_OF]->(character), 
	(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
	(substate21:Substate {substateid: apoc.create.uuid(), name: 'palmately', definition: 'subunits attached at the apex of a petiole (can be sessile or petiolulate)'})-[:SUBSTATE_OF]->(state2), 
	(substate21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
	(substate22:Substate {substateid: apoc.create.uuid(), name: 'pinnately', definition: 'subunits arranged along a rachis (can be odd- or even-pinnate)'})-[:SUBSTATE_OF]->(state2), 
	(substate22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state3:State {stateid: apoc.create.uuid(), name: 'trifoliate', definition: 'a compound leaf with three leaflets'})-[:STATE_OF]->(character),
	(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state4:State {stateid: apoc.create.uuid(), name: 'bipinnate', definition: 'compound leaf dissected twice with leaflets arranged along rachillae that are attached to the rachis (alternate term is twice pinnatley compound)'})-[:STATE_OF]->(character), 
	(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (state5:State {stateid: apoc.create.uuid(), name: 'tripinnate', definition: 'a compound leaf with leaflets attached to secondary rachillae that are in turn attached to rachillae, which are borne on the rachis (alternate term is thrice pinnately compound)'})-[:STATE_OF]->(character),
	(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person);
