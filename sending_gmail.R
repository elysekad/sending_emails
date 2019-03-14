
library(xlsx)
library(gmailr)

setwd("")
contact_list <- xlsx::read.xlsx('contact_list_full.xlsx', 1, stringsAsFactors=FALSE)
n=length(contact_list[!is.na(contact_list$e_mail), 'e_mail'])

mapply(function(first_name, e_mail) {
  
  body <- paste0("Dear ", first_name, ", 
\nWe celebrated our one year anniversary at KenSci on Monday! Thirty data scientists came out to celebrate and we spent the night networking and recapping the positive impact Seattle Women in Data Science has had on members and the data science community. It was a warm, festive celebration and we could not have made it so far without your generous help!    
\nOn behalf of SeaWiDS, we would like to give you a huge thank you for volunteering your time and resources at our meetups. The past year has been a huge success and we cannot wait to create more opportunities to support women data scientists this upcoming year.
\nThank you again and we hope to see you again at a future meetup!
\nSincerely,
\nSeattle Women in Data Science")
  
  html_msg <- mime() %>%
  to(e_mail) %>%
  from("elysekad@gmail.com") %>%
  cc("mahnaz.akbari@gmail.com") %>%
  subject("A big thank you from SeaWiDS!") %>%
  html_body(body) %>%
  attach_part(body) %>%
  attach_file("SeaWiDS_group_pic.png") -> file_attachment

send_message(file_attachment)}, first_name=contact_list$first_name[1:n], e_mail=contact_list$e_mail[1:n])



