# What is mean by K-means clustering? 
# K Means Clustering is an unsupervised learning algorithm that tries to cluster the data based on their similarity. 
# Unsupervised learning means that there is no outcome to be predicted, and the algorithm just tries to find patterns in the data.

# How K-means clustering model works?
# In k means clustering, we have to specify the number of clusters we want the data to be grouped into.
# The algorithm randomly assigns each observation to a cluster, and finds the centroid of each cluster. 
# Then, the algorithm iterates through two steps:
# 1.	Reassign data points to the cluster whose centroid is closest.
# 2.	Calculate new centroid of each cluster.
# These two steps are repeated until the within cluster variation cannot be reduced any further.

# How K-means clustering model is used in R programming?
# Load the iris dataset in the working environment
library(datasets)

# Exploring the data
head(iris)
# The iris dataset contains data about sepal length, sepal width, petal length, and petal width of flowers of different species.  
# After a little bit of exploration, I found that Petal.Length and Petal.Width were similar among the same species but varied considerably between different species.

# To get complete overview of data we plot ggplot of iris data. To plot iris data, we will insatll ggplot2 package in R and then load the ggplot2 in r environment.
library(ggplot2)
# Plot the ggplot for iris dataset for two variable Pedal.Length and Pedal.Width with color perfernece as per species. 
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

#  After exploring and plotting of data, let us try to cluster it. Since the initial cluster assignments are random, let us set the seed to ensure reproducibility.
set.seed(20)

# Since we know that there are 3 species involved, we ask the algorithm to group the data into 3 clusters, and since the starting assignments are random, we specify nstart = 20. 
# This means that R will try 20 different random starting assignments and then select the one with the lowest within cluster variation.
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster

# Let us compare the clusters with the species
table(irisCluster$cluster, iris$Species)

# We can plot to see the clusters
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()

# We can find out the error in k mean clustering
not.error <- unclass(iris$Species) == irisCluster$cluster
iris$noerror <- not.error

# We can plot the error in k-mean clustering.
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) +geom_point(size = 3, alpha = 0.5, aes(shape = iris$noerror))


