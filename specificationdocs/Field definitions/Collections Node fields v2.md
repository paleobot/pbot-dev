# User-entry fields for Collection Nodes
 
### Name of field for user interface 
* Entry type: describe how users will enter data into the field
* Considerations: this is an optional section, if there is info to convey to the PBot team (Botany, Dev, or both) about the field. Notes, wishes, questions, etc. 
* PBot: the PBot backend field name+code from the list Claire generated. Many will be missing.
* dwc: the DarwinCore field term name and link to term info. https://dwc.tdwg.org/terms/ 
* Info: the definition of the field. In addition to being for our internal use, these will serve as the draft for later definitions used in the guidelines/tutorials for users. 

**We've moved to having lots of accordions to help make these more manageable to fill out. BUT, does this mean that it is more difficult to autopopulate PBDB information if a collection is already entered in PBDB?**

## Data entry fields

### Data access group* 
* Entry type: multi-select from the users groups (i.e. projects) and the option Public
* Considerations: This is for internal PBot use only. Does not need to pipe to PBDB. 
* PBot: elementOf: [Group!]! @relation(name: "ELEMENT_OF", direction: OUT). Creates a relationship with PBot groups.
* dwc: not relevant. This is PBot internal relating to who can access these records.
* Info: Defines who has access to view and edit the record.

### Latitude*
* Entry type: free text, numeric
* Considerations: Side by side view with longitude. Degrees and Direction are required by PBDB, and PBDB gives boxes to free-text enter Degrees, Minutes, Seconds, and Decimal, with a drop-down menu for direction (for latitude, options are North or South). Would we like to duplicate this, or just require everyone to do decimal degrees? If we have everyone enter decimal degrees, then can we have a single entry field and PBot will split it apart when it is piped to PBDB. PBDB allows you to choose the datum- do we want to do that or ask everyone to use the same datum?
* PBot:
* dwc: decimalLatitude http://rs.tdwg.org/dwc/terms/decimalLatitude
* Info: From PBDB: Record the present-day latitude and longitude (as opposed to paleolatitude and paleolongitude, which are not currently included in this database). "Degrees" must be filled out if anything on these two lines is. Enter minutes and seconds if these are given in the original source; if decimal values are given instead (e.g., "37.823"), enter the part before the decimal point in "Degrees" (e.g., "37") and the part after the decimal point in "Decimal value" (e.g., "823"). Do not fill in both the minutes fields and the decimal field. So if you have data like "37 degrees 21.57 minutes," convert the ".57" part into seconds (in this case, 34.2 seconds). Note that you can put decimal values in the seconds field, just not in the minutes field. More info in PBDB resources. Also, we will want to include rules about what GPS coordinates to enter if you only have county, state, or country information.

### Longitude*
* Entry type: free text, numeric
* Considerations: Side by side with latitude. Degrees and Direction are required by PBDB, and PBDB gives boxes to free-text enter Degrees, Minutes, Seconds, and Decimal, with a drop-down menu for direction (for longitude, options are East or West). Would we like to duplicate this, or just require everyone to do decimal degrees? If we have everyone enter decimal degrees, then can we have a single entry field and PBot will split it apart when it is piped to PBDB. PBDB allows you to choose the datum- do we want to do that or ask everyone to use the same datum?
* PBot:
* dwc:decimalLongitude http://rs.tdwg.org/dwc/terms/decimalLongitude
* Info: The geographic longitude (in decimal degrees, using the WGS84 datum) of the geographic center of a collection. Positive values are east of the Greenwich Meridian, negative values are west of it. Legal values lie between -180 and 180, inclusive. See also Latitude field for PBDB issues.

### GPS coordinate uncertainty*
* Entry type: numeric
* Considerations: this is not required for PBDB, and in fact doesn't even fit any of their fields. Mark would like to change to this, but PBDB doesn't have the ability to do that right now. He said: "This is NOT a required field for PBDB so maybe you guys do point/radius and we can work towards that in our system."
* PBot:
* dwc: http://rs.tdwg.org/dwc/terms/coordinateUncertaintyInMeters
* Info: provide a radius of uncertainty (in meters) for the GPS coordinate entered

### Paleobiology Database ID
* Entry: free text entry, with the search function next to it to search the PBDB and be able to populate what is below.
* Considerations: Lots of integration aspects to consider. Search just based on latitude and longitude.
* PBot:
* dwc:
* Info: Link to an equivalent PBDB collection

### Collection name*
* Entry type: free text, limit of 80 characters
* Considerations: need to have a check to make sure the name is unique, and also will need to integrate with PBDB to make sure names are unique. If the collection is already in PBDB, we will want to pull the data from there so that the user does not enter and potentially make errors. Andrew has a plan for how to do this all.
* PBot: name: [name]
* dwc: http://rs.tdwg.org/dwc/terms/collectionID?,http://rs.tdwg.org/dwc/terms/datasetName?
* Info: A unique identification that may also aid in recognizing close links among collections. For example, if you are entering multiple collections from the same collection (e.g., a series of consecutive beds), use collection names that reflect their relationship (e.g., "Bully Hill 1.5 meter bed" and "Bully Hill 2.0 meter bed"). Keep the name short and do not enter a string of terms such as "XX Quarry, XX Formation, XX County, XX Country, XX km south of such-and-such." All of this information except "XX Quarry" should go in other fields.

### References*
* Entry type: search Reference Nodes. Multiple references allowed.
* Considerations:
* PBot: [CollectionCitedBy] : creates relationship to one or more reference nodes
* dwc: associatedReferences http://rs.tdwg.org/dwc/terms/associatedReferences
* Info: Provide information for one or more references that described the collection (locality). This may also be a temporary holder for personal workbenches and unpublished collections.

## Begin "Geographic information*" accordion
*note, the * in the title of the accordion indicates to the user that there is required information in here.*

### Protected site?*
* Entry type: Yes / No
* Considerations: Andrew included this field: "Protected -- Boolean". PBDB does not require it to be entered. Mark says: "This has been hacked in by Shanan."
* PBot:
* dwc:
* Info: is this considered a legally protected site?

### Country*
* Entry type: dropdown menu with all the countries in the world as options (PBDB has this- easy to find?)
* Considerations: required for PBDB. If we have the capability to auto-fill once lat-long are entered, that would be great, but maybe hard. From Mark: Asking for both country and state along with lat/long is a good error checking routine. PBDB roughly checks to see if your coordinate are in the right country (maybe not state...), which helps with typos.
* PBot:
* dwc:
* Info: 

### State/province
* Enty type: free text
* Considerations: This a required field for PBDB if the country is USA. If we have the capability to auto-fill once lat-long are entered, that would be great, but maybe hard. From Mark: Asking for both country and state along with lat/long is a good error checking routine. PBDB roughly checks to see if your coordinate are in the right country (maybe not state...), which helps with typos.
* PBot:
* dwc: 
* Info: A required field if the country is the USA. Elsewhere, its use is also encouraged (e. g., England is a "state" of the United Kingdom, Ontario is a province of Canada). You must spell out the entire state name; do not use U.S. postal codes like "CA" or "WY."

### Scale of geographic resolution
* Entry type: drop-down menu, select one, with choices: hand sample, small collection (<10x10m), outcrop (<1x1km), local area (<100x100km), and basin
* PBot:
* dwc:
* Info: From the pop-up menu, select the resolution that best characterizes your collection. Err on the side of conservatism: if you know the collection is from a particular road cut but don't know if it does or doesn't come from a small excavation within the road cut, enter "outcrop" instead of "small collection." If no information is given, do not make a selection. Terms are defined as follows:
small collection: from an area < 10 x 10 m, e.g., a single fossil, an individual bulk sample, or a small quarry
outcrop: from an area < 1 x 1 km, e.g., a large quarry, road cut, or wash
local area: from an area < 100 x 100 km, e.g., approximately a one-by-one degree lat/long rectangle or the size of most individual counties in the USA
basin: from any area > 100 x 100 km

### Comments on geographic information
* Entry type: free text
* Considerations: Info copied from PBDB
* PBot:
* dwc:
* Info: Provide any additional information that you think is important with respect to the geographic location of the collection. A large-scale map shows a small land area in great detail.
## End "Geographic information*" Accordion

## Begin "Age information*" Accordion
### Maximum time interval*
* Entry type: search Macrostrat for options
* Considerations: I think there is a lot going on the back-end with PBDB to match higher resolution intervals with lower resolution Periods, etc. Do we want to do that as well, or have it more specified? Side by side with minimum time interval
* PBot:
* dwc: has options for Eonothem, Erathem, Period/System, Epoch/Series, Age/Stage. E.g., http://rs.tdwg.org/dwc/terms/earliestPeriodOrLowestSystem
* Info: Enter the zone, age/stage, epoch, or period from which your collection is drawn. Use the most precise term you can. Geographically localized terms like "Wasatchian" and "Richmondian" are fine. If the time interval's name starts with "Late," "Upper," "Middle," etc., use the pull-down menu to select the proper term. Do not type these terms into the input field. Note that the "Early/Middle/Late" pull-down menu is not required. If the age of the collection spans more than one interval, put the oldest (= maximum) time interval in the first input field and the youngest in the second. Example: the collection is "Late Triassic to Early Jurassic." Put "Triassic" at the left and "Jurassic" at the right, with the left and right pull-downs set to "Late/Upper" and "Early/Lower," respectively. If a collection is known to span, or could span, multiple intervals, ignore the ones in between. So, if the span is as the Givetian, Frasnian, and Fammenian stages, then the maximum is "Givetian" and the minimum is "Fammenian." If the maximum and minimum values are identical, only the first field needs to be filled in. Do not put words like "epoch," "series," "age," or "stage" in these fields!

### Minimum time interval
* Entry type: search Macrostrat for options
* Considerations: This is not required because PBDB has you only enter Maximum time interval if the collection falls entirely within one time interval. Side by side with maximum time interval
* PBot:
* dwc: has options for Eonothem, Erathem, Period/System, Epoch/Series, Age/Stage. E.g., http://rs.tdwg.org/dwc/terms/earliestPeriodOrHighestSystem
* Info: See PBDB text under Maximum Time Interval. They discuss both together.

### Direct date
* Entry: Free text, numeric; PBDB has a box for date and a second box for Plus/minus error, and then a drop-down menu with options: Ma, Ka, YBP
* Considerations: We are not trying to be all-inclusive, and getting people to enter data is always a problem. So, we are simplifying and not asking for the method of dating.
* PBot:
* dwc:
* Info: Numeric age if associated with specific geochron measurement. Use this if the fossil horizon was directly dated.

### Numeric maximum age 
* Entry: Free text, numeric; PBDB has a box for date and a second box for Plus/minus error, and then a drop-down menu with options: Ma, Ka, YBP
* Considerations: We are not trying to be all-inclusive, and getting people to enter data is always a problem. So, we are simplifying and not asking for the method of dating.
* PBot:
* dwc:
* Info: Maximum numeric age if associated with specific geochron measurement. if associated with specific geochron measurement. These should not be filled in if a collection can only be assigned to a Period, Epoch, Age, or Series.

### Numeric minimum age
* Entry: Free text, numeric; PBDB has a box for date and a second box for Plus/minus error, and then a drop-down menu with options: Ma, Ka, YBP
* Considerations: We are not trying to be all-inclusive, and getting people to enter data is always a problem. So, we are simplifying and not asking for the method of dating.
* PBot:
* dwc:
* Info: Minimum numeric age if associated with specific geochron measurement. These should not be filled in if a collection can only be assigned to a Period, Epoch, Age, or Series.

### Comments on age information
* Entry type: free text
* Considerations: 
* PBot:
* dwc:
* Info: Provide any additional information that you think is important with respect to the age of the collection.
## End "Age information*" Accordion

## Begin "Geologic information*" Accordion
### Lithology*
* Entry: dropdown menu or checkbox, choices: not reported, “siliciclastic”, claystone, mudstone, “shale”, siltstone, sandstone, gravel, conglomerate, breccia, amber, coal, peat, lignite, subbituminous coal, bituminous coal, anthracite, coal ball, tar, “volcaniclastic”, ash, tuff, evaporite, gypsum, phosphorite, pyrite, ironstone, siderite, chert, diatomite, radiolarite, “mixed carbonate-siliciclastic”, marl, lime mudstone, chalk, travertine, “limestone”, dolomite, “carbonate”
* Considerations: Note that Ellen reduced PBDB choices to what PBot users are likely to choose. But really, I only got rid of the reef-type carbonate rocks. Is that ok with everyone? Also, we are getting rid of the other three pull-down menus PBDB had (lithification level, secondary lithology, tertiary lithology).
* PBot:
* dwc:
* Info: The lithology that makes up most of the exposure (for an outcrop) or part of the core that was studied (for a sample from a core). If it is not clear which lithology dominates, choose the first one listed in the publication. 

### Original, complete description of lithology
* Entry type: free text
* Considerations: Straight from PBSB
* PBot:
* dwc:
* Info: Provide any additional information that you think is important with respect to the lithology of the collection, the lithological context, or the taphonomic situation. Feel free to quote extensively from the publication, if it includes information you can't record in our fields and you think are important.

### Geologic group
* Entry type: free text
* Considerations: I prefaced all of the stratigraphic information with “Geologic” since we have other “Groups” and “Members” in PBot. Note that in our Github issue, we had "Stratigraphic Unit" listed with the definition "The most highly resolved stratigraphic unit - e.g., if your section has a known Group, Formation, Member, Submember, and Bed, you would put the Bed name here." Do we still want this field, or are we just keeping the Group, Formation, Member, Bed, and asking people to fill in what they can? Also, do we want to ping Macrostrat for consistent names, or just have free-text entry? This might be a PBot v2.0 thing.
* PBot:
* dwc:group http://rs.tdwg.org/dwc/terms/group
* Info: The full name of the lithostratigraphic group from which the cataloged item was collected. Important: Do not put the term “group.” in this field.

### Geologic formation
* Entry type: free text
* Considerations: 
* PBot:
* dwc:formation http://rs.tdwg.org/dwc/terms/formation
* Info: The full name of the lithostratigraphic formation from which the cataloged item was collected. Important: Do not put the term “formation” or “fm.” in this field.

### Geologic member
* Entry type: free text
* Considerations:
* PBot:
* dwc:member http://rs.tdwg.org/dwc/terms/member
* Info: The full name of the lithostratigraphic member from which the cataloged item was collected. Important: Do not put the term “member” or “mbr.” in this field.

### Geologic bed
* Entry type: free text
* Considerations:
* PBot:
* dwc:bed http://rs.tdwg.org/dwc/terms/bed
* Info: The full name of the lithostratigraphic bed from which the cataloged item was collected.

### Comments on stratigraphy
* Entry type: free text
* Considerations: Maps to PBDB.
* PBot:
* dwc:
* Info: Provide any additional information that you think is important with respect to the stratigraphic delineation of the collection.

### Environment
Entry type: drop-down menu with PBDB selections: terrestrial indet., fluvial-lacustrine indet., fluvial indet., alluvial fan, channel lag, “channel”, “floodplain”, crevasse splay, levee, mire/swamp, delta plain, lacustrine indet, lacustrine - large, lacustrine - small, pond, crater lake, lacustrine prodelta, dune, interdune, loess, eolian indet, cave, sinkhole, tar, glacial, coastal indet., estuary/bay, lagoonal, paralic indet., interdistributary bay, delta front, prodelta, deltaic indet., marine indet., marginal marine indet., deep-water indet.
Considerations:  This should map to the PBDB “Environment” field. Ellen reduced the number of choices, given where plant fossils are typically found.
PBot:
Dwc:
Info: The paleoenvironment interpretation. From PBDB: Select the most exact environmental category you can figure out. Each section of the pulldown includes some generalized "indet." terms that you should use only if a more precise determination is not possible. Full details from the Paleobiology Database are at: https://paleobiodb.org/public/tips/environtips.html.

### Comments on environment
* Entry type: free text
* Considerations: Maps straight to PBDB.
* PBot:
* dwc:
* Info: From PBDB: Provide any additional information, including extensive quotes from the paper, that you used to figure out these values. Don't leave this field blank unless the paper very specifically assigned the collection to environmental/tectonic/phase categories that exactly correspond to the ones we use.
## End "Geologic information*" Accordion

## Begin "Collecting information*" Accordion
### Author’s main reason for describing collection*
* Entry type: drop-down menu or check-box. options are: biostratigraphic, paleoecologic, taphonomic, taxonomic, general fanual/floral.
* Considerations: This is a required field for PBDB, so we must also make it required.
* PBot:
* dwc:
* Info: Characterize the intent or subject area of the part of the publication from which the collection was compiled. Be careful because different parts of one paper might have different purposes. When in doubt, use the category that best describes the whole paper.
biostratigraphic means described for the purpose of temporal correlation, or in the course of a geological study (e.g., lists given within descriptions of measured sections). When in doubt, choose general faunal/floral.
paleoecologic means described for the purpose of paleoecological analysis, including taxonomic lists that are given without descriptions of fossils and without discussions of temporal correlation.
taphonomic means described for the purpose of a taphonomic analysis.
taxonomic means a systematic paleontology treatment, including simple descriptions of fossils. Use this if the all the taxa are included in a systematic paleontology section, or if the taxonomic list is given only in support of an otherwise taxonomic account of one or a few taxa.
general faunal/floral means there is no detailed discussion of the age, environment, ecology, preservation, or morphology of the fossils, but a taxonomic list is given. Use this category only if the other ones are too specific.

### Modes of preservation*
* Entry type: check boxes with multiple choices allowed: body, trace, permineralized, cast, concretion, dissolution traces, mold/impression, soft parts, charcoalification, adpression/compression, recrystallized, coalified
* Considerations: Specimens would have a mode of preservation field, but unfortunately collection needs to be entered first, so I think we still need to collect this information. If specimens with new modes of preservation are added, is it possible to have that auto-fill here?
* PBot:
* dwc: 
* Info: Check as many of them as apply to any of the fossils in the collection. Impressions, casts, and molds are fossils with none of the original biomineralized or organic tissue preserved. These three categories are differentiated from each other as follows:
impression may be a 2D fossil (e.g., leaf impression).
cast means a 3D fossil that is a positive image of the original.
mold means a 3D fossil that is a negative image of the original.

### Size classes*
* Entry type: drop-down menu / check boxes with multiple choices allowed: > 10 mm, 1 - 10 mm, < 1 mm
* Considerations: This is a required field for PBDB, so we must also make it required.
* PBot:
* dwc:
* Info: Check all gross size categories that describe the fossils in the taxonomic list. Check a size category if the greatest length in any direction of the average fossil of any taxon fits into that category. Hence, if you have a 12 mm bivalve and a 3 mm gastropod, check both "> 10 mm" (for the bivalve) and "1 - 10 mm"> (for the gastropod). The categories roughly correspond to the following terms:
> 10 mm: macrofossil.
1 - 10 mm: mesofossil.
< 1 mm: microfossil.

### Collection methods
* Entry type: drop-down menu (or check-box) with multiple choices allowed: sieve, core, census, quarry, surface (float), surface (in situ), salvage, anthill
* Considerations: Ellen made small edits to the PBDB list; not sure how pollen would fit with this. would we just give the direction that it either be core (if from a core), or sieve (if from a hand sample?)?
* PBot:
* dwc:
* Info: PBDB options are: bulk: the fossils in a set volume of rock, or on an all surfaces of slabs of rock, were identified.
sieve: the fossils were put through a screen or sieve either in the field or in the lab.
core: the fossils came from a core, regardless of whether all material was identified.
quarrying: a trench, pit, or quarry was dug to collect the fossils, but not everything was necessarily identified (if it was, then call it a census collection).
surface (float): loose fossils were picked up at the surface.
surface (in situ): fossils were found embedded in the rock but no extensive quarrying or coring was done to collect them.
salvage: some fossils, but not all, were collected during an excavation intended for some other purpose (e.g., construction).
anthill: fossils were picked from the debris on the tops of anthills (a common method of collecting small vertebrates).

### Collectors
* Entry type: free text
* Considerations: Information copied from PBDB.
* PBot:
* dwc: http://rs.tdwg.org/dwc/terms/recordedBy
* Info: List the names of the people who collected the fossils, including the authors if appropriate. Separate names by commas and do not write out "and." Example: J. Doe, J. Smith, J. Brown

### Comments about collecting methods
* Entry type: free text
* Considerations: Info copied from PBDB
* PBot:
* dwc:
* Info: Provide as much additional information as possible. Examples: crinoids were not identified; the sediments were wet screened in the field; specimens were collected from a spoil pile; the quarry was discovered by Doe and excavated by Smith and Brown; the USNM museum collection was made in 1940 and the AMNH museum collection in 1941.
## End "Collecting Information*" Accordion

## Fields auto-generated by PBot:
 
### pbotID
* Info: Internal unique identifier in the PBot database. 
* Entry type: no entry, is autogenerated by PBot when creating a new record.
* PBot: pbotID: ID!
* dwc:  
 
### Entered by
* Info: The user who entered the record.
* Entry type: no entry, is autogenerated by PBot based on the user login when creating a new record.
* PBot: enteredBy: [CollectionEnteredBy]
* dwc: similar to but not quite synonymous with recordedBy http://rs.tdwg.org/dwc/terms/recordedBy

### Date entered 
* Info: Date the record was entered
* Entry type: no entry, is autogenerated by PBot when creating a new record.
* PBot: 
* dwc:

