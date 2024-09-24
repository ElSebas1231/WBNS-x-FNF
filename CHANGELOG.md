# Changelog
Todo los cambios mencionados aquí, son respecto a la versión de lanzamiento (v1.0.0)

El formato de este changelog es basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto se adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## WBNSxFNF v1.1.1
### Arreglos
    - Se arregló los posibles crasheos al salir de los resultados
    - Se corrigieron las animaciones de C3jo en la canción de **Speedrun**

Sí, se nos pasaron algunas cosas pero lo bueno es que eran pocas.

## WBNSxFNF v1.1.0
### Adiciones
- Se agregaron algunos gameovers para canciones que no los tenían, no todas las que faltan lamentablemente...
    - Speedrun
    - Don't look up
    - Free The End (Sección de Locochon Solo)
    - Boneless Wings
    - Entre otras canciones
- Se añadió una nueva dificultad:
    - **Soarinng**. Esta dificultad solo aplica para las canciones de **Story Mode**
- Se añadió una canción nueva:
    - Toneando
    Origins y Night Guards eran canciones planeadas para la versión 1.0, pero por falta de assets no se añadieron. (Ahora si están al 100%)
- Se agregaron funciones del juego base:
    - Soundtray del juego base (contador de volumen)
    - La transición de stickers (Créditos a [elcami22](https://x.com/camemllo5879) por los stickers)
    - Pantalla de Resultados
    - Note Hold Covers (animaciones al mantener una nota)
    De igual manera, se añadieron opciones que deshabilitan estas funciones.
- En el menú de pausa, se muestra el/los compositor/es de la canción actual, intercalando entre compositor/es y charter/es. Tomando los créditos del JSON de la canción
- En el editor de charteo, se añadió una opción para agregar créditos de charter y composer
- Al completar una canción, se guardará el porcentaje de completado (Basado completamente en el juego base. Apartir de la cantidad de sicks más cantidad de goods divido entre la cantidad total de notas)
- Se añadieron algunos textos en la pantalla de inicio
- Se añadieron algunos icons faltantes:
    - Meica sus
    - Duxo irl
    - Duxita
    - Tomy irl
- Nuevos eventos en Animal Conflict y en Say it
    - Créditos a SanfordXD (Animal Conflict)
    - Créditos a ElSebas1231 (Say it)
### Cambios
- Se cambió el rol de Nieves de Directora a Ex-Directora (ya que WBNSxFNF ya no forma parte del Team Snowdy)
- Al iniciar el juego, se cambio el texto "NexoV Nieves Presentan" a "NexoV Presenta", esto por lo antes mencionado
- Se eliminó el la referencia del Team Snowdy al iniciar el juego, en su lugar ahora aparece refencia al Psych Engine
- Ahora para acceder al Easter Egg, puedes usar el teclado numérico
- Cambios en el menú de **Story Mode** (cambios ligeros)
    - Se reposicionaron algunos textos
    - El nombre de cada week ahora tiene un degradado
- Se cambió el nombre de la week de Duxo de "Duxo Week" a "Mundo Distintos". Ese nombre era un placeholder que al final no tuvo cambio en la versión de lanzamiento
- Algunos de los charts fueron modificados, siendo ahora más coherentes (aunque puede que no xd). Esto con el fin de hacer que sean más divertidos de jugar, exceptuando la dificultad **Insane**
- Se cambió ligeramente el HUD en Boneless Wings, ahora mostrando los icons de los personajes
- Se cambiaron los nombres de Lore (Soarinng Mix), esto para evitar confusión con que versión es cada una:
    - "Lore (Soarinng Mix)" se renombró a "Lore (Soarinng Mix) v3"
    - "Lore (Soarinng Mix) OLD" se renombró a "Lore (Soarinng Mix) v2" (Esta más que nada porque se confundía con la versión de la demo)
- En la actividad en Discord se mostrará lo siguiente:
    - Botones que redirigen a links (No son maliciosos btw)
    - Ahora todas las canciones, muestran su portada correctamente
    - Si la canción que jueges no es del mod, se mostrará la portada de WBNSxFNF en su lugar
- Ahora al jugar Possesion desde el **Story Mode**, mostrará la portada de Penguin or Rat y al hacer el cambio, mostrará la portada de Possesion (Esto para hacer coherencia con lo que se está viendo)
- Al jugar Rethey Forever, hay un pequeño cambio de sprites, al igual un cambio en la imagen en la actividad en Discord
- Al escuchar una canción en **Freeplay**, podrás ver la portada de la canción correspondiente. En caso de que no sea del mod se mostrará la portada de WBNSxFNF.
- Al seleccionar una canción mostrará el porcentaje de completado (Esto para darle uso al porcentaje obtenido en la pantalla de resultados)
- Ahora las Note Splashes tendrán un color respecto a la dirección que es (Izquierda, Abajo, Arriba y Derecha), mostrando un color diferente. Esto también aplica para los Note Hold Covers.
### Arreglos
- Se aumentó ligeramente el volumen de las cinemáticas del modo historia.
- Al terminar la cinemática en Possesion, habrá una breve pausa. (Es lo más que se pudo :disappointed:)
- Se corrigió el bug en Made in 2002 que hacía que los personajes cambiaran de posición al cantar en la transición del segundo escenario. (Se cambió el método de como se hacía esto)
- Se corrigieron varios scripts de funcionamiento:
    - Scripts de RGB en las Note Splashes y Note Skins, ahora funcionan como debido
    - Los scripts de Note Splashes y Note Skins ya no lagean el juego si la sección actual es de GF (gfSection)
    - Ahora los scripts de las skins también colorea los Note Hold Cover
- Ahora en las canciones en donde hay dos ó más personajes, al presionar una nota se cambiará el color de la barra de vida y el icon actual.
- En Loco Classic Encore, ahora se muestra correctamente la animación del final

> [!Nota]
>_Si siguen ocurriendo crasheos en canciones que lleven videos/cinemáticas, es por la librería de los videos xd. Las puntuaciones guardadas no serán afectadas al jugar esta actualización.