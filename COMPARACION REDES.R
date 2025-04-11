###6.  **Comparación de redes**###
#Construye dos redes:
  
#Una red aleatoria tipo Erdos-Rényi.
red1 <- sample_gnp(100, p = 0.5)

#Una red tipo "scale-free" usando el modelo Barabási–Albert.
red2<-sample_pa(100 ,directed = FALSE)
  
#Para ambas redes:
source("FUNCION.R")
calculo_total(red1)
#Compara su grado promedio


#distribución de grados
degree_distribution(red1)->degreed
hist(degreed, , col="purple", main="Histograma del grado red ER")

degree_distribution(red2)->degreed1
hist(degreed1, , col="orange", main="Histograma del grado BA")

#coeficiente de clusterización 

#diámetro.\
-   Interpreta las diferencias en el contexto de redes biológicas.
