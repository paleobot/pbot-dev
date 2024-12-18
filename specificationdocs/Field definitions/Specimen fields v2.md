# User-entry fields for Specimen node

### Bold name is the name of the entry field for the user interface: 
* **Entry type:** describe how data will be entered into the field
* **Considerations:** this section is for info to convey to the PBot team (Botany, Dev, or both) about the field. Notes, wishes, questions, etc. 
* **PBot:** the PBot backend field name+code from the list Claire generated a couple months ago (may not be up to date with the current dev)
* **dwc:** the DarwinCore field term name and link to term info, if we can find one that is applicable. https://dwc.tdwg.org/terms/ 
* **Info:** the definition of the field. In addition to being for our internal use, these will serve as the draft for later definitions used in the guidelines/tutorials for users.

# Specimen Entry Fields

### Data access groups*: 
* Entry type: multi-select from the project groups and the option Public.  
* Considerations: How do we handle restrictions on what can go public? For example if the specimen does not have a legit catalog number, or some other rule? Or will we have rules about this after all? 
* PBot: elementOf: [Group!]! @relation(name: "ELEMENT_OF", direction: OUT). Defines a relationship to another node.
* dwc:  “groups” are sorta similar to datasetID http://rs.tdwg.org/dwc/terms/datasetID, or datasetName http://rs.tdwg.org/dwc/terms/datasetName
* Info: Defines who has access to view the record.

### Collection*:
* Entry type: search PBot Collection Nodes.   
* Consideration:
* PBot: collection: Collection! @relation(name: "COLLECTED_IN", direction: OUT). Defines a relationship to another node.
* dwc:  
* Info: PBot follows the definition for collection as set forth in the PBDB: “In the context of our database, a ‘fossil collection’ represents a set of fossil occurrences co-located geographically and temporally. In order to belong to a single collection the occurrences must have been collected deliberately as a group, though not necessarily all on the same occasion.”

### Specimen name*:
* Entry type: free text. 
* Consideration: Add check box by field to note if official catalog number or field number? May relate to how we allow data to go public vs not (does it need to be a catalogged specimen to be public?), and connection to dwc field. Also, are we calling this the catalog ID or name?
* PBot: name: String.  
* dwc: catalogNumber http://rs.tdwg.org/dwc/terms/catalogNumber; note that dwc:recordNumber is more of a field ID or internal/personal identifier http://rs.tdwg.org/dwc/terms/recordNumber, and there is also fieldNumber http://rs.tdwg.org/dwc/terms/fieldNumber. Also see organismName http://rs.tdwg.org/dwc/terms/organismName (for name, not so much a catalog number)
* Info: The name of the specimen in the collection (e.g., official catalog number at the institutional repository, or field ID number or other internal-use identifier).

### Parts preserved*:
* PBot:  organ: Organ @relation(name: "IS_TYPE", direction: OUT). Defines a relationship to another node.
* dwc: 
* Info: Selection of the organs preserved by the specimen.  
* Entry type: multi-select from predefined organ node options. This was formerly called “organ” 

### Notable features preserved:
* Entry type: multi-select from predefined “notable features preserved” node options: 
* Consideration: Note: this field is NOT required - the presence of these features can be definitive (if you say they are there then you definitely have observed them), but it is hard to be certain of the absence of the features (i.e., maybe there is cuticle but you are not sure because it would require extra prep work on the specimens, regardless you have not yet observed it so can’t say yes, but can’t say absent either).
* PBot: Not in PBot yet. Defines a relationship to another node..
* dwc: 
* Info: The specimen includes description of these preserved features.

### Preservation mode*:
* Entry type: multiple-select from the following options: body, trace, permineralized, cast, concretion, dissolution traces, mold/impression, soft parts, charcoalification, adpression/compression, recrystallized, coalified.  Required. 
* Consideration:
* PBot: preservationMode: String
* dwc:  
* Info: The type(s) of preservation exhibited by the specimen

### Repository*: 
* Entry type: Free text. Could autofill/select from prior entries.
* Consideration: There is a similar dwc field for Collection Code (dwc:collectionID)- these can be researcher or project collections that are registered (ie not necessarily accessioned into a museum repository). See GRSciColl link above. 
* PBot: Not in PBot yet
* dwc:  institutionID
* Info: Indicates at what institution the specimen is housed. The institutional code is preferred- if your institution has one, please use it (examples: Smithsonian National Museum of Natural History is USNM, Perot Museum of Nature and Science is PMNS). Institutional codes registered with the Global Registry of Scientific Collections (GRSciColl) can be found at https://www.gbif.org/grscicoll/institution/search. If your institution does not have a unique code, type out the full name of the repository. [Train people on permanent repository vs. temporary home, and then also about having to update fields when repositories change. People should put where the specimen is currently.]


## Begin "Linked external specimen information" Accordion
### iDigBio specimen ID
* Entry type: free text - how to make it a link? copy/paste url?
* Consideration: call this Specimen ID or Specimen Record? (same for others below)
* PBot: idigbiouuid: String
* dwc:  associatedReferences http://rs.tdwg.org/dwc/terms/associatedReferences, or otherCatalogNumbers http://rs.tdwg.org/dwc/terms/otherCatalogNumbers
* Info: ID/Link for specimen record at the Integrated Digitized Biodiversity Collections (PBDB). 

### GBIF specimen ID
* Entry type: free text - how to make it a link? copy/paste url?
* PBot: Not in PBot yet
* dwc:   associatedReferences http://rs.tdwg.org/dwc/terms/associatedReferences, or otherCatalogNumbers http://rs.tdwg.org/dwc/terms/otherCatalogNumbers
* Info: ID/Link for specimen record at the Global Biodiversity Information Facility (GBIF). 

### Other repository link
* Entry type: free text - how to make it a link? copy/paste url?
* PBot: Not in PBot yet
* dwc:   associatedReferences http://rs.tdwg.org/dwc/terms/associatedReferences, or otherCatalogNumbers http://rs.tdwg.org/dwc/terms/otherCatalogNumbers
* Info: ID/Link for online specimen record at an institutional repository. Can use if not in iDigBio or GBIF, but available online via other open-access database.
## End "Linked external specimen information" Accordion

### Example of taxon/OTU:
* Entry type: search OTU Nodes. 
* Considerations: This creates the same relationship as in the OTU page selecting a specimen as an "Additional specimen".
* PBot: exampleOf: [ExampleOf]. Defines a relationship to another node.
* dwc:  taxonConceptID http://rs.tdwg.org/dwc/terms/taxonConceptID
* Info: Designates that this specimen is a representative of the indicated OTU.

### Identified by:
* Entry type: search Person Nodes. Need to allow multiple people to be selected.
* Considerations: 
* PBot: 
* dwc: identifiedBy
* Info: Says who did the identification.

### Notes: 
* Entry type: free text.
* Considerations: need to figure out comment entry.
* PBot: Not in PBot yet
* dwc:  similar to occurrenceRemarks http://rs.tdwg.org/dwc/terms/occurrenceRemarks or organismRemarks http://rs.tdwg.org/dwc/terms/organismRemarks 
* Info: Comments on the specimen

### References:
* Entry type: search PBot Reference Nodes. 
* Considerations: We need to be clear about what people are referencing here. Reference is to indicate that this particular specimen is figured or discussed by name in a paper. The claim that a specimen is a taxon requires a reference. Is that handled here?
* PBot: references: [SpecimenCitedBy]. Defines a relationship to another node.
* dwc:  
* Info: The published or internal reference for the specimen. 

## Auto-generated / Things that are managed on the back end:

### pbotID
* Info: Internal unique identifier in the PBot database. Autogenerated by PBot.
* Entry type: no entry, is autogenerated by PBot when creating a new record.
* PBot: pbotID: ID!
* dwc:  

### Entered by:
* Info: The user who entered the record. Autogenerated by PBot.
* Entry type: no entry, is autogenerated by PBot based on the user login when creating a new record.
* PBot: enteredBy: [SpecimenEnteredBy]
* dwc: similar to but not quite synonymous with recordedBy http://rs.tdwg.org/dwc/terms/recordedBy


### Image:
* PBot: Not in PBot yet. Defines a relationship to another node.
* dwc:  
* Info: Specifies the relationship between an image and a specimen.
* Entry type: select an image that has been entered.
* Considerations: 

### Description:
* PBot: describedBy: [DescribedBy] Defines a relationship to another node.
* dwc:  
* Info: 
* Entry type: takes user to the form/interface for entering descriptive data.
* Considerations: This is a further action, not a part of initial submit of the specimen form.
* Once you create a specimen, then you can describe it! But I guess it needs a field right?

### Exemplar specimen type: 
* Entry type: Select one option from defined exemplar types: holotype/exemplar.
* Consideration: THis is better dealt with from the OTU page. need to define the type options, with consideration from others in the field. For the taxonomists, is it important to know what sort of type a specimen is? Is this treated same for true type specimens of Linnean species? Can this be required IF the specimen was designated as an exampleOf? Or set default to non-type specimen exemplar (whatever we call that), unless the holo- or para-type etc are selected?
* PBot: holotypeOf: [HolotypeOf]. Defines a relationship to another node.
* dwc:  similar to typeStatus http://rs.tdwg.org/dwc/terms/typeStatus
* Info: Designates the specimen as one of several exemplar types. Can only choose one. Only one specimen may be the “holo-exemplar/primary exemplar”
