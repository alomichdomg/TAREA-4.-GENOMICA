###5.  **Red de coexpresión simulada**###

#Simula una matriz de expresión con 20 genes en 6 condiciones diferentes.
matriz_genes <- matrix(c(sample(1:120, 20)), nrow = 6, ncol = 20)

# Calcula la correlación entre todos los pares de genes.
cor(matriz_genes)->correlacion_mat

#Construye una red de coexpresión utilizando un umbral de correlación \> 0.8.\
matriz_grafo <- matrix((correlacion_mat > 0.8), nrow = (correlacion_mat), ncol =(correlacion_mat))


graph_from_adjacency_matrix()

-   Calcula la distribución de grados.\

-   Identifica si hay módulos o agrupamientos de genes altamente correlacionados.\
-   Visualiza la red y discute qué tipo de topología tiene.
