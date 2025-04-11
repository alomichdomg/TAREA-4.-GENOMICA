###4.  **Redes biológicas**####
library(igraph)

#Cargue y genere una gráfica en `igraph`.
red_biologica <- read.table("bn-mouse_visual-cortex_1.edges") #es una tabla

red_bio<- graph_from_data_frame(red_biologica)

plot(red_bio, vertex.size=12,vertex.size=5,
     edge.arrow.size=0.25,layout=layout_nicely,vertex.size.label=0.25)

#Explica que representam los nodos y las conectividades.
#Los bordes representan tractos de fibras que conectan un vértice con otro.
#red cerebral de un raton.
  
#Genera la gráfica con todos los layouts disponibles.

layout_randomly(red_bio)->layout_1
plot(red_bio, layout = layout_1, main = "Coloca los vértices de forma totalmente aleatoria")


layout_in_circle(red_bio)	->l2
plot(red_bio, layout = l2, 
     main = "Disposición determinista que coloca los vértices en un círculo")


layout_on_sphere(red_bio)->l3
plot(red_bio, layout = l3, main = "coloca los vértices superficie de una esfera")

layout_with_drl(red_bio)	-> l4
plot(red_bio, layout = l4, main = "El algoritmo DRL (Distributed Recursive Layout) 
     para grafos grandes")


layout_with_fr(red_bio)	-> l5
plot(red_bio, layout = l5, main = "#El algoritmo dirigido Fruchterman-Reingold")


layout<- layout_with_kk(red_bio)	
plot(red_bio, layout = layout, main = "Red Kamada-Kawai")


layout_with_lgl(red_bio)->l6	
plot(red_bio, layout = l6, main = "El algoritmo LGL (Large Graph Layout) 
     para grafos grandes")


layout_as_tree(red_bio)->l7
plot(red_bio, layout = l7, main = "Diseño de árbol de Reingold-Tilford, útil para grafos 
     (casi) arbóreos")

layout_nicely(red_bio)->la
plot(red_bio, layout = la, main = "Algoritmo de diseño que elige automáticamente 
     uno de los otros algoritmos en función de determinadas propiedades del grafo")

#Grafica la red con al menos tres medidas de centralidad.

  #2.- Centralidad de intermediación
#cuales son los nodos importantes basado en su importancia en el flujo de la red
#utiliza las rutas mas cortas de la red
#cuanto mayor sea su intermediacion mayor sera su importancia para el flujo de la red
#en este caso todos los nodos tiene el mismo tamaño asi que ningun nodo es mas importante
#que otro
betweenness(red_bio)
V(red_bio)$betweenness <- betweenness(red_bio)

plot(red_bio, 
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(red_bio)$betweenness) # sized by betweenness

  #3.- Centralidad de cercania
#indica la rapidez con la que fluye el flujo de una red, en este caso los nodos mayores
#son necesarios para el flujo correcto
closeness(red_bio)
V(red_bio)$closeness <- closeness(red_bio) #muchas NA

V(red_bio)$closeness[is.na(V(red_bio)$closeness)] <- 0 #quitar NA y ahora son 0

plot(red_bio,
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(red_bio)$closeness/max(V(red_bio)$closeness) * 20)

#4.- Centralidad del vector propio.
#el nodo mas importante basado en sus conexiones totales.
#en este caso el nodo 9 es el mas importante por sus coenxiones.

eigen_centrality(red_bio)$red_bio
V(red_bio)$eigenvector <- eigen_centrality(red_bio)$vector

plot(red_bio,
     vertex.label.cex = .6, 
     vertex.label.color = "black", 
     vertex.size = V(red_bio)$eigenvector/max(V(red_bio)$eigenvector) * 20)

#¿Qué tan densa es la red?
edge_density(red_bio)
#=0.05418719 poca densidad de la red: baja conectividad de la red.

#Clusteriza la red con al menos tres métodos de clusterización. 
  #Gráfica la red con esos métodos.
cluster_infomap(red_bio)->cluster1
plot(cluster1, red_bio, main = "cluster_infomap")

cluster_optimal(red_bio)->cluster2
plot(cluster2, red_bio, main = "cluster_optimal")

cluster_edge_betweenness(red_bio)->cluster3
plot(cluster3, red_bio, main = "CLUSTER EDGE BETWEENNESS")


#REFERENCIA:https://stackoverflow.com/questions/58350400/how-to-read-in-edges-file-in-r
#https://cran.r-project.org/web/packages/igraph/vignettes/igraph_ES.html
################################################################################