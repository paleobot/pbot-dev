// Create a new reference node
// Note that you cannot (should not) have arrays or lists, even though it will accept it as part of the JSON
CREATE (a:Reference 
      {
      refid: '431d5b07caa98bec0db700748de6e918'
      title: 'Manual of Leaf Architecture - Morphological description and categorization of dicotyledonous and net-veined monocotyledonous angiosperms',
      year: '1999', 
      publisher: 'Smithsonian Institution',
      doi:'10.13140/2.1.3674.5282'
      })
  
// Create a new Person node
CREATE (a:Person
    {
    userid: '9e40e3603e519ffcf2c4590f50cb1589'
    given: 'Scott',
    surname: 'Wing',
    email: 'wing@si.edu',
    orcid: '0000-0002-2954-8905'
    })
        
CREATE (a:Person
    {
    userid: '75cb1ca0e6286d31133ce51b0ad4f44f',
    given: 'Andrew',
    surname: 'Zaffos',
    email: 'azaffos@arizona.edu',
    orcid: '0000-0002-4731-6091'
    })
        
CREATE (a:Person
    {
    userid: '8b876f81690b0284d81fb00764525346',
    given: 'Amanda',
    surname: 'Ash' // Rather than have the orcid and email fields blank, I just excluded them. Not sure what best practice is in Neo4Js world.
    })
        
CREATE (a:Person
    {
    userid: '0c6f2272ac9bb55e39538e19265238f9',
    given: 'Leo',
    surname: 'Hickey' // Rather than have the orcid and email fields blank, I just excluded them. Not sure what best practice is in Neo4Js world.
    })

CREATE (a:Person
    {
    userid: '8ffc79743f1c80631a81aefdbd9692ba',
    given: 'Kirk',
    surname: 'Johnson' // Rather than have the orcid and email fields blank, I just excluded them. Not sure what best practice is in Neo4Js world.
    })
        
// Assign the person scott wing as relation AUTHOR to Reference Manual of Leaf Architecture
MATCH (a:Person), (b:Reference)
WHERE a.userid='9e40e3603e519ffcf2c4590f50cb1589' AND b.refid='431d5b07caa98bec0db700748de6e918'
CREATE (a)-[r:AUTHOR]->(b) // Note that -> means there is directionality in the relationship
RETURN type(r)

// make multiple nodes at once
CREATE (a:Term {termid: 'f16335802cb21b79b07a91eab96f92fd', name: 'apex',definition:'toward the midline of the lamina'}),(b:Term {termid: 'dc68111a81dd8b6dc05f1411687e37ab', name: 'admedial', definition: 'toward the midline of the lamina'})

// Manual of Leaf Architecture to SOURCE for terms
// Note this is a blanket statement that set manual of leaf architecture as source for all terms, obviously you would need more logic in a situation with
// multiple sources/terms
MATCH (a:Term), (b:Reference)
WHERE b.refid='431d5b07caa98bec0db700748de6e918'
CREATE (b)-[r:SOURCE]->(a) // Note that -> means there is directionality in the relationship
RETURN type(r)

// Added enterer relation to self plus other persons
MATCH (a:Person), (b:Person)
WHERE a.userid='75cb1ca0e6286d31133ce51b0ad4f44f'
CREATE (a)-[r:ENTERER {timestamp: datetime()}]->(b)
RETURN type(r)

MATCH (a:Person), (b:Term)
WHERE a.userid='75cb1ca0e6286d31133ce51b0ad4f44fs'
CREATE (a)-[r:ENTERER {timestamp: datetime()}]->(b)
RETURN type(r) 
                                                                              
// Mega entry that does a lot at once
// Establish me as the enterer of various states and characters and assign those states and characters to a reference
MATCH (n:Person {userid: '75cb1ca0e6286d31133ce51b0ad4f44f'}), (m:Reference {userid: '431d5b07caa98bec0db700748de6e918'})
CREATE 
(n) -[r1:ENTERER {timestamp: datetime()}]->
(a:State {stateid: 'b6ad9b8970cdfb1b1fb6005522d2d25e', name: 'alternate', definition: 'one leaf at each node'}), 
(n) -[r2:ENTERER {timestamp: datetime()}]->
(b:State {stateid: '1861372cf9c8da97ff0a83e98ed6a953', name: 'opposite', definition: 'two leaves at each node'}), 
(n) -[r3:ENTERER {timestamp: datetime()}]->
(c:State {stateid: 'fe44d248f93537924725483684a69bc8', name: 'whorled', definition: 'three or more leaves at each node'}),
(n) -[r4:ENTERER {timestamp: datetime()}]->
(d:State {stateid: 'e7a09c4351846a01826c243c1f166ad5', 'decussate', definition: 'each leaf attached at 90° from those above and below (can be opposite or alternate)'}),
(m) -[r5:SCHEMA]-> (f:Character {charid: '2a7a60cf3f5b69a7960c6f7f7f241df3', name: 'Leaf Attachment'}),
(f) -[r6:SCHEMA]-> (a),
(f) -[r7:SCHEMA]-> (b),
(f) -[r8:SCHEMA]-> (c),
(f) -[r9:SCHEMA]-> (d) 

// Query children of children that have the relation "schema"
// There are definiteily more efficient ways to do this recursively, but I haven't figured it out yet
MATCH (a:Reference {name:'Manual of Leaf Architecture'})-[r:SCHEMA]-(char), 
      (char)-[q:SCHEMA]-(state) 
      RETURN a,r,char,q,state               

// How to wipe a database
MATCH (n)
DETACH DELETE n
