##################
# R Basic Commands
##################

# Display a message
print("Coding in R")

# Assign a string value to a variable
first_variable <- "This is my variable"

# Assign a numeric value to a variable
second_variable <- 12.5

# Use the combine function to create a vector
vec_1 <- c(13, 48.5, 71, 101.5, 2)

# typeof() returns the vector type
typeof(vec_1)

# Determine the size (length) of a vector
length(vec_1)

# Create a vector of integers
n <- c(10L, 20L, 30L)

# Create a vector of doubles
n <- c(10, 20, 30)

# Assign a name to each element of the vector
names(n) <- c("a", "b", "c")

# Retrieve a vector element by its name
n["a"]

# Retrieve a vector element by its index position
n[1]

# Use a pipe to redirect the output of a function to the input of
# another function
"Hello" %>% print

# Create a list with named elements that contains element of
# different types
z <- list("MyCharacter" = "A", "MyDouble" = 10.3, "MyInteger" = 60L,
          "MyLogical" = TRUE)

# Display the list structure and the type of each element it contains
# str stands for: "Compactly Display the Structure of an Arbitrary R
# Object Description"
str(z)

# Load tidyverse and lubridate libraries
library(tidyverse)
library(lubridate)

# Create a full date-time object
ymd_hms("2021-06-30 15:41:34")

# Create a partial date-time object
mdy_hm("06-30-2021 15:41")

# Get the date portion from a date-time object
as_date(now())

# List all the loaded datasets
data()

# List all the datasets available in the computer (including the not loaded)
data(package = .packages(all.available = TRUE))

# Load a specific dataset
data(mtcars)

# Create a data frame
data.frame(x = c(1, 2, 3), y = c(1.5, 5.5, 7.5))

# Create a blank file
file.create("new_text_file.txt")

# Delete a file
unlink("new_text_file.txt")

# Copy a file
file.copy("new_text_file.txt", "C:\\")

# Create a matrix containing the values from 3 to 8 in two rows
matrix(c(3:8), nrow = 2)

# Create a matrix containing the values from 3 to 8 in two columns
matrix(c(3:8), ncol = 2)

# Display the columns and the first rows of data in "diamonds" dataset
head(diamonds)

# Display the column names of a dataset
colnames(diamonds)

# Display summaries of each column in the dataset arranged horizontally
glimpse(diamonds)
str(diamonds)

# Rename two dataset columns
rename(diamonds, carat_new = carat, cut_new = cut)

# Calculate and display the mean value in a dataset column
summarize(diamonds, mean_carat = mean(carat))

# Take the diamonds dataset, plot the carat column on the X-axis,
# the price column on the Y-axis, and represents the data as a scatter plot
# using the geom_point() command
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()

# Same as previous, but now change the color of each point so that it
# represented another variable, such as the cut of the diamond
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point()

# Same as previous, but now create a different plot for each type of cut,
# using the facet_wrap() command
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
       geom_point() + facet_wrap(~cut)

# Update all the packages
update.packages()

# Update a specific package, e.g. cli package
install.packages(cli)

# Check for Tidyverse updates
tidyverse_update()

# Display the vignettes of a specific package
browseVignettes("ggplot2")

# Create a tibble from a dataset.
tibble_diamonds <- as_tibble(diamonds)

# Use read_csv (from readr) to load an example file
read_csv(readr_example("mtcars.csv"))

# Use read_csv to load a .csv file from disk
read_csv("C:\\Labs\\Git\\Google\\Data Analytics\\Course 7\\07.17 - hotel_bookings.csv")

# Load readxl to read Excel files
library(readxl)

# Read an Excel example file
read_excel(readxl_example("type-me.xlsx"))

# List an Excel file sheet names
excel_sheets(readxl_example("type-me.xlsx"))

# Read a specific Excel file sheet by name
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")

# Read a specific Excel file sheet by its ordinal number
read_excel(readxl_example("type-me.xlsx"), sheet = 2)

# Install and load packages
install.packages("dplyr")
library(dplyr)
install.packages("here")
library(here)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)
install.packages("palmerpenguins")
library(palmerpenguins)

# Select only island and year columns
penguins %>% select(island, year)

# Select all columns except the species column
penguins %>% select(-species)

# Rename island column to island_new
penguins %>% rename(island_new = island)

# Rename all column names to uppercase
penguins %>% rename_with(toupper)

# Use clean_names from janitor package to ensure there is only
# characters, numbers, and underscores in the names
penguins %>% clean_names

# Sort the dataset by a specific column in ascending order
penguins %>% arrange(bill_length_mm)

# Sort the dataset by a specific column in descending order
penguins %>% arrange(-bill_length_mm)
penguins %>% arrange(desc(bill_length_mm))

# Find the max and min values within a column
max(penguins$year)
min(penguins$year)

# Use group_by to sort the dataset by a specific column, leave out NA values,
# and display a new column with the mean from each group
penguins %>%
    group_by(island) %>%
    drop_na %>%
    summarize(mean_bill_length_mm = mean(bill_length_mm))

# Summarize by species and island and then display the mean and maximum values
# for each species on each island
penguins %>%
    group_by(species, island) %>%
    drop_na %>%
    summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# Filter the results to include only a specific species
penguins %>% filter(species == "Adelie")

# Select two columns and unite them into one column
example_df <- bookings_df %>%
    select(arrival_date_year, arrival_date_month) %>% 
    unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"),
          sep = " ")

# Create a data frame
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman",
          "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan",
          "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical",
               "Developer", "Programmer", "Management", "Clerical",
               "Developer", "Programmer")
employee <- data.frame(id, name, job_title)


# Separate the content of one column into two separate columns
new_employee <- separate(employee, name, into = c("first_name", "last_name"), sep = " ")

# Unite the content of two separate columns into one column
unite(new_employee, name, first_name, last_name, sep = " ")

# Install and load Tmisc package to use Anscombe's Quartet dataset
install.packages("Tmisc")
library(Tmisc)
data("quartet")

# Group quartet dataset by set column and then summarize x and y columns
quartet %>%
    group_by(set) %>%
    summarise(mean(x), sd(x), mean(y), sd(y), cor(x, y))

# Visualize the data to confirm if the datasets are actually identical
ggplot(quartet, aes(x, y)) +
    geom_point() +
    geom_smooth(method = lm, se = FALSE) +
    facet_wrap(~set)

# Install and load datasauRus package
install.packages("datasauRus")
library(datasauRus)

# Use the datasauRus dataset to show R visualization capabilities
ggplot(datasaurus_dozen, aes(x = x, y = y, color = dataset)) +
    geom_point() +
    theme_void() +
    theme(legend.position = "none") +
    facet_wrap(~dataset)

# Install SimDesign package to evaluate a dataset bias
install.packages("SimDesign")
library(SimDesign)

# Use the bias function to evaluate the difference between the actual and
# the predicted temperatures
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicted_temp)

# Create a scatter plot of the penguins dataset
ggplot(data = penguins) + geom_point(mapping = aes(x = body_mass_g,
                                                   y = flipper_length_mm))

# Same as previous, this syntax makes the different layers more visible
ggplot(penguins) + aes(body_mass_g, flipper_length_mm) + geom_point()

# Same as previous, adding another aesthetic property to map the plot color
# to the species variable
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, color = species) +
    geom_point()

# Adds a shape property that is also mapped to the species variable
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, color = species, shape = species) +
    geom_point()

# Adds a size property that is also mapped to the species variable
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, color = species, shape = species,
        size = species) +
    geom_point()

# Removes color, shape, and size, then adds an alpha property also mapped to
# the species variable. Adds size and color properties to geom_point()
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, alpha = species) +
    geom_point(size = 5, color = "purple")

# Use geom_smooth() instead of geom_point()
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm) +
    geom_smooth()

# Use both geom_smooth() and geom_point()
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm) +
    geom_smooth() +
    geom_point()

# Maps the linetype property to the species variable
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, linetype = species) +
    geom_smooth()

# Adds a little of noise (jitter) to each point so that the points do not
# overlap so much
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm) +
    geom_jitter()

# Render a bar graph using geom_bar()
ggplot(diamonds) + geom_bar(aes(cut))

# Fill the bars with different colors
ggplot(penguins) + geom_bar(aes(x = species, fill = species))
ggplot(diamonds) + geom_bar(aes(x = cut, fill = cut))

# Plot cut variable values on each bar filling the bars with clarity variable
ggplot(diamonds) + geom_bar(aes(x = cut, fill = clarity))

# Plot year variable values on each bar filling the bars with species variable
ggplot(penguins) + geom_bar(aes(year, fill = species))

# Plot a graph containing species facet, each specie having a different color
ggplot(penguins) +
    aes(body_mass_g, flipper_length_mm, color = species) +
    geom_point(size = 3) +
    facet_wrap(~species)

# Plot diamonds color values while separating each cut facet on its own graph
ggplot(diamonds) +
    aes(x = color, fill = cut) +
    geom_bar() +
    facet_wrap(~cut)

# Plot a grid of penguins' flipper_length_mm and body_mass_g values separating
# each sex and species facet on its own graph (3 species * 3 sex = 9 graphs)
ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g, color = species) +
    geom_point() +
    facet_grid(sex~species)

# Focus on sex facet only
ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g, color = species) +
    geom_point() +
    facet_grid(~sex)

# Load "Hotel Bookings" dataset from a .csv file
hotel_bookings <- read.csv("C:\\Labs\\Git\\Google\\Data Analytics\\Course 7\\07.17 - hotel_bookings.csv")

# Use different colors to represent each market segment
ggplot(hotel_bookings) +
    aes(x = hotel, fill = market_segment) +
    geom_bar()

# Use facet_wrap() to plot a graph for each segment
ggplot(data = hotel_bookings) +
    geom_bar(mapping = aes(x = hotel)) +
    facet_wrap(~market_segment)

# Filtering the dataset to include only city hotels that are online TA
onlineta_city_hotels <- filter(hotel_bookings, 
                               (hotel=="City Hotel" & 
                                hotel_bookings$market_segment=="Online TA"))

# Display filtering result
View(onlineta_city_hotels)

# Same as previous, using the pipe operator
onlineta_city_hotels_v2 <- hotel_bookings %>%
    filter(hotel=="City Hotel") %>%
    filter(market_segment=="Online TA")

# Display filtering result
View(onlineta_city_hotels_v2)

# Create a plot that shows the relationship between lead time and guests
# traveling with children for online bookings at city hotels
ggplot(data = onlineta_city_hotels_v2) +
    geom_point(mapping = aes(x = lead_time, y = children))

# Use the labs (short for "labels") function to add a title and the annotate()
# function to show an annotation on the coordinates given
ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g, color = species) +
    geom_point() +
    labs(title = "Palmer Islands Penguins: Body Mass vs. Flipper Length",
         subtitle = "Sample Of Three Penguin Species",
         caption = "Data collected from 2007 to 2009 by Dr.Kristen Gorman") +
    annotate("text", x = 225, y = 4500, label = "The Gentoos are the largest",
             color = "red", fontface = "bold", size = 4.5, angle = 30)

# Store the plot in a variable
p <- ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g, color = species) +
    geom_point() +
    labs(title = "Palmer Islands Penguins: Body Mass vs. Flipper Length",
         subtitle = "Sample Of Three Penguin Species",
         caption = "Data collected from 2007 to 2009 by Dr.Kristen Gorman")

# Now add the annotation to the plot variable to get the same result
p + annotate("text", x = 225, y = 4500, label = "The Gentoos are the largest",
             color = "red", fontface = "bold", size = 4.5, angle = 30)

# Save to local disk an image file containing the last plot rendered
ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g, color = species) +
    geom_point(size = 4.6)
ggsave("Three Penguin Species.png")

# Get the min() and max() arrival_date_year
mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)

# Add a title, a caption, x and y axis titles, and a legend title
ggplot(hotel_bookings) +
    geom_bar(aes(market_segment,
                 fill = market_segment)) +
    facet_wrap(~hotel) +
    theme(plot.title = element_text(size = 20,
                                    color = "dark blue"),
          axis.text.x = element_text(angle = 45,
                                     margin = margin(25, 0, 0, 0, "pt")),) +
    labs(title = "Comparison of Market Segments by Hotel Type for Hotel Bookings",
         caption = paste0("Data from ", mindate, " to ", maxdate),
         x = "Market Segment",
         y = "Number of Bookings",
         fill = "Market Segment")




