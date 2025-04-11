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
calculo_total(red2)
#Compara su grado promedio
degree(red1, mode = "")


#distribución de grados
degree_distribution(red1)->degreed
hist(degreed, , col="purple", main="Histograma del grado red ER")

par(mfrow = c(1, 2))
degree_distribution(red2)->degreed1
hist(degreed1, , col="orange", main="Histograma del grado BA")

#coeficiente de clusterización 


#diámetro.
#RED1= 2 
#RED2=12 ---

-   Interpreta las diferencias en el contexto de redes biológicas.
