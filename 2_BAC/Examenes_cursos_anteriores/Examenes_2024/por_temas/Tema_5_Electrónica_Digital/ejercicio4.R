library(dplyr)
datos = read.csv2("~/Escritorio/Enlace hacia 2_BAC/Examenes_2024/por_temas/Tema_5_Electrónica_Digital/Resolución_examen.csv"
                  ,sep=","
                  ,header=TRUE)

datos2 <- datos[, c("X", "PA", "PC", "FA", "FC", "MA", "MC")]
datos2 <- datos2 %>% arrange(PA, PC)

datos3 <- datos[, c("X", "PA", "FA", "PC", "FC", "MA", "MC")]
datos3 <- datos3 %>% arrange(PA, FA,PC,FC)

write.csv2(datos2,"resolucion_csv_pa_pc_fa_fc.csv")