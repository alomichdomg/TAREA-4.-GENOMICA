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
################################################################################
#AMIGOS/SALON
g<-read.csv("adjacency_matrix - adjacency_matrix.csv")
View(g)
rownames(g)<-g[,1]
View(g)
g<-g[,-1]
g<-as.matrix(g)
diag(g)<-0
red<-graph_from_adjacency_matrix(g)
plot(red,vertex.size=15,vertex.size=5,
     edge.arrow.size=0.25,layout=layout_nicely,vertex.size.label=0.25)

degree(red, v="ALONDRA", mode = "in")
amigos3 <- neighbors(red, v = "ALONDRA")
degree(red, v = amigos3)

#funcion
#para esto poner nombre en mayusculas y comillas
amigos_comparacion <- function(grafo, nombre){
#Escribe una función que calcule el número de amigos que tiene cualquier persona 
  amigos <- degree(grafo, v=nombre, mode = "out")#que el considera amigos
  cat("amigos que considera:", amigos, "\n")
  amigos2 <- degree(grafo, v=nombre, mode = "in")
  cat("lo consideran su amigos:", amigos2, "\n")
   #compare con el número de los amigos de estos.
  amigos3 <- neighbors(grafo, v = nombre)
  #cat("amigos de sus amigos:", amigos3, "\n")
  print(amigos3)
  grados_amigos <- degree(grafo, v = amigos3)
  cat("compare con el número de los amigos de estos:", grados_amigos, "\n")
  promedio_amigos<- mean(grados_amigos)
  cat("EL PROMEDIO DE AMIGOS ES:", promedio_amigos, "\n")
  
  
}
amigos_comparacion(red, "ZAID")
degree_distribution(red)->d1
hist(d1)
#Escribe una función que te de la trayectoria más larga entre dos nodos
#arbitrarios de la red.

all_simple_paths(red, from = "ALONDRA", to = "ABRAHAM")

#comillas y mayuscula(from, to)
lejanos_amigos <- function(grafo, nombre1, nombre2){
  trayectorias <- all_simple_paths(red, from = nombre1, to = nombre2)
  #rayectoria más larga entre dos nodos
  largos1 <- sapply(trayectorias, length)
  lejano1 <- max(largos1) #para que saque cual es la mas larga
  trayectoria_larga <- trayectorias[largos1 == lejano1] #cual tiene la mas lejana
  print(trayectoria_larga)
}
lejanos_amigos(red, "ALONDRA", "ABRAHAM") #te da todas las combinaciones :)

