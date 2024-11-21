View(Zoon[1:1000,])

species <- sswidb::sswidb_species(conn)
needprec <- data.frame("CLASS_METHOD"="ZOONIVERSE",
                       "SPECIES_NAME"=species$SPECIES_NAME[!(species$SPECIES_NAME %in% classprec2$SPECIES_NAME)],
                       "PRECISION"= 0,
                       "USER_GROUP_CODE"= "Z",
                       "ID"= species$ID[!(species$ID %in% classprec2$ID)])
needprec$SPP_MODE <- paste0("PHOTO_TAG_",gsub(pattern = "\\W", replacement = "", x = toupper(needprec$SPECIES_NAME)))


unique(Zoon$METADATA_GROUP_CODE)
unique(grep(x=Zoon$SPP_MODE, pattern="DEER", value=TRUE))
unique(grep(x=Zoon$SPP_MODE, pattern="SQUIRRELSANDCHIPMUNKS", value=TRUE))
sort(unique(grep(x=Zoon$SPP_MODE, pattern = "^\\w+$", value = TRUE)))
sort(unique(classprec$SPECIES_NAME))
(gsub(pattern = "\\W", replacement = "", x = toupper(classprec$SPECIES_NAME)))

DF <- data.frame("SPPMode"=grep(x=Zoon$SPP_MODE, pattern="DEER", value=TRUE))
DFSummary <- DF%>%group_by(SPPMode)%>%summarise(n=n())
DFSummary$n[DFSummary$SPPMode == "DEER"]
sum(DFSummary$n[DFSummary$SPPMode != "DEER"])
0.005

p <- Zoon[is.na(Zoon$PRECISION),]
