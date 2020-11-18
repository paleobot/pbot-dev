# Ellen's Design Specification for PBOT 0.01

## Overview & Required Functionality
The Paleobotany Database and Web Client (PBOT) promised to EarthCube and to the paleobotanical community must fulfill the following four functions:
  1. Provide a single, coordinated interface for entry and storage of formal and informal taxonomic data
  2. Create the platform for community-inclusive, evolvable, and sustainable descriptive character schemas that enable coordination across working groups and databases
  3. Maintain a community forum for expert commentary on PBOT contents, enabling and tracking discussion for resolving taxonomic issues (e.g., synonymies, connecting different organs, and relationships)
  4. Link with existing databases to apply these taxonomies to specimens currently only identified within Linnean schemas at higher taxonomic levels that are not useful for most meta-analyses.

In this attempt at a design document, I first go through some over-arching broad-stroke requirements required to achieve more than one of the above objectives. Then, I go through these four functions one by one with additional notes.

## Broad-Strokes Requirements
### Critical
1. Creation of a new database to hold information specific to PBOT, including information about users, vocabularies, user-commentary, and other standard meta-data.
2. Creation of digital infrastructure for community-wide discussions that includes archiving comments
3. Ability to collect and query user input in order to track the relationships of different schemas, traits, morphotypes, synonymies, taxonomies, specimens, users, user-commentary, and other metadata information
4. Clean, easy-to-use design with well-made, easily findable tutorials, definitions, and library of images of each character and character state
5. Method for documenting uncertainty at every stage of data entry and community commenting (imperfect preservation leads to uncertainty in assigning character states, variation in character states within a species or even specimen, uncertainty in assigning taxonomic affinities, uncertainty due to user expertise, etc.)
6. Users have a private workbench and reasonable control over when data become public

### Optional
1. Private workbench can be used without internet access
2. Ability to batch-add data
   * This is probably only important at the beginning, to facilitate people's initial round of data entry
3. Best practices documentation for photography and upload of specimen meta-data into iDigBio.

## A single, coordinated interface for data entry and storage
PBOT users will need enter these three types of data:
  1. Proposed Vocabularies
  2. Community opinions about the validity of a proposed vocabulary
  3. Annotation of a specific iDigBio specimen with proposed vocabularies
- Question: Is it possible to pull specimen data from museum repositories



## A platform for community-inclusive, evolvable, and sustainable descriptive character schemas

## Maintain a community forum for expert commentary on PBOT contents, enabling and tracking discussion for resolving taxonomic issues

## Link with existing databases to apply taxonomies to specimens
PBOT must be able to pull images and specimen meta-data from iDigBio
PBOT must be able to add, edit, or delete records in the PBDB (see text in final proposal)
  * Note, I (Ellen) am not entirely clear where and how things like locality data are entered. Are we relying on this already being in iDigBio, or would you enter this in PBOT and then have it pushed to PBDB. My understanding is that we would not need to enter anything into PBDB but would go in there to do fun analyses.
