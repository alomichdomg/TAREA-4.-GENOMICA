###PREGUNTAS###
library(igraph)
source("FUNCION.R")

###RED 1
red1 <- make_graph(edges = c(6,10, 6,9, 6,4, 4,8, 4,2, 2,1, 2,3, 3,5, 1,7), directed = FALSE)
plot(red1)
calculo_total(red1)

###RED 2
red2 <- make_graph(edges = c(5,1, 2,1,3,1,6,1, 4,1, 7,4, 9,4,8,4,10,8), directed = TRUE)
plot(red2)
calculo_total(red2)

###RED 3
red3 <- make_full_graph(10, directed = FALSE)
plot(red3)
calculo_total(red3)

###RED 4
red4 <- make_graph(edges=c(1,7, 1,8, 2,5, 2,10, 3,6, 3,9, 4,2, 4,10, 5,1, 5,7,
                                    6,1, 6,10, 7,8, 8,6, 9,1, 9,4, 10,3, 10,6), directed = TRUE)
plot(red4)
calculo_total(red4)
###RED 5
red5 <- make_graph(edges = c(2,7,5,7,3,7,3,1, 7,1,7,8,8,6,8,10,8,9,1,10,10,4,9,10,6,4), directed = FALSE)
plot(red5)
calculo_total(red5)

###REd 6
red6 <- make_graph(edges = c(4,9,4,8,2,4,2,5,5,10,1,2,1,3,3,7,3,6), 
                   directed = TRUE)
plot(red6)
calculo_total(red6)
#################################################################################
#KARATE:
karate<-make_graph("Zachary")

#PREGUNTA 7
calculo_total(karate)
mean_distance(karate)

#PREGUNTA DEL DEGREE DISTRIBUTION
degree_distribution(karate)->degreed
hist(degreed, , col="purple", main="Histograma del grado")


#PREGUNTA 8
distancia_1 <- distances(karate)
print(distancia_1)

max(distancia_1)->distancia_maxima
which(distancia_1 == distancia_maxima)#

#la trayectoria mas lejana es de 5 y son estos los nodos
#PREGUNTA 10
  #1.-Centralidad de grados:
degree(karate) 
V(karate)$degree <- degree(karate) # assignment

plot(karate, vertex.label.cex = .6, vertex.label.color = "black", vertex.size = V(karate)$degree, vertex.label.cex = .2) # sized by degree
  #2.- Centralidad de intermediación
betweenness(karate)#, directed = TRUE)
V(karate)$betweenness <- betweenness(karate)#, directed = F) # assignment

plot(karate, 
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(karate)$betweenness) # sized by betweenness
  #3.- Centralidad de cercania
closeness(karate)
V(karate)$closeness <- closeness(karate)
plot(karate,
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(karate)$closeness/max(V(karate)$closeness) * 20)
  #4.- Centralidad del vector propio.
eigen_centrality(karate)$vector
V(karate)$eigenvector <- eigen_centrality(karate)$vector

plot(karate,
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(karate)$eigenvector/max(V(karate)$eigenvector) * 20)
