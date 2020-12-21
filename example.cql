// Create a new reference node
// Note that you cannot (should not) have arrays or lists, even though it will accept it as part of the JSON
CREATE (a:Reference 
      {
      name: 'Manual of Leaf Architecture', // No need for both name and title, just convenient to have a shorter alias for title
      title: 'Manual of Leaf Architecture - Morphological description and categorization of dicotyledonous and net-veined monocotyledonous angiosperms',
      year: '1999', 
      publisher: 'Smithsonian Institution',
      doi:'10.13140/2.1.3674.5282'
      })
  
// Create a new Person node
CREATE (a:Person
    {
    name: 'Scott L. Wing',
    given: 'Scott',
    surname: 'Wing',
    email: 'wing@si.edu'
    })
        
CREATE (a:Person
    {
    name: 'Andrew A. Zaffos',
    given: 'Andrew',
    surname: 'Zaffos',
    email: 'azaffos@arizona.edu'
    })

// Assign the person scott wing as relation AUTHOR to Reference Manual of Leaf Architecture
MATCH (a:Person), (b:Reference)
WHERE a.name='Scott L. Wing' AND b.name='Manual of Leaf Architecture'
CREATE (a)-[r:AUTHOR]->(b) // Note that -> means there is directionality in the relationship
RETURN type(r)

// make multiple nodes at once
CREATE (a:Term {name: 'apex',definition:'toward the midline of the lamina'}),(b:Term {name: 'admedial', definition: 'toward the midline of the lamina'})

// Manual of Leaf Architecture to SOURCE for terms
// Note this is a blanket statement that set manual of leaf architecture as source for all terms, obviously you would need more logic in a situation with
// multiple sources/terms
MATCH (a:Term), (b:Reference)
WHERE b.name='Manual of Leaf Architecture'
CREATE (b)-[r:SOURCE]->(a) // Note that -> means there is directionality in the relationship
RETURN type(r)

// Added enterer relation to self plus other persons
MATCH (a:Person), (b:Person)
WHERE a.name='Andrew A. Zaffos'
CREATE (a)-[r:ENTERER {timestamp: datetime()}]->(b)
RETURN type(r)

MATCH (a:Person), (b:Term)
WHERE a.name='Andrew A. Zaffos'
CREATE (a)-[r:ENTERER {timestamp: datetime()}]->(b)
RETURN type(r)
     
                                                                              
// Mega entry that does a lot at once...
MATCH (n:Person {name: 'Andrew A. Zaffos'}), (m:Reference {name: 'Manual of Leaf Architecture'})
CREATE 
(n) -[r1:ENTERER {timestamp: datetime()}]->
(a:State {name: 'alternate', definition: 'one leaf at each node'}), 
(n) -[r2:ENTERER {timestamp: datetime()}]->
(b:State {name: 'opposite', definition: 'two leaves at each node'}), 
(n) -[r3:ENTERER {timestamp: datetime()}]->
(c:State {name: 'whorled', definition: 'three or more leaves at each node'}),
(n) -[r4:ENTERER {timestamp: datetime()}]->
(d:State {name: 'decussate', definition: 'each leaf attached at 90° from those above and below (can be opposite or alternate)'}),
(m) -[r5:SCHEMA]-> (f:Character {name: 'Leaf Attachment'}),
(f) -[r6:SCHEMA]-> (a),
(f) -[r7:SCHEMA]-> (b),
(f) -[r8:SCHEMA]-> (c),
(f) -[r9:SCHEMA]-> (d) 
