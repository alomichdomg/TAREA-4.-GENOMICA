###4.  **Redes biológicas**####
library(igraph)

#Cargue y genere una gráfica en `igraph`.
red_biologica <- read.table("bn-mouse_visual-cortex_1.edges") #es una tabla

red_bio<- graph_from_data_frame(red_biologica)

plot(red_bio, vertex.size=12,vertex.size=5,
     edge.arrow.size=0.25,layout=layout_nicely,vertex.size.label=0.25)

#Explica que representam los nodos y las conectividades.

  
Genera la gráfica con todos los layouts disponibles.

#Grafica la red con al menos tres medidas de centralidad.
-   ¿Qué tan densa es la red?
  -   Clusteriza la red con al menos tres métodos de clusterización. Gráfica la red con esos métodos.

Explica tus resultados.

#REFERENCIA:https://stackoverflow.com/questions/58350400/how-to-read-in-edges-file-in-r
################################################################################