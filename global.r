dat <- read.csv("project_data.csv")
disease_list <- levels(as.factor(dat$disease))
zipcode_list <- levels(as.factor(dat$zip_code))
