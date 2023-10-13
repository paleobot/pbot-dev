//!!!!!!!!!!NOTE: You must add the APOC plugin to the db you plan to install this in.

//Roles and assignment
CREATE 
	(:Role {
		pbotID: apoc.create.uuid(),
		name: "admin"
    }),
    (:Role {
		roleID: apoc.create.uuid(),
		name: "user"
    });

//Public group
CREATE
    (g:Group {
        pbotID: apoc.create.uuid(),
        name: "public"
    }),
    (g)-[:ELEMENT_OF]->(g);

// Create core users
MATCH
    (admin:Role {name: "admin"}),
    (user:Role {name: "user"}),
    (public:Group {name: "public"})
WITH admin, user, public    
    CREATE 
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "guest",
        surname: "guest",
        email: "guest"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Andrew",
        surname: "Zaffos",
        email: "azaffos@arizona.edu",
        orcid: "0000-0002-4731-6091"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user),
    (p)-[:HAS_ROLE]->(admin)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Scott",
        surname: "Wing",
        email: "wing@si.edu",
        orcid: "0000-0002-2954-8905"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Amanda",
        surname: "Ash"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Leo",
        surname: "Hickey"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Kirk",
        surname: "Johnson"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Dori",
        surname: "Contreras",
        email: "dori.contreras@perotmuseum.org",
        orcid: "0000-0001-6820-7364"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user),
    (p)-[:HAS_ROLE]->(admin)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Ellen",
        surname: "Currano",
        email: "ecurrano@uwyo.edu",
        orcid: "0000-0002-5242-8573"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user),
    (p)-[:HAS_ROLE]->(admin)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Beth",
        surname: "Ellis"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "John",
        surname: "Mitchell"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Douglas",
        surname: "Daly",
        email: "ddaly@nybg.org"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Peter",
        surname: "Wilf",
        email: "pwilf@psu.edu",
        orcid: "0000-0001-6813-1937"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Claire",
        surname: "Cleveland",
        email: "clairecleveland@psu.edu",
        orcid: "0000-0002-0403-3243"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user),
    (p)-[:HAS_ROLE]->(admin)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Simon",
        surname: "Goring",
        email: "simon.j.goring@gmail.com",
        orcid: "0000-0002-2700-4605"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Douglas",
        surname: "Meredith",
        email: "douglasm@arizona.edu"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user),
    (p)-[:HAS_ROLE]->(admin)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Rebecca",
        surname: "Koll",
        email: "rebecca.koll@perotmuseum.org",
        orcid: "0000-0001-5601-6632"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
        pbotID: apoc.create.uuid(),
        given: "Shanan",
        surname: "Peters",
        email: "peters@geology.wisc.edu",
        orcid: "0000-0002-3346-4317"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user)
WITH admin, user, public
    CREATE
    (p:Person {
    pbotID: apoc.create.uuid(),
        given: "Mark",
        surname: "Uhen",
        email: "muhen@gmu.edu",
        orcid: "0000-0002-2689-0801"
    })-[:MEMBER_OF]->(public),
    (p)-[:HAS_ROLE]->(user);
    
//Make 'em all entered by me    
MATCH 
    (p:Person),
    (eP:Person {surname:"Meredith"})
CREATE
    (p)<-[:ENTERED_BY {timestamp: datetime()}]-(eP);
    	

        
