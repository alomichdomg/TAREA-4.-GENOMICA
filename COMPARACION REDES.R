###6.  **Comparación de redes**###
#Construye dos redes:
  
#Una red aleatoria tipo Erdos-Rényi.
red1 <- sample_gnp(100, p = 0.5)

#Una red tipo "scale-free" usando el modelo Barabási–Albert.
red2<-sample_pa(100 ,directed = FALSE)
par(mfrow = c(1, 2))
plot(red1, main = 'Red Aleatoria (ER)', vertex.size=5, vertex.label=NA)
plot(red2, main = 'Red Power-law (BA)', vertex.size=5, vertex.label=NA)

#Para ambas redes:
source("FUNCION.R")
calculo_total(red1)
calculo_total(red2)
#Compara su grado promedio
#RED1:
#=49.54

#RED2:
#=1.98 

#distribución de grados
degree_distribution(red1)->degreed
hist(degreed, , col="purple", main="Histograma del grado red ER")
#mas variado, quitan nodos que son importantes.

par(mfrow = c(1, 2))
degree_distribution(red2)->degreed1
hist(degreed1, , col="orange", main="Histograma del grado BA")
#mas concentrados el degree

#coeficiente de clusterización 
#RED1
transitivity(red1, type = "local")->cluster_1
print(cluster_1)
#varian ya que en la red hay ciertos nodos que sus vecinos estan coenctados entre si
#esto nos indica una fuerte relacio, la red necesita de la presencia de otros nodos, como
#redes de proteinas y cascadas de señalizacion donde se necesita la interraccion de todos
#los elementos. 

#RED2:
# 0 porque no hay ningun nodo conectado en los vecions
#en redes biologicas esto puede ser una red trofica, donde depredador se come a presa especifica
#que mantiene siempre a las mismas presas( se toma la red que solo es depredador-unica presa)

#diámetro.
#RED1= 2 
#a pesar de ser una red larga esta más conectada por las interracciones que se encesitan para
#que la red se mantenga estable.

#RED2=12 --- red mas separada y fragmentada
#Con la analogia de las presas; los extremos de la red (presas) no interactuan con otras presas. 
#en este tipo de redes la perdida de un nodo representa la perdida de todas las conexiones y nodos
#que salen de este nodo. 
