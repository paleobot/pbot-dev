//TEMPLATE

MATCH (n:Person {personid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (n)-[:ENTERER {timestamp: datetime()}]->
    (a:Character {charid: '', name: '', definition: ''})-[:SCHEMA]->(m),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a1:State {stateid: '', name: '', definition: ''})-[:SCHEMA]->(a),
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a2:State {stateid: '', name: '', definition: ''})-[:SCHEMA]->(a), 
    (n) -[:ENTERER {timestamp: datetime()}]->
    (a3:State {stateid: '', name: '', definition: ''})-[:SCHEMA]->(a),
          


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
    