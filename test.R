library(googlesheets4)
library(googledrive)

list1 <- c("first","second","third")
list2 <- c("uno","dos","tres")
df <- as.data.frame(list1,list2)

# Write the JSON secret to a temp file, then authenticate
key_file <- tempfile(fileext = ".json")
writeLines(Sys.getenv("GOOGLE_SHEETS_KEY"), key_file)

# Debug: check what's being read
key_contents <- Sys.getenv("GOOGLE_SHEETS_KEY")
cat("Number of characters read:", nchar(key_contents), "\n")
cat("First 50 characters:", substr(key_contents, 1, 50), "\n")

# Write to temp file and verify it exists
key_file <- tempfile(fileext = ".json")
writeLines(key_contents, key_file)
cat("Temp file exists:", file.exists(key_file), "\n")
cat("Temp file size:", file.size(key_file), "\n")

gs4_auth(path = key_file)

# Upload fb_archive to the "feedbin" Google Sheet
sheet_id <- drive_get("feedbin")$id
write_sheet(df, ss = sheet_id, sheet = "Sheet1")
