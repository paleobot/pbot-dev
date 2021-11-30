// For more specimen information see https://docs.google.com/spreadsheets/d/1xzgVW_ImkGAs4wtL-oatQSITK2P8cGP5/edit#gid=582472317

//-----------------------------------------------------------------------------------
//-------------------- OTU Descriptions ---------------------------------------------

//----------------------------- Cornus hyperborea -----------------------------------

//Create Organ node. Use MERGE, as these are reused. This allows queries like "show me all the leaf specimens".
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime();

//Create Description node complex.
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(schema:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(leafAttachment:Character {name: "Leaf Attachment"}),
		(leafAttachment)<-[:STATE_OF]-(leafAttachment_petiolate:State {name: "petiolate"}),
	(schema)<-[:CHARACTER_OF]-(leafOrganization:Character {name: "Leaf Organization"}),
		(leafOrganization)<-[:STATE_OF]-(leafOrganization_simple:State {name: "simple"}),
	(schema)<-[:CHARACTER_OF]-(laminarSize:Character {name: "Laminar Size"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_microphyll:State {name: "microphyll"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_notophyll:State {name: "notophyll"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_mesophyll:State {name: "mesophyll"}),
	(schema)<-[:CHARACTER_OF]-(laminarShape:Character {name: "Laminar Shape"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_ovate:State {name: "ovate"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_oblong:State {name: "oblong"}),
	(schema)<-[:CHARACTER_OF]-(laminarRatio:Character {name: "Laminar L:W Ratio"}),
		(laminarRatio)<-[:STATE_OF]-(laminarRatio_quantity:State {name: "quantity"}),
	(schema)<-[:CHARACTER_OF]-(lobation:Character {name: "Lobation"}),
		(lobation)<-[:STATE_OF]-(lobation_unlobed:State {name: "unlobed"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminaAttachment:Character {name: "Position of Lamina Attachment"}),
	//	(laminaAttachment)<-[:STATE_OF]-(laminaAttachment_marginal:State {name: "marginal"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(petioleBase:Character {name: "Petiole Base"}),
	//	(petioleBase)<-[:STATE_OF]-(petioleBase_regular:State {name: "regular"}),
	(schema)<-[:CHARACTER_OF]-(marginType:Character {name: "Margin Type"}),
		(marginType)<-[:STATE_OF]-(marginType_untoothed:State {name: "untoothed"}),
	(schema)<-[:CHARACTER_OF]-(baseSymmetry:Character {name: "Base Symmetry"}),
		(baseSymmetry)<-[:STATE_OF]-(baseSymmetry_symmetrical:State {name: "base symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(medialSymmetry:Character {name: "Medial Symmetry"}),
		(medialSymmetry)<-[:STATE_OF]-(medialSymmetry_symmetrical:State {name: "symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(baseShape:Character {name: "Base Shape"}),
		(baseShape)<-[:STATE_OF]-(State {name: "no basal extension"})<-[:STATE_OF]-(baseShape_convex:State {name: "convex"}),
	(schema)<-[:CHARACTER_OF]-(baseAngle:Character {name: "Base Angle"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_acute:State {name: "acute"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_obtuse:State {name: "obtuse"}),
	(schema)<-[:CHARACTER_OF]-(apexShape:Character {name: "Apex Shape"}),
		(apexShape)<-[:STATE_OF]-(apexShape_acuminate:State {name: "acuminate"}),
	(schema)<-[:CHARACTER_OF]-(apexAngle:Character {name: "Apex Angle"}),
		(apexAngle)<-[:STATE_OF]-(apexAngle_acute:State {name: "acute"})
CREATE
    (description:Description {
		pbotID: apoc.create.uuid(),
		type: "OTU",
		name: "Cornus hyperborea",
		family: "Cornacaea",
		genus: "Cornus",
		species: "hyperborea"
	}),
    (description)-[:APPLICATION_OF]->(schema),
    (description)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(characterInstance01:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance01)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance01),
			(characterInstance01)-[:INSTANCE_OF]->(leafAttachment),
			(characterInstance01)-[:HAS_STATE]->(leafAttachment_petiolate),
		(characterInstance02:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance02)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance02),
			(characterInstance02)-[:INSTANCE_OF]->(leafOrganization),
			(characterInstance02)-[:HAS_STATE]->(leafOrganization_simple),
		(characterInstance03a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03a),
			(characterInstance03a)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03a)-[:HAS_STATE]->(laminarSize_microphyll),
		(characterInstance03b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03b),
			(characterInstance03b)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03b)-[:HAS_STATE]->(laminarSize_notophyll),
		(characterInstance03c:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03c)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03c),
			(characterInstance03c)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03c)-[:HAS_STATE]->(laminarSize_mesophyll),
		(characterInstance04a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance04a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance04a),
			(characterInstance04a)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance04a)-[:HAS_STATE]->(laminarShape_ovate),
		(characterInstance04b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance04b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance04b),
			(characterInstance04b)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance04b)-[:HAS_STATE]->(laminarShape_oblong),
		(characterInstance05a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05a),
			(characterInstance05a)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance05a)-[:HAS_STATE {value: "3:2"}]->(laminarRatio_quantity),
		(characterInstance05b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05b),
			(characterInstance05b)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance05b)-[:HAS_STATE {value: "3.3:1"}]->(laminarRatio_quantity),
		(characterInstance06:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance06)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance06),
			(characterInstance06)-[:INSTANCE_OF]->(lobation),
			(characterInstance06)-[:HAS_STATE]->(lobation_unlobed),
		//(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance07),
		//	(characterInstance07)-[:INSTANCE_OF]->(laminaAttachment),
		//	(characterInstance07)-[:HAS_STATE]->(laminaAttachment_marginal),
		//(characterInstance08:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance08)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance08),
		//	(characterInstance08)-[:INSTANCE_OF]->(petioleBase),
		//	(characterInstance08)-[:HAS_STATE]->(petioleBase_regular),
		(characterInstance09:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance09)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance09),
			(characterInstance09)-[:INSTANCE_OF]->(marginType),
			(characterInstance09)-[:HAS_STATE]->(marginType_untoothed),
		(characterInstance10:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance10)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance10),
			(characterInstance10)-[:INSTANCE_OF]->(baseSymmetry),
			(characterInstance10)-[:HAS_STATE]->(baseSymmetry_symmetrical),
		(characterInstance11:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance11),
			(characterInstance11)-[:INSTANCE_OF]->(medialSymmetry),
			(characterInstance11)-[:HAS_STATE]->(medialSymmetry_symmetrical),
		(characterInstance12:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance12),
			(characterInstance12)-[:INSTANCE_OF]->(baseShape),
			(characterInstance12)-[:HAS_STATE]->(baseShape_convex),
		(characterInstance13a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13a),
			(characterInstance13a)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance13a)-[:HAS_STATE]->(baseAngle_acute),
		(characterInstance13b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13b),
			(characterInstance13b)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance13b)-[:HAS_STATE]->(baseAngle_obtuse),
		(characterInstance14:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance14)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance14),
			(characterInstance14)-[:INSTANCE_OF]->(apexShape),
			(characterInstance14)-[:HAS_STATE]->(apexShape_acuminate),
		(characterInstance15:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance15)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance15),
			(characterInstance15)-[:INSTANCE_OF]->(apexAngle),
			(characterInstance15)-[:HAS_STATE]->(apexAngle_acute)

//Create Specimen node and connect to Description and Organ
WITH description
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(organ:Organ {type: "Leaf"})
CREATE
    (specimen:Specimen {pbotID: apoc.create.uuid(), name: "YPM PB 028288", locality: "USNM 14051", preservationMode: "Compression",  idigbiouuid: "982472a2-fd87-47fe-913a-3c707c82e3d4", pbdbcid: "10805", pbdboccid: "130975"}),
    (specimen)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (specimen)-[:IS_TYPE]->(organ),
    (specimen)-[:EXAMPLE_OF {entered_by: person.personID, timestamp: datetime()}]->(description);


//----------------------------- Chaetoptelea microphylla -----------------------------------

//Create Organ node. Use MERGE, as these are reused. This allows queries like "show me all the leaf specimens".
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime();

//Create Description node complex.
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(schema:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminarSize:Character {name: "Laminar Size"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_microphyll:State {name: "microphyll"}),
	(schema)<-[:CHARACTER_OF]-(laminarShape:Character {name: "Laminar Shape"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_ovate:State {name: "ovate"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_oblong:State {name: "oblong"}),
	(schema)<-[:CHARACTER_OF]-(laminarRatio:Character {name: "Laminar L:W Ratio"}),
		(laminarRatio)<-[:STATE_OF]-(laminarRatio_quantity:State {name: "quantity"}),
	(schema)<-[:CHARACTER_OF]-(lobation:Character {name: "Lobation"}),
		(lobation)<-[:STATE_OF]-(lobation_unlobed:State {name: "unlobed"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminaAttachment:Character {name: "Position of Lamina Attachment"}),
	//	(laminaAttachment)<-[:STATE_OF]-(laminaAttachment_marginal:State {name: "marginal"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(petioleBase:Character {name: "Petiole Base"}),
	//	(petioleBase)<-[:STATE_OF]-(petioleBase_regular:State {name: "regular"}),
	(schema)<-[:CHARACTER_OF]-(marginType:Character {name: "Margin Type"}),
		(marginType)<-[:STATE_OF]-(:State {name: "toothed"})<-[:STATE_OF]-(marginType_serrate:State {name: "serrate"}),
	(schema)<-[:CHARACTER_OF]-(baseSymmetry:Character {name: "Base Symmetry"}),
		(baseSymmetry)<-[:STATE_OF]-(baseSymmetry_symmetrical:State {name: "base symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(medialSymmetry:Character {name: "Medial Symmetry"}),
		(medialSymmetry)<-[:STATE_OF]-(medialSymmetry_asymmetrical:State {name: "asymmetrical"}),
	(schema)<-[:CHARACTER_OF]-(baseShape:Character {name: "Base Shape"}),
		(baseShape)<-[:STATE_OF]-(:State {name: "no basal extension"})<-[:STATE_OF]-(:State {name: "convex"})<-[:STATE_OF]-(baseShape_rounded:State {name: "rounded"}),
		(baseShape)<-[:STATE_OF]-(:State {name: "basal extension"})<-[:STATE_OF]-(baseShape_cordate:State {name: "cordate"}),
	(schema)<-[:CHARACTER_OF]-(baseAngle:Character {name: "Base Angle"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_obtuse:State {name: "obtuse"}),
	(schema)<-[:CHARACTER_OF]-(apexShape:Character {name: "Apex Shape"}),
		(apexShape)<-[:STATE_OF]-(apexShape_acuminate:State {name: "acuminate"}),
	(schema)<-[:CHARACTER_OF]-(apexAngle:Character {name: "Apex Angle"}),
		(apexAngle)<-[:STATE_OF]-(apexAngle_acute:State {name: "acute"})
CREATE
    (description:Description {
		pbotID: apoc.create.uuid(),
		type: "OTU",
		name: "Chaetoptelea microphylla",
		family: "Ulmaceae",
		genus: "Chaetoptelea",
		species: "microphylla"
	}),
    (description)-[:APPLICATION_OF]->(schema),
    (description)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(characterInstance01:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance01)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance01),
			(characterInstance01)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance01)-[:HAS_STATE]->(laminarSize_microphyll),
		(characterInstance02a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance02a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance02a),
			(characterInstance02a)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance02a)-[:HAS_STATE]->(laminarShape_ovate),
		(characterInstance02b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance02b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance02b),
			(characterInstance02b)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance02b)-[:HAS_STATE]->(laminarShape_oblong),
		(characterInstance03a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03a),
			(characterInstance03a)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance03a)-[:HAS_STATE {value: "3:2"}]->(laminarRatio_quantity),
		(characterInstance03b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03b),
			(characterInstance03b)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance03b)-[:HAS_STATE {value: "7:2"}]->(laminarRatio_quantity),
		(characterInstance04:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance04)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance04),
			(characterInstance04)-[:INSTANCE_OF]->(lobation),
			(characterInstance04)-[:HAS_STATE]->(lobation_unlobed),
		//(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance07),
		//	(characterInstance07)-[:INSTANCE_OF]->(laminaAttachment),
		//	(characterInstance07)-[:HAS_STATE]->(laminaAttachment_marginal),
		//(characterInstance08:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance08)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance08),
		//	(characterInstance08)-[:INSTANCE_OF]->(petioleBase),
		//	(characterInstance08)-[:HAS_STATE]->(petioleBase_regular),
		(characterInstance05:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05),
			(characterInstance05)-[:INSTANCE_OF]->(marginType),
			(characterInstance05)-[:HAS_STATE]->(marginType_serrate),
		(characterInstance6:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance6)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance6),
			(characterInstance6)-[:INSTANCE_OF]->(baseSymmetry),
			(characterInstance6)-[:HAS_STATE]->(baseSymmetry_symmetrical),
		(characterInstance7:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance7)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance7),
			(characterInstance7)-[:INSTANCE_OF]->(medialSymmetry),
			(characterInstance7)-[:HAS_STATE]->(medialSymmetry_asymmetrical),
		(characterInstance8a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance8a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance8a),
			(characterInstance8a)-[:INSTANCE_OF]->(baseShape),
			(characterInstance8a)-[:HAS_STATE]->(baseShape_cordate),
		(characterInstance8b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance8b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance8b),
			(characterInstance8b)-[:INSTANCE_OF]->(baseShape),
			(characterInstance8b)-[:HAS_STATE]->(baseShape_rounded),
		(characterInstance9:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance9)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance9),
			(characterInstance9)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance9)-[:HAS_STATE]->(baseAngle_obtuse),
		(characterInstance10:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance10)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance10),
			(characterInstance10)-[:INSTANCE_OF]->(apexShape),
			(characterInstance10)-[:HAS_STATE]->(apexShape_acuminate),
		(characterInstance11:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance11),
			(characterInstance11)-[:INSTANCE_OF]->(apexAngle),
			(characterInstance11)-[:HAS_STATE]->(apexAngle_acute)

//Create Specimen node and connect to Description and Organ
WITH description
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(organ:Organ {type: "Leaf"})
CREATE
    (specimen:Specimen {pbotID: apoc.create.uuid(), name: "YPM PB 028277", locality: "USNM 14066a", preservationMode: "Compression", idigbiouuid: "8917a8d6-4766-4172-bcf4-10daa6aaa3d6", pbdbcid: "?", pbdboccid: "?"}),
    (specimen)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (specimen)-[:IS_TYPE]->(organ),
    (specimen)-[:EXAMPLE_OF {entered_by: person.personID, timestamp: datetime()}]->(description);


//----------------------------- Archeampelos acerifolia -----------------------------------

//Create Organ node. Use MERGE, as these are reused. This allows queries like "show me all the leaf specimens".
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime();

//Create Description node complex.
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(schema:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(leafAttachment:Character {name: "Leaf Attachment"}),
		(leafAttachment)<-[:STATE_OF]-(leafAttachment_petiolate:State {name: "petiolate"}),
	(schema)<-[:CHARACTER_OF]-(leafOrganization:Character {name: "Leaf Organization"}),
		(leafOrganization)<-[:STATE_OF]-(leafOrganization_simple:State {name: "simple"}),
	(schema)<-[:CHARACTER_OF]-(laminarSize:Character {name: "Laminar Size"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_notophyll:State {name: "notophyll"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_mesophyll:State {name: "mesophyll"}),
	(schema)<-[:CHARACTER_OF]-(laminarShape:Character {name: "Laminar Shape"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_ovate:State {name: "ovate"}),
	(schema)<-[:CHARACTER_OF]-(laminarRatio:Character {name: "Laminar L:W Ratio"}),
		(laminarRatio)<-[:STATE_OF]-(laminarRatio_quantity:State {name: "quantity"}),
	(schema)<-[:CHARACTER_OF]-(lobation:Character {name: "Lobation"}),
		(lobation)<-[:STATE_OF]-(:State {name: "lobed"})<-[:STATE_OF]-(lobation_palmate:State {name: "palmately lobed"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminaAttachment:Character {name: "Position of Lamina Attachment"}),
	//	(laminaAttachment)<-[:STATE_OF]-(laminaAttachment_marginal:State {name: "marginal"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(petioleBase:Character {name: "Petiole Base"}),
	//	(petioleBase)<-[:STATE_OF]-(petioleBase_regular:State {name: "regular"}),
	(schema)<-[:CHARACTER_OF]-(marginType:Character {name: "Margin Type"}),
		(marginType)<-[:STATE_OF]-(:State {name: "toothed"})<-[:STATE_OF]-(marginType_dentate:State {name: "dentate"}),
	(schema)<-[:CHARACTER_OF]-(baseSymmetry:Character {name: "Base Symmetry"}),
		(baseSymmetry)<-[:STATE_OF]-(baseSymmetry_symmetrical:State {name: "base symmetrical"}),
		(baseSymmetry)<-[:STATE_OF]-(:State {name: "base asymmetrical"})<-[:STATE_OF]-(baseSymmetry_baseExAsym:State {name: "basal extension asymmetrical"}),
	(schema)<-[:CHARACTER_OF]-(medialSymmetry:Character {name: "Medial Symmetry"}),
		(medialSymmetry)<-[:STATE_OF]-(medialSymmetry_symmetrical:State {name: "symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(baseShape:Character {name: "Base Shape"}),
		(baseShape)<-[:STATE_OF]-(:State {name: "basal extension"})<-[:STATE_OF]-(baseShape_cordate:State {name: "cordate"}),
	(schema)<-[:CHARACTER_OF]-(baseAngle:Character {name: "Base Angle"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_obtuse:State {name: "obtuse"}),
	(schema)<-[:CHARACTER_OF]-(apexShape:Character {name: "Apex Shape"}),
		(apexShape)<-[:STATE_OF]-(apexShape_straight:State {name: "straight"}),
	(schema)<-[:CHARACTER_OF]-(apexAngle:Character {name: "Apex Angle"}),
		(apexAngle)<-[:STATE_OF]-(apexAngle_acute:State {name: "acute"}),
		(apexAngle)<-[:STATE_OF]-(apexAngle_obtuse:State {name: "obtuse"})
CREATE
    (description:Description {
		pbotID: apoc.create.uuid(),
		type: "OTU",
		name: "Archeampelos acerifolia",
		family: "Vitaceae",
		genus: "Archeampelos",
		species: "acerifolia"
	}),
    (description)-[:APPLICATION_OF]->(schema),
    (description)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(characterInstance01:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance01)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance01),
			(characterInstance01)-[:INSTANCE_OF]->(leafAttachment),
			(characterInstance01)-[:HAS_STATE]->(leafAttachment_petiolate),
		(characterInstance02:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance02)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance02),
			(characterInstance02)-[:INSTANCE_OF]->(leafOrganization),
			(characterInstance02)-[:HAS_STATE]->(leafOrganization_simple),
		(characterInstance03a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03a),
			(characterInstance03a)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03a)-[:HAS_STATE]->(laminarSize_notophyll),
		(characterInstance03b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03b),
			(characterInstance03b)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03b)-[:HAS_STATE]->(laminarSize_mesophyll),
		(characterInstance04:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance04)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance04),
			(characterInstance04)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance04)-[:HAS_STATE]->(laminarShape_ovate),
		(characterInstance05a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05a),
			(characterInstance05a)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance05a)-[:HAS_STATE {value: "3:4"}]->(laminarRatio_quantity),
		(characterInstance05b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05b),
			(characterInstance05b)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance05b)-[:HAS_STATE {value: "4:3"}]->(laminarRatio_quantity),
		(characterInstance06:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance06)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance06),
			(characterInstance06)-[:INSTANCE_OF]->(lobation),
			(characterInstance06)-[:HAS_STATE]->(lobation_palmate),
		//(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance07),
		//	(characterInstance07)-[:INSTANCE_OF]->(laminaAttachment),
		//	(characterInstance07)-[:HAS_STATE]->(laminaAttachment_marginal),
		//(characterInstance08:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance08)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance08),
		//	(characterInstance08)-[:INSTANCE_OF]->(petioleBase),
		//	(characterInstance08)-[:HAS_STATE]->(petioleBase_regular),
		(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance07),
			(characterInstance07)-[:INSTANCE_OF]->(marginType),
			(characterInstance07)-[:HAS_STATE]->(marginType_dentate),
		(characterInstance08a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance08a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance08a),
			(characterInstance08a)-[:INSTANCE_OF]->(baseSymmetry),
			(characterInstance08a)-[:HAS_STATE]->(baseSymmetry_symmetrical),
		(characterInstance08b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance08b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance08b),
			(characterInstance08b)-[:INSTANCE_OF]->(baseSymmetry),
			(characterInstance08b)-[:HAS_STATE]->(baseSymmetry_baseExAsym),
		(characterInstance09:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance09)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance09),
			(characterInstance09)-[:INSTANCE_OF]->(medialSymmetry),
			(characterInstance09)-[:HAS_STATE]->(medialSymmetry_symmetrical),
		(characterInstance10:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance10)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance10),
			(characterInstance10)-[:INSTANCE_OF]->(baseShape),
			(characterInstance10)-[:HAS_STATE]->(baseShape_cordate),
		(characterInstance11:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance11),
			(characterInstance11)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance11)-[:HAS_STATE]->(baseAngle_obtuse),
		(characterInstance12:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance12),
			(characterInstance12)-[:INSTANCE_OF]->(apexShape),
			(characterInstance12)-[:HAS_STATE]->(apexShape_straight),
		(characterInstance13a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13a),
			(characterInstance13a)-[:INSTANCE_OF]->(apexAngle),
			(characterInstance13a)-[:HAS_STATE]->(apexAngle_acute),
		(characterInstance13b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13b),
			(characterInstance13b)-[:INSTANCE_OF]->(apexAngle),
			(characterInstance13b)-[:HAS_STATE]->(apexAngle_obtuse)

//Create Specimen node and connect to Description and Organ
WITH description
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(organ:Organ {type: "Leaf"})
CREATE
    (specimen:Specimen {pbotID: apoc.create.uuid(), name: "YPM PB 028277???", locality: "USNM 14066a", preservationMode: "Compression", idigbiouuid: "8917a8d6-4766-4172-bcf4-10daa6aaa3d6???", pbdbcid: "?", pbdboccid: "?"}),
    (specimen)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (specimen)-[:IS_TYPE]->(organ),
    (specimen)-[:EXAMPLE_OF {entered_by: person.personID, timestamp: datetime()}]->(description);


//----------------------------------------------------------------------------------------
//-------------------------- Specimen Descriptions ---------------------------------------

//----------------------------- 68 -----------------------------------

//Create Organ node. Use MERGE, as these are reused. This allows queries like "show me all the leaf specimens".
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime();

//Create Description node complex.
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(schema:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(leafAttachment:Character {name: "Leaf Attachment"}),
		(leafAttachment)<-[:STATE_OF]-(leafAttachment_petiolate:State {name: "petiolate"}),
	(schema)<-[:CHARACTER_OF]-(laminarSize:Character {name: "Laminar Size"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_microphyll:State {name: "microphyll"}),
	(schema)<-[:CHARACTER_OF]-(laminarShape:Character {name: "Laminar Shape"}),
		(laminarShape)<-[:STATE_OF]-(laminarShape_elliptic:State {name: "elliptic"}),
	(schema)<-[:CHARACTER_OF]-(laminarRatio:Character {name: "Laminar L:W Ratio"}),
		(laminarRatio)<-[:STATE_OF]-(laminarRatio_quantity:State {name: "quantity"}),
	(schema)<-[:CHARACTER_OF]-(lobation:Character {name: "Lobation"}),
		(lobation)<-[:STATE_OF]-(lobation_unlobed:State {name: "unlobed"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminaAttachment:Character {name: "Position of Lamina Attachment"}),
	//	(laminaAttachment)<-[:STATE_OF]-(laminaAttachment_marginal:State {name: "marginal"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(petioleBase:Character {name: "Petiole Base"}),
	//	(petioleBase)<-[:STATE_OF]-(petioleBase_regular:State {name: "regular"}),
	(schema)<-[:CHARACTER_OF]-(marginType:Character {name: "Margin Type"}),
		(marginType)<-[:STATE_OF]-(marginType_untoothed:State {name: "untoothed"}),
	(schema)<-[:CHARACTER_OF]-(baseShape:Character {name: "Base Shape"}),
		(baseShape)<-[:STATE_OF]-(State {name: "no basal extension"})<-[:STATE_OF]-(baseShape_convex:State {name: "convex"}),
	(schema)<-[:CHARACTER_OF]-(baseAngle:Character {name: "Base Angle"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_obtuse:State {name: "obtuse"}),
	(schema)<-[:CHARACTER_OF]-(apexShape:Character {name: "Apex Shape"}),
		(apexShape)<-[:STATE_OF]-(apexShape_acuminate:State {name: "acuminate"}),
	(schema)<-[:CHARACTER_OF]-(apexAngle:Character {name: "Apex Angle"}),
		(apexAngle)<-[:STATE_OF]-(apexAngle_acute:State {name: "acute"})
CREATE
    (description:Description {
		pbotID: apoc.create.uuid(),
		type: "specimen"
	}),
    (description)-[:APPLICATION_OF]->(schema),
    (description)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(characterInstance01:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance01)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance01),
			(characterInstance01)-[:INSTANCE_OF]->(leafAttachment),
			(characterInstance01)-[:HAS_STATE]->(leafAttachment_petiolate),
		(characterInstance03a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03a),
			(characterInstance03a)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03a)-[:HAS_STATE]->(laminarSize_microphyll),
		(characterInstance04a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance04a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance04a),
			(characterInstance04a)-[:INSTANCE_OF]->(laminarShape),
			(characterInstance04a)-[:HAS_STATE]->(laminarShape_elliptic),
		(characterInstance05a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance05a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance05a),
			(characterInstance05a)-[:INSTANCE_OF]->(laminarRatio),
			(characterInstance05a)-[:HAS_STATE {value: "2:1"}]->(laminarRatio_quantity),
		(characterInstance06:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance06)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance06),
			(characterInstance06)-[:INSTANCE_OF]->(lobation),
			(characterInstance06)-[:HAS_STATE]->(lobation_unlobed),
		//(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance07),
		//	(characterInstance07)-[:INSTANCE_OF]->(laminaAttachment),
		//	(characterInstance07)-[:HAS_STATE]->(laminaAttachment_marginal),
		//(characterInstance08:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance08)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance08),
		//	(characterInstance08)-[:INSTANCE_OF]->(petioleBase),
		//	(characterInstance08)-[:HAS_STATE]->(petioleBase_regular),
		(characterInstance09:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance09)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance09),
			(characterInstance09)-[:INSTANCE_OF]->(marginType),
			(characterInstance09)-[:HAS_STATE]->(marginType_untoothed),
		(characterInstance12:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance12),
			(characterInstance12)-[:INSTANCE_OF]->(baseShape),
			(characterInstance12)-[:HAS_STATE]->(baseShape_convex),
		(characterInstance13b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13b),
			(characterInstance13b)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance13b)-[:HAS_STATE]->(baseAngle_obtuse),
		(characterInstance14:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance14)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance14),
			(characterInstance14)-[:INSTANCE_OF]->(apexShape),
			(characterInstance14)-[:HAS_STATE]->(apexShape_acuminate),
		(characterInstance15:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance15)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance15),
			(characterInstance15)-[:INSTANCE_OF]->(apexAngle),
			(characterInstance15)-[:HAS_STATE]->(apexAngle_acute)

//Create Specimen node and connect to Description and Organ
WITH description
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(organ:Organ {type: "Leaf"})
CREATE
    (specimen:Specimen {pbotID: apoc.create.uuid(), name: "68", locality: "EDC1202"}),
    (specimen)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (specimen)-[:IS_TYPE]->(organ),
    (specimen)-[:DESCRIBED_BY {entered_by: person.personID, timestamp: datetime()}]->(description);

//Test the new specimen Description against existing Descriptions using a Jaccard comparison on the States.
//Nothing is created here. The OTU and value are used in the next step.
MATCH
	(specimen:Specimen {name:"68"})-[:DESCRIBED_BY]->(specimenDescription:Description)-[defined_by:DEFINED_BY]->(characterInstance:CharacterInstance)-[instanceOf:INSTANCE_OF]->(character:Character),
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
    //otu1, description1, otu2, collect([characterInstance2, instanceOf2, character2, hasState2, state2]) AS description2
    specimen, specimenDescription, fromDescriptionSet,
	CASE otuDescription.name
		WHEN null THEN specimen2.name
		ELSE otuDescription.name
	END AS otuName,
	collect(id(state2)) AS toDescriptionSet
RETURN specimen.name AS from,
       otuName AS to,
       gds.alpha.similarity.jaccard(fromDescriptionSet, toDescriptionSet) AS similarity
ORDER BY similarity DESC

//Add an EXAMPLE_OF relationship between the Specimen and the OTU Description. This can only be done after running the previous
//comparison function to determine what OTU Description this Specimen best fits. I developed a statement that pipes
//these together and creates the relationship automatically, based on the top result of the Jaccard. That statement
//is available in scratch.cypher and needs further verification. However, I'm not sure this is the sort of thing
//we'll want to automate.
MATCH
	(person:Person {given: "Douglas", surname: "Meredith"}),
	(specimen:Specimen {name: "68", locality: "EDC1202"}),
	(description:Description {name: "Cornus hyperborea"})
MERGE
	(specimen)-[ex:EXAMPLE_OF {inferenceMethod: "Jaccard on states present", inferenceValue: 0.47368421052631576, entered_by: person.pbotID}]->(description)
	ON CREATE SET
		ex.timestamp = datetime();

//Create CANDIDATE_FOR relationships between OTU Descriptions and any CharacterInstance
//nodes of specimen descriptions that are not represented by CharacterInstance nodes of the OTU Description
MATCH
    (otuDescription:Description {type: "OTU"})<-[:EXAMPLE_OF]-(:Specimen)-[:DESCRIBED_BY]->(:Description)-[:DEFINED_BY]->(spCharacterInstance:CharacterInstance)-[:HAS_STATE]->(spState:State)
WHERE
    NOT (spState)<-[:HAS_STATE]-(:CharacterInstance)<-[:DEFINED_BY]-(otuDescription)
MERGE
    (otuDescription)<-[cf:CANDIDATE_FOR]-(spCharacterInstance);


//----------------------------- 77 -----------------------------------

//Create Organ node. Use MERGE, as these are reused. This allows queries like "show me all the leaf specimens".
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"})
MERGE
    (organ:Organ { type: "Leaf"})-[entered_by:ENTERED_BY]->(person)
    ON CREATE SET
        organ.pbotID = apoc.create.uuid(),
        entered_by.timestamp = datetime();

//Create Description node complex.
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(schema:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(leafAttachment:Character {name: "Leaf Attachment"}),
		(leafAttachment)<-[:STATE_OF]-(leafAttachment_petiolate:State {name: "petiolate"}),
	(schema)<-[:CHARACTER_OF]-(laminarSize:Character {name: "Laminar Size"}),
		(laminarSize)<-[:STATE_OF]-(laminarSize_microphyll:State {name: "microphyll"}),
	(schema)<-[:CHARACTER_OF]-(lobation:Character {name: "Lobation"}),
		(lobation)<-[:STATE_OF]-(lobation_unlobed:State {name: "unlobed"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(laminaAttachment:Character {name: "Position of Lamina Attachment"}),
	//	(laminaAttachment)<-[:STATE_OF]-(laminaAttachment_marginal:State {name: "marginal"}),
	//(:Schema {title: "Cornell, 2009"})<-[:CHARACTER_OF]-(petioleBase:Character {name: "Petiole Base"}),
	//	(petioleBase)<-[:STATE_OF]-(petioleBase_regular:State {name: "regular"}),
	(schema)<-[:CHARACTER_OF]-(marginType:Character {name: "Margin Type"}),
		(marginType)<-[:STATE_OF]-(marginType_untoothed:State {name: "untoothed"}),
	(schema)<-[:CHARACTER_OF]-(baseSymmetry:Character {name: "Base Symmetry"}),
		(baseSymmetry)<-[:STATE_OF]-(baseSymmetry_symmetrical:State {name: "base symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(medialSymmetry:Character {name: "Medial Symmetry"}),
		(medialSymmetry)<-[:STATE_OF]-(medialSymmetry_symmetrical:State {name: "symmetrical"}),
	(schema)<-[:CHARACTER_OF]-(baseShape:Character {name: "Base Shape"}),
		(baseShape)<-[:STATE_OF]-(State {name: "no basal extension"})<-[:STATE_OF]-(baseShape_convex:State {name: "convex"}),
	(schema)<-[:CHARACTER_OF]-(baseAngle:Character {name: "Base Angle"}),
		(baseAngle)<-[:STATE_OF]-(baseAngle_acute:State {name: "acute"})
CREATE
    (description:Description {
		pbotID: apoc.create.uuid(),
		type: "specimen"
	}),
    (description)-[:APPLICATION_OF]->(schema),
    (description)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(characterInstance01:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance01)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance01),
			(characterInstance01)-[:INSTANCE_OF]->(leafAttachment),
			(characterInstance01)-[:HAS_STATE]->(leafAttachment_petiolate),
		(characterInstance03a:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance03a)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance03a),
			(characterInstance03a)-[:INSTANCE_OF]->(laminarSize),
			(characterInstance03a)-[:HAS_STATE]->(laminarSize_microphyll),
		(characterInstance06:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance06)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance06),
			(characterInstance06)-[:INSTANCE_OF]->(lobation),
			(characterInstance06)-[:HAS_STATE]->(lobation_unlobed),
		//(characterInstance07:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance07)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance07),
		//	(characterInstance07)-[:INSTANCE_OF]->(laminaAttachment),
		//	(characterInstance07)-[:HAS_STATE]->(laminaAttachment_marginal),
		//(characterInstance08:CharacterInstance {pbotID: apoc.create.uuid()}),
		//(characterInstance08)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		//(description)-[:DEFINED_BY]->(characterInstance08),
		//	(characterInstance08)-[:INSTANCE_OF]->(petioleBase),
		//	(characterInstance08)-[:HAS_STATE]->(petioleBase_regular),
		(characterInstance09:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance09)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance09),
			(characterInstance09)-[:INSTANCE_OF]->(marginType),
			(characterInstance09)-[:HAS_STATE]->(marginType_untoothed),
		(characterInstance10:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance10)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance10),
			(characterInstance10)-[:INSTANCE_OF]->(baseSymmetry),
			(characterInstance10)-[:HAS_STATE]->(baseSymmetry_symmetrical),
		(characterInstance11:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance11)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance11),
			(characterInstance11)-[:INSTANCE_OF]->(medialSymmetry),
			(characterInstance11)-[:HAS_STATE]->(medialSymmetry_symmetrical),
		(characterInstance12:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance12)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance12),
			(characterInstance12)-[:INSTANCE_OF]->(baseShape),
			(characterInstance12)-[:HAS_STATE]->(baseShape_convex),
		(characterInstance13b:CharacterInstance {pbotID: apoc.create.uuid()}),
		(characterInstance13b)-[:ENTERED_BY {timestamp: datetime()}]->(person),
		(description)-[:DEFINED_BY]->(characterInstance13b),
			(characterInstance13b)-[:INSTANCE_OF]->(baseAngle),
			(characterInstance13b)-[:HAS_STATE]->(baseAngle_acute)

//Create Specimen node and connect to Description and Organ
WITH description
MATCH
	(person:Person {given: "Ellen", surname: "Curranno"}),
	(organ:Organ {type: "Leaf"})
CREATE
    (specimen:Specimen {pbotID: apoc.create.uuid(), name: "77", locality: "EDC0606"}),
    (specimen)-[:ENTERED_BY {timestamp: datetime()}]->(person),
    (specimen)-[:IS_TYPE]->(organ),
    (specimen)-[:DESCRIBED_BY {entered_by: person.pbotID, timestamp: datetime()}]->(description);

//Test the new specimen Description against existing Descriptions using a Jaccard comparison on the States.
//Nothing is created here. The OTU and value are used in the next step.
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
    //otu1, description1, otu2, collect([characterInstance2, instanceOf2, character2, hasState2, state2]) AS description2
    specimen, specimenDescription, fromDescriptionSet,
	CASE otuDescription.name
		WHEN null THEN specimen2.name
		ELSE otuDescription.name
	END AS otuName,
	collect(id(state2)) AS toDescriptionSet
RETURN specimen.name AS from,
       otuName AS to,
       gds.alpha.similarity.jaccard(fromDescriptionSet, toDescriptionSet) AS similarity
ORDER BY similarity DESC
limit 1 as result

//Add an EXAMPLE_OF relationship between the Specimen and the OTU Description. This can only be done after running the
//previous comparison function to determine what OTU Description this Specimen best fits. I developed a statement that
//pipes these together and creates the relationship automatically, based on the top result of the Jaccard. That statement
//is available in scratch.cypher and needs further verification. However, I'm not sure this is the sort of thing
//we'll want to automate.
MATCH
	(person:Person {given: "Douglas", surname: "Meredith"}),
	(specimen:Specimen {name: "77", locality: "EDC0606"}),
	(description:Description {name: "Cornus hyperborea"})
MERGE
	(specimen)-[ex:EXAMPLE_OF {inferenceMethod: "Jaccard on states present", inferenceValue: 0.4444444444444444, entered_by: person.pbotID}]->(description)
	ON CREATE SET
		ex.timestamp = datetime();

//Create CANDIDATE_FOR relationships between OTU Descriptions and any CharacterInstance
//nodes of specimen descriptions that are not represented by CharacterInstance nodes of the OTU Description
MATCH
    (otuDescription:Description {type: "OTU"})<-[:EXAMPLE_OF]-(:Specimen)-[:DESCRIBED_BY]->(:Description)-[:DEFINED_BY]->(spCharacterInstance:CharacterInstance)-[:HAS_STATE]->(spState:State)
WHERE
    NOT (spState)<-[:HAS_STATE]-(:CharacterInstance)<-[:DEFINED_BY]-(otuDescription)
MERGE
    (otuDescription)<-[cf:CANDIDATE_FOR]-(spCharacterInstance);
