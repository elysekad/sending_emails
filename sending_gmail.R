

library(gmailr)

first_name <- 'Elyse'

body <- paste0("Dear ", first_name, ", 
\nWe celebrated our one year anniversary at KenSci on Monday! Thirty data scientists came out to celebrate and we spent the night networking and recapping the positive impact Seattle Women in Data Science has had on members and the data science community. It was a warm, festive celebration and we could not have made it so far without your generous help!    
\nOn behalf of SeaWiDS, we would like to give you a huge thank you for volunteering your time and resources at our meetups. The past year has been a huge success and we cannot wait to create more opportunities to support women data scientists this upcoming year.
\nThank you again and we hope to see you again at a future meetup!
\nSincerely,
\nSeattle Women in Data Science")


html_msg <- mime() %>%
  to("elysekad@gmail.com") %>%
  from("elysekad@gmail.com") %>%
  cc("mahnaz.akbari@gmail.com") %>%
  subject("SeaWiDS celebrated our one year anniversary") %>%
  html_body(body) %>%
  attach_part(body) %>%
  attach_file("SeaWiDS_group_pic_med.png") -> file_attachment

create_draft(file_attachment)
