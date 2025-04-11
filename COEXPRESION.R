###5.  **Red de coexpresión simulada**###

#Simula una matriz de expresión con 20 genes en 6 condiciones diferentes.
matriz_genes <- matrix(c(sample(1:120, 20)), nrow = 6, ncol = 20)

# Calcula la correlación entre todos los pares de genes.
cor(matriz_genes)->correlacion_mat

#Construye una red de coexpresión utilizando un umbral de correlación \> 0.8.\
which(correlacion_mat > 0.8)

#se le tiene que poner nrow y el otro repetido pq si no no lo carga
matriz_grafo <- matrix((correlacion_mat > 0.8 ), nrow = nrow(correlacion_mat), ncol =ncol(correlacion_mat))
as.integer(matriz_grafo) #para que me de true false a todos los que son mayores de 0.8

graph_from_adjacency_matrix(matriz_grafo)->intento1 #si funciono

#Calcula la distribución de grados.\
degree(intento1)

#Identifica si hay módulos o agrupamientos de genes altamente correlacionados.\
cluster_infomap(intento1)->cluster4
plot(cluster4, intento1, main = "cluster_infomap")

cluster_optimal(intento1)->cluster5
plot(cluster5, intento1, main = "cluster_optimal")

cluster_edge_betweenness(intento1)->cluster6
plot(cluster6, intento1, main = "CLUSTER EDGE BETWEENNESS")

#se forman grupos de 3 nodos

#Visualiza la red y discute qué tipo de topología tiene.
plot(intento1)
#le falta conexion a la red ya que al ser una matriz de correlacion solo lo maneja por pares 
#no todos los nodos tuvieron una correlacion mayor que 0.8