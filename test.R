library(googlesheets4)
library(googledrive)

list1 <- c("first","second","third")
list2 <- c("uno","dos","tres")
df <- as.data.frame(list1,list2)

# Write the JSON secret to a temp file, then authenticate
key_file <- tempfile(fileext = ".json")
writeLines(Sys.getenv("GOOGLE_SHEETS_KEY"), key_file)
gs4_auth(path = key_file)

# Upload fb_archive to the "feedbin" Google Sheet
sheet_id <- drive_get("feedbin")$id
write_sheet(df, ss = sheet_id, sheet = "Sheet1")
