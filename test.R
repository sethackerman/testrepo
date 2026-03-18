library(googlesheets4)
library(googledrive)

list1 <- c("first","second","third")
list2 <- c("uno","dos","tres")
df <- as.data.frame(list1,list2)

secret_json <- Sys.getenv("GDRIVE_SERVICE_ACCOUNT")
tkn <- tempfile(fileext = ".json")
writeLines(secret_json, tkn)
drive_auth(path = tkn)
gs4_auth(token = drive_token())
message("Authenticated as: ", drive_user()$emailAddress)

temp_file <- tempfile(fileext = ".csv")
write.csv(df, temp_file, row.names = FALSE)
drive_put(media = temp_file, path = as_id("1lSybfpacWavRrV3runu7vkeHXXXFTSxq"), name = "df.csv")
