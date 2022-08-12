//MLA 1999 code; Claire Cleveland

//create person doing coding
CREATE (:Person {pbotID: apoc.create.uuid(), given: "Claire", surname: "Cleveland", email: "fossilstories@gmail.com", orcid: "0000-0002-0403-3243"})

//create schema reference
MATCH (person:Person {given: "Claire", surname: "Cleveland"}) 
CREATE (:Reference {pbotID: apoc.create.uuid(), title: "Manual of Leaf Architecture", year: "1999", publisher: "Smithsonian Institution"})-[:ENTERED_BY {timestamp: datetime()}]->(person)

//create schema
MATCH (person:Person {given: "Claire", surname: "Cleveland"})
CREATE (:Schema {pbotID: apoc.create.uuid(), title: "Smithsonian MLA", year: "1999"})-[:ENTERED_BY {timestamp: datetime()}]->(person)

//create relationship reference cited by schema
MATCH (schema:Schema {title: "Smithsonian MLA"}), (reference:Reference {publisher: "Smithsonian Institution"})
CREATE (reference)-[:CITED_BY]->(schema)

//create character, states, substates with relationship(s) to schema

//Character 14
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Attachment"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "whorled", definition: "three or more leaves at each node"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "opposite", definition: "two leaves at each node"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "deccusate", definition: "each leaf attached at 90° from those above and below (can be opposite or alterate)"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "alternate", definition: "one leaf at each node"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 15
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Organization"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "simple", definition: "consisting of a single lamina"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "ternate (trifoliate)", definition: "a compound leaf with with three leaflets"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "palmately compound", definition: "a leaf with separate subunits (leaflets) attached at the apex of a petiole"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31:State {pbotID: apoc.create.uuid(), name: "sessile"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state32:State {pbotID: apoc.create.uuid(), name: "petiolulate"})-[:STATE_OF]->(state3),
(state32)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "pinnately compound", definition: "a leaf with leaflets arranged along a rachis or rachillae"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41:State {pbotID: apoc.create.uuid(), name: "bipinnate (twice pinnately compound)", definition: "compound leaf dissected twice with leaflets arranged along rachillae that are attached to the rachis"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state411:State {pbotID: apoc.create.uuid(), name: "even-pinnate"})-[:STATE_OF]->(state41),
(state411)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state412:State {pbotID: apoc.create.uuid(), name: "odd-pinnate"})-[:STATE_OF]->(state41),
(state412)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42:State {pbotID: apoc.create.uuid(), name: "once pinnately compound", definition: "a leaf with leaflets arranged along a rachis"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state421:State {pbotID: apoc.create.uuid(), name: "even-pinnate"})-[:STATE_OF]->(state42),
(state421)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state422:State {pbotID: apoc.create.uuid(), name: "odd-pinnate"})-[:STATE_OF]->(state42),
(state422)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state43:State {pbotID: apoc.create.uuid(), name: "tripinnate (thrice pinnately compound)", definition: "a compound leaf with leaflets attached to secondary rachillae that are in turn attached to rachillae, which are borne on the rachis"})-[:STATE_OF]->(state4),
(state43)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state431:State {pbotID: apoc.create.uuid(), name: "even-pinnate"})-[:STATE_OF]->(state43),
(state431)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state432:State {pbotID: apoc.create.uuid(), name: "odd-pinnate"})-[:STATE_OF]->(state43),
(state432)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 16
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Petiole Features"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "base swollen", definition: "petiole thickens at the base where it attaches to the node"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "pullvinate", definition: "having an abruptly swollen portion near the node around which the leaf can flex"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 17
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar Size"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "microphyll", definition:  "225-2,025 mm²"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "nanophyll", definition: "25-225 mm²"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "leptophyll", definition: "<25 mm²"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "notophyll", definition: "2,025-4,500 mm²"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "mesophyll", definition: "4,500-18,225 mm²"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "megaphyll", definition: ">164,025 mm²"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7:State {pbotID: apoc.create.uuid(), name: "macrophyll", definition: "18,225-164,025 mm²"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 18
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar Shape", definition: "locate the laminar axis or, in some cases, the zone of greatest width that lies perpendicular to the axis of greatest length; for lobed leaves, an ellipse is drawn around the apices of the lobes and the widest part of the elipse is then considered as in unlobed leaves"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "special", definition: "leaf is not described by any of the shapes illustrated here, ex. needle-like or awl shaped"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "oblong", definition: "the widest part of the leaf is a zone in the middle third of the long axis where the opposite margins are roughly parallel"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "obovate", definition: "the widest part of the leaf is on an axis in the apical two-fifths of the leaf"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "ovate", definition: "the widest part of the leaf is on an axis in the basal two-fifths of the leaf"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "elliptic", definition: "the widest part of the leaf is on an axis in the middle fifth of the long axis of the leaf"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 19
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar Symmetry", definition: "more than one state may apply"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "symmetrical", definition: "lamina approximately the same shape on either side of the midvein"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "asymmetrical", definition: "lamina different size or shape on either side of the midvein"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "circular", definition: "used for peltate leaves"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "circular", definition: "used for peltate leaves"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 20
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Laminar L:W Ratio", definition: "measure the length of the lamina and divide this number by the width of the lamina"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 21
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Base Angle", definition: "the vertex of the base angle lies in the center of the petiole at the point where the basal most laminar tissue touches the petiole; base angle is the angle from the vertex to the points where a line perpendicular to the midvein at 0.25 lm from the base intersects the margin and is always measured on the apical side of the rays"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "obtuse", definition: "base angle >90°"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "acute", definition: "base angle <90°"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "circular", definition: "used for peltate leaves"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "wide obtuse", definition: "a special case of obtuse such that the base angle is >180°"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 22
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Apex Base Angle", definition: "apex angle is the angle from the apical termination of the midvein to the pair of points where a line perpendicular to the midvein and 0.75 lm from the base intersects the margin, and is always measured on the basal side of the rays"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "acute", definition: "apex angle <90°"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "obtuse", definition: "apex angle 90 - 180°"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "odd-lobed acute apex"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "odd-lobed obtuse apex"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "wide obtuse", definition: "a special case of obtuse such that the apex angle is >180°"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 23
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Base Shape", definition: "these states apply to the basal 25% of the lamina (0 - 0.25L"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "hastate", definition: "two narrow pointed lobes that have apices directed exmedially, i.e. at 90°-125° from the leaf axis (lb~0)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "cuneate (straight)", definition: "the margin between the base and 0.25L has no significant curvature"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "concave", definition: "the margin between the base and 0.25L curves away from the center of the leaf (lb=0)"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state31:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "the laminar tissue extends basally along the petiole at a gradually decreasing angle (lb=0)"})-[:STATE_OF]->(state3),
(state31)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "concavo-convex", definition: "the margin between the base and 0.25L is concave basally and convex apically (lb=0)"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41:State {pbotID: apoc.create.uuid(), name: "decurrent", definition: "the laminar tissue extends basally along the petiole at a gradually decreasing angle (lb=0)"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "convex", definition: "the margin between the base and 0.25L curves away from the center of the leaf (lb=0)"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state51:State {pbotID: apoc.create.uuid(), name: "rounded", definition: "the margin forms a smooth arc across the base (lb=0)"})-[:STATE_OF]->(state5),
(state51)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state52:State {pbotID: apoc.create.uuid(), name: "trunctae", definition: "the base terminates abruptly as if cut, with margin perpendicular to the midvein or nearly so (lb=0)"})-[:STATE_OF]->(state5),
(state52)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "complex", definition: "there are more than two inflection points in the curve of the margin between the base and 0.25L (lb=0)"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7:State {pbotID: apoc.create.uuid(), name: "saggitate", definition: "narrow pointed lobes with apices directed basally, i.e. at an angle 125° or greater from the leaf axis (lb>0)"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state8:State {pbotID: apoc.create.uuid(), name: "cordate", definition: "the leaf base is embayed in a sinus with straight or convex sides (lb>0)"})-[:STATE_OF]->(character),
(state8)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state9:State {pbotID: apoc.create.uuid(), name: "lobate", definition: "rounded projections with inner margins (those towards the petiole) concave in part (lb>0)"})-[:STATE_OF]->(character),
(state9)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 24
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Position of Petiolar Attachment"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "peltate eccentric", definition: "petiole attached near the edge but inside the boundries of the leaf margin, (lb>0)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "peltate central", definition: "petiole attached within the boundaries of the leaf margin and near the center of the leaf (lb>0)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "marginal", definition: "petiolar insertion at the margin of the leaf"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 25
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Apex Shape", definition: "these states apply to the apical 25% of the lamina (0.75L - 1L)"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "complex", definition: "there are more than two inflection points in the curve of the margin between the apex and 0.75L (la = 0)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "truncate", definition: "the apex terminates abruptly as if cut, with margin perpendicular to midvein or nearly so (la = 0)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "acuminate", definition: "the margin between the apex and 0.75L is concave, curving toward the center of the leaf, or is convex basally and concve apically (la = 0); includes most drip tips"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "straight", definition: "the margin between the apex and 0.75L has no significant curvature (la = 0)"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "lₐ > 0"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state51:State {pbotID: apoc.create.uuid(), name: "lobed", definition: "lₐ > 25% of lₘ + lₐ"})-[:STATE_OF]->(state5),
(state51)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state52:State {pbotID: apoc.create.uuid(), name: "emarginate", definition: "5% < lₐ < 25% of lₘ + lₐ"})-[:STATE_OF]->(state5),
(state52)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state53:State {pbotID: apoc.create.uuid(), name: "retuse", definition: "lₐ < 5% of lₘ + lₐ"})-[:STATE_OF]->(state5),
(state53)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "convex", definition: "the margin betweeen the apex and 0.75L curves away from the center of the leaf (la = 0)"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state61:State {pbotID: apoc.create.uuid(), name: "rounded", definition: "the margin forms a smooth arc across the apex (la = 0)"})-[:STATE_OF]->(state6),
(state61)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 26
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Margin Type", definition: "more than one state may apply"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "erose", definition: "margins are irregular as if chewed"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "revolute", definition: "margins are turned under or rolled up like a scroll"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "entire", definition: "margin is smooth, without teeth"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "toothed", definition: "teeth are marginal projections with sinuses indented less than 1/4 of the distance to the midvein or long axis of the leaf; any leaf with a single tooth of any size is considered to be toothed"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state41:State {pbotID: apoc.create.uuid(), name: "dentate", definition: "teeth pointed with their axes perpendicular to the trend of the leaf margin"})-[:STATE_OF]->(state4),
(state41)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state42:State {pbotID: apoc.create.uuid(), name: "crenate", definition: "teeth smoothly rounded without a pointed apex"})-[:STATE_OF]->(state4),
(state42)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state43:State {pbotID: apoc.create.uuid(), name: "serrate", definition: "teeth pointed with their axes inclined to the trend of the leaf margin"})-[:STATE_OF]->(state4),
(state43)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 27
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Lobation", definition: "lobes are marginal indentations that reach 1/4 or more of the distance to the midvein, measured parallel to the axis of symmetry of the lobe"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "palmately lobed"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "pinnately lobed"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "unlobed"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "bilobed"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 28
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "1° Vein Category"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "pinnate", definition: "with a single primary vein"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "flabellate", definition: "several to many equally fine basal veins diverge radially at low angles and branch apically"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "palinactinodromous", definition: "primaries diverging in a series of dichotomous branchings, either closely or more distantly spaced"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "parallelodromous", definition: "2 or more parallel primary veins originate beside each other at the leaf base and converge apically"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "campylodromous", definition: "several primary veins or their branches, originating at or near a single point and running in strongly recurved arches that converge apically"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "actinodromous", definition: "three or more primary veins diverging radially from a single point"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state61:State {pbotID: apoc.create.uuid(), name: "basal"})-[:STATE_OF]->(state6),
(state61)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state62:State {pbotID: apoc.create.uuid(), name: "suprabasal"})-[:STATE_OF]->(state6),
(state62)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7:State {pbotID: apoc.create.uuid(), name: "acrodromous", definition: "three or more primaries running in convergent arches toward the leaf apex"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state71:State {pbotID: apoc.create.uuid(), name: "basal"})-[:STATE_OF]->(state7),
(state71)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state72:State {pbotID: apoc.create.uuid(), name: "suprabasal"})-[:STATE_OF]->(state7),
(state72)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 29
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "2° Vein Category"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "acrodromous", definition: "two or more secondaries running in convergent arches toward the apex of the leaf"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11:State {pbotID: apoc.create.uuid(), name: "suprabasal"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12:State {pbotID: apoc.create.uuid(), name: "basal"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "craspedodromous", definition: "secondaries terminating at the margin (ordinarily in toothed leaves)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "brochidodromous", definition: "secondaries joined together in a series of prominent arches"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "reticulodromous", definition: "secondaries branching into a reticulum toward the margin"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "semicraspedodromous", definition: "secondary veins branching just within the margin, one of the branches terminating at the margin and the other joining the superadjacent secondary (ordinariliy in toothed leaves)"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "interior", definition: "2° veins crossing between primary veins or 2° veins that do not reach the margin - typically arched or straight"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7:State {pbotID: apoc.create.uuid(), name: "eucampdodromous", definition: "secondaries upturned and gradually diminishing apically inside the margin, connected to the sueradjacent secondaries by a series of 3° cross veins without forming and 2° marginal loops"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state8:State {pbotID: apoc.create.uuid(), name: "intramarginal vein", definition: "secondaries end in a strong vein closely paralleling the leaf margin"})-[:STATE_OF]->(character),
(state8)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state9:State {pbotID: apoc.create.uuid(), name: "festooned", definition: "semicraspedodromous venation with one or more additional sets of loops outside the branch that joins the superadjacent 2° (ordinarilly in toothed leaves"})-[:STATE_OF]->(character),
(state9)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state10:State {pbotID: apoc.create.uuid(), name: "festooned brochidodromous", definition: "having one or more additional sets of loops outside of the main brochidodromous loop"})-[:STATE_OF]->(character),
(state10)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state011:State {pbotID: apoc.create.uuid(), name: "claddodromous", definition: "secondaries freely branching toward the margin"})-[:STATE_OF]->(character),
(state011)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state012:State {pbotID: apoc.create.uuid(), name: "weak brochidodromous", definition: "secondaries joined together in a series of arches"})-[:STATE_OF]->(character),
(state012)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 30
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Agrophic Veins", definition: "a comb-like complex of veins comprised of a lateral 1° or 2° backbone with 2 or more exmedial 2° veins that travel roughly parallel courses towards the margin; these veins may be straight or looped"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "simple agrophic", definition: "one or a pair of agrophic veins"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "compound agrophic", definition: "more than one pair of agrophic veins"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 31
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "# of Basal Veins", definition: "The number of 1°, 2°, and 3° veins originating at or near the the base of the leaf/top of the petiole"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 32
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "2° Vein Spacing"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "uniform"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "irregular"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "decreasing toward base"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "increasing toward base"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 33
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "2° Vein Angle"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "uniform"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "one pair acute basal secondaries"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "two pair acute basal secondaries"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "smoothly increasing toward base"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "smoothly decreasing toward base"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "abruptly increasing toward base"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 34
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Inter-2° Veins", definition: "intersecondary veins have a width and course similar to the 2°s, but they are usually thinner than the costal 2°s and do not reach the margin"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "weak"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "strong"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 35
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "3° Vein Category"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "opposite pecurrent", definition: "tertiaries cross between adjacent secondaries in parallel paths without branching"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "alternate pecurrent", definition: "tertiaries cross between secondaries with an offset (an abrupt angular discontinuity)"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "mixed opp/alt", definition: "tertiaries have both opposite percurrent and alternate percurrent courses"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "random reticulate", definition: "tertiaries anastomose (rejoin) with other 3° veins or 2° veins at random angles"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "dichotomizing", definition: "tertiaries branch freely"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "regular polygonal reticulate", definition: "tertiaries anastomose with other 3° veins to form polygons of similar size and shape"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 36
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "3° Vein Course"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "opposite pecurrent tertiary veins"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state11:State {pbotID: apoc.create.uuid(), name: "straight", definition: "passing across the intercostal area without a noticeable change in course"})-[:STATE_OF]->(state1),
(state11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state12:State {pbotID: apoc.create.uuid(), name: "convex", definition: "middle portion of the vein curving away from the center of the leaf"})-[:STATE_OF]->(state1),
(state12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state13:State {pbotID: apoc.create.uuid(), name: "sinuous", definition: "changing direction of curvature"})-[:STATE_OF]->(state1),
(state13)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "ramified tertiary veins"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state21:State {pbotID: apoc.create.uuid(), name: "admedially ramified", definition: "branching oriented toward the primary or midline"})-[:STATE_OF]->(state2),
(state21)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state22:State {pbotID: apoc.create.uuid(), name: "exmedially ramified", definition: "branching oriented toward the leaf margin"})-[:STATE_OF]->(state2),
(state22)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 37
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "3° (Vein) Angle to 1°"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "acute"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "obtuse"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "perpendicular"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 38
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "3° Vein Angle variability", definition: "the tertiary angle is measured with respect to the primary vein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "inconsistent", definition: "angle of the tertiaries varies randomly over the lamina"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "uniform", definition: "angles of the tertiaries do not vary over the surface of the lamina"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "increasing exmedially", definition: "the angles of the tertiaries become more obtuse away from the axis of symmetry"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "decreasing exmedially", definition: "the angles of the tertiaries become more acute away from the axis of symmetry"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "increasing basally", definition: "the tertiary angles become more obtuse toward the base of the lamina"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 39
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "4° Vein Category", definition: "fourth and higher order venational characters should be scored in the portion of the leaf that is roughly half way between the base and the apex unless the area is lacking"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "alternate Percurrent", definition: "4°s cross between adjacent tertiaries with an offset (an abrupt angular discontinuity)"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "opposite Percurrent", definition: "4°s cross between adjacent 3os in parallel paths without branching"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "regular polygonal reticulate", definition: "4°s anastomose with other veins to form polygons of similar size and shape"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "dichotomizing", definition: "4°s branch freely and are the finest vein order the leaf exhibits"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 40
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "5° Vein Category", definition: "fourth and higher order venational characters should be scored in the portion of the leaf that is roughly half way between the base and the apex unless the area is lacking"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "regular polygonal reticulte", definition: "veins anastomose with other veins to form polygons of similar size and shape"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "dichotomizing", definition: "5°s branch and are the finest vein class that the leaf exhibits"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 41
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Areolation", definition: "areoles are the smallest areas of the leaf tissue surrounded by veins; taken together they form a contiguous field over most of the area of the lamina; any order of venation can form one or more sides of an areole"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "lacking", definition: "(rare) venation that ramifies into the intercostal area without producing closed meshes"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "poorly developed", definition: "areoles many sided (often >7) and of highly irregular size and shape"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "moderately developed", definition: "areoles of irregular shape, more or less variable in size, usually fewer sided than in poorly developed areolation"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "well developed", definition: "areoles of relatively consistent size and shape"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "paxillate", definition: "areoles occurring in oriented fields"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 42
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "FEVs", definition: "“FEVs” are the freely ending ultimate veins of the leaf; enter extreme states as endmembers of the spectrum of states observed"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "absent"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "unbranched", definition: "no branches, may be linear or curved"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "branched", definition: "branches one time"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "2 or more branched", definition: "branches more than once"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 43
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Highest Order", definition: "highest vein order of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 44
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Highest Excurrent", definition: "highest vein order showing excurrent branching; that is, having true lateral branches rather than those produced by forking of the vein"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 45
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Marginal Ultimate (Venation)"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "incomplete loops", definition: "freely ending veinlets adjacent to the margin"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "looped", definition: "marginal ultimate vein recurved to form loops"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "teeth"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "no teeth"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "fimbrial vein", definition: "higher vein orders fused into a vein running just inside the margin"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 46
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Leaf Rank", definition: "leaf rank is a semiquantitative description of the regularity of the leaf's vein system, from an arbitrary level of 1ʳ for the lowest rank or level of organization to 4ʳ for the highest; the rank number corresponds to the highest order of veins that is well organized; the table on the next page gives the characters that define the rank"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 47
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "# of Orders (of Teeth)", definition: "(1°, 2° or 3°) if the teeth can be separated into different size groups, they are called compound"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "1 order"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "2 orders"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "3 orders"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "compound"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 48
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Teeth per Centimeter", definition: "the number of teeth/cm in the middle 50% of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 49
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "(Tooth) Spacing", definition: "the number of teeth/cm in the middle 50% of the leaf"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "quantity"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 50: I am skipping this one since this is extrememly long code for a trait we have not yet decided how to handle in MLA 2009. I can create the code if anyone thinks we need it.

//Character 51
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "Sinus (Shape)", definition: "the shape of the sinus of the tooth"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "angular"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "rounded"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 52
MATCH (person:Person {given: "Claire", surname: "Cleveland"}), (schema:Schema {title: "Smithsonian MLA"})
CREATE
(character:Character {pbotID: apoc.create.uuid(), name: "(Tooth) Apex", definition: "for situations in which a more specific identification is not possible, use non-specific glandular"})-[:CHARACTER_OF]->(schema),
(character)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state1:State {pbotID: apoc.create.uuid(), name: "simple", definition: "tooth apex formed by the change in direction of the leaf margin without additional elements"})-[:STATE_OF]->(character),
(state1)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state2:State {pbotID: apoc.create.uuid(), name: "non-specific glandular", definition: "in fossils, it may be impossible to distinguish between the different subtypes of glandular teeth; this character state is reserved for the description of fossil teeth with a visible concentration of material on the tooth apex"})-[:STATE_OF]->(character),
(state2)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state3:State {pbotID: apoc.create.uuid(), name: "spinose", definition: "principal vein of tooth projecting beyond the apex"})-[:STATE_OF]->(character),
(state3)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state4:State {pbotID: apoc.create.uuid(), name: "spherulate", definition: "having a spherical callosity fused to the apex"})-[:STATE_OF]->(character),
(state4)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state5:State {pbotID: apoc.create.uuid(), name: "papillate", definition: "having a clear, nipple-shaped, glandular apical termination"})-[:STATE_OF]->(character),
(state5)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state6:State {pbotID: apoc.create.uuid(), name: "foraminate", definition: "with an apical cavity or foramen that broadens from the termination of the principal vein toward the exterior"})-[:STATE_OF]->(character),
(state6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state7:State {pbotID: apoc.create.uuid(), name: "mucronate", definition: "with an opaque or non-deciduous cap or mucro fused to the tooth"})-[:STATE_OF]->(character),
(state7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
(state8:State {pbotID: apoc.create.uuid(), name: "setaceous", definition: "an opaque, deciduous bristle or cap thickened proximally and not fused firmly with the remaining tooth substance"})-[:STATE_OF]->(character),
(state8)-[:ENTERED_BY {timestamp: datetime()}]->(person)

//Character 53: Tooth Venation in this manual is a form field for the morphotyper to enter their description in their own words. I don't think we'll allow these in schemas, but instead we'll allow space for them in the specimen description comments section.

//Character 54: Cuticle will be handled by separate schema(s)

//Character 55: Stomata will be handled by the cuticle schema(s)

//Charcter 56: (Cuticular) Features will be handled by the cuticle schema(s)
//END OF MLA 1999 CODE