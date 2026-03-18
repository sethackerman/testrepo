library(googlesheets4)
library(googledrive)
library(jsonlite)

list1 <- c("first","second","third")
list2 <- c("uno","dos","tres")
df <- data.frame(list1 = list1, list2 = list2)
key_json <- jsonlite::fromJSON(Sys.getenv("GOOGLE_SHEETS_KEY"))
cat("Characters read:", nchar(Sys.getenv("GOOGLE_SHEETS_KEY")), "\n")
gs4_auth(path = key_json)

sheet_id <- drive_get("feedbin")$id

write_sheet(df, ss = sheet_id, sheet = "Sheet1")
