library(tidyverse)
library(lubridate)

# cleaning the characters such as | and $
raw_lines <- readLines("Unclean Dataset.csv")
clean_lines <- str_replace_all(raw_lines, "\\|", ",")
clean_lines <- str_replace_all(clean_lines, ",+$", "")

# since i made the csv into raw text, turn it back into a dataframe 
df <- read.csv(text = clean_lines, 
               header = TRUE, 
               stringsAsFactors = FALSE, 
               na.strings = c("NA", ""))

# making it into 8 columns as per the uncleaned csv
df <- df[, 1:8]
colnames(df) <- str_trim(colnames(df))

# 3. The Master Cleaning Pipeline
df_cleaned <- df %>%

  mutate(across(everything(), str_trim)) %>%  #remove all whitespaces
  
  
  filter(!is.na(First_Name) | !is.na(Last_Name)) %>%  #theres row with no names at all, i remove the row entirely
  
  # some of the data contains two words in the first name column (first and last name, so extract the second word into last name )
  mutate(
    has_two_names = ifelse(is.na(First_Name), FALSE, str_detect(First_Name, " ")),
    Last_Name = ifelse(has_two_names, word(First_Name, 2, -1), Last_Name),
    First_Name = ifelse(!is.na(First_Name), word(First_Name, 1), First_Name)
  ) %>%
  select(-has_two_names) %>% 
  
  # reassigning all the ids starting from 101
  mutate(Full_Name = str_squish(paste(replace_na(First_Name, ""), replace_na(Last_Name, "")))) %>%
  mutate(Student_ID = match(Full_Name, unique(Full_Name)) + 100) %>%
  select(-Full_Name) %>%
  
  # remove everything that's not a digit
  mutate(Total_Payments = str_remove_all(Total_Payments, "[^0-9.]"),
         Total_Payments = as.numeric(Total_Payments)) %>%
  
  # clean age and replace missing data with the median
  mutate(Age = str_extract(Age, "\\d+"),
         Age = as.numeric(Age)) %>%
  mutate(Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age)) %>%
  
  # clean course names and replace missing with "UNKNOWN"
  mutate(Course = case_when(
    str_detect(Course, "Machine Learnin") ~ "Machine Learning",
    str_detect(Course, "Web Developme") ~ "Web Development",
    Course == "4" ~ "UNKNOWN",
    TRUE ~ Course
    
  )) %>%
  mutate(Course = replace_na(Course, "UNKNOWN")) %>%
  
  # Clean gender and replace missing with "UNKNOWN", also ensure it's only either M or F
  mutate(Gender = str_extract(toupper(Gender), "[MF]")) %>%
  mutate(Gender = replace_na(Gender, "UNKNOWN")) %>%
  
  # standardizing the date format for all rows
  mutate(Enrollment_Date = parse_date_time(Enrollment_Date, orders = c("ymd", "mdy", "dmy"), quiet = TRUE)) %>%
  
  # remove duplicates
  distinct()

head(df_cleaned)