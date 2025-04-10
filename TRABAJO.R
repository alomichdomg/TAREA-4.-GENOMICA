###PREGUNTAS###
library(igraph)

calculo_total <- function(grafo){
#Número de conexiones
  ecount(grafo)->conexiones
  print(conexiones)
  cat("#conexiones:", conexiones, "\n")
#Número de nodos
  vcount(grafo)->nodos
  print(nodos)
  cat("#nodos:", nodos, "\n")
  
  #Degree
degree(grafo, mode = "total")->total
print(total)
cat("#degree:", total, "\n")

#Average degree
ava_degree <- total/nodos
print(ava_degree)
cat("degreeavarage:", ava_degree, "\n")
#Degree distribution
  hist(total, col="purple", main="Histograma del grado")
#Density
densi <- conexiones/(nodos * (nodos-1))
print(densi)
cat("densidad:", densi, "\n")
#Adjacency matrix
adj_mat <- as.matrix(as_adjacency_matrix(grafo))
View(adj_mat)
#Matriz de distancia
distances(grafo)
dist_matrix <- distances(grafo)
heatmap(dist_matrix, main="Matriz de distancias")

#Diámetro
diameter(grafo)->diametro
print(diametro)
cat("diametro:", diametro, "\n")
#Coeficiente de clusterización
transitivity(grafo, type = "local")->cluster_1
print(cluster_1)
cat("cluster local:", cluster_1, "\n")
}

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
karate<-make_graph("Zachary")
calculo_total(karate)
mean_distance(karate)
