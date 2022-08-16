// MLA 2009 cypher schema code

//For some reason the I can't make the "b" in "lb" subscript. Need to do a find and replace when figure this out.


//create schema reference
MATCH 
    (person:Person {given: "Claire", surname: "Cleveland"}),
    (public:Group {name: "public"})
CREATE 
    (ref:Reference {
        pbotID: apoc.create.uuid(), 
        title: "Manual of Leaf Architecture",
        year: "2009",
        publisher: "Cornell University Press"
    })-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (ref)-[:ELEMENT_OF]->(public);

// Assign authors to the Smithsonian (1999) reference
UNWIND [{lastname: "Ellis", order: 1},
		{lastname: "Wing", order: 2},
		{lastname: "Hickey", order: 3},
		{lastname: "Johnson", order: 4},
		{lastname: "Wilf", order: 5},
		{lastname: "Mitchell", order: 6},
		{lastname: "Daly", order: 7}] as author
MATCH (person:Person {surname: author.lastname}), (reference:Reference {publisher: "Cornell University Press"})
CREATE (reference)-[:AUTHORED_BY {order: author.order}]->(person),

//create schema
MATCH (person:Person {given: "Claire", surname: "Cleveland"})
CREATE (:Schema {pbotID: apoc.create.uuid(), title: "Cornell MLA", year: "2009"})-[:ENTERED_BY {timestamp: datetime()}]->(person)
MATCH 
    (person:Person {given: "Claire", surname: "Cleveland"}),
    (public:Group {name: "public"})
CREATE 
    (schema:Schema {
        pbotID: apoc.create.uuid(), 
        title: "Cornell, 2009",
        year: "2009"
    })-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (schema)-[:ELEMENT_OF]->(public);

// Assign authors to the Cornell schema
UNWIND [{lastname: "Ellis", order: 1},
		{lastname: "Wing", order: 2},
		{lastname: "Hickey", order: 3},
		{lastname: "Johnson", order: 4},
		{lastname: "Wilf", order: 5},
		{lastname: "Mitchell", order: 6},
		{lastname: "Daly", order: 7}] as author
MATCH (person:Person {surname: author.lastname}), (schema:Schema {title: "Cornell, 2009"})
CREATE (schema)-[:AUTHORED_BY {order: author.order}]->(person);
    
//create relationship reference cited by schema
MATCH (schema:Schema {title: "Cornell MLA"}), (reference:Reference {publisher: "Cornell University Press"})
CREATE (reference)-[:CITED_BY]->(schema)


//create character, states, substates with relationship(s) to schema

//Character 1
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Attachment"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "sessile", definition: "leaf attaches directly to the axis without petiole"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "petiolate", definition: "a petiole attaches the leaf to the axis"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 2
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Arrangement", definition: "the placement of adjacent leaves on the nodes of the axis (more than one may apply)"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "whorled", definition: "three or more leaves are borne at each node"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name:  "alternate", definition: "adjacent leaves occur above or below others on the axis with one leaf per node"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "distichous", definition: "in one plane in two ranks on opposite sides of the axis"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "helical", definition: "in a spiral along the axis"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "opposite", definition: "leaves occur in opposed pairs that arise from the same node along the axis"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "spirodecussate", definition: "successive leaf pairs inserted at angles >90° to those above and below"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "distichous", definition: "leaf pairs are aligned with those above and below"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state33:State {pbotID: apoc.create.uuid(), name: "decussate", definition: "leaf pairs inserted at ~90° to those above and below"})-[:STATE_OF]->(state3),
(state33)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state33)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "subopposite", definition: "adjacent leaves occur in pairs that are nearly but not strictly opposite"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "spirodecussate", definition: "successive leaf pairs inserted at angles >90° to those above and below"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "distichous", definition: "leaf pairs are aligned with those above and below"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public),
(state43:State {pbotID: apoc.create.uuid(), name: "decussate", definition: "leaf pairs inserted at ~90° to those above and below"})-[:STATE_OF]->(state4),
(state43)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state43)-[:ELEMENT_OF]->(public);

//Character 3
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Organization"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "simple", definition: "leaf consists of a single lamina attached to a simple petiole"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "compound", definition: "leaf consists of two or more leaflets (laminae not interconnected by laminar tissue"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "palmately compound", definition: "leaf has more than two separate laminar subunits (leaflets) attached at the apex of a petiole"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state211:State {pbotID: apoc.create.uuid(), name: "quantity", definition: "number of leaflets"})-[:STATE_OF]->(state21),
(state211)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state211)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "pinnately compound", definition: "leaf has leaflets arranged along a rachis"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state221:State {pbotID: apoc.create.uuid(), name: "twice, or bipinnately compound", definition: "dissected twice with leaflets arranged along rachillae that are attached to the rachis"})-[:STATE_OF]->(state22),
(state221)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state221)-[:ELEMENT_OF]->(public),
(state222:State {pbotID: apoc.create.uuid(), name: "once compound", definition: "with a single order of pinnate leaflets"})-[:STATE_OF]->(state22),
(state222)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state222)-[:ELEMENT_OF]->(public),
(state223:State {pbotID: apoc.create.uuid(), name: "thrice, or tripinnately compound", definition: "leaflets are attached to secondary rachillae that in turn attached to rachillae, which are borne along the rachis"})-[:STATE_OF]->(state22),
(state223)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state223)-[:ELEMENT_OF]->(public),

//Character 4
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaflet Arrangement", definition: "definition: these character states apply only to pinnately compound leaves"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "unknown", definition: "not preserved"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "subopposite", definition: "leaflets are in pairs that are nearly, but not strictly, opposite"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "alternate", definition: "leaflets are arranged alternately on the rachis"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "opposite", definition: "leaflets are arranged alternately on the rachis"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "odd-pinnately compound"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "even-pinnately compound"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public);

//Character 5
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaflet Attachment", definition: "these character states apply only to compound leaves"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "sessile", definition: "leaflet is attached directly to the rachis"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "petiolule", definition: "leaflet is attached to the rahis by means of a petiolule (stalk) analogous to the petiole of a leaf"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 6
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Petiole Features"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "phyllodes", definition: "petiole or rachis is expanded to make a lamina"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "glands", definition: "swollen areas of secretory tissue, often paired"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "acropetiolar", definition: "glands are borne at the distal end of the petiole, below the base of the leaf"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "petiolar", definition: "glands are borne along the petiole"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "petiole-cross section"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "canaliculate", definition: "having a longitudinal channel or groove"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "alate or winged", definition: "with lateral ridges or flanked by laminar tissue"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state33:State {pbotID: apoc.create.uuid(), name: "terete", definition: "round"})-[:STATE_OF]->(state3),
(state33)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state33)-[:ELEMENT_OF]->(public),
(state34:State {pbotID: apoc.create.uuid(), name: "semiterete", definition: "semicircular"})-[:STATE_OF]->(state3),
(state34)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state34)-[:ELEMENT_OF]->(public),
(state35:State {pbotID: apoc.create.uuid(), name: "angular"})-[:STATE_OF]->(state3),
(state35)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state35)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "petiole base"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "sheathing", definition: "petiole expands to clasp the stem"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "pulvin(ul)ate", definition: "having an abruptly swollen portion near the node around which the leaf(let) can flex"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public);

//Character 7
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Position of Lamina Attachment", definition: "the point from which the lamina is borne"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "peltate excentric", definition: "leaf is borne from a position within the boundaries of the lamina but not near its center"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "marginal", definition: "leaf is attached at its margin"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "peltate central", definition: "leaf is borne from a position near the center of the lamina"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 8
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar Size", definition: "the area of the leaf blade"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "megaphyll", definition: ">164,025 mm²"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "mesophyll", definition: "4,500-18,225 mm²"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "notophyll", definition: "2,025-4,500 mm²"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "nanophyll", definition: "25-225 mm²"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "leptophyll", definition: "<25 mm²"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public),
(state6:State {pbotID: apoc.create.uuid(), name: "macrophyll", definition: "18,225-164,025 mm²"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6)-[:ELEMENT_OF]->(public),
(state7:State {pbotID: apoc.create.uuid(), name: "microphyll", definition: "225-2,025 mm²"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7)-[:ELEMENT_OF]->(public);

//Character 9
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar L:W Ratio", definition: "ratio of the laminar length to maximum width perpendicular to the axis of the midvein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

//Character 10
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar Shape (in compound leaves, this applies to the shape of the leaflets)", definition: "to determine the shape of the lamina, locate the midvein and determine the zone of greatest width measured perpendicular to the midvein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "elliptic", definition: "the widest part of the leaf is in the middle one-fifth"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "special", definition: "outlines that do not fall readily into one of the shape classes above"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "linear", definition: "the L:W ratio of the leaf is >=10:1, regardless of the position of the widest part of the leaf"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "oblong", definition: "the opposite margins are roughly parallel for at least the middle one-third of the leaf"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "ovate", definition: "the widest part of the leaf is in the proximal two-fifths"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public),
(state6:State {pbotID: apoc.create.uuid(), name: "obovate", definition: "the widest part of the leaf is in the distal two-fifths"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6)-[:ELEMENT_OF]->(public);

//Character 11
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Medial Symmetry", definition: "determined by the width ratio in the middle of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "asymmetrical", definition: "width ratio (x/y)<0.9 from 0.25L to 0.75L"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "symmetrical", definition: "width ratio (x/y)>0.9 from 0.25L to 0.75L"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 12
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Base Symmetry", definition: "base symmetry and basal width asymmetry are determined by the width ratio in the base of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "base symmetrical", definition: "base lacks any of the asymmetries identified below"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "base asymmetrical", definition: "more than one state may apply"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "basal width asymmetrical", definition: "basal width ratio (x/y)>0.9"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "basal extension asymmetrical", definition: "basal extension length on one side is < 0.75 of the other side (Lb₁/Lb₂ < 0.75)"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public);

//Character 13
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Lobation", definition: "a lobe is a marginal projection with a corresponding sinus incised 25% or more of the distance from the projection apex to the midvein, measured parallel to the axis of symmetry and along the apical side of the projection (or the basal side of a terminal projection)"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "bilobed", definition: "leaf has two lobes"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "unlobed", definition: "the leaf has no lobes"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "palmately and pinnately lobed", definition: "at least one lobe in a palmately lobed leaf is pinnately lobed"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "lobed"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "pinnately lobed", definition: "major veins of the lobes are formed by costal secondaries"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "palmately lobed", definition: "major veins of the lobes are primary veins that arise from the base of the leaf"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public),
(state421:State {pbotID: apoc.create.uuid(), name: "palmatisect", definition: "special case of palmately lobed in which the incision goes almost to the petiole but without resulting in distinct leaflets"})-[:STATE_OF]->(state42),
(state421)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state421)-[:ELEMENT_OF]->(public),
(state422:State {pbotID: apoc.create.uuid(), name: "pinnatisect", definition: "special case of pinnately lobed in which the incision goes almost to the midvein but without resulting in distinct leaflets"})-[:STATE_OF]->(state42),
(state422)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state422)-[:ELEMENT_OF]->(public);

//Character 14
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Margin Type", definition: "features of the edge of the lamina"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "untoothed", definition: "margin has no teeth"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "toothed", definition: "margin has vascularized projections separated by sinuses that are incised less than 25% of the distance to the midvein or long axis of the leaf as measured parallel to the axis of symmetry from the apical incision of the projection"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "crenate", definition: "majority of the teeth are smoothly rounded, without a pointed apex"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "dentate", definition: "majority of the teeth have axes of symmetry directed perpendicular to the trend of the leaf margin"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "serrate", definition: "majority of the teeth have axes of symmetry directed at an angle to the trend of the leaf margin"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public);

//Character 15
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Special Margin Features"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "appearance of the edge of the leaf blade"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "erose", definition: "maring is minutely irregular, as if chewed"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "sinuous", definition: "margin forms a series of shallow and gentle curves that lack principal veins"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "appearance of the abaxial-adaxial plane of the leaf blade"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "undulate", definition: "margin forms a series of smooth curves in the abaxial-adaxial plane (in and out of the plane of the leaf)"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "involute", definition: "margin is turned up or rolled in the adaxial direction"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "revolute", definition: "margin is turned down or rolled (in the manner of a scroll) in the abaxial direction"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public);

//Character 16
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Apex Angle", definition: "the vertex of the apex angle lies at the center of the midvein where it terminates at the apex of the leaf; the apex angle is formed by two rays that depart this vertex and are tangent to the leaf margin without crossing over any part of the lamina; the angle is always measured on the proximal side of the rays"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "reflex", definition: "apex angle >180°"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "acute", definition: "apex angle <90°"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "obtuse", definition: "apex angle between 90° and 180°"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 17
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Apex Shape", definition: "these states apply to the shape of the distal 25% of the lamina"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "acuminate", definition: "margin between the apex and 0.75L is convex proximally and concave distally, or concave only"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "lobed", definition: "lₘ is 75% of lₘ + lₐ"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "emarginate", definition: "lₘ is 75-95% of lₘ + lₐ"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "straight", definition: "margin between the apex and 0.75L has no significant curvature"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "convex", definition: "margin between the apex and 0.75L curves away from the midvein"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public),
(state51:State {pbotID: apoc.create.uuid(), name: "truncate", definition: "apex terminates abruptly as if cut, with margin perpendicular to the midvein or nearly so"})-[:STATE_OF]->(state5),
(state51)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state51)-[:ELEMENT_OF]->(public),
(state52:State {pbotID: apoc.create.uuid(), name: "rounded", definition: "subtype of convex in which the margin forms a smooth arc"})-[:STATE_OF]->(state5),
(state52)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state52)-[:ELEMENT_OF]->(public);

//Character 18
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Base Angle", definition: "the vertex of the base angle lies in the center of the midvein next to the point where the basalmost laminar tissue joins the petiole (or joins the proximal margin in the case of sessile leaves); base angle is always measured on the distal side of the vertex"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "obtuse", definition: "angle >90° but <180°"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "circular", definition: "special case of reflex in which angle >360°; this includes leaves in which the basal extension overlaps across the midline, as well as peltate leaves"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "acute", definition: "angle <90°"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "reflex", definition: "special case of obtuse in which angle is >180° but <360°"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public);

//Character 19
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Base Shape", definition: "these states apply to the shapes of the proximal 25% of the lamina"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "there is no basal extension (lb = 0)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "concave", definition: "margin between the base and 0.25L curves toward the midvein"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state111:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "special case in which the laminar tissue extends along the petiole at a gradually decreasing angle"})-[:STATE_OF]->(state11),
(state111)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state111)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "straight", definition: "margin between the base and 0.25L has no significant curvature"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state13:State {pbotID: apoc.create.uuid(), name: "convex", definition: "margin between the base and 0.25L curves away from the midvein"})-[:STATE_OF]->(state1),
(state13)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state13)-[:ELEMENT_OF]->(public),
(state131:State {pbotID: apoc.create.uuid(), name: "rounded", definition: "the margin forms a smooth arc across the base"})-[:STATE_OF]->(state13),
(state131)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state131)-[:ELEMENT_OF]->(public),
(state132:State {pbotID: apoc.create.uuid(), name: "truncate", definition: "the base terminates abruptly as if cut perpendicular to the midvein or nearly so"})-[:STATE_OF]->(state13),
(state132)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state132)-[:ELEMENT_OF]->(public),
(state14:State {pbotID: apoc.create.uuid(), name: "complex", definition: "margin curvature has more than one inflection point (change of curvature) between the base and 0.25L"})-[:STATE_OF]->(state1),
(state14)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state14)-[:ELEMENT_OF]->(public),
(state141:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "special case in which the laminar tissue extends along the petiole at a gradually decreasing angle"})-[:STATE_OF]->(state14),
(state141)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state141)-[:ELEMENT_OF]->(public),
(state15:State {pbotID: apoc.create.uuid(), name: "concavo-convex", definition: "margin between the base and 0.25L is concave proximally and convex distally"})-[:STATE_OF]->(state1),
(state15)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state15)-[:ELEMENT_OF]->(public),
(state151:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "special case in which the laminar tissue exends along the petiole at a gradually decreasing angle"})-[:STATE_OF]->(state15),
(state151)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state151)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "there is a basal extension (lb > 0)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "cordate", definition: "leaf base forms a single sinus with the petiole generally inserted at the deepest point of the sinus"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "lobate", definition: "leaf base is lobed on both sides of the midvein; the lobes are defined by a central sinus containing the petiole as in cordate leaves, and by sinuses on their distal sides such that the nadirs of the distal sinus are within the base of the leaf"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state221:State {pbotID: apoc.create.uuid(), name: "hastate", definition: "leaf base has two narrow lobes with apices directed exmedially at 90°-125° from the midvein"})-[:STATE_OF]->(state22),
(state221)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state221)-[:ELEMENT_OF]->(public),
(state222:State {pbotID: apoc.create.uuid(), name: "saggitate", definition: "leaf base has two narrow, usually pointed projections (technically these may not qualify as lobes because they are not bounded by distal sinuses) with apices directed proximally at an angle 125° or greater from the midvein"})-[:STATE_OF]->(state22),
(state222)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state222)-[:ELEMENT_OF]->(public),
(state223:State {pbotID: apoc.create.uuid(), name: "runcinate", definition: "a lobate lamina with two or more pairs of downward-pointing (>110°) angular lobes"})-[:STATE_OF]->(state22),
(state223)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state223)-[:ELEMENT_OF]->(public),
(state224:State {pbotID: apoc.create.uuid(), name: "auriculate", definition: "a lobate lamina having a pair of rounded basal lobes that are oriented downward, with their axes of symmetry at an angle >125° from the midvein of the leaf"})-[:STATE_OF]->(state22),
(state224)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state224)-[:ELEMENT_OF]->(public),
(state2241:State {pbotID: apoc.create.uuid(), name: "panduriform", definition: "the lateral sinuses that define the lobes of an auriculate leaf extend more than 50% of the distance to the midvein"})-[:STATE_OF]->(state224),
(state2241)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2241)-[:ELEMENT_OF]->(public);

//Character 20
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Terminal Apex Features", definition: "the following states describe the region where the midvein terminates"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "mucronate (apiculate)", definition: "the midvein terminates in an opaque, peg-shaped, nondeciduous extension of the midvein"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "spinose", definition: "the midvein extends through the margin at the apex; the spine may be short or long, but it is not always sharp"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "retuse", definition: "the midvein terminates in a shallow sinus such that lm is 95-99% of lₘ + lₐ"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 21
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Surface Texture", definition: "more than one may apply"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "papillate", definition: "having small projections originating from the laminar surface"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "pitted", definition: "having indentations"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "pubescent", definition: "having hairs"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "rugose", definition: "rough; for example, from vein relief"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "smooth", definition: "lacking indentations, projections, hairs, or other roughness"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public);

//Character 22
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Surficial Glands"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "basilaminar", definition: "glands present only near the base of the blade"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "marginal", definition: "glands present only near or on the blade margin"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "apical", definition: "glands present only near the blade apex"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "laminar", definition: "glands present on the surface (may be clustered)"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public);

//Character 23
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Primary Vein Framework"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "pinnate", definition: "leaf or leaflet has a single 1° vein"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "palmate", definition: "leaf has three or more basal veins, of which at least two are primaries, use 75% of gauge cutoff for primary veins"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "parallelodromous", definition: "multiple parallel 1° veins originate collaterally at the leaf base and converge toward the leaf apex"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "flabellate", definition: "several to many equally fine basal veins diverge radially at low angles to each other and branch distally"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "campylodromous", definition: "multiple parallel 1° veins originate collaterally at or near the leaf base and run in strongly recurved arches that converge toward the leaf apex"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state24:State {pbotID: apoc.create.uuid(), name: "palinactinodromous", definition: "three or more primaries diverge in a series of branches rather than from a single point"})-[:STATE_OF]->(state2),
(state24)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state24)-[:ELEMENT_OF]->(public),
(state25:State {pbotID: apoc.create.uuid(), name: "acrodromous", definition: "three or more primaries originate from a point and run in convergent arches toward the leaf apex"})-[:STATE_OF]->(state2),
(state25)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state25)-[:ELEMENT_OF]->(public),
(state251:State {pbotID: apoc.create.uuid(), name: "basal", definition: "primary veins radiate from the petiolar insertion point"})-[:STATE_OF]->(state25),
(state251)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state251)-[:ELEMENT_OF]->(public),
(state252:State {pbotID: apoc.create.uuid(), name: "suprabasal", definition: "primary veins radiate from a point distal to petiolar insertion"})-[:STATE_OF]->(state25),
(state252)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state252)-[:ELEMENT_OF]->(public),
(state26:State {pbotID: apoc.create.uuid(), name: "actinodromous", definition: "three or more 1° veins diverge radially from a single point"})-[:STATE_OF]->(state2),
(state26)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state26)-[:ELEMENT_OF]->(public),
(state261:State {pbotID: apoc.create.uuid(), name: "basal", definition: "primary veins radiate from the petiolar insertion point"})-[:STATE_OF]->(state26),
(state261)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state261)-[:ELEMENT_OF]->(public),
(state262:State {pbotID: apoc.create.uuid(), name: "suprabasal", definition: "primary veins radiate from a point distal to petiolar insertion"})-[:STATE_OF]->(state26),
(state262)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state262)-[:ELEMENT_OF]->(public);

//Character 24
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Naked Basal Veins"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "present", definition: "the exmedial side of one or both lateral primaries, or of basal scondaries, forms part of the leaf margin at the base"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 25
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Number of Basal Veins"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity", definition: "total number of 1° and 2° veins that originate in the base of the leaf and have courses similar to the course(s) of the primary or primaries"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

//Character 26
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Agrophic Veins"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "present", definition: "a comblike complex of veins composed of a lateral 1° or 2° vein with two or more excurrent minor 2° veins that originate on it and travel roughly parallel courses toward the margin"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "simple", definition: "one or two agrophic veins that may be paired or appear only on one side of the leaf"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "compound", definition: "more than two agrophic veins"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public);

//Character 27
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Major Secondary Vein Framework"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "mixed", definition: "major secondary course varies within the leaf"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "major secondaries form loops of secondary gauge and do not reach the margin"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "simple brochidodromous", definition: "secondaries join in a series of prominent arches or loops of secondary gauge, and junctions between secondaries are excurrent and the smaller vein has >25% of the gauge of the larger vein at the junction"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "festooned brochidodromous", definition: "secondaries join in a series of prominent arches or loops of secondary gauge, and junctions between secondaries are excurrent and the smaller vein has >25% of the gauge of the larger vein at the junction"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "major secondaries (or their branches) reach the margin"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "semicraspedodromous (usually in toothed leaves)", definition: "secondaries branch near the margin; one of the branches terminates at the margin and the other joins the superjacent secondary"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "craspedodromous (usually in toothed leaves)", definition: "secondaries terminate at the margin or at the marginal vein"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state33:State {pbotID: apoc.create.uuid(), name: "festooned semicraspedodromous", definition: "secondaries form more than one set of loops, with branches from the most exmedial loops terminating at the margin"})-[:STATE_OF]->(state3),
(state33)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state33)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "major secondaries and their branches do not reach the margin and lose gauge by attenuation"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "reticulodromous", definition: "secondaries branch into a reticulum of higher-order veins"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "cladodromous", definition: "secondaries freely ramify exmedially"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public),
(state43:State {pbotID: apoc.create.uuid(), name: "eucamptodromous", definition: "secondaries connect to superadjacent major secondaries via tertiaries without forming marginal loops of secondary gauge"})-[:STATE_OF]->(state4),
(state43)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state43)-[:ELEMENT_OF]->(public),
(state431:State {pbotID: apoc.create.uuid(), name: "hemieucamptodromous", definition: "all eucamptodromous secondaries arise from the proximal half of the leaf, with 0.5L from base of leaf"})-[:STATE_OF]->(state43),
(state431)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state431)-[:ELEMENT_OF]->(public),
(state432:State {pbotID: apoc.create.uuid(), name: "eucamptodromous becoming brochidodromous distally", definition: "proximal secondaries are eucamptodromous, but distal secondaries form loops of secondary guage"})-[:STATE_OF]->(state43),
(state432)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state432)-[:ELEMENT_OF]->(public),
(state433:State {pbotID: apoc.create.uuid(), name: "basal eucamptodromous", definition: "all eucamptodromous secondaries arise from the base of the leaf, within 0.25L from base of leaf"})-[:STATE_OF]->(state43),
(state433)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state433)-[:ELEMENT_OF]->(public);

//Character 28
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Interior Secondaries"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "present", definition: "secondaries cross between 1° veins or between 1° and perimarginal 2° veins but do not reach the margin"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 29
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Minor Secondary Course"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "simple brochidodromous", definition: "joined together in a series of prominent arches or loops of secondary gauge, and junctions between secondaries are excurrent and the smaller vein has >25% of the gauge of the larger"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "craspedodromous", definition: "terminating at the margin"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "semicraspedodromous", definition: "minor secondaries branch near the margin and one of the branches eventually terminates at the margin, the other joins the superajacent minor secondary"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 30
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Perimarginal Veins", definition: "when present, these veins closely parallel the leaf margin and lose little gauge distally"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "fimbrial vein", definition: "vein of consistent 3° gauge running on the margin with no laminar tissue exmedial to it"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "marginal secondary", definition: "vein of 2° gauge running on the leaf margin with no laminar tissue exmedial to it"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "intramarginal secondary", definition: "vein of 2° gauge running near the margin with laminar tissue exmedial to it"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 31
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Major Secondary Spacing"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "gradually increasing proximally", definition: "secondary spacing increases gradually toward base"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "regular", definition: "secondary spacing proportionally decreases distally and proximally"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "decreasing proximally", definition: "secondary spacing decreases toward base and may be regular or irregular"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "irregular", definition: "secondary spacing varies over the lamina"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "abruptly increasing proximally", definition: "secondary spacing increases abruptly toward base"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public);

//Character 32
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Variation of Major Secondary Angle to Midvein", definition: "the major secondary angle should be evaluated proximal to 0.75 lₘ; each angle measured on the distal side of the junction (the vertex) of the secondary with the midvein; one ray of the angle follows the midvein distal to the junctions and the other follows the secondary for 25% of its length"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "inconsistent", definition: "major 2° angle varies >10° from the base to 0.75 lₘ"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "one pair of acute basal secondaries"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "uniform", definition: "major 2° angle varies <10° from the base to 0.75 lₘ"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "smoothly decreasing proximally"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "smoothly increasing proximally"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public),
(state6:State {pbotID: apoc.create.uuid(), name: "abruptly increasing proximally"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6)-[:ELEMENT_OF]->(public);

//Character 33
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Major Secondary Attachment to Midvein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "proximal secondaries decurrent", definition: "major secondaries near the lamina base are decurrent on midvein, though distal secondaries are excurrent"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "excurrent", definition: "major secondaries join the midvein without deflecting it, midvein monopodial"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "major secondaries meet the midvein asymptotically"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "deflected", definition: "midvein is deflected at junctions with major secondaries and is thus sympodial"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public);

//Character 34
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Intersecondary Veins", definition: "veins with courses similar to those of the major secondaries, but generally shorter in exmedial extent and intermediate in gauge between major secondaries and tertiaries"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "intersecondary distal course"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "parallel to a major secondary"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "perpendicular to a subjacent major secondary"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state13:State {pbotID: apoc.create.uuid(), name: "reticulating or ramifying", definition: "branching and losing a defined course"})-[:STATE_OF]->(state1),
(state13)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state13)-[:ELEMENT_OF]->(public),
(state14:State {pbotID: apoc.create.uuid(), name: "basiflexed but not joining the subjacent secondary at right angles"})-[:STATE_OF]->(state1),
(state14)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state14)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "intersecondary length"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "more than 50% of subjacent secondary"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "less than 50% of subjacent secondary"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "intersecondary frequency", definition: "average number of intersecondary veins per intercostal area"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "usually one per intercostal area"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "more than one per intercostal area"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state33:State {pbotID: apoc.create.uuid(), name: "less than one per intercostal area"})-[:STATE_OF]->(state3),
(state33)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state33)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "intersecondary proximal course"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "perpendicular to midvein"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "parallel to major secondaries"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public);

//Character 35
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Intercostal Tertiary Vein Fabric"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "ramified", definition: "tertiaries branch without forming a tertiary reticulum"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "transversely ramified", definition: "opposed 3° veins from adjacent major secondaries ramify and join at a higher vein order"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "exmedially ramified", definition: "tertiary branching is oriented toward the leaf margin"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state13:State {pbotID: apoc.create.uuid(), name: "transversely freely ramified", definition: "tertiary veins originating on one secondary vein branch toward adjacent secondary but do not join other veins from the opposing secondary"})-[:STATE_OF]->(state1),
(state13)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state13)-[:ELEMENT_OF]->(public),
(state14:State {pbotID: apoc.create.uuid(), name: "admedially ramified", definition: "multiple tertiary veins branch toward the primary or midvein"})-[:STATE_OF]->(state1),
(state14)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state14)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "reticulate", definition: "veins anastomose with other tertiary veins or secondary veins to form a net"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "irregular", definition: "tertiaries anastomose at various angles to form irregular polygons or non-polygonal nets"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "composite admedial", definition: "tertiaries connect to a trunk that ramifies admedially toward the axil of the subjacent costal secondary"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "regular", definition: "tertiaries anastomose with other tertiaries at regular angles to generate a regular polygonal field"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "percurrent", definition: "tertiaries cross between adjacent secondaries"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "angle of percurrent tertiaries", definition: "angle formed between the midvein trend and the course of a percurrent 3° vein projected to the midvein"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state311:State {pbotID: apoc.create.uuid(), name: "acute", definition: "angle >0° and <90°"})-[:STATE_OF]->(state31),
(state311)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state311)-[:ELEMENT_OF]->(public),
(state312:State {pbotID: apoc.create.uuid(), name: "obtuse", definition: "angle >90° and <180°"})-[:STATE_OF]->(state31),
(state312)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state312)-[:ELEMENT_OF]->(public),
(state313:State {pbotID: apoc.create.uuid(), name: "perpendicular", definition: "angle is ~90°"})-[:STATE_OF]->(state31),
(state313)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state313)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "course of percurrent tertiaries"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state321:State {pbotID: apoc.create.uuid(), name: "mixed", definition: "tertiaries have both opposite and alternate pecurrent courses"})-[:STATE_OF]->(state32),
(state321)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state321)-[:ELEMENT_OF]->(public),
(state322:State {pbotID: apoc.create.uuid(), name: "alternate", definition: "majority of tertiaries cross between secondaries with regular offsets (abrupt angular dicontinuities) near the middle of the intercostal area"})-[:STATE_OF]->(state32),
(state322)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state322)-[:ELEMENT_OF]->(public),
(state323:State {pbotID: apoc.create.uuid(), name: "opposite", definition: "majority of tertiaries cross betwen adjacent secondaries in parallel paths without branching"})-[:STATE_OF]->(state32),
(state323)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state323)-[:ELEMENT_OF]->(public),
(state3231:State {pbotID: apoc.create.uuid(), name: "straight", definition: "passing across the intercostal area without a noticeable change in course"})-[:STATE_OF]->(state323),
(state3231)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3231)-[:ELEMENT_OF]->(public),
(state3232:State {pbotID: apoc.create.uuid(), name: "sinuous", definition: "changes direction of curvature"})-[:STATE_OF]->(state323),
(state3232)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3232)-[:ELEMENT_OF]->(public),
(state3233:State {pbotID: apoc.create.uuid(), name: "forming a chevron", definition: "most tertiary courses have a markedly sharp bend"})-[:STATE_OF]->(state323),
(state3233)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3233)-[:ELEMENT_OF]->(public),
(state3234:State {pbotID: apoc.create.uuid(), name: "convex", definition: "middle portion of the vein arches exmedially, without an inflection point"})-[:STATE_OF]->(state323),
(state3234)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3234)-[:ELEMENT_OF]->(public);

//Character 36
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Intercostal Tertiary Vein Variability", definition: "applies only to leaves with percurrent tertiaries"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "increasing exmedially", definition: "angles of the tertiaries become more obtuse away from the midvein"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "basally concentric", definition: "special case of increasing exmedially such that the tertiaries form a spider web pattern around the primary vein(s) at the base of the leaf"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "consistent", definition: "angles of the tertiaries do not vary over the surface of the lamina by more than 10%"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "increasing proximally", definition: "angles of the tertiaries become more obtuse toward the base of the lamina"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "decreasing proximally", definition: "angles of the tertiaries become more acute toward the base of the lamina"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state5:State {pbotID: apoc.create.uuid(), name: "inconsistent", definition: "angles of the tertiaries vary randomly over the lamina"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5)-[:ELEMENT_OF]->(public),
(state6:State {pbotID: apoc.create.uuid(), name: "decreasing exmedially", definition: "angles of the tertiaries become more acute away from the midvein"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6)-[:ELEMENT_OF]->(public);

//Character 37
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Epimedial Tertiaries", definition: "tertiaries that intesect a 1° vein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "course of percurrent epimedial tertiaries"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "distal/exmedial course of the epimedial tertiaries", definition: "course of the epimedial tertiaries from their approximate midpoint to their intersection with the adjacent secondary (if not ramifying or reticulating), more than one character state may apply"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state111:State {pbotID: apoc.create.uuid(), name: "basiflexed", definition: "course bends toward the base of the leaf and may either join the secondaries or lose gauge"})-[:STATE_OF]->(state11),
(state111)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state111)-[:ELEMENT_OF]->(public),
(state112:State {pbotID: apoc.create.uuid(), name: "acroflexed", definition: "course bends toward the apex of the leaf and may either join the secondaries or lose gauge"})-[:STATE_OF]->(state11),
(state112)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state112)-[:ELEMENT_OF]->(public),
(state113:State {pbotID: apoc.create.uuid(), name: "parallel to intercostal tertiary", definition: "epimedial tertiaries match pattern of adjacent intercostal tertiaries"})-[:STATE_OF]->(state11),
(state113)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state113)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "proximal/admedial course of the epimedial tertiaries", definition: "course of the epimedial tertiaries from the junction with the midvein to their approximate midpoint, more than one character state may apply"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state121:State {pbotID: apoc.create.uuid(), name: "acute to the midvein"})-[:STATE_OF]->(state12),
(state121)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state121)-[:ELEMENT_OF]->(public),
(state122:State {pbotID: apoc.create.uuid(), name: "obtuse to the midvein"})-[:STATE_OF]->(state12),
(state122)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state122)-[:ELEMENT_OF]->(public),
(state123:State {pbotID: apoc.create.uuid(), name: "parallel to the subjacent secondary"})-[:STATE_OF]->(state12),
(state123)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state123)-[:ELEMENT_OF]->(public),
(state124:State {pbotID: apoc.create.uuid(), name: "parallel to the intersecondary"})-[:STATE_OF]->(state12),
(state124)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state124)-[:ELEMENT_OF]->(public),
(state125:State {pbotID: apoc.create.uuid(), name: "parallel to the intercostal tertiaries"})-[:STATE_OF]->(state12),
(state125)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state125)-[:ELEMENT_OF]->(public),
(state126:State {pbotID: apoc.create.uuid(), name: "perpendicular to the midvein"})-[:STATE_OF]->(state12),
(state126)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state126)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "epimedial tertiary fabric"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "ramified", definition: "epimedial tertiaries branch toward the leaf margin"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "reticulate", definition: "epimedial tertiaries anastomose with other 3° veins to form a net"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "mixed", definition: "epimedial tertiaries do not consistently exhibit one characteristic"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state24:State {pbotID: apoc.create.uuid(), name: "percurrent", definition: "epimedial veins cross between 1° and 2° veins"})-[:STATE_OF]->(state2),
(state24)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state24)-[:ELEMENT_OF]->(public),
(state241:State {pbotID: apoc.create.uuid(), name: "mixed", definition: "approximately equal number of opposite and alternate percurrent tertiaries"})-[:STATE_OF]->(state24),
(state241)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state241)-[:ELEMENT_OF]->(public),
(state242:State {pbotID: apoc.create.uuid(), name: "opposite percurrent", definition: "majority of tertiaries cross between primary and secondaries in parallel paths without branching"})-[:STATE_OF]->(state24),
(state242)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state242)-[:ELEMENT_OF]->(public),
(state243:State {pbotID: apoc.create.uuid(), name: "alternate percurrent", definition: "majority of tertiaries cross between primary and secondaries with regular offsets (abrupt angular dicontinuities)"})-[:STATE_OF]->(state24),
(state243)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state243)-[:ELEMENT_OF]->(public);

//Character 38
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Exterior Tertiary Course", definition: "configuration of the third-order veins that lie exmedially to the outermost secondaries but do not necessarily form the marginal ultimate veins"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "absent", definition: "leaf does not have exterior tertiaries"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "looped", definition: "tertiaries form loops"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "variable", definition: "pattern is not consistent"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "terminating at the margin", definition: "tertiaries terminate at the margin"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public);

//Character 39
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Quaternary Vein Fabric", definition: "pattern formed by the fourth-order vein courses; these and other higher-order venation characters should be scored near the center of the blade"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "freely ramifying", definition: "quaternaries branch freely and are the finest vein-order the leaf exhibits"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "percurrent"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "mixed percurrent", definition: "quaternaries are alternate and opposite in equal proportions"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "alternate", definition: "most quaternary veins cross between adjacent tertiaries with an offset (an abrupt angular discontinuity)"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "opposite", definition: "most quaternary veins cross between adjacent tertiary veins in parallel paths without branching"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "reticulate", definition: "quaternaries anastomose with other veins to form a net"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "regular", definition: "angles formed by the vein intersections are regular"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "irregular", definition: "angles formed by the vein intersections are highly variable"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public);

//Character 40
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Quinternary Vein Fabric", definition: "pattern formed by 5° vein courses, when present; these and other higher-order venation characters should be scored near the center of the blade"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "freely ramifying", definition: "quinternaries branch freely and are the finest vein-order the leaf exhibits"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "reticulate", definition: "quinternaries anastomose with other veins to form polygons"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "regular", definition: "angles formed by the vein intersections are regular"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "irregular", definition: "angles formed by the vein intersections are highly variable"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public);

//Character 41
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Areolation", definition: "areoles are the smallest areas of the leaf tissue that are completely surrounded by veins; taken together they form a contiguous field of polygons over most of the area of the lamina; any order of venation can form one or more sides of an areole"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "absent", definition: "definition: venation ramifies into the intercostal area without producing closed meshes"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "present"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "good development", definition: "areoles of relatively consistent size and shape and generally with 3-6 sides"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "moderate development", definition: "areoles of irregular shape, more or less variable in size, generally with <7 sides"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "paxillate", definition: "areoles occurring in distinct oriented fields"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state24:State {pbotID: apoc.create.uuid(), name: "poor development", definition: "areoles many-sided (often >7) and of highly irregular size and shape"})-[:STATE_OF]->(state2),
(state24)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state24)-[:ELEMENT_OF]->(public);

//Character 42
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Freely Ending Veinlets (FEVs)", definition: "highest-order veins that freely ramify"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "FEV terminals"})-[STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "highly branched sclerids", definition: "FEVs branch densely (10+) out of the plane of the veins; the finer branches often stain differently because they are sclerids, not tracheids"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "tracheoid idoblasts", definition: "FEV endings are club-shaped and consist of tracheal cells with spiral wall thickenings"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state13:State {pbotID: apoc.create.uuid(), name: "simple"})-[:STATE_OF]->(state1),
(state13)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state13)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "FEV branching"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "mostly unbranched", definition: "FEVs present but unbranched, may be straight or curved"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "FEVs absent"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "mostly with one branch"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state24:State {pbotID: apoc.create.uuid(), name: "mostly with two or more branches"})-[:STATE_OF]->(state2),
(state24)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state24)-[:ELEMENT_OF]->(public),
(state241:State {pbotID: apoc.create.uuid(), name: "branching equal (dichotomous)"})-[:STATE_OF]->(state24),
(state241)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state241)-[:ELEMENT_OF]->(public),
(state242:State {pbotID: apoc.create.uuid(), name: "branching unequal (dendritic)"})-[:STATE_OF]->(state24),
(state242)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state242)-[:ELEMENT_OF]->(public);

//Character 43
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Marginal Ultimate Venation", definition: "configuration of the highest-order veins at the margin"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "incomplete", definition: "marginal ultimate veins recurve to form incomplete loops"})-[STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "looped", definition: "marginal ultimate veins recurved to form loops"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "absent", definition: "ultimate veins join perimarginal veins"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "spiked", definition: "marginal ultimate veins form outward-pointing spikes"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public);

//Character 44
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Tooth Spacing"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "regular", definition: "minimum intertooth distance is >60% of the maximum intertooth distance"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "irregular", definition: "minimum intertooth distance is <60% of the maximum intertooth distance"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 45
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Number of Orders of Teeth"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "one", definition: "all teeth are the same size or vary in size continuously"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "two", definition: "teeth are of two distinct sizes"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "three", definition: "teeth are of three distinct sizes"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public);

//Character 46
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Number of Teeth per Centimeter"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity", definition: "number of teeth per centimeter"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

//Character 47
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Sinus Shape"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "rounded"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "angular"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 48
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Tooth Shape"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "dominant tooth shape", definition: "primary tooth shape observed, ex: distal flank convex (CV)/proximal flank straight (ST)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state11:State {pbotID: apoc.create.uuid(), name: "distal flank", definition: "curvature of the distal flank relative to the midline of the tooth"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11)-[:ELEMENT_OF]->(public),
(state111:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state11),
(state111)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state111)-[:ELEMENT_OF]->(public),
(state112:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state11),
(state112)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state112)-[:ELEMENT_OF]->(public),
(state113:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state11),
(state113)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state113)-[:ELEMENT_OF]->(public),
(state114:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state11),
(state114)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state114)-[:ELEMENT_OF]->(public),
(state115:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state11),
(state115)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state115)-[:ELEMENT_OF]->(public),
(state12:State {pbotID: apoc.create.uuid(), name: "proximal flank", definition: "curvature of the proximal flank relative to the midline of the tooth"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12)-[:ELEMENT_OF]->(public),
(state121:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state12),
(state121)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state121)-[:ELEMENT_OF]->(public),
(state122:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state12),
(state122)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state122)-[:ELEMENT_OF]->(public),
(state123:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state12),
(state123)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state123)-[:ELEMENT_OF]->(public),
(state124:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state12),
(state124)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state124)-[:ELEMENT_OF]->(public),
(state125:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state12),
(state125)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state125)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "common tooth shape", definition: "tooth shape commonly observed, ex: distal flank convex (CV)/proximal flank straight (ST)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "distal flank", definition: "curvature of the distal flank relative to the midline of the tooth"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state211:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state21),
(state211)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state211)-[:ELEMENT_OF]->(public),
(state212:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state21),
(state212)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state212)-[:ELEMENT_OF]->(public),
(state213:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state21),
(state213)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state213)-[:ELEMENT_OF]->(public),
(state214:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state21),
(state214)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state214)-[:ELEMENT_OF]->(public),
(state215:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state21),
(state215)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state215)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "proximal flank", definition: "curvature of the proximal flank relative to the midline of the tooth"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state221:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state22),
(state221)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state221)-[:ELEMENT_OF]->(public),
(state222:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state22),
(state222)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state222)-[:ELEMENT_OF]->(public),
(state223:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state22),
(state223)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state223)-[:ELEMENT_OF]->(public),
(state224:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state22),
(state224)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state224)-[:ELEMENT_OF]->(public),
(state225:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state22),
(state225)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state225)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "additional tooth shape", definition: "tooth shape also observed, ex: distal flank convex (CV)/proximal flank straight (ST)"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "distal flank", definition: "curvature of the distal flank relative to the midline of the tooth"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state311:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state31),
(state311)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state311)-[:ELEMENT_OF]->(public),
(state312:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state31),
(state312)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state312)-[:ELEMENT_OF]->(public),
(state313:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state31),
(state313)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state313)-[:ELEMENT_OF]->(public),
(state314:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state31),
(state314)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state314)-[:ELEMENT_OF]->(public),
(state315:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state31),
(state315)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state315)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "proximal flank", definition: "curvature of the proximal flank relative to the midline of the tooth"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state321:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state32),
(state321)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state321)-[:ELEMENT_OF]->(public),
(state322:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state32),
(state322)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state322)-[:ELEMENT_OF]->(public),
(state323:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state32),
(state323)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state323)-[:ELEMENT_OF]->(public),
(state324:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state32),
(state324)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state324)-[:ELEMENT_OF]->(public),
(state325:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state32),
(state325)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state325)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "additional tooth shape", definition: "tooth shape also observed, ex: distal flank convex (CV)/proximal flank straight (ST)"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "distal flank", definition: "curvature of the distal flank relative to the midline of the tooth"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state411:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state41),
(state411)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state411)-[:ELEMENT_OF]->(public),
(state412:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state41),
(state412)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state412)-[:ELEMENT_OF]->(public),
(state413:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state41),
(state413)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state413)-[:ELEMENT_OF]->(public),
(state414:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state41),
(state414)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state414)-[:ELEMENT_OF]->(public),
(state415:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state41),
(state415)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state415)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "proximal flank", definition: "curvature of the proximal flank relative to the midline of the tooth"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public),
(state421:State {pbotID: apoc.create.uuid(), name: "CV", definition: "convex"})-[:STATE_OF]->(state42),
(state421)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state421)-[:ELEMENT_OF]->(public),
(state422:State {pbotID: apoc.create.uuid(), name: "ST", definition: "straight"})-[:STATE_OF]->(state42),
(state422)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state422)-[:ELEMENT_OF]->(public),
(state423:State {pbotID: apoc.create.uuid(), name: "CC", definition: "concave"})-[:STATE_OF]->(state42),
(state423)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state423)-[:ELEMENT_OF]->(public),
(state424:State {pbotID: apoc.create.uuid(), name: "FL", definition: "flexuous such that tooth flank is apically concave and basally convex"})-[:STATE_OF]->(state42),
(state424)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state424)-[:ELEMENT_OF]->(public),
(state425:State {pbotID: apoc.create.uuid(), name: "RT", definition: "retroflexed such that tooth flank is basally concave and apically convex"})-[:STATE_OF]->(state42),
(state425)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state425)-[:ELEMENT_OF]->(public);

//Character 49
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Principal Vein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "present"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public);

//Character 50
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Principal Vein Termination"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "submarginal"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "marginal"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state21:State {pbotID: apoc.create.uuid(), name: "at the apex of tooth"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21)-[:ELEMENT_OF]->(public),
(state22:State {pbotID: apoc.create.uuid(), name: "at the nadir of superjacent sinus"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22)-[:ELEMENT_OF]->(public),
(state23:State {pbotID: apoc.create.uuid(), name: "on the distal flank"})-[:STATE_OF]->(state2),
(state23)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state23)-[:ELEMENT_OF]->(public),
(state24:State {pbotID: apoc.create.uuid(), name: "on the proximal flank"})-[:STATE_OF]->(state2),
(state24)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state24)-[:ELEMENT_OF]->(public);

//Character 51
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Course of Major Accessory Veins"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "straight or concave"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "running from sinus to principal vein"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "convex relative to principal vein"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "looped", definition: "with multiple looping connections to principal vein"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public);

//Character 52
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Special Features of the Tooth Apex"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "simple", definition: "no tissue or structure is present within or on the tooth apex"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public),
(state2:State {pbotID: apoc.create.uuid(), name: "nonspecific", definition: "to be used for fossil teeth with a visible concentration of material in or on the tooth apex not assignable to the other special features described here"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2)-[:ELEMENT_OF]->(public),
(state3:State {pbotID: apoc.create.uuid(), name: "specific tissue or structure present within the tooth apex"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3)-[:ELEMENT_OF]->(public),
(state31:State {pbotID: apoc.create.uuid(), name: "tylate", definition: "having clear tissue at the termination of the principal vein"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31)-[:ELEMENT_OF]->(public),
(state32:State {pbotID: apoc.create.uuid(), name: "foraminate", definition: "having a bulb- or funnel-shapped cavity at the tooth apex that opens to the outside"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32)-[:ELEMENT_OF]->(public),
(state33:State {pbotID: apoc.create.uuid(), name: "cassidate", definition: "having opaque tissue at the termination of the principal vein"})-[:STATE_OF]->(state3),
(state33)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state33)-[:ELEMENT_OF]->(public),
(state4:State {pbotID: apoc.create.uuid(), name: "specific tissue or structure on the tooth apex"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4)-[:ELEMENT_OF]->(public),
(state41:State {pbotID: apoc.create.uuid(), name: "papillate", definition: "a clear, flame-shaped projection is present at the apex"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41)-[:ELEMENT_OF]->(public),
(state42:State {pbotID: apoc.create.uuid(), name: "setaceous", definition: "an opaque, peg-shaped, deciduous projection is present at the apex"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42)-[:ELEMENT_OF]->(public),
(state43:State {pbotID: apoc.create.uuid(), name: "spherulate", definition: "a clear, spherical projection is present at the apex"})-[:STATE_OF]->(state4),
(state43)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state43)-[:ELEMENT_OF]->(public),
(state44:State {pbotID: apoc.create.uuid(), name: "spinose", definition: "principal vein extends beyond the leaf margin; extension may be short or long, usually sharp"})-[:STATE_OF]->(state4),
(state44)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state44)-[:ELEMENT_OF]->(public),
(state45:State {pbotID: apoc.create.uuid(), name: "mucronate", definition: "an opaque, vascularized, peg-shaped, non-deciduous projection is present at the apex"})-[:STATE_OF]->(state4),
(state45)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state45)-[:ELEMENT_OF]->(public);

//Character Extra (Measurements)
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Lamina Length", definition: "L = lₘ + lₐ + lb"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Apical Extension Length", definition: "lₐ"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Basal Extension Length", definition: "lb"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Midvein Length", definition: "lₘ"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Width Ratio", definition: "the ratio of the smaller to the larger of the two distances measured perpendicularly from the midvein to the margin on each side of the leaf at the position of maximum leaf width; on a lobed leaf, the width ratio is measured to the outermost portion of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);

MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (public:Group {name: "public"}), (schema:Schema {title: "Cornell MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Basal Width Ratio", definition: "similar to width ratio but measured only in the widest portion of the base of the leaf (0-0.25L)"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(character)-[:ELEMENT_OF]->(public),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1)-[:ELEMENT_OF]->(public);
