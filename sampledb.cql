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
    
MATCH (n: user {uid: "1"}) CREATE (n) -[r: posted]-> (p: post {pid: "42", title: "Good Night", msg: "Have a nice and peaceful sleep.", author: n.uid});

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

// Identify as user 543cab021a7e811e7cc69b7ed3aa1c16 (Rebecca Koll) and add a chracter "leaf attachement" to reference and also specify the
// The enterer relationship
MATCH (n:Person {userid: '543cab021a7e811e7cc69b7ed3aa1c16'}), (m:Reference {refid: '431d5b07caa98bec0db700748de6e918'})
CREATE (m)-[r:SCHEMA]-
    (a:Character {
    charid: '94cb4886ef93f11d71601e4c89e20f55', 
    name: 'Leaf Attachment'})
    <-[r1:ENTERER {timestamp: datetime()}]-(n)

// Characters for Manual of Leaf Architecture 1999
CREATE (a:Character {
    charid: '94cb4886ef93f11d71601e4c89e20f55',
    name: 'Leaf Attachment'
    }),
    (b:Character {
    charid: '1f6654b644593e67528d6e73f89be90d',
    name: 'Leaf Organization'
    })

// States for Manual of Leaf Architecture 1999
CREATE (a:State {
        stateid: 'c18d0958b6a93c0bec6b3f7a615e0d9b'
        name: 'simple'
        definition: 'consisting of a single lamina'
        }), // Leaf organization 
        (b:State {
        stateid: '134'
        name: 'chonk'
        })
