# Elaborado por: Fabian Vergel Ojeda
# Taller B
# # R version 4.1.1 (2021-08-10)


# 1. intial configuration
rm(list = ls())
pacman::p_load(tidyverse,reshape2,readxl)

# 2.Importar bases de datos 
## 2.1 base de datos 2019

caractgen_cabe_data =readRDS(file = "data/input/2019/Cabecera - Caracteristicas generales (Personas).rds") #Cargar base de datos en formato RDS
caractgen_cabe_data =data.frame(caractgen_cabe_data)
colnames(caractgen_cabe_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
caractgen_cabe_data2 = dplyr::select(caractgen_cabe_data , directorio , `secuencia_p` , orden , P6020  , P6040 , P6050 , ESC , mes , dpto , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(caractgen_cabe_data2) =c('directorio' , 'secuencia_p' , 'orden' , 'P6020' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

desoc_cabe_data =readRDS(file ="data/input/2019/Cabecera - Desocupados.rds") #Cargar base de datos en formate RDS
colnames(desoc_cabe_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
desoc_cabe_data =data.frame(desoc_cabe_data)
desoc_cabe_data2 = dplyr::select(desoc_cabe_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(desoc_cabe_data2) =c('directorio' , 'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

fuertrab_cabe_data =readRDS(file = "data/input/2019/Cabecera - Fuerza de trabajo.rds") #Cargar base de datos en formato RDS
fuertrab_cabe_data =data.frame(fuertrab_cabe_data)
colnames(fuertrab_cabe_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
fuertrab_cabe_data2 = dplyr::select(fuertrab_cabe_data , directorio , `secuencia_p` , orden , Mes , DPTO , Fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(fuertrab_cabe_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

inac_cabe_data =readRDS(file = "data/input/2019/Cabecera - Inactivos.rds") #Cargar base de datos en formato RDS
inac_cabe_data =data.frame(inac_cabe_data)
colnames(inac_cabe_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
inac_cabe_data2 = dplyr::select(inac_cabe_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(inac_cabe_data2) =c('directorio' , 'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

ocu_cabe_data =readRDS(file = "data/input/2019/Cabecera - Ocupados.rds") #Cargar base de datos en formato RDS
ocu_cabe_data =data.frame(ocu_cabe_data)
colnames(ocu_cabe_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
ocu_cabe_data2 = dplyr::select(ocu_cabe_data , directorio , `secuencia_p` , orden , mes , dpto , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(ocu_cabe_data2) =c('directorio' , 'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

caractgen_rest_data =readRDS(file = "data/input/2019/Resto - Caracteristicas generales (Personas).rds") #Cargar base de datos en formato RDS
colnames(caractgen_rest_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
caractgen_rest_data = data.frame(caractgen_rest_data)
caractgen_rest_data2 = dplyr::select(caractgen_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , MES , ESC  , DPTO , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(caractgen_rest_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'MES' , 'ESC ' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

desoc_rest_data = readRDS(file = "data/input/2019/Resto - Desocupados.rds") #Cargar base de datos en formato RDS
colnames(desoc_rest_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
desoc_rest_data =data.frame(desoc_rest_data)
desoc_rest_data2 = dplyr::select(desoc_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe  
colnames(desoc_rest_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

fuertrab_rest_data =readRDS(file ="data/input/2019/Resto - Fuerza de trabajo.rds") #Cargar base de datos en formato RDS
fuertrab_rest_data =data.frame(fuertrab_rest_data)
colnames(fuertrab_rest_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
fuertrab_rest_data2 = dplyr::select(fuertrab_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe 
colnames(fuertrab_rest_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

inac_rest_data =readRDS(file ="data/input/2019/Resto - Inactivos.rds") #Cargar base de datos en formato RDS
inac_rest_data =data.frame(inac_rest_data)
colnames(inac_rest_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
inac_rest_data2 = dplyr::select(inac_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe 
colnames(inac_rest_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

ocu_rest_data =readRDS(file ="data/input/2019/Resto - Ocupados.rds")#Cargar base de datos en formato RDS
ocu_rest_data =data.frame(ocu_rest_data)
colnames(ocu_rest_data) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
ocu_rest_data2 = dplyr::select(ocu_rest_data , DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011)  #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(ocu_rest_data2) =c('directorio' ,'secuencia_p' , 'orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'



## 2.2 base de datos 2020

caractgen_cabe_data3 =read.csv2(file = 'data/input/2020/Cabecera - Caracteristicas generales (Personas).csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
colnames(caractgen_cabe_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
caractgen_cabe_data3 = data.frame(caractgen_cabe_data3)
caractgen_cabe_data4 = dplyr::select(caractgen_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , ESC , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(caractgen_cabe_data4) =c('directorio' , 'secuencia_p' , 'orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

desoc_cabe_data3 =read.csv2(file ='data/input/2020/Cabecera - Desocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
colnames(desoc_cabe_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
desoc_cabe_data3 =data.frame(desoc_cabe_data3)
desoc_cabe_data4 = dplyr::select(desoc_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe  
colnames(desoc_cabe_data4) =c('directorio' , 'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

fuertrab_cabe_data3 =read.csv2(file ='data/input/2020/Cabecera - Fuerza de trabajo.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
fuertrab_cabe_data3 =data.frame(fuertrab_cabe_data3)
colnames(fuertrab_cabe_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
fuertrab_cabe_data4 = dplyr::select(fuertrab_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(fuertrab_cabe_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

inac_cabe_data3 =read.csv2(file ='data/input/2020/Cabecera - Inactivos.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
inac_cabe_data3 = mutate(inac_cabe_data3 , inac_cabe_vari_19 = ifelse(test = nchar(P7454) == 2 , yes = 2 , no = 1)) #Las personas inactivas estaran representadas con el "0"
inac_cabe_data3 =data.frame(inac_cabe_data3)
inac_cabe_data4 = mutate(inac_cabe_data4, inactivos = ifelse(test = nchart(P7430)==2 , yes = 2 , no = 1)) 
colnames(inac_cabe_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
inac_cabe_data4 = dplyr::select(inac_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe 
colnames(inac_cabe_data4) =c('directorio' , 'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'


ocu_cabe_data3 =read.csv2(file ='data/input/2020/Cabecera - Ocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
names(ocu_cabe_data3)
ocu_cabe_data1 =data.frame(ocu_cabe_data3)
colnames(ocu_cabe_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
ocu_cabe_data4 = dplyr::select(ocu_cabe_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe 
colnames(ocu_cabe_data4) =c('directorio' , 'secuencia_p' , 'orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'
ocu_cabe_data4 = mutate(ocu_cabe_data4, ocupados = ifelse(test = nchart(P6440)))


caractgen_rest_data3 =read.csv2(file ='data/input/2020/Resto - Caracteristicas generales (Personas).csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
colnames(caractgen_rest_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
caractgen_rest_data3 = data.frame(caractgen_rest_data3)
caractgen_rest_data4 = dplyr::select(caractgen_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6020 , P6030S1 , P6040 , P6050 , ESC , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(caractgen_rest_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'P6020' , 'P6030S1' , 'P6040' , 'P6050' , 'ESC' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

desoc_rest_data3 = read.csv2(file ='data/input/2020/Resto - Desocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
colnames(desoc_rest_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
desoc_rest_data3 =data.frame(desoc_rest_data3)
desoc_rest_data4 = dplyr::select(desoc_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011)  
colnames(desoc_rest_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

fuertrab_rest_data3 =read.csv2(file ='data/input/2020/Resto - Fuerza de trabajo.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
fuertrab_rest_data3 =data.frame(fuertrab_rest_data3)
colnames(fuertrab_rest_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
fuertrab_rest_data4 = dplyr::select(fuertrab_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(fuertrab_rest_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

inac_rest_data3 =read.csv2(file ='data/input/2020/Resto - Inactivos.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
inac_rest_data3 =data.frame(inac_rest_data3)
colnames(inac_rest_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
inac_rest_data4 = dplyr::select(inac_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , MES , DPTO , fex_c_2011) 
colnames(inac_rest_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'MES' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'

ocu_rest_data3 =read.csv2(file ='data/input/2020/Resto - Ocupados.csv' ,sep = ";", header = T, stringsAsFactors = F) #Cargar base de datos en formato CSV
ocu_rest_data3 =data.frame(ocu_rest_data3)
colnames(ocu_rest_data3) #Visualizar las variables para poder cambiar sus nombres con la funcion colnames
ocu_rest_data4 = dplyr::select(ocu_rest_data3 , ï..DIRECTORIO , `SECUENCIA_P` , ORDEN , P6440 , P6450 , P6920 , MES , INGLABO , DPTO , fex_c_2011) #Crear una nueva un nuevo modulo del dataframe existente con las variables solicitadas, mediante select la tomo y obtengo mi nuevo dataframe
colnames(ocu_rest_data4) =c('directorio' ,'secuencia_p' , 'orden' , 'P6440' , 'P6450' , 'P6920' , 'MES' , 'INGLABO' , 'DPTO' , 'fex_c_2011') #Procedo a cambiar el nombre de las variables solicitadas, como es el caso de 'secuencia_p'


## 2.3 Crear listas
lista_1=list() #Crear la lista vacia para luego incluir los dtf
lista_1=list(caractgen_cabe_data2, desoc_cabe_data2, fuertrab_cabe_data2, inac_cabe_data2, ocu_cabe_data2, caractgen_rest_data2, 
             desoc_rest_data2, fuertrab_rest_data2, inac_rest_data2, ocu_rest_data2)
list_2=list(caractgen_cabe_data4, desoc_cabe_data4, fuertrab_cabe_data4, inac_cabe_data4, ocu_cabe_data4, caractgen_rest_data4,
            desoc_rest_data4, fuertrab_rest_data4, inac_rest_data4, ocu_rest_data4)


# 3. Unir datos

#Crear base de datos cabecera
colnames(caractgen_cabe_data2)
duplicated(caractgen_cabe_data2[,c('directorio')]) %>% table() # ¿Existe algun duplicado por directorio? claro que si, Hay 17803 viviendas unicas(Porque directorio es el identificador vivienda), es decir, este identificador de directorio es unico para 17803
duplicated(caractgen_cabe_data2[,c('directorio','secuencia_p')]) %>% table() # ¿Por directorio y secuencia hay duplicados? claramente si, hay 18049 hogares, porque secuencia_p es el identificador hogar
duplicated(caractgen_cabe_data2[,c('directorio','secuencia_p','orden')]) %>% table() # el indentificador orden me muestra el orden dentro del hogar

cabecera = full_join(x = caractgen_cabe_data2 , y = desoc_cabe_data2 , by = c('directorio','secuencia_p','orden')) #Unir los dtf mediante los ID unicos
cabecera = full_join(x = cabecera ,  y = fuertrab_cabe_data2 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos
cabecera = full_join(x = cabecera ,  y = inac_cabe_data2 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos
cabecera = full_join(x = cabecera ,  y = ocu_cabe_data2 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos
cabecera = full_join(x = cabecera ,  y = caractgen_cabe_data4 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos 
cabecera = full_join(x = cabecera ,  y = desoc_cabe_data4 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos
cabecera = full_join(x = cabecera ,  y = fuertrab_cabe_data4 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos 
cabecera = full_join(x = cabecera ,  y = inac_cabe_data4 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos
cabecera = full_join(x = cabecera ,  y = ocu_cabe_data4 , by = c('directorio','secuencia_p','orden')) #Tomar el nuevo dtf llamado cabecera y a este incluirle la siguiente base de datos 



#Crear base de datos resto
colnames(caractgen_rest_data2)
duplicated(caractgen_rest_data2[,c('directorio')]) %>% table() # ¿Existe algun duplicado por directorio? claro que si, Hay 17803 viviendas unicas(Porque directorio es el identificador vivienda), es decir, este identificador de directorio es unico para 17803
duplicated(caractgen_rest_data2[,c('directorio','secuencia_p')]) %>% table() # ¿Por directorio y secuencia hay duplicados? claramente si, hay 18049 hogares, porque secuencia_p es el identificador hogar
duplicated(caractgen_cabe_data2[,c('directorio','secuencia_p','orden')]) %>% table() # el indentificador orden me muestra el orden dentro del hogar

resto = full_join(x = caractgen_rest_data4 , y = desoc_rest_data2 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = fuertrab_rest_data2 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = inac_rest_data2 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = ocu_rest_data2 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = caractgen_rest_data4 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = desoc_rest_data4 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = fuertrab_rest_data4 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = inac_rest_data4 , by = c('directorio','secuencia_p','orden')) 
resto = full_join(x = resto ,  y = ocu_rest_data4 , by = c('directorio','secuencia_p','orden')) 



4. # Una base nacional

nacional = plyr::rbind.fill(cabecera,resto) #Agrega columnas que no están presentes en todas las entradas, completando las que hacen falta y el las vacias las deja como NA



