# Display a message
print("Coding in R")

# Assign a string value to a variable
first_variable <- "This is my variable"

# Assign a numeric value to a variable
second_variable = 12.5

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

# Use a pipe to redirect the output of a function to the input of another function
"Hello" %>% print

# Create a list with named elements that contains element of different types
z <- list("MyCharacter" = "A", "MyDouble" = 10.3, "MyInteger" = 60L, "MyLogical" = TRUE)

# Display the list structure and the type of each element it contains
# str stands for: "Compactly Display the Structure of an Arbitrary R Object Description"
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

# List all the datasets available in the computer (including the not loaded)
data(package = .packages(all.available = TRUE))

# Create a data frame
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

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


