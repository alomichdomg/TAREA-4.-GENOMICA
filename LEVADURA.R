###LEVADURA###
#A partir de la red de interacción proteína-proteína (PPI) de la levadura que se encuentra 
#en la bilbioteca
library(igraph)
install.packages("igraphdata")
library(igraphdata)
library(poweRlaw)
library(tidyverse)
data(yeast)
upgrade_graph(yeast)->levadura

#Encuentre qué tipo de distribución de conectividades tiene. 
  #Haz un ajuste en log-log para ver que tipo de distribución podría ser.
grados_nodo <- degree(levadura)
hist(grados_nodo, breaks=10, col='skyblue', main='Grado en LEVADURA')

# Crear modelo
m <- displ$new(grados_nodo)

# Estimar xmin
est_xmin <- estimate_xmin(m)
m$setXmin(est_xmin)

# Estimar y fijar los parámetros de la ley de potencia
m$setPars(estimate_pars(m))

# Ahora sí puedes graficar
plot(m)
lines(m, col = "orange")

#Encuentra las diez proteínas más conectadas.
sort(degree(levadura, mode = "total"), decreasing = TRUE)->proteinas
proteinas[1:10]

#Calcula el diámetro y promedio de las distancias
diameter(levadura)
#=15
mean_distance(levadura)
#=5.095629

#Crea una función que, a partir de eliminar al azar un noodo de la red genere el 
  #promedio d elas distancias después de eliminar $n=1,2,3,\ldots, 100$ nodos al azar


#Crea una función que elimine las proteínas más conectadas y calcule el promedio de 
  #las distancias cad vez que se remueve un nodo.



#Calcula el proemdio del coeficiente de clusterización.
transitivity(levadura, type = "local")->levaduracluster
print(levaduracluster)

transitivity(levadura, type = "average")->levaduracluster1
levaduracluster1 #=0.3870165

which(levaduracluster  >= levaduracluster1)

  #¿Hay proteínas que tengan un coeficiente de clusterización de 1? Eso qué significa.
#esto significaria que todos los nodos a los que esta proteina esta conectada estan conectados
#entre si, esto se debe a que en un organismo una misma proteina es necesaria para 
#la regulacion de otra proteina, ademas si se trata de una via de señalizacion
#es importante que estas proteinas interactuen entre si
