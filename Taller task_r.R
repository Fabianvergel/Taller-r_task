# Elaborado por: Fabian Vergel Ojeda
# Colaboradores:
# Fecha de elaboracion: 
# Ultima modificacion: 


# 1. intial configuration
rm(list = ls())
pacman::p_load(tidyverse,reshape2,readxl)

# 2.Importar bases de datos 
## 2.1 base de datos 2019

caractgen_cabe_data =readRDS(file = "data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
caractgen_cabe_data =data.frame(caractgen_cabe_data)
colnames(caractgen_cabe_data)
caractgen_cabe_data2 = dplyr::select(caractgen_cabe_data , directorio , `secuencia_p` , orden , P6020  , P6040 , P6050 , ESC , mes , dpto , fex_c_2011)
colnames(caractgen_cabe_data2) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'P6020' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011')

desoc_data =readRDS(file ="data/input/2019/Cabecera - Desocupados.rds")
colnames(desoc_data)
desoc_data =data.frame(desoc_data)
desoc_data2 = dplyr::select(desoc_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)
colnames(desoc_data2) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

fuertrab_data =readRDS(file = "data/input/2019/Cabecera - Fuerza de trabajo.rds")
fuertrab_data =data.frame(fuertrab_data)
colnames(fuertrab_data)
fuertrab_data2 = dplyr::select(fuertrab_data , directorio , `secuencia_p` , orden , Mes , DPTO , Fex_c_2011)
colnames(fuertrab_data2) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

inac_data =readRDS(file = "data/input/2019/Cabecera - Inactivos.rds")
inac_data =data.frame(inac_data)
inac_data = mutate(inac_data , act = ifelse(test = nchar(ini) == 2 , yes = 1 , no = 0)) 
colnames(inac_data)
inac_data2 = dplyr::select(inac_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)
colnames(inac_data2) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

ocu_data =readRDS(file = "data/input/2019/Cabecera - Ocupados.rds")
ocu_data =data.frame(ocu_data)
colnames(ocu_data)
ocu_data2 = dplyr::select(ocu_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)
colnames(ocu_data2) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

caractgen_caberest_data =readRDS(file = "data/input/2019/Resto - Caracteristicas generales (Personas).rds")
colnames(caractgen_caberest_data)
caractgen_caberest_data = data.frame(caractgen_caberest_data)
caractgen_caberest_data2 = dplyr::select(caractgen_caberest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , MES , ESC  , DPTO , fex_c_2011)
colnames(caractgen_caberest_data2) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'MES' , 'ESC ' , 'DPTO' , 'fex_c_2011')

desoc_rest_data = readRDS(file = "data/input/2019/Resto - Desocupados.rds")
colnames(desoc_rest_data)
desoc_rest_data =data.frame(desoc_rest_data)
desoc_rest_data2 = dplyr::select(desoc_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  
colnames(desoc_rest_data) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

fuertrab_rest_data =readRDS(file ="data/input/2019/Resto - Fuerza de trabajo.rds")
fuertrab_rest_data =data.frame(Fuertrab_rest_data)
colnames(Fuertrab_rest_data)
fuertrab_rest_data2 = dplyr::select(Fuertrab_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(fuertrab_rest_data2) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

inac_rest_data =readRDS(file ="data/input/2019/Resto - Inactivos.rds")
inac_rest_data =data.frame(inac_rest_data)
colnames(inac_rest_data)
inac_rest_data2 = dplyr::select(inac_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(inac_rest_data2) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

ocu_rest_data =readRDS(file ="data/input/2019/Resto - Ocupados.rds")
ocu_rest_data =data.frame(ocu_rest_data)
colnames(ocu_rest_data)
ocu_rest_data2 = dplyr::select(ocu_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011) 
colnames(ocu_rest_data2) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011')



## 2.2 base de datos 2020

caractgen_cabe_data3 =read.csv2(file = 'data/input/2020/Cabecera - Caracteristicas generales (Personas).csv' ,sep = ";", header = T, stringsAsFactors = F) #
colnames(caractgen_cabe_data3)
caractgen_cabe_data3 = data.frame(caractgen_cabe_data3)
caractgen_cabe_data4 = dplyr::select(caractgen_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , ESC , MES , DPTO , fex_c_2011)
colnames(caractgen_cabe_data4) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011')

desoc_data3 =read.csv2(file ='data/input/2020/Cabecera - Desocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #
colnames(desoc_data3)
desoc_data3 =data.frame(desoc_data3)
desoc_data4 = dplyr::select(desoc_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  
colnames(desoc_data4) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

fuertrab_data3 =read.csv2(file ='data/input/2020/Cabecera - Fuerza de trabajo.csv' ,sep = ";", header = T, stringsAsFactors = F) #
fuertrab_data3 =data.frame(fuertrab_data3)
colnames(fuertrab_data3)
fuertrab_data4 = dplyr::select(fuertrab_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(fuertrab_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

inac_data3 =read.csv2(file ='data/input/2020/Cabecera - Inactivos.csv' ,sep = ";", header = T, stringsAsFactors = F) #
inac_data3 =data.frame(inac_data3)
colnames(inac_data3)
inac_data4 = dplyr::select(inac_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(inac_data4) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

ocu_data3 =read.csv2(file ='data/input/2020/Cabecera - Ocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #
ocu_data1 =data.frame(ocu_data3)
colnames(ocu_data3)
ocu_data4 = dplyr::select(ocu_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011) 
colnames(ocu_data4) =c('Directorio' , 'Secuencia_p' , 'Orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011')

caractgen_caberest_data3 =read.csv2(file ='data/input/2020/Resto - Caracteristicas generales (Personas).csv' ,sep = ";", header = T, stringsAsFactors = F) #
colnames(caractgen_caberest_data3)
caractgen_caberest_data3 = data.frame(caractgen_caberest_data3)
caractgen_caberest_data4 = dplyr::select(caractgen_caberest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , ESC , MES , DPTO , fex_c_2011)
colnames(caractgen_caberest_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011')

desoc_rest_data3 = read.csv2(file ='data/input/2020/Resto - Desocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #
colnames(desoc_rest_data3)
desoc_rest_data3 =data.frame(desoc_rest_data3)
desoc_rest_data4 = dplyr::select(desoc_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  
colnames(desoc_rest_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

Fuertrab_rest_data3 =read.csv2(file ='data/input/2020/Resto - Fuerza de trabajo.csv' ,sep = ";", header = T, stringsAsFactors = F) #)
Fuertrab_rest_data3 =data.frame(Fuertrab_rest_data3)
colnames(Fuertrab_rest_data3)
Fuertrab_rest_data4 = dplyr::select(Fuertrab_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(Fuertrab_rest_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

inac_rest_data3 =read.csv2(file ='data/input/2020/Resto - Inactivos.csv' ,sep = ";", header = T, stringsAsFactors = F) #)
inac_rest_data3 =data.frame(inac_rest_data3)
colnames(inac_rest_data3)
inac_rest_data4 = dplyr::select(inac_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(inac_rest_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'MES' , 'DPTO' , 'fex_c_2011')

ocu_rest_data3 =read.csv2(file ='data/input/2020/Resto - Ocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #)
ocu_rest_data3 =data.frame(ocu_rest_data3)
colnames(ocu_rest_data3)
ocu_rest_data4 = dplyr::select(ocu_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011) 
colnames(ocu_rest_data4) =c('Directorio' ,'Secuencia_p' , 'Orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011')


# 3.1 Crear listas
lista_1=list() 
lista_1=list(caractgen_cabe_data2, desoc_data2, fuertrab_data2, inac_data2, ocu_data2, caractgen_caberest_data2, 
             desoc_rest_data, fuertrab_rest_data2, inac_rest_data2, ocu_rest_data2)
list_2=list(caractgen_cabe_data4, desoc_data4, fuertrab_data4, inac_data4, ocu_data4, caractgen_caberest_data4,
            desoc_rest_data4, Fuertrab_rest_data4, inac_rest_data4, ocu_rest_data4)











