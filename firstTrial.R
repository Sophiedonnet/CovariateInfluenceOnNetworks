library(sbm)
library(ggplot2)

################### SIMULATE 
nbNodes  <- 90
blockProp <- c(.5, .25, .25) # group proportions
means <- diag(.4, 3) + 0.05  # connectivity matrix: affiliation network
K <- length(blockProp)
connectParam <- list(mean = means)
mySampler <- sampleSimpleSBM(nbNodes, blockProp, connectParam)
adjacencyMatrix <- mySampler$networkData

########### cov 
mu <- sample(1:K*10,K,rep=FALSE)
cov1 <-mu[mySampler$memberships] + rnorm(nbNodes)
cov2 <-sample(1:K*10,nbNodes,rep=TRUE) + rnorm(nbNodes)

mydata <- as.data.frame(as.factor(mySampler$memberships))
names(mydata) = 'memberships'
mydata$cov1 <- cov1
mydata$cov2 <- cov2
#################### 
ggplot(mydata, aes(x=memberships, y=cov1)) +  geom_boxplot() 
ggplot(mydata, aes(x=memberships, y=cov2)) +  geom_boxplot() 

################################################################ 
### graph induit
x <- cov1
A <-adjacencyMatrix 
L <- 20
g <- quantile(x,c(4:L)/L)
for (i in l:L){
  
  w <- which(x<g[l])
  Aw <- A[w,w]
  
  
}
