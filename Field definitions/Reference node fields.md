# User-entry fields for Reference Nodes
 
### Name of field for user interface: 
* Entry type: describe how users will enter data into the field
* Considerations: this is an optional section, if there is info to convey to the PBot team (Botany, Dev, or both) about the field. Notes, wishes, questions, etc. 
* PBot: the PBot backend field name+code from the list Claire generated. Many will be missing.
* dwc: the DarwinCore field term name and link to term info. https://dwc.tdwg.org/terms/ 
* Info: the definition of the field. In addition to being for our internal use, these will serve as the draft for later definitions used in the guidelines/tutorials for users. 

## Required fields:

### Authors*
* Entry type: search person nodes.
* Considerations: Note that we would want to have an "Anonymous person node". Needs to be an easy way to accommodate adding a new person node if there is not already one created. Note for PBDB interface that PBDB has fields: First author initials, First author last name, Second author initials, second author last name, Initials and names of additional authors (separate the names with commas).
* PBot: create a relationship with one person node.
* dwc: 
* Info: 

### Year* 
* Entry type: Four digit numeric entry
* Considerations:
* PBot: TBD
* dwc: 
* Info: PBDB Tips: This is a required field. Use that actual date of publication, if available, not the nominal year of publication for the volume.

### PBDB ID
* The way this is already is great. You do the search and have options to populate.

### Title* 
* Entry type: string
* Considerations: 
* PBot: TBD
* dwc: 
* Info: The source (article/book chapter/ book if the entirety is being referenced as opposed to a chapter in a book) title. PBDB Tips: Type in the entire title and do not use abbreviations. Use of colons and semi-colons is OK. If the title is not in English, enter the original title first, and then enter an English-language translation in brackets. For a thesis, enter only the name of the institution (e.g., “University of Saskatchewan”)

### Publication type* 
* Entry type: This is required for PBDB. We can either get the options from their API or have our own dropdown menu with these options: journal article, book, book chapter, book/book chapter, serial monograph, compendium, Ph.D. thesis, M.S. thesis, abstract, guidebook, news article, unpublished, instcoll
* Considerations: Not even Mark knows what instcoll means. Also, we should talk through how this works with our private workbenches. Will it be easy to have one “Ellen’s unpublished work” that gets tagged for everything on my private workbench and then when it is time to make the collection/OTU/etc. public, I just make the new reference and replace? I think so…
* PBot: TBD
* dwc: 
* Info: PBDB Tips: Choose the closest possible value. “Unpublished” includes field notes, manuscripts, undergraduate theses, etc.; “guidebook” includes individual articles in guidebooks.

### Serial name 
* Entry type: string
* Considerations: This needs to be optional rather than required since books, guidebooks, etc. would not have anything to put here. However, it needs to be strongly recommended!
* PBot: TBD
* dwc: 
* Info: Full name of the serial (e.g., journal, edited book). PBDB Tips: none provided, but looking at download, all titles are written out in full, no abbreviations. 

### First page number* 
* PBot: TBD
* dwc: 
* Info: PBDB Tips: This is a required field. Do NOT add a hyphen after the page number: this will be done automatically by the data entry processing program. If you are citing an entire book, put “1” here and the total number of pages in the last page field. If the pages are numbered with combinations of numbers and letters (e.g., “A-32) put everything in and do not strip the letters.
* Entry type: string
* Considerations: 

### Last page number* 
* PBot: TBD
* dwc: 
* Info: PBDB Tips: This is a required field. Do NOT add a hyphen before the page number: this will be done automatically by the data entry processing program. If you are citing an entire book, put “1” in the first page field and the total number of pages here. If the pages are numbered with combinations of numbers and letters (e.g., “A-32) put everything in and do not strip the letters.
* Entry type: string
* Considerations: 

### DOI 
* PBot: TBD
* dwc: 
* Info: 
* Entry type: string
* Considerations: Probably not possible, but it would be amazing if you could just type in the DOI and get other things to auto-populate. Not required by PBDB.

## Optional fields:

### Publication volume 
* PBot: TBD
* dwc: 
* Info: Journal volume number
* Entry type: string
* Considerations: This is only relevant to journal articles, and should be strongly encouraged.

### Editor(s) 
* PBot: TBD
* dwc: the 
* Info: For edited books, only.
* Entry type: string
* Considerations: Rarely recorded in PBDB.

### Publisher
* PBot: TBD
* dwc: 
* Info: Only for books: the publisher
* Entry type: string
* Considerations: Not required by PBDB

### City of publication 
* PBot: TBD
* dwc: 
* Info: Only enter for books: the city where the book was published. 
* Entry type: string
* Considerations: Not required by PBDB

### Notes
* PBot: TBD
* dwc: 
* Info: Place for the user to enter any additional notes they have about a reference.
* Entry type: string
* Considerations: This maps to PBDB's reference comments field.

## Fields auto-generated by PBot/PBDB:

### –Not sure if any of these are recorded in PBot or do we pass through info and then just pull from PBDB? None of this is shown for PBDB since their user doesn’t have to enter it.–

### PBot/PBDB:ID
* PBot: pbotID:ID!
* dwc:
* Info: Internal unique identifier in the PBDB database. 
* Entry type: no entry, is autogenerated by PBDB when creating a new record.

### Date entered
* PBot: 
* dwc:
* Info: Date the reference was entered
* Entry type: no entry, is autogenerated by PBot when creating a new record.

### Entered by  Are we using “entered by” (or some other name for it like recordedBy?)--see question from Doug’s email
* PBot: 
* dwc: similar to but not quite synonymous with recordedBy http://rs.tdwg.org/dwc/terms/recordedBy
* Info: The user who entered the record.
* Entry type: no entry, is autogenerated by PBot when creating a new record.
