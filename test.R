library(googlesheets4)
library(googledrive)

list1 <- c("first","second","third")
list2 <- c("uno","dos","tres")
df <- as.data.frame(list1,list2)

# Authenticate using a service account key stored as a GitHub secret
gs4_auth(path = Sys.getenv("GOOGLE_SHEETS_KEY"))

# Upload fb_archive to the "feedbin" Google Sheet
sheet_id <- drive_get("feedbin")$id

write_sheet(df, ss = sheet_id, sheet = "Sheet1")
