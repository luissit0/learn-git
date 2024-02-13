curso comandos de git:
debo dar credito de donde aprendi en youtube: recopilando de diversos maestros:
(de dalto)https://www.youtube.com/watch?v=9ZJ-K-zk_Go&list=PLGSMsQrrJyqTpn_giLM9hlBj0SzwfpYcq&index=34
(de estefania)https://www.youtube.com/watch?v=mBYSUUnMt9M&list=PLGSMsQrrJyqTpn_giLM9hlBj0SzwfpYcq&index=6
(de ivanlynch) https://www.youtube.com/watch?v=-cXA74bbIYM&list=PLjJXcuN5Zxq0xfMFlH0oq58Ka70__uLDZ&index=10


#para crear un repositorio git es el siguiente comandos
git init # esto inicialisara un repositorio git en donde se encuentre actualmente


git config --list # ve todo lo que git tiene para configurar
#luego para crear usuario y correo asociado a ese repositorio
git config user.name "nombre del usuario"
#en caso que queira crear para todo lso repositorio el mismo 
# nombre de usuario
git config --global user.name hola

# similar aplicar para el email
git config [--global] [user.email] "con comillas pemite espacios vacios"

#esto es para compatibilidad en caso de pasar de linux  o mac o unix etc a windows el salto de epacio es diferente windows \r/n linux es:\n 
git config --global core.autocrlf true

# en el caso que queiras cambiar el nombre de tu rama princial 
# por ejemplo de master a main
git config --global init.defaultBranch "main"

#el commando git log muestra las modificaciones commits cambiado y su ramificacion ultimo con repecto anterior
git status
#  aparte de*/
 man git # tambien puedes buscar mas especifico de man git con*/
 man git status -s # te saldran dentro de git la opcion status y dentro con la opcion que hace eso y tambien el -s que es 
 (saca en formato corto que tipi de estado de auput esta un archivo si esta modificado o no)*/

#para comensar a hace seguimiento a tus archivos etc se pone
git add "tu archivo"
# si estas seguro que queire agrega todos los cambios al seguimiento desde la rama de carpeta de donde estas puede poner
git add . 

#zona especial de dalto
---
rm [el archivo] #remover archivo
# si haces un */git add "a un archivo que has removido previamente" # git agregara la ultima accion lo que subirar esa accion que remueve ese archivo des stage y asi se puede eliminar archivos de stage
# y si queires recuperar ese archivo del estage es con es siguiente comando:
git restore
---
#para asociar un editor como principal a git en mi terminal parrot por defaul usa nano.
git config --global core.editor "editor --wait" #en caso de que sea para un editor no soportado default de git se pone todo el path del systema de donde esta el editor el ejecutable
# --wait permite esperar a que terminemos de escribir primero en el editor y luego lo asocia

git commit -a #esto salta el archivo directamente  a coomit se salta el git add zona de staging

#hacer un git commit que significa comprometerse oxea pasar lo al estado que puede comprometer al programa
git commit -m "aqui se pone el mensaje decriptivo del cambio que se va comprometer"
#o tambien puede hacer en un editor
git commit
# el git commit compromete todo lo que esta dentro del add asi que procura solo meter lo que queires cambiar de verdad en el add.

# dalto 1:06:41 - Modificar y deshacer Commits
git commit --amend #cambia el mensaje del ultimo commit


#para resetear un commit es el siguiente comando que tiene los siguientes opciones o parametros
git reset --soft HEAD~1
# el paramentro soft significa que es un reseseto suave osea no borra el contenido cambiado solo su historial en el git log lo borra del commit y lo regresa al staged
# y en el parmetro HEAD~1 significa que solo borra el ultimos 1 commit realisado si fuera 2 serian los ultimos 2 commit realisados.

#tambien se puede en ves de HEAD~# poner los iniciales de hash en la posicion que sale de gitlog se resetea hasta ese posicion ejemplo
git reset --soft aa1f4d2        

git reset --mixed HEAD~1 #lo resetea del commite y del staged y lo regresa al comienso la zona de trabajo tiempo real.

# tambien exite la opcion hard por deduccion significaria que tambien elimina el contenido lo quita del commit y del staged y del la sona de trabajo elmina todo y el head sucede igual para especificar que es lo que queire ser retrocedido en el tiempo
git reset --hard HEAD~2 #por ejemplo

# ahora toca aprender a crear un rama en git que genera una linea 
independiente o version paralela de la evolucion del programa*/
git branch "nombre-de-la-nueva-rama" #por convencion se usa - como saparacion entre palabras
#para ver en que rama estoy y que ramas hay
git branch #la version en que estas estara de color verde

# ahora toca saber como moverse de rama en rama se hace con el siguiente comando
git checkout "la-version-de-la-rama-que-deseas-mover-te"

# luego debes de tener cuidado si queire crear otra rama se creara 
otra rama desde la rama de donde estan y generalmente regresan a la
 rama principal si no queiren ningun "flavor".*/
git checkout main 
# tambien se puede usar con
git switch [branch name]

#para crear una rama y de una ves ir a esa rama en el mismo tiempo que se crea agregar el paramentro opcion -b
git checkout -b "version-python"

#ahora toca saber como cambiar el nombre de una rama hay 2 forma de hacer la una es cambiar el nombre en la rama que estas a dentro
git brach -m "version-js" # la version cambiar nombre de la rama dentro del que estas
git branch -m "la version que quiere cambiar" "el nuevo nombre que queire cambiar" #la verion de cambiar nombre sin importar en que rama estes.

# ahora toca aprender como eliminar las ramas y la rama pricipal no se
 puede eliminar el main en este caso que le pusiste como rama pricipal
 del curso-d-git*/
git branch -d version-py # -d significa delete paramentro que activa ese metodo en branch y luego se selecciona la rama que se quiere eliminar

# es para ver la informacion historial y sha(secure hash algorimts)
# solo en mi zsh para salir del git log se tiene que apretar la 
letra q y no se porque esto en tu systema operativo parrot*/
git log 
#para ver los de forma resumida especialemnte cuando hay mayor cantidad de cambios usar
git log --oneline
#con el comando
git log -b #esto permite ver la diferencia que se ha cambiado la lineas anteriores y la de despues y presionando enter se puede ver mas habajo si lo hay

#pra configurar  mas letras para el oneline en caso de que el repositorios sea muy grande o mas chico y es mucho mas probable que se repitan las letras el siguiente comando
git config --global core.abbrev [#numero]

# ahora toca saber como hacer para fusionar ramas
# para fusionar dos ramas, debes de estar en la rama que recibira la fusion. es muy importante.
git merge "texto-expandido" #desde donde estas escribir el merge con el rrama que quiere que se agregea desdes donde estas actualmente.
git branch -d texto-expandido #recuerda borrar la rama que se sumo al main o rama elegida a fusionar si es que es que ya no se nececita.

# hay que saber que hay posibles conflictos con el merge ahora vamos a averiguar de que se trata 
# 
en caso que surja un conflicto y en el edito de codigo elije 
como se ha resolvido luego por git para terminarlos en ves de 
aplastar el boton puedes utilisar el siguiente comando
*/
git merge --continue

git remote #permite ver a donde se conecta?
# si pones
git remote -v #sale el origen de venida con fetch se queda grabada automaticamente despues de usar 
git clone "el repositorio github" # su origen de venida
#y push tambien que seria de salida.

git show [archivo]#muestra toda la info sobre un archivo que ya esta en el commit solo.
 # ahora que hace ? git diff #es para comprar diferencias
git diff -staged #es para comparar la diferencia de lo que esta en el stage lugar de preparado para el commit con el commited el commited aparecera en rojo y la zona que va para ser comiteada o actualisada es la verde.

# y como hago para comparar entre 2 commits de archivos diferentes?
git diff [el hash md5 del archivo del commit] [con el otro hash #md5]
# muestra la comprarcion del contenido de adentro

#pero y si solo queiro comparar los nombres?
git diff --name-only [hash#md5] [hash#md5] 
# ojo esto coje segun la configuracion minima del oneline del hash

#para ver la direrencia solo en la lineas de codigo entre 2 commits
git diff --word-diff [hash#md5] [hash#md5]
# siempre se muestra en orden la primera es del primer archivo y la segunda es del segundo que se ha cambiado
# rojo la primera y a lado verde la segunda en contenido de 
codigo pero antes muestra la diferencias de nombres y inicial de 
hashes*/

git ls-tree -r --name-only [el hash#md5]# opcional
  # el ls-tree hace mirar la estructura en arbol
  # -r ver recursivo contenido de adentro
  # --name-only solo nombres de los archivos y no su contenido u otro
.gitignore #.gitignore archivo donde especifica que archivos se ignora no subiendolo a la area del staging, muchas vece suben contrasenya al github sin queere porque no configuraron el git ignore
# crear un archivo oculito .gitignore este archivo se subira al commit pero no los que estan especificado adentro. adentro  se puede hacer progrmaciones practicas como:
## esto es comentario en git ignoro solo para dar referencia de guia ejm en caso de que uno no queires escribit demasiado archivo la mayoria puede hacer lo siguiente
# *.txt esto dice que ignore todo los archivos txt
#!readme.txt esto da un excepcion el unico archivo txt que no se ignora de todo los demas
# si pones *).txt significa que todo los txt que termine con ) signo o el que le pongas sera ignorado asi systematisas un orde de dato mas practico y dinamico.
# .gitignore no es retro activo si ya fue rastreado o puesto a git no lo elimina hay que eliminarlo nosotros mismo alguna equivocacion de antes

# para crear un .gitignore_global crea ese archovo en un lugar de eleccion recordadr donde es el path luego configurar en el git el siguiente comando
git --config --global core.excludesfile [el lugar donde se ha creado tu .gitignore_global]
# ojo siempre tiene prioridad el local del global 

git log --oneline --all --graph
# para ver todo el grafo del historial de commits

# toca aprender git alias que es similar a un sniple en rit resumir un codigo largo en una funcion o macro algo asi
# para crear una alias se pone lo siguiente como ejemplo
git config --global alias.log-mejorado "log --oneline --graph --all --pretty=format:'%C(auto)%h%d %s %C(black)%C(bold)%cr'"

# ahora toca entender reflow en git dice que lleva un registro de todo los commit que se ha creado o hecho
#en realidad sucede similar cuando elminar un archivo de forma simple en tu pc se elmina la referencia y no el archivo en si por lo tanto si aplicas:
git reset --hard [hash#md5] #en la ves par o 2da(ves 2*x) se regresa el reset se recupera reseta lo resteado asi sea hard o cualkier modo.
# pero como recuerdas el hash para recuperar las referencias?
# para eso el siguiente comando
git reflog # aparece todo el historial de los anteriores heads de cambios con sus hashes.
# tambien se puede recupear con
git checkout [hash#md5] #pero da 2 opciones recuperar como el reset o como una re modificacion nueva en caso de un nuevo aupdete ensima que se ve en el git log como algo nuevo ensima lo de conteneido anterior recuperado el sigiente comando
git switch -c [cambios-recuperado]

# ahora toca saber que es git stash parece similar a la papelera de reciclaje(es global), pero la idea es que es un espacio suelto flotante que no pertenece necesariamente para ningun proyecto todavia esta tomando formas puede ser bastante cambiante se esta descubriendo cosas no esta para subirlos a nigun proyecto correspondiente necesariamente o no es de importancia relevante de la naturaleza del objetivo. un espacio borrador y se pone por defeacto WIP significa wor in progress

git stash # mueve o copia el archivo para se  el gid add a la soana WIP
# para ver comprar los cambios de stage en pre add 
git stash show -p # el - ps muestra la linea de codigo que se ha cambiado o aumentado o diferenciado.

git stash list # lista de los archivos stash
# el git stash funciona con la logica del stack se va apilando en nuevo ultimo en el primero  numero del head{0} numeracion hay 0 como inicial o final.

# para poner un nombre al stash de donde estas
git stash push -m "otro cambio que no se queire confirmar todavia"

# para aplicar un git stash para la zona a modificar del ultim stash a cambiar dentro de la logica del stack
git stash apply [0~#n] # la logica de buscar en un stack o similar
git stash pop # elimina el primero osea el {0} del stack 
git stash drop [0~#n] # elegir cual numero se queire borrar.
# cuando se elimina se produce el efeacto del stack que los de abajo suben a completar arriba al 2 o el # que se ha quitado

# y para borrar todo el borrador
git stash clear.

# si crear una rama desde el stash se borra de la lista del estash y se crea una rama como si se hubiera sucedido un checkout dice, ejm.
git stash branch mi-starsh-1 [0~#n]
               # puede escojer por el nombre asignado o
               #crea un nombre y cojer por el # de orden de la logica del stack  

# ahora se complica un poco con git rebase
https://www.youtube.com/watch?v=NhLv3WHI_BI
# git rebase coge todo la diferencial de branch y lo poner ensima de otro 
# debes estar en la rama del que queires aplicar le ensima el reabase todo el cambio de la otra rama
# muchas veces no se recomienda usar la rama central master o main  ponerce ensima de los brach  lo corona pero se pierde la hilacion de la historia original central raraveces solo coronar cuando realmente edeberia ser en si algo superior o algo asi.
git rebase [la rama entera al que les va a poner ensima de donde estas]
# video criterio general de git rebase
https://www.youtube.com/watch?v=0chZFIZLR_0               

# un buen resumen de criterio general avanzado explicado facilmente
https://www.youtube.com/watch?v=HyCaL6ld8pI



# "felicitaciones ahora ya sabe todo los fundamentos practicos essenciales de git" 
----------------------------------------------------------------
#Ahora toca saber sobre git hub

#agregar la url del repositorio de que se queire dirigir hay 2 formas
git remote add luissit0 https:#github.com/luissit0/bash-resume-tutorial.git
git remote add origin https:#github.com/luissit0/bash-resume-tutorial.git
git remote -v #para ver los repositorios agregados
luissit0	https:#github.com/luissit0/bash-resume-tutorial.git (fetch)
luissit0	https:#github.com/luissit0/bash-resume-tutorial.git (push)
origin	https:#github.com/luissit0/bash-resume-tutorial.git (fetch)
origin	https:#github.com/luissit0/bash-resume-tutorial.git (push)

en ves del add tambien hay opciones rename(renombrar) o rm(remover)

# antes de poder hace un push o subir al reprositorio connectar nececitas hacer un git fetch que sincronisa el ropsitorio con una carpeta que se genera, el git fetch se autogenera si mas antes has echo un git clone y desde esa carpeta repositorio has estado trabajando pero si no debes de hacer el git fetch
git fetch 
#una ves sincronisado debes de mover el archivo que queires actualisar dentro de la carpeta creada del mismo nombre no cambiar el nombre de la carpeta no sabes que puede suceder puede que no lo reconosca facil
# depues de mover aplicar*/ 
git add 
           #y 
git commit
#luego
# para connectar desde tu terminal git a github porner el siguiente commando esto sube o actualisa desde tu git al repositorio git hub
git push origin main 
# o 
git push luissit0 main
# ademas en mi terminal dice que git a cancelado la forma de entrar por contrasenya solo se puede entrar por token y que se recomienda que se cree tokens que expiren. en seetings/developer settings etc. aqui tiene que poner tu usuario y tu token.

# ahora toca lo contrario actualisa tu repositorio git jalando desde github con
git pull origin main #desde origin el por defeacto de git y en la rama main
git fetch # commando usado para verifica los cambios realizados
en el repositorio remoto sin combinar esos cambios con el 
repositorio local*/ 
# o
git fetch origin
#luego al poner
git switch --detach origin/master #abrira codium para ver primero lo que ha hecho sin hacer el merge primero otra opcion es la de abajo.
git checkout origin/main #entrara la descarga opcional donde dara escrito 2 opciones
#si deseas descagarlos en un rama alterna o  revertir eso. 
#luego al regresar a
git checkout main 
#saldra la opcion de si pones 
git pull origin #se actualisara en el repositorio de donde estas

# ahora para crear un git y conectarlo al github
# del push pedira nombre del usuarion y clave del token
echo "# javascript-pr.js" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https:#github.com/luissit0/javascript-pr.js.git
git push -u origin main

git remote add origin https:#github.com/luissit0/javascript-pr.js.git
git branch -M main
git push -u origin main
# despues de hace un fork en git hub opciones, ahora toca ver como funciona un pull request, 
# El pull request lo hace en el github
#el 
git pull origin la-rama-elegida-de-tu-github #pasa de rama a la misma rama, si es main o master con el mismo si no
#pero en caso de que desde main haces un pull origin de otra rama en
#github entonces no funciona se hace lo siguiente.
git fetch origin # luego
git checkout la-nueva-rama #aparece la nueva rama una ves que hace el git check out si no el branch no lo dectara antes
git branch #verifica que aparece la nueva rama.

#ahora toca sabe como eliminar una rama local y luego remota
git branch -d nueva-rama

# para ver las ramas locales y tambien remotas poner
git branch -a #recuerde que q es para salir del esta del output de la terminal

#ahora para eliminar lo desde la terminal de forma remota a github
#el siguiente comando:
git push origin -d nueva-rama

#ademas la rama principal main o master no se puede eliminar
#asi es por defecto por seguridad


