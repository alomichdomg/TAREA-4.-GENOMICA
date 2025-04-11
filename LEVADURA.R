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
levadura_mod <- levadura

levadura_funcion<- function(grafo){
levadura_mod1 <- grafo
promedio_distancias <- c()

#antes era un ciclo while que no sirvio :/
for (contador in 1:100) {
  
  if (vcount(levadura_mod1) == 0) { #tiene que ser mayor que 100 siempre.
    print("NO")
  }
  # TOMAR DE UNO EN UNO
  nodo_eliminado <- sample(1:vcount(levadura_mod1), 1)
  
  #QUE ELIMINE DE UNO-UNO
  levadura_nueva <- delete_vertices(levadura_mod1, nodo_eliminado)
  
  print(vcount(levadura_nueva)) #cuantos nodos va teniendo la levadura nueva
  
  promedio_distancias_unica<- mean_distance(levadura_nueva) #cuenta solo la primera eliminada :/
  #promedio_distancias <- promedio_distancias_unica#---NOOO
    #se le agrega a la nueva distancia, para que aparezcan 
  promedio_distancias <- c(promedio_distancias, promedio_distancias_unica)
  levadura_mod1 <- levadura_nueva
  }
return(promedio_distancias)
}

levadura_funcion(levadura_mod) #
levadura_funcion(red) #-- sale el NO 


#Crea una función que elimine las proteínas más conectadas y calcule el promedio de 
  #las distancias cad vez que se remueve un nodo.

levadura_conectadas <- function(grafo){
  sort(degree(levadura, mode = "total"), decreasing = TRUE)->proteinas_conectadas
  proteinas_conectadas[1]

}

levadura_conectadas <- function(grafo) {
  levadura_mod <- grafo
    proteinas_conectadas <- sort(degree(levadura_mod, mode = "total"), decreasing = TRUE)
  
  promedio_distancias <- c()
  for (i in 1:10) {
    # Nodo a eliminar
    nodo_distancias <- proteinas_conectadas[i]
  
    eliminados_nodos <- delete_vertices(levadura_mod, nodo_distancias)
    
        promedio_distancias_unica<- mean_distance(eliminados_nodos) #cuenta solo la primera eliminada :/
      promedio_distancias <- c(promedio_distancias, promedio_distancias_unica)
    levadura_mod <- eliminados_nodos
    

  } #del ciclo for
  
  # Devolver los promedios de la mean_distances()
  return(promedio_distancias)
}

levadura_conectadas(levadura)

#si se quitan las proteinas con mas conexiones se altera la estructura de la red
#esto puede ocasionar perdida de conexiones importantes y el funcionamiento de la
#levadura.

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
