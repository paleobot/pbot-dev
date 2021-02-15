// People/Person/Users are the highest level of independence in the db schema (at least at this moment) so they get created first
// Should there be a metadata log for who enters the enterers?
// One thing I did that I'm not sure if it is considered kosher or not is rather than put NULL for the orcid and email fields when those data are missing
// I exclude those data entirely 

// My current philosophy as to what should be a node as opposed to a property of a node is that if the propetry is something that you want to have metadata
// of its own, then it should be a new node. If not, then it should be a property - i.e., properties should be terminal information.
// So, in this case, whether a user is an Admin should be signified by attachment to an Admin node rather than it being stated as a property of the Person node.
CREATE (a:Person {
    personid: '75cb1ca0e6286d31133ce51b0ad4f44f',
    given: 'Andrew',
    surname: 'Zaffos',
    email: 'azaffos@arizona.edu',
    orcid: '0000-0002-4731-6091'
    }), 
    (b:Person {
    personid: '9e40e3603e519ffcf2c4590f50cb1589',
    given: 'Scott',
    surname: 'Wing',
    email: 'wing@si.edu',
    orcid: '0000-0002-2954-8905'
    }),      
    (c:Person {
    personid: '8b876f81690b0284d81fb00764525346',
    given: 'Amanda',
    surname: 'Ash'
    }),
    (d:Person {
    personid: '0c6f2272ac9bb55e39538e19265238f9',
    given: 'Leo',
    surname: 'Hickey'
    }),
    (e:Person {
    personid: '8ffc79743f1c80631a81aefdbd9692ba',
    given: 'Kirk',
    surname: 'Johnson'
    }),
    (f:Person {
    personid: '28a24aecda52f2e2a43b6b8819b41497',
    given: 'Dori',
    surname: 'Contreras',
    email: 'dori.contreras@perotmuseum.org',
    orcid: '0000-0001-6820-7364'
    }),
    (g:Person {
    personid: 'b6a792bfe6c20622620b48f999c5baaf',
    given: 'Ellen',
    surname: 'Curranno',
    email: 'ecurrano@uwyo.edu',
    orcid: '0000-0002-5242-8573'
    }),
    (h:Person {
    personid: 'a362be48e97cb57b1cb584d59d91851d',
    given: 'Beth',
    surname: 'Ellis'
    }),
    (i:Person {
    personid: 'be7320d8f4ca55934df6a4338fd0c7ce',
    given: 'John',
    surname: 'Mitchell'
    }),
    (j:Person {
    personid: 'df06c03a45ed263374f3fba8b3559aab',
    given: 'Douglas',
    surname: 'Daly',
    email: 'ddaly@nybg.org'
    }),
    (k:Person {
    personid: '35070f34b5889a74ddf9516311d27d54',
    given: 'Peter',
    surname: 'Wilf',
    email: 'pwilf@psu.edu',
    orcid: '0000-0001-6813-1937'
    }),
    (l:Person {
    personid: '9feee63c84046ab256493c78cc967b30',
    given: 'Claire',
    surname: 'Cleveland',
    email: 'clairecleveland@psu.edu',
    orcid: '0000-0002-0403-3243'
    }),
    (m:Person {
    personid: '6cab138722a7a7eec53e213a698038bc',
    given: 'Simon',
    surname: 'Goring',
    email: 'simon.j.goring@gmail.com',
    orcid: '0000-0002-2700-4605'
    }),
    (n:Person {
    personid: 'dbdea03036fd0c1d7b597fd860ba0494',
    given: 'Douglas',
    surname: 'Meredith',
    email: 'douglasm@arizona.edu'
    }),
    (o:Person {
    personid: '543cab021a7e811e7cc69b7ed3aa1c16',
    given: 'Rebecca',
    surname: 'Koll',
    email: 'rebecca.koll@perotmuseum.org',
    orcid: '0000-0001-5601-6632'
    }),
    (p:Person {
    personid: '5075f3cd4c4d711f28c35da7d125da28',
    given: 'Shanan',
    surname: 'Peters',
    email: 'peters@geology.wisc.edu',
    orcid: '0000-0002-3346-4317'
    }),
    (q:Person {
    personid: '9270c7e9036a1c9a29d395c866b25acc',
    given: 'Mark',
    surname: 'Uhen',
    email: 'muhen@gmu.edu',
    orcid: '0000-0002-2689-0801'
    })

// Create two new references as personid 75cb1ca0e6286d31133ce51b0ad4f44f
MATCH (n:Person {personid: '75cb1ca0e6286d31133ce51b0ad4f44f'})
CREATE (n)-[r:ENTERER {timestamp: datetime()}]->(a:Reference {
      refid: '431d5b07caa98bec0db700748de6e918',
      title: 'Manual of Leaf Architecture - Morphological description and categorization of dicotyledonous and net-veined monocotyledonous angiosperms',
      year: '1999', 
      publisher: 'Smithsonian Institution',
      doi:'10.13140/2.1.3674.5282'
      }),
      (n)-[r1:ENTERER {timestamp: datetime()}]->(b:Reference {
      refid: 'f6cc59e5793b6ec1bc8777fe972d2a99',
      title: 'Manual of Leaf Architecture',
      year: '2009',
      publisher: 'Cornell University Press'
      })
      
// Assign authors to the 1999 reference
MATCH (a:Person), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
WHERE a.surname IN ['Ash', 'Ellis','Wing','Hickey','Johnson','Wilf','Wing']
CREATE (a)-[:AUTHOR]->(m)

// Assign authors to the 20009 reference
MATCH (a:Person), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
WHERE a.surname IN ['Ellis','Wing','Hickey','Johnson','Wilf','Wing','Mitchell','Daly']
CREATE (a)-[:AUTHOR]->(m)

// Identify as user 543cab021a7e811e7cc69b7ed3aa1c16 (Rebecca Koll) and add a chracter "leaf attachement" to reference and also specify the enterer relationship
// Note that characters and states refer to the 1999 Manual of leaf architecture - refid `431d5b07caa98bec0db700748de6e918`
// This is not an exhaustive list
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '4a537369661846692b69a0d5e3d287c7', name: 'Leaf Attachment'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '5e9c7f0a61c551a22a471c1418106de3', name: 'alternate', definition: 'one leaf at each node'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'aa6e874e342a182472cfde12a978f13e', name: 'opposite', definition: 'two leaves at each node'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'fa7ff0c6677b272084964c4ac2417292', name: 'whorled', definition: 'three or more leaves at each node'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '8be25cd7356abc7d9de31b391323aee0', name: 'decussate', definition: 'each leaf attached at 90 from those above and below (can be opposite or alternate)'})-[:SCHEMA]->(a)

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '6c99821059e736cc4433ba79d7043c0f', name: 'Leaf Organization'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '1fb13901cab1f80e176adb90e39de2f2', name: 'simple', definition: 'consisting of a single lamina'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '0be8bae13399593cbeb10bb80cae2669', name: 'palmately compound', definition: 'a leaf with separate subunits (leaflets) attached at the apex of a petiole (can be sessile or petiolulate)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'ced12892222f103a97366fc8a64ad979', name: 'trifoliate', definition: 'a compound leaf with three leaflets'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '2e1f5395c9bb8b503967347dda38527d', name: 'pinnately compound', definition: 'a leaf with leaflets arranged along a rachis (can be odd- or even-pinnate)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '36c6fcea46a62b5e3435744a67c6eaee', name: 'bipinnate', definition: 'compound leaf dissected twice with leaflets arranged along rachillae that are attached to the rachis (alternate term is twice pinnatley compound)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '9a72cf16bc64b940499ef1d77830530c', name: 'tripinnate', definition: 'a compound leaf with leaflets attached to secondary rachillae that are in turn attached to rachillae, which are borne on the rachis (alternate term is thrice pinnately compound)'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '66b4977c7771a2b4ef9000308ce426fa', name: 'Petiol Features'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'ae008dffb64ce314f8e57a095c56b3a6', name: 'base swollen', definition: 'petiole thickens at the base where it attaches to the node'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '3fd7e25bdad9362e83b89783b7c1d7cb', name: 'pulvinate', definition: 'having an abruptly swollen portion near the node around which the leaf can flex'})-[:SCHEMA]->(a)
   
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'ce4663e2a70971c4e0e5683e25f476c9', name: 'Laminar Size', definition: 'area of the leaf'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '7911d97d0a9fb2c98d16090eec95f26d', name: 'leptophyll', definition: 'blade class wherein area of leaf in mm^2 = <25'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'def1f4be7a46e3b5895f49b0aced5005', name: 'nanophyll', definition: 'blade class wherein area of leaf in mm^2 = 25-225'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '213836a673ee2fbb82e9d86c2e34ff37', name: 'microphyll', definition: 'blade class wherein area of leaf in mm^2 = 225-2025'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '6f2097a5d5952f289ab558a985ea01fc', name: 'notophyll', definition: 'blade class wherein area of leaf in mm^2 = 2025-4500'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'f12dd914aaca6b1b5abca49c7824f962', name: 'mesophyll', definition: 'blade class wherein area of leaf in mm^2 = 4500-18,225'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '1cd3d496b3743cbea5b9c9b746017784', name: 'macrophyll', definition: 'blade class wherein area of leaf in mm^2 = 18,225-164,025'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: 'e8713202eeaad201c2958a78f24d3b46', name: 'megaphyll', definition: 'blade class wherein area of leaf in mm^2 = >164,025'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '776743a44e41d5fed02fd3e5fd280397', name: 'Laminar Shape'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'e2bbdbc294f12839e9f759e427f2c8fe', name: 'elliptic', definition: 'the widest part of the leaf is on an axis in the middle fith of the long axis of the leaf'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '8c5b6e69639b990ccd61175fc0d13826', name: 'obovate', definition: 'widest part of the leaf is on an axis in the apical 2/5 of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'd2ac59567b7803c6ce9a09a7aaeb45e3', name: 'ovate', definition: 'widest part of the leaf is on an axis in the basal 2/5 of the leaf'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'e552c88633c6dcfbf6579bfb38ea2760', name: 'oblong', definition: 'widest part of the leaf is a zone in the middle 1/3 of the long axis where the opposite margins are roughly parallel'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'a373d3439aee5ba2ccddaff128bf5829', name: 'special', definition: 'leaf is not described by any of the shapes listed here'})-[:SCHEMA]->(a),
     
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'b6255e38a7a9895c9469f3cb408a7a57', name: 'Laminar Symmetry'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '168298638f92c198c53ee4f65a090803', name: 'symmetrical', definition: 'lamina approximately the same shape on either side of the midvein'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'e83d1b2f4a288ba06a9f524874594b67', name: 'asymmetrical', definition: 'lamina different size or shape on either side of the midvein (whole lamina)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '17dfe53399bd821653f61e18b288ffb7', name: 'base asymmetrical', definition: 'base of the lamina of markedly different shape on either side of the midline (base only)'})-[:SCHEMA]->(a)
   
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'aba9ff3c74ff901e70f8b05bccd87c0e', name: 'Base Angle', definition: 'the angle from the vertex to the points where a line perpendicular to the midvein at 0.25 midvein length from the base intersects the margin'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'f0b4809a47d206ce3b5cbf8cb9c5f365', name: 'acute', definition: 'base angle <90'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'a647f9d27883e768d01df671334d36c9', name: 'obtuse', definition: 'base angle >90'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '8b1bd9e96045effebfe6644548cb74ec', name: 'wide obtuse', definition: 'a special case of obtuse such that the base angle is >180'})-[:SCHEMA]->(a)


MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'dbd0f7a3019560fc72446acc6aa20c47', name: 'Apex Angle', definition: 'the angle from the apical termination of the midvein to the pair of points where a line perpendicular to the midvein and 0.75 midvein length from the base intersects the margin'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'eee251b431742c37df3ed4e7984ec1d5', name: 'acute', definition: 'apex angle <90'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '4c99a05d24c39f1103ceb1a140bedef8', name: 'obtuse', definition: 'apex angle 90-180'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '74170a7fbdbfa82a7550317a4ad53033', name: 'wide obtuse', definition: 'a special case of obtuse such that the apex angle is >180'})-[:SCHEMA]->(a),
   (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'c50146cd6716ccc0cdfe319933ee6729', name: 'odd-lobed actue apex'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '3aaa8a65d01267d47a5de5be34a3114b', name: 'odd-lobed obtuse apex'})-[:SCHEMA]->(a)
   
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'd80ca3d16183680a58e88d3e6d960386', name: 'Base Shape', definition: 'basal 25% of the lamina'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '62cefd0b32c6dd26f2596aa3c3fe7f50', name: 'cuneate', definition: 'the margin between the base and 0.25L has no significant curvature'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '102d86d82089eb801c6126da9457ef76', name: 'convex', definition: 'the margin between the base and 0.25L curves away from the center of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '127edc094cf93178bc9d03b0739f4f06', name: 'rounded', definition: 'subtype of convex in which the margin forms a smooth arc across the base'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'f5431d0253c9a03f6cc5dc8bdc517ffb', name: 'truncate', definition: 'subtype of convex in which the base terminates abruptly as if cut, with margin perpendicular to the midvein or nearly so'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '2f27118be3db86da88ad49c846246887', name: 'concave', definition: 'the margin between the base and 0.25L curves toward the center of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '0a68e18ebd7d33f1466132a81fa2e4d7', name: 'concavo-convex', definition: 'the margin between the base and 0.25L is concave basally and convex apically'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: '355f800e4c60223e1b8b5f0562c4450b', name: 'decurrent', definition: 'subtype of either concave or concavo-convex in which the laminar tissue extends basally along he petiole at a gradually decreasing angle'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a8:State {stateid: 'b5a4f559bb0dd5c26ca1e433ac08c55b', name: 'complex', definition: 'there are more than two inflection points in the curve of the margin between the base and 0.25L'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a9:State {stateid: '5ea1f2a850cb2145c61f5e5b442c48d8', name: 'cordate', definition: 'the leaf base is embayed in a sinus with straight or convex sides'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a10:State {stateid: 'ab60eaa1c35553325a7af86a0e819ac2', name: 'lobate', definition: 'rounded projections with inner margins (those towards the petiole) concave in part'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a11:State {stateid: '7e40572a5e91eff09b898fbc4b791e26', name: 'sagittate', definition: 'narrow pointed lobes with apices directed basally (at an angle 125 or greater from the leaf axis)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a12:State {stateid: 'd177709889aeffeb42058a901f2ea5ee', name: 'hastate', definition: 'two narrow pointed lobes that have apices directed exmedially (90-125 from the leaf axis)'})-[:SCHEMA]->(a)


MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'c0c37be6346b9b8f2d923105bdc1c191', name: 'Position of Petiolar Attachment'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '53a0a5d81d6959ab3aa183db85308157', name: 'marginal', definition: 'petiolar insertion at the margin of the leaf'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '40bd09ccdd1e3b01c23f7b513d15b4a7', name: 'peltate central', definition: 'petiole attached within the boundaries of the leaf margin and near the center of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'c06221404ad6f09d2ba2a71fb6a39f5f', name: 'peltate eccentric', definition: 'petiole attached near the edge but inside the boundaries of the leaf margin'})-[:SCHEMA]->(a)
   

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '501f25a1e8fc75cde8c6205daf2c322f', name: 'Apex Shape', definition: 'states of the apical 25% of the lamina'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '6af85080dd4851d29b98c81443e77f97', name: 'straight', definition: 'the margin between the apex and the 0.75L has no significant curvature'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '23d10dbb89a520c644ab203f47f47f9a', name: 'convex', definition: 'the margin between the apex and 0.75L curves away from the center of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'd276adc77245cc68c244da7801dec832', name: 'rounded', definition: 'subtype of convex in which the margin forms a smooth arc across the apex'})-[:SCHEMA]->(a),
     (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '6f3060d7e93bc121e6b5b5569670fce1', name: 'truncate', definition: 'the apex terminates abruptly as if cut, with margin perpendicular to midvein or nearly so'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '3ec9a8fbdb002a82ae49e5fc7c1349f8', name: 'acuminate', definition: 'the margin between the apex and 0.75L is concave, curving toward the center of the leaf, or is convex basally and concave apically (category includes drip tips)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '5d457cdd3b5e4abc2535cb160f5ca77c', name: 'complex', definition: 'there are more than two inflection points in the curve of the margin between the apex and 0.75L'})-[:SCHEMA]->(a),
     (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: 'c13a5d721f940ee2f86e9c6ff2667a3a', name: 'retuse', definition: 'the length of the midvein is 95-99% of midvein length + apical extension length'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a8:State {stateid: 'e78d6a195db8371a9439d62f8ed238de', name: 'emarginate', definition: 'the length of the midvein is 75-95% of midvein length + apical extension length'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a9:State {stateid: '7f9e875e05047924590e70ad4de09532', name: 'lobed', definition: 'the length of the midvein is <75% of midvein length + apical extension length'})-[:SCHEMA]->(a)
          

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '764492bb10ffa538a2580260ab3d80e3', name: 'Margin Type'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'da7f6ea53b8a6118e7497dc0f19879a8', name: 'Toothed', definition: 'marginal projections with sinuses indented less than 1/4 of the distance to the midvein or long axis of the leaf (can be dentate, serrate, or crenate)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '9051165b83a9d0f154a63aab6b6d9d72', name: 'dentate', definition: 'teeth pointed with their axes perpendicular to the trend of the leaf margin'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'b6a21f1ffd10aa390d41eb2bad5a234e', name: 'serrate', definition: 'teeth pointed with their axes inclined to the trend of the leaf margin'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '256560ca1fd663c616c54fadc8a9db9f', name: 'crenate', definition: 'teeth smoothly rounded without a pointed apex'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'b744333c576fc51104b75127d9366472', name: 'entire', definition: 'margin is smooth, without teeth'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '243836ac6781e945f3fc51a24a1d495d', name: 'revolute', definition: 'margins are turned under or rolled up like a scroll'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: '355d8045f4761cec33e761a723256c57', name: 'erose', definition: 'margins are irregular as if chewed'})-[:SCHEMA]->(a)

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '426e947951d767b3045af7af5578f279', name: 'Lobation', definition: 'marginal indentations that reach 1/4 or more of the distance to the midvein, measured parallel to the axis of symmetry of the lobe'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'ab555477525437552097b3f7a6c4e843', name: 'unlobed'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'fab3aa9ab599a40c2c22d37efe8bb3a3', name: 'bilobed'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '044394ab4de8d40f5cc06ff0bc38df8c', name: 'palmately lobed'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '261093e79d74c5c23b57729e4517d831', name: 'pinnately lobed'})-[:SCHEMA]->(a)

// Identify as user 543cab021a7e811e7cc69b7ed3aa1c16 (Rebecca Koll) and add a chracter "leaf attachement" to reference and also specify the enterer relationship
// Note that characters and states refer to the 2009 Manual of leaf architecture - refid `f6cc59e5793b6ec1bc8777fe972d2a99`
// This is not an exhaustive list
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '6fcaebb1142bb6517d9b9e7c331cdc21', name: 'Leaf Attachment'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '9358703a565aac9930c75ec6edaa7cf6', name: 'petiolate', definition: 'a petiole attaches the leaf to the axis'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '10bc76aff40682aa83a108cdc0ecf9e6', name: 'sessile', definition: 'leaf attaches directly to the axis without a petiole'})-[:SCHEMA]->(a) 

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '40e73d92403e678b06dc170e58ce7cfc', name: 'Leaf Arrangement', definition: 'the placement of adjacent leaves on the nodes of the axis (more than one may apply)'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '6f56586218084a39f8de127b5b3abf01', name: 'alternate distichous', definition: 'adjacent leaves occur above or below others on the axis with one leaf per node (in one plane in two ranks on opposite sides of the axis)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'a255f86487a54ea9577c1db148f1b779', name: 'alternate helical', definition: 'adjacent leaves occur above or below others on the axis with one leaf per node (in a spiral along the axis)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '122de8336af6336a41cfaa43886e4977', name: 'opposite', definition: 'leaves occur in opposed pairs that arise from the same node along the axis (leaf pairs may be decussate, distichous, or spirodecussate)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '29e881ec2417928e442279ccec88b1f2', name: 'whorled', definition: 'three or more leaves are borne at each node'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'f40dac433ca587274b76dd70c158a169', name: 'subopposite decussate', definition: 'adjacent leaves occur in pairs that are nearly but not strictly opposite (leaf pairs inserted at ~90 to those above and below)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '5ec13751ea7d019d563b68571cfa375b', name: 'subopposite distichous', definition: 'adjacent leaves occur in pairs that are nearly but not strictly opposite (leaf pairs are aligned with those above and below)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: 'da433b0b3433faf5fa1d98e2a4c5939f', name: 'subopposite spirodistichous', definition: 'adjacent leaves occur in pairs that are nearly but not strictly opposite (successive leaf pairs inserted at angles >90 to those above and below)'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '48b90545116e5d014a2da91e6a4c678a', name: 'Leaf Organization'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '2bb22f1bebbd5d1fd739e6b3b1325c7b', name: 'simple', definition: 'leaf consists of a single lamina attached to a simple petiole'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '6ef30f723e614714eb300fcdc623d155', name: 'palmately compound', definition: 'leaf has more than two separate laminar sub-units (leaflets) attached at the apex of the petiole'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '7763fcf788ba0a55ad4373f1df679de1', name: 'once compound', definition: 'leaflet arranged along a rachis (with a single order of pinnate leaflets)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '566e410a681f930bbdf4a06b06c475cc', name: 'bipinnately compound', definition: 'leaflet arranged along a rachis (dissected twice with leaflets arranged along rachillae that are attached to the rachis)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'd058f06653e6f088d98ada5e2b89680f', name: 'tripinnately compound', definition: 'leaflet arranged along a rachis (leaflets are attached to secondary rachillae that are in turn attached to rachillae, which are borne along the rachis)'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '8f9d01c945d21fda71618d4781593cf1', name: 'Leaflet Arrangement'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '3a26a8fc5aaba3896368ed34e7f91074', name: 'alternate', definition: 'leaflets are arranged alternately on the rachis'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'ccec35d549d303520c1f205338dd8f99', name: 'subopposite', definition: 'leaflets are in pairs that are nearly, but not strictly, opposite'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'fb51c9a994b5ce1af6758c3b13471c08', name: 'opposite', definition: 'leaflets are in pairs that arise on opposite sides of the rachis (odd-pinnately compound or even-pinnately compound)'})-[:SCHEMA]->(a),
(n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'e8a1c086e543f079cf0e4b63d1736aea', name: 'unknown', definition: 'fossil only, not preserved'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '0059d30a03468e8d855b0a1773524afb', name: 'Leaflet Attachment'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '71732f5f9b176959edecf394e8a26622', name: 'petiolulate', definition: 'leaflet is attached to the rachis by means of a petiolule (stalk analogous to the petiole of a leaf)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'cab134e1e3667188f629429b9ee4b808', name: 'sessile', definition: 'leaflet is attached directly to the rachis'})-[:SCHEMA]->(a) 
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'fcb3b63a0f794515b5c2c833832a7646', name: 'Petiole Base'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '0f2a311a52b41a233e45d2018566f343', name: 'sheathing', definition: 'petiole expands to clasp the stem'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '3fab359c1456d801896a0da8d3a3eab5', name: 'pulvin(ul)ate', definition: 'having an abruptly swollen portion near the node around which the leaf(let) can flex (may occur with or without an abscission joint)'})-[:SCHEMA]->(a) 

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '976e62f1398b3b54baa4c32eceacbf40', name: 'Glands', definition: 'swollen areas of secretory tissue, often paired'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '851235712863a42507843f4aa2f7d633', name: 'petiolar', definition: 'glands are borne along the petiole'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'adc01ba20048b3c5ea3be6110fe794b7', name: 'acropetiolar', definition: 'glands are borne at the distal end of the petiole, below the base of the leaf'})-[:SCHEMA]->(a) 
   
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'b7d9668fb63ff149b74926b704878df8', name: 'Petiole-cross Section'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'bcf7e95cf2c9c97271231a786d74d6dd', name: 'terete', definition: 'round'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '32f10b14c299a9098ea0727c923b6002', name: 'semiterete', definition: 'semicircular'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '589961673d254a61f1c16100b4a8eff0', name: 'canaliculate', definition: 'having a longitudinal channel or groove'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '55bfb0dea423edf7d01356cef4782055', name: 'angular'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'faaf63b20e0346397a12a97071667ef0', name: 'alate', definition: 'with lateral ridges or flanked by laminar tissue (also referred to as winged)'})-[:SCHEMA]->(a)

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '43d874f41d4b23ed1d999b042c734f0b', name: 'Phyllodes', definition: 'petiole or rachis is expanded to make a lamina'})-[:SCHEMA]->(m)

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '4ada3b30158d85503221c28becedc1f9', name: 'Position Of Leaf Attachment', definition: 'the point from which the lamina is borne'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'ee743b011b783a8923a3dbe658ed1ebf', name: 'marginal', definition: 'leaf is attached at its margin'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '03d5fe52d8554f07832b2993004479c3', name: 'peltate central', definition: 'leaf is borne from a position near the center of the lamina'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '68d94808ead961079671a74c7e2b7993', name: 'peltate excentric', definition: 'leaf is borne from a position within the boundaries of the lamina but not near its center'})-[:SCHEMA]->(a)
       
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '1235a34eb53c2df632508f6fe67eadae', name: 'Laminar Shape'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '94e0f1bb025131bc1396c5e66f7e8c80', name: 'elliptic', definition: 'the widest part of the leaf is in the middle one-fifth'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '2c85adf0d253d2be277709760be09cb6', name: 'obovate', definition: 'the widest part of the leaf is in the distal two-fifths'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '8cf74efa371c5e10cbfd7991502afcc8', name: 'ovate', definition: 'the widest part of the leaf is in the proximal two-fifths'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '97cef3716360cf5eb37e87c30e974c0f', name: 'oblong', definition: 'the opposite margins are roughly parallel for at least the middle one-third of the leaf'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '90ea5f46d177904bd791551f32b06ce5', name: 'linear', definition: 'the L:W ratio of a leaf is greater than or equal to 10:1, regardless of the position of the widest part of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '523e34e539455f81b1132fc68673b1e7', name: 'special', definition: 'outlines that do not fall readily into one of the shape classes above'})-[:SCHEMA]->(a)
         
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '831b819f9931578d2434f1f5d8262f3d', name: 'Medial Symmetry', definition: 'determined by the width ratio in the middle of the leaf'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '488efce53e0ba622dd7233abc2a1f319', name: 'symmetrical', definition: 'width ratio (x/y)>0.9 from 0.25L to 0.75L'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '193be333dcb42b3948a1755ed8efc115', name: 'asymmetrical', definition: 'width ratio (x/y)<0.9L from 0.25L to 0.75L'})-[:SCHEMA]->(a)

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'f44fd4ac3b974d79c48453ee65c44daa', name: 'Base Symmetry', definition: 'determined by the width ratio in the base of the leaf'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'f276c15086b1b55aa9a76d49ec9f24e3', name: 'base symmetrical', definition: 'base lacks any of the asymmetries identified below'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '5f5d14f4241ef11cd1c1b8524ee56bfe', name: 'basal width asymmetrical', definition: 'basal width ratio (x/y)<0.9'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '0b52820756cd8a4975c141153f54d0d6', name: 'basal extension asymmetrical', definition: 'basal extension length on one side is >0.75 of the other side'})-[:SCHEMA]->(a),
     (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '38f47214113073e09e34d937f6256084', name: 'basal insertion asymmetrical', definition: 'insertion points of lamina base on either side of the petiole are separated by >3 mm'})-[:SCHEMA]->(a)
 
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '0d40bf4df9c0a9dc25367d5d3f709a28', name: 'Lobation', definition: 'marginal projection with a corresponding sinus incised 25% or more of the distance from the projection apex to the midvein, measured parallel to the axis of symmetry and along the apical side of the projection (or basal side of a terminal projection)'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '72a9d5b8f1c81f4ac927e48d7af98291', name: 'unlobed', definition: 'leaf has no lobes'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'f135210525265553282531e95d96e6fc', name: 'palmately lobed', definition: 'major veins of the lobes are primary veins that arise from the base of the leaf'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '29b3ff847932a9e20ae0e2be4abb7731', name: 'palmatisect', definition: 'special case of palmately lobed in which the incision goes almost to the petiole but without resulting in distinct leaflets (alternate terms include palmatifid and palmatipartite)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '7bc3419c6742616726b3bc6e8bb80a9e', name: 'pinnately lobed', definition: 'major veins of the lobes are formed by costal secondaries'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'c3077b374d8e5a9cb5d2baddcc23012b', name: 'pinnatisect', definition: 'special case of pinnately lobed in which the incision goes almost to the midvein but without resulting in distinct leaflets (alternate terms include pinnatifid and pinnatipartite)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '5a586539bdc10158cfc4c5655301c729', name: 'palmately and pinnately lobed', definition: 'at least one lobe in a palmately lobed leaf is pinnately lobed'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: 'f6ed98b604dfa68da3daed984c87c6b5', name: 'bilobed', definition: 'leaf has two lobes'})-[:SCHEMA]->(a)
     
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'afb7538e1ab4d9b8638ef69e07f17893', name: 'Margin Type', definition: 'features of the edge of the lamina'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '19bbed2ca3defdd87402d5a0782fcb61', name: 'untoothed', definition: 'margin has no teeth'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '9fbe8643d6b00796a9dd6b9bf4ac08b3', name: 'dentate', definition: 'majority of the teeth have axes of symmetry directed perpendicular to the trend of the leaf margin'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'c900172d469500255b66130ae719b745', name: 'serrate', definition: 'majority of the teeth have axes of symmetry directed at an angle to the trend of the leaf margin'})-[:SCHEMA]->(a),
  (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'f5273240e99e451495601aaab35adc05', name: 'crenate', definition: 'majority of the teeth are smoothly rounded, without a pointed apex'})-[:SCHEMA]->(a)
          
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'fb05707e0b0d9a615586e5f4f2a25759', name: 'Special Margin Features'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'f9d6ddef7130bd7a2ebfb056b70386c9', name: 'erose', definition: 'margin is minutely irregular, as if chewed'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '4781e03dec5cc5389961b9dc16027a3c', name: 'sinuous', definition: 'margin forms a series of shallow and gentle curves that lack principal veins (projections are not considered teeth)'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'eac6ad203c2c244d2eae7476099aa1a4', name: 'revolute', definition: 'margin is turned down or rolled (in the manner of a scroll) in the abaxial direction'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '41533c639c4dd57fe7470e33c912da16', name: 'involute', definition: 'margin is turned up or rolled in the adaxial direction'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '827281d8e21ec91dd5c2b6272d99fa9a', name: 'undulate', definition: 'margin forms a series of smooth curves in the abaxial-adaxial plane (in and out of the plane of the leaf)'})-[:SCHEMA]->(a)
    
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'fa3177bcd11cd1aeff3fc4d48d807116', name: 'Apex Angle', definition: 'the vertex of the apex angle lies at the center of the midvein where it terminates at the apex of the leaf'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'f41f0b2369ae63c796d1b8810b8c9a4a', name: 'acute', definition: 'apex angle <90'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '2fb66db250c815e17ba86b3d93477665', name: 'obtuse', definition: 'apex angle between 90 and 180'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '80ea72e61a9f162d06aa2e0cd6e54039', name: 'reflex', definition: 'apex angle >180'})-[:SCHEMA]->(a)
 
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'f0cc38e83fcc6aed7b1e7ae47b3a8274', name: 'Apex Shape', definition: 'shape of the distal 25% of the lamina'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'cc5b4e078877d0ceef833fb45e5a8642', name: 'straight', definition: 'margin between the apex and 0.75L has no significant curvature'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '41ca0eb4943270d22cf1162867ff0a06', name: 'rounded', definition: 'subtype of convex in which the margin forms a smooth arc across the apex'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '0b5a8af029e4d2babd058789f0640b02', name: 'truncate', definition: 'apex terminates abruptly as if cut, with margin perpendicular to midvein or nearly so'})-[:SCHEMA]->(a),
(n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'b8a2dd1bf961d2bb1e52016075c8c765', name: 'acuminate', definition: 'margin between the apex and 0.75L is convex proximally and concave distally, or concave only (often encompasses drip tips)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'e2c86529f0384f10a0d6067631aae3ad', name: 'emarginate', definition: 'midvein length is 75-90% of midvein length + apical extension length'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '849f8d731c1bdf72441a8f885f9e6604', name: 'lobed', definition: 'midvein length is <75% of midvein length + apical extension length'})-[:SCHEMA]->(a)
 
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '563b30e222cdbb10693742884423244a', name: 'Base Angle', definition: 'the vertex of the base angle lies in the center of the midvein next to the point where the basalmost laminar tissue joins the petiole (or joins the proximal margin in the case of sessile leaves)'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'ef85539e65d1bfd277e9d4dae632a84c', name: 'acute', definition: 'angle <90'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'a42b15c620bab3888a094f67d9aaf9f2', name: 'obtuse', definition: 'angle >90 but <180'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: 'f439a8da3ce48a21ccc1f16ec2d33e90', name: 'reflex', definition: 'special case of obtuse in which angle is >180 but <360'})-[:SCHEMA]->(a),
   (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'f790628fd0a0a0b2c7ef49fbebbc848a', name: 'circular', definition: 'special case of reflex in which angle is >360 (includes leaves in which the basal extension overlaps across the midline, as well as peltate leaves)'})-[:SCHEMA]->(a)
   
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '5112082a2cc61e044106277500adb76d', name: 'Base Shape', definition: 'shape of the proximal 25% of the lamina'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'c352b8030c37b58f9e443a25fece092b', name: 'straight', definition: 'margin between the base and 0.25L has no significant curvature (alternate term is cuneate)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'e58471379c5d43eadb9467a8b97fc80b', name: 'concave', definition: 'margin between the base and 0.25L curves toward the midvein'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '0e6b6a4eefc9840d8269ca620daafd2d', name: 'rounded', definition: 'margin forms a smooth arc across the base'})-[:SCHEMA]->(a),
 (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'c98a250363b4c2d7e6fc2d8c2e3356de', name: 'truncate', definition: 'base terminates abruptly as if cut perpendicular to the midvein or nearly so'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: '4bb675913a587c8230779f68d754d896', name: 'concavo-convex', definition: 'margin between the base and 0.25L is convace proximally and convex distally'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a6:State {stateid: '07b211d7ff559760f81fded1729c5780', name: 'complex', definition: 'margin curvature has more than one inflection point (change of curvature) between the base and 0.25L'})-[:SCHEMA]->(a),
 (n) -[:ENTERER {timestamp: datetime()}]->
    (a7:State {stateid: 'ae402cb234d97b9798f5cbb218a9224f', name: 'decurrent', definition: 'special case in which the laminar tissue extends along the petiole at a gradually decreasing angle (can occur in concave, concavo-convex, or complex bases)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a8:State {stateid: '211e512aee6e55c59aa54e4ae0d6b37a', name: 'cordate', definition: 'leaf base forms a single sinus with the petiole generally inserted at the deepest point of the sinus'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a9:State {stateid: '43028d1810aa63a93bf882a07283898d', name: 'sagittate', definition: 'leaf base has two narrow, usually pointed projections (technically these may not qualify as lobes because they are not bounded by distal sinuses) with apices directed proximally at an angle 125 or greater from the midvein'})-[:SCHEMA]->(a),
 (n) -[:ENTERER {timestamp: datetime()}]->
    (a10:State {stateid: '17433915a4f27fabdd9e85cbab909831', name: 'hastate', definition: 'leaf base has two narrow lobes with apices directed exmedially at 90-125 from the midvein'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a11:State {stateid: '2d72d6e2b6574ac8f30eda4297198858', name: 'runcinate', definition: 'lobate lamina with two or more pairs of downward-pointing angular lobes'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a12:State {stateid: '7c5a241ccd68d714c68fb319c362b89c', name: 'auriculate', definition: 'lobate lamina having a pair of rounded basal lobes that are oriented downward, with their axes of symmetry at an angle >125 from the midvein of the leaf'})-[:SCHEMA]->(a)
 
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '7df3548451826af965254adf0b75c56c', name: 'Terminal Apex Feature', definition: 'region where the midvein terminates'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '44f2d29fe665815513dd91648c89ae83', name: 'mucronate', definition: 'midvein terminates in an opaque, peg-shaped, nondeciduous exension of the midvein'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '3d61cb849d51c8664444e33ed3d52fd6', name: 'spinose', definition: 'midvein extends through the margin at the apex; the spine may be short or long, but it is not always sharp'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '70b03be0df5aa4ad7b1e562568b181be', name: 'retuse', definition: 'midvein terminates in a shallow sinus such that midvein length is 95-99% of midvein length + apical extension length'})-[:SCHEMA]->(a)
 
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'dd6c8cc0955116076497f1ed1e961164', name: 'Surface Texture'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'cb47270fe2744ec36d0a9484d31e27b3', name: 'smooth', definition: 'lacking indentations, projections, hairs, or other roughness'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '582879b693b4ca947009845830f2fd47', name: 'pitted', definition: 'having indentations'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '5d8698bc18ee7f1aa30b03d9285e51c7', name: 'papillate', definition: 'having small projections originating from the laminar surface'})-[:SCHEMA]->(a),
  (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: '8abbff06a140a6baf00604f1b5db3ab9', name: 'rugose', definition: 'rough'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a5:State {stateid: 'b6afc958c8efc97a721a37f392a1d56c', name: 'pubescent', definition: 'having hairs'})-[:SCHEMA]->(a)
  
MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: 'f6cc59e5793b6ec1bc8777fe972d2a99'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: 'ac4efe808bbe5f22edc387dbc4370d0a', name: 'Surficial Glands', definition: 'placement of secretory structures'})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: 'c009d76779b293fd09691194bc73226a', name: 'laminar', definition: 'glands present on the surface (may be clustered)'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: 'ace2500e31b74cac148e1e1cbff4a5cc', name: 'marginal', definition: 'glands present only near or on the blade margin'})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '6d1587cf337ed655385952518d228f35', name: 'apical', definition: 'glands present only near the blade apex'})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a4:State {stateid: 'e19026ad3a75150eeb1e7ec42e32b62f', name: 'basilaminar', definition: 'glands present only near the base of the blade'})-[:SCHEMA]->(a)
  

// Create a specimen record (and associated organ type) and an OTU record
// Note that I store the enterer id as a property of relation Schema
// For more specimen information see https://docs.google.com/spreadsheets/d/1xzgVW_ImkGAs4wtL-oatQSITK2P8cGP5/edit#gid=582472317
MATCH (n:Person {personid: 'b6a792bfe6c20622620b48f999c5baaf'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Specimen {specimenid: 'a8875f1614e4a7e98e5f81eef694db0d', idigbiouuid: '982472a2-fd87-47fe-913a-3c707c82e3d4', pbdbcid: '10805', pbdboccid: '130975'}), 
    (a)-[:TYPE]->(b:Organ {organid: '391643a8c18bb294a873c274b351b252', type: 'Leaf'}),
    (n)-[:ENTERER {timestop: datetime()}]->
    (c:OTU {otuid: '50eb719b3b6e3ea460bf8ad9c9d8d96b', name: 'Cornus hyperborea', family: 'Cornacaea', genus: 'Cornus', species: 'hyperborea'}),
    (c)-[:SCHEMA {enterer: n.personid, timestamp: datetime()}]->(a)
