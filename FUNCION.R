###FUNCION###
calculo_total <- function(grafo){
  library(igraph)
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
  cat("degree avarage:", ava_degree, "\n")
  
  degre1<- degree(grafo, mode = "total")
  mean(degre1)->promedio1
  
  cat("degree avarage FUNCION:", promedio1, "\n")
  
  #Degree distribution
  hist(total, col="purple", main="Histograma del grado")
  #Density
  densi <- conexiones/(nodos * (nodos-1))
  print(densi)
  cat("densidad manual :", densi, "\n")
  edge_density(grafo)->denis1
  cat("densidad:", denis1, "\n")
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
