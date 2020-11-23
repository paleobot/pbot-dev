# Ellen's Design Specification for PBOT 0.01

## Overview & Required Functionality
The Paleobotany Database and Web Client (PBOT) promised to EarthCube and to the paleobotanical community must fulfill the following four functions:
  1. Provide a single, coordinated interface for entry and storage of formal and informal taxonomic data
  2. Create the platform for community-inclusive, evolvable, and sustainable descriptive character schemas that enable coordination across working groups and databases
  3. Maintain a community forum for expert commentary on PBOT contents, enabling and tracking discussion for resolving taxonomic issues (e.g., synonymies, connecting different organs, and relationships)
  4. Link with existing databases to apply these taxonomies to specimens currently only identified within Linnean schemas at higher taxonomic levels that are not useful for most meta-analyses.

In this attempt at a design document, I first go through some over-arching broad-stroke requirements required to achieve more than one of the above objectives. Then, I go my vision for how PBOT will work to fulfill these requirements.

## Broad-Strokes Requirements
### Critical
1. Creation of a new database to hold information specific to PBOT, including information about users, vocabularies, user-commentary, and other standard meta-data.
2. Creation of digital infrastructure for community-wide discussions that includes archiving comments
3. Ability to collect, track, and query user input 
4. Clean, easy-to-use design with well-made, easily findable tutorials, definitions, and library of images of each character and character state
5. Method for documenting uncertainty at every stage of data entry and community commenting (imperfect preservation leads to uncertainty in assigning character states, variation in character states within a species or even specimen, uncertainty in assigning taxonomic affinities, uncertainty due to user expertise, etc.)
6. Users have a private workbench and reasonable control over when data become public
   * Option to share one's private workbench with selected colleagues, allowing all with access to enter data and provide comments.
7. Ability to **Link with existing databases to apply taxonomies to specimens**
    1. PBOT must be able to pull images and specimen meta-data from iDigBio
    2. PBOT must be able to add, edit, or delete records in the PBDB (see text in final proposal)


### Optional
1. Private workbench can be used without internet access
2. Ability to batch-add data
   * This is probably only important at the beginning, to facilitate people's initial round of data entry
3. Best practices documentation for photography and upload of specimen meta-data into iDigBio.

## A single, coordinated interface for data entry and storage
This figure from the proposal shows the data that will be entered in PBOT and relationships with iDigBio and PBDB:
![image](https://github.com/azgs/pbot_client/blob/main/Relationships%20figure.png)

On entering PBOT, users are first asked whether they would like to:
1. Work on vocabularies
2. Annotate individual specimens
3. Search the database

*Note, Ellen is not entirely clear where and how PBDB occurrence data is being entered. Are we relying on this already being in iDigBio, or would you enter this in PBOT and then have it pushed to PBDB. My understanding is that we would not directly enter anything into PBDB but would go in there to do fun analyses. So, if there is information PBDB needs that is not already in iDigBio, then we need to figure out where and how to do that.

### Work on vocabularies
This section describes **a platform for community-inclusive, evolvable, and sustainable descriptive character schemas**
1. Users enter proposed traits, characters, character states, definitions of each of these.
   * Required entry is the name of the character/trait/state, a definition, an image file (line drawing or photograph), keywords, and type of field for entry.
   * Each trait/character is assigned a set of keywords that makes it findable by users. For example, secondary vein course would be assigned to leaf, venation, and compression.
   * By "type of field for entry", I mean selecting things like check boxes, numerical entry, text string.
   * After entering a character, user needs to associate character states with that character.
2. Users create schemas using characters/traits already entered into PBOT.
   * Create a new schema by selecting characters and traits from a list.
      * Generate possible lists using the assigned keywords.
   * Choose a schema already in the database and add or subtract characters
3. Users provide opinions about the validity of a proposed vocabulary
    * For each character state, character, trait, and schema in PBOT, there needs to be a way for users to suggest edits or provide commentary on utility. This will be key for informal working groups to coalesce and build standardized schemas for organs that do not yet have these.
  
### Annotation of a specific iDigBio specimen with proposed vocabularies
- *Question*: Is it possible to pull specimen data from museum repositories or does everything need to go through iDigBio?

I envision this working as follows:
1. Users are first asked whether they want to use their private workbench or have work be accessible to everyone.
    * In lieu of having this as a separate screen, maybe it is one of the options on the "What do you want to do in PBOT" homescreen.
2. Next, users enter the mode of preservation, plant organ, and major plant group (unknown always needs to be an option)
3. Based on their selections, users are given options of proposed schemas already in the database.
    - If unknown is selected for any, then the user is presented with all possible schemas that would not be eliminated by another selection (e.g., if mark leaf for plant organ then no flower characters are given).
    - It would be helpful for the user to easily see data for each schema: who wrote it, how much usage is it receiving
    - Include as an option, "No defined schema. I'll choose characters/traits individually."
4. Users enter Uncertainty metric: see Critical Broad-Strokes #5.
    * This is something we need to talk about and get community ideas.
5. After the user has completed describing a specimen using all characters in selected schema, they can choose to add additional characters. I think it would be useful to have a text field for searching characters by name or by keyword.
6. At any point in the description process, the user can select a "show me similar morphotypes" button, allowing PBOT to suggest linkages with similar specimens
   - Option to tell the computer how broadly to search. For example, it would be useful to first constrain to specimens/morphotypes entered by that user (you are studying one flora and trying to figure out how many morphotypes you have), then broaden out to specimens/morphotypes from the same region, time period, or user, and finally consider everything in PBOT.
   - We need to figure out how PBOT will choose similar specimens- what proportion of characters need to be in common? Or are there better ways to do this?
   - Output file / browser screen of shared vs. different characters (include what character state was assigned for each) and photographs of each specimen for comparison.
      - Need to handle incomplete preservation vs. different character states assigned.
  - When the user finds a good match for their specimen, they have the option to assign that morphotype name to the specimen, which then means they do not fill in any additional descriptive information. But, something to think about is how we account for intraspecific variation in morphology. For example, say your specimen has a different tooth shape than described for the exemplar. How do we both annotate your specimen and also update the overall morphotype description to account for multiple character states?
7. The person entering the data has priority on saying their specimen is the same morphotype as something already in the database.
    - As a control, we may want a flag if the number of conflicting character states exceeds a given threshold.
8. Regardless of schema chosen, all specimens should have a "click to make this the morphotype exemplar" box in the annotation page.
    
### Search the database
This section addresses the objective: **Maintain a community forum for expert commentary on PBOT contents, enabling and tracking discussion for resolving taxonomic issues**

#### For those interested in doing synthetic work
The objective here is for paleobotanists to be able to compare specimens/morphotypes and propose synonymies, taxonomic names, and whole-plant reconstructions. In other words, users propose linking specimens that are the same morphotype (even if researchers called them different things) and also linking plant organs into whole-plant reconstructions. Users can also propose a Linnean taxonomic assignment. We should include a link to PBDB with the note that any other sort of synthetic analyses (e.g. download all occurrences of a given morphotype, make maps of occurrences, etc) are done in PBDB!

1. Query page to be able to search for:
    1. all morphotypes with a given suite of features
    2. by name (both formal and informal)
2. Results page has the list of iDigBio specimens in one column, and then workbench space capable of showing 2 (or more?) records at the same time. Users would want to see photograph, basic locality information (age, region, collector), and descriptive annoations.
3. Users propose linkages among iDigBio specimens: This would include both linking specimens that are the same morphotype (even if researchers called them different things) and also linking plant organs into whole-plant reconstructions.
   - The results page described above has an "I think these are the same" button. Maybe also an option to type in your level of certainty.
   - Easy option of saying you agree with someone else's comments- so, also need an easy way to see comments people have made.
   - Do we need some sort of notification system for when a user proposers a synonymy that includes a specimen you entered?
   - *Question*: How is the final decision made on taxonomies, synonymies, identifications, etc?
4. Even after linkages are made (e.g. synonymizing morphotypes), there is still a "paper trail" in case mistakes were made.
   
## Types of data output
1. csv file of character states & trait values for a set of morphotypes
2. Beautiful morphotype sheet with images- to be printed and taken to the field or submitted for publication
    * Am I thinking too old school here? The whole point of this system is to get rid of binders and supplemental appendices...
3. Schema sheets with definitions of characters, character states, and traits, and associated images
4. Co-occurrence data- I'm not sure if this is something PBDB already does, but it will be very helpful to be able to generate lists of morphotypes that commonly co-occur because that is important data for whole-plant reconstructions

*Note, this is something we want to get community feedback on! And we will need PBDB expertise to know what can be done there vs. what we need to create for PBOT*

## Ellen learned enough about GitHub to be able to gratuitously include the PBOT logo at the end of her design document!
![image](https://github.com/azgs/pbot_client/blob/main/PBOT-logo-full.png)
