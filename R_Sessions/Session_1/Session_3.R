

# Changing working directory

getwd() 
setwd("/home/tanvir/Documents/ownCloud/Git_Repos/causality-group/RSessions/")


# R has different type of objects

# 1. Numeric object

x <- 1.5
class(x)

# 2. Vector Numeric, c() function is used to attach 

y <- c(1.5, 2.5, 3.5)
class(y)

# 3. String object

z <- "Hello"
class(z)

# 4. Matrix object

m <- matrix(1:6, nrow = 2, ncol = 3)
class(m)

# print the matrix in the console
m

# Accessing elements in a matrix
m[1, 2] # Accessing the element in the first row and second column
m[1, 2] <- 10 # Modifying the element in the first row and second column
m
m[1,]  # Accessing the first row of the matrix


# 5. Data Frame object

df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Height = c(5.5, 6.0, 5.8)
)

class(df)

# View data frame in the console
View(df)

# Accessing elements in a data frame with column name
# use $ operator to access a specific column

df$Name  # Accessing the 'Name' column
df$Age  # Accessing the 'Age' column

# with column name and row number

df[1, "Name"]  # Accessing the 'Name' of the first row

# subset of the data, often subsetting is quite helpful

df_subset <- df[df$Age > 28, ]  # Subset where Age is greater than 28

# View the subset data frame
View(df_subset)



# 6. List object


mylist <- list(1, "2", "asap", c(1, 2, 3))

l <- list(
  Name = "Alice",
  Age = 25,
  Height = 5.5,
  Scores = c(90, 85, 88)
)

# categorical data

categorical_data <- c("Fully Satisfied", "Fully Satisfied", "Not Satisfied", "Average Satisfied", "Not Satisfied")

factor_data <- factor(categorical_data)

factor_data

table(factor_data)

barplot(table(factor_data))

# user defined function y = 2x + 1

my_function <- function(x) {
  y <- 2*x + 1
  return(y)
}


my_function(4)



