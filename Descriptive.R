#import the required libraries
library(tidyverse)
library(dplyr)

#Read the data files
phone_data<- read.csv("smartphone_customer_data.csv")
head(phone_data)

#Find the mean chat time for Samsung phones in the small category
chat_minutes <- phone_data%>%
  filter(brand=="samsung",size_cat == "s", years_ago==1)%>%
  summarise(Average_Chat_Minutes = mean(chat))
chat_minutes

#Categorize phones by brand and size
categories <- phone_data%>%
  group_by(size_cat, brand,years_ago)%>%
  summarise(Count = n())%>%
  arrange(desc(Count))
categories

#