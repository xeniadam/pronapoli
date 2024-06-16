# Documentación técnica para la codificación de *Soledad Amena* 

Las siguientes guías directrices explican la codificación para las diferentes composiciones poéticas de Garcilaso de la Vega, bajo el título *Soledad Amena*, accesible a través de la URL: https://pronapoli.com/ediciondigital/ 

## Esquema RNG 

Para la codificación de los textos que comprenden la edición *Soledad Amena* se ha creado un esquema específico `pronapoli.rng`, disponible desde el sitio: <https://pronapoli.com/ediciondigital/pronapoli.rng>, así como desde este repositorio en GitHub.  También está disponible en este mismo repositorio la ODD, bajo el nombre `pronapoli_ODD.xml`.

## Encabezado

El encabezado del documento TEI, para el que se utiliza el elemento `teiHeader`, siempre es el mismo y contiene las informaciones tanto del proyecto como de los editores de la composición. En principio, todos los encabezados tienen la misma información, varía sólo quien ha preparado la edición filológica y la edición digital. El esquema general se encuentra ya en la plantilla `template.xml` a partir del cual se recomienda empezar a trabajar.

### >> fileDesc >> titleStmt 

- `title`: Título en español y en inglés. 
- `author`: autor de la composición (por defecto, siempre Garcilaso de la Vega), con un  `@corresp` que apunta hacia el archivo de `global.xml`. 
- `respStmt`: señalamos los editores de la parte filológica y digital. Puede indicarse en español “es” y en inglés “en” repitiendo las informaciones para las dos futuras versiones de la edición que se ofrecerá en ambos idiomas. Esta información aparece en el resultado HTML de la edición crítico en el recuadro de Créditos. 

### >> fileDesc >> publicationStmt

En esta sección aparecen las informaciones sobre la UdG, URL tanto del proyecto como del poema en concreto, y la licencia. 

### >> /TEI/teiHeader/sourceDesc

La descripción de los testimonios utilizados para la edición aparecen, de momento, en la sección general del proyecto "Nuestra edición". Esta sección en el futuro deberá incluir las siglas de los manuscritos, ediciones príncipes y otras ediciones posteriores utilizadas para el cotejo y se deberán relacionar con la sección de Aparato crítico. 

### >> /TEI/teiHeader/profileDesc

Se señalan las diferentes lenguas utilizadas en los archivos XML-TEI. 

### >> /TEI/teiHeader/encodingDesc 

Por ahora en esta sección se remite a los criterios de edición generales y a estas guías de codificación. En un futuro, se podrá añadir también los siguientes elementos: 

- `projectDesc`: breve descripción sobre el proyecto 
- `editorialDecl`: enlace a esta documentación técnica del proyecto así como de los criterios de edición. 
- `schemaRef`: enlace al esquema rng y la ODD.

### >> /TEI/teiHeader/revisionDesc

Aparece la serie de intervenciones en el archivo digital (creación, codificación, revisiones). 

### Ejemplo de `teiHeader`


```xml
   <teiHeader>
      <fileDesc>
         <titleStmt>
            <title xml:lang="es">Oda I</title>
            <title xml:lang="en">Ode I</title>
            <author corresp="#GdV">Garcilaso de la Vega</author>
            <respStmt xml:lang="es" resp="editor_filologico">
               <resp>Edición filológica preparada por</resp>
               <persName corresp="#RL" ref="https://pronapoli.com/equipo/lokaj-rodney/">Rodney Lokaj
               </persName>
            </respStmt>
         </titleStmt>

         <publicationStmt>
            <publisher>Universitat de Girona</publisher>
            <address>
               <addrLine>Edifici Sant Domènec I</addrLine>
               <addrLine> Pl. Ferrater i Mora, 1</addrLine>
               <addrLine>17004 - Girona</addrLine>
            </address>
            <idno type="general">https://pronapoli.com/</idno>
            <idno type="url_poema">https://pronapoli.com/ediciondigital/oda1</idno>
            <availability status="restricted">
               <licence target="http://creativecommons.org/licenses/by-nc-nd/3.0/fr/"
                  >http://creativecommons.org/licenses/by-nc-nd/3.0/es/</licence>
            </availability>
         </publicationStmt>

         <sourceDesc>
            <p>Para la información de los testimonios utilizados para esta edición crítica digital,
               se remite de momento, a la sección <ref type="link_interno"
                  target="https://pronapoli.com/ediciondigital/">Nuestra edición</ref>. </p>
         </sourceDesc>

      </fileDesc>

      <profileDesc>
         <langUsage>
            <language ident="en">Inglés</language>
            <language ident="es">Español</language>
            <language ident="lat">Latín</language>
            <language ident="cat">Catalán</language>
         </langUsage>
      </profileDesc>

      <encodingDesc>
         <p>Los criterios de edición se especifican en la sección general <ref type="link_interno"
               target="https://pronapoli.com/ediciondigital/">Nuestra edición</ref>, y los criterios
            para codificación en XML-TEI del documento digital en <ref type="link_externo"
               target="https://github.com/susannalles/pronapoli/blob/gh-pages/docs.md"/>.</p>
      </encodingDesc>

      <revisionDesc>
         <change resp="#SAT"><date when="2024-02-17"/>Creación del documento XML-TEI.</change>
         <change resp="#SAT"><date when="2024-02"/>Codificación documento XML-TEI.</change>
         <change resp="#SAT"><date when="2024-05"/>Revisiones y homogeneización de la codificación
            documento XML-TEI.</change>
      </revisionDesc>

   </teiHeader> 
```

## ESTRUCTURA CUERPO 

La parte general que corresponde al elemento `<body>` se estructura en nueve partes principales que básicamente corresponden a las diferentes secciones de la edición digital: 

1. Contexto
2. Métrica
3. Notas
4. Comentarios
5. Loci similes
6. Aparato crítico
7. Texto del poema
8. Traducción del poema
9. Bibliografía 

Cada una de estas secciones tiene una estructura muy similar, y se contempla que cada una se divida en dos partes para contener el texto en español y en inglés. De momento (mayo 2024), solo se ofrece la parte en español. El esquema general es el siguiente: 

```xml
   <text>
      <body>
         <div type="contexto">
            <div xml:lang="es">
               <p/>
               <p/>
            </div>
         </div>

         <div type="metrica">
            <div xml:lang="es">
               <p/>
               <p/>
            </div>
         </div>

         <div type="notas">
            <note type="nota_intro" n="1">
               <note type="nota_intro_es" xml:id="id" xml:lang="es"/>
            </note>
            <note xml:id="id" n="01" corresp="#">
               <note xml:id="id" xml:lang="es" resp="#">
         </div>

         <div type="comentarios">
            <note type="comentario_intro" n="1">
               <note type="comentario_intro_es" xml:id="id" xml:lang="es" resp="#"/>
            </note>
            <note xml:id="id" n="01" corresp="#">
               <note xml:id="id" xml:lang="es" resp="#"/>
            </note>
         </div>

         <div type="loci_similes">
            <note type="ls_intro"/>
            <note xml:id="id" resp="#"/>
         </div>

         <div type="ApCrit">
            <ab>
                <span type="link" from="#v" n="0">x</span>
               <app>
                  <lem>lema</lem>
                  <rdg>variante <wit>testimonio</wit></rdg>
                  <rdg>variante <wit>testimonio</wit></rdg>
               </app>
               <note type="n_ApCrit">Nota... </note>
            </ab>
         </div>

         <div type="poema" xml:id="id">
            <lg xml:lang="lat">
               <head><title xml:id="cancion_5_t">Canción V</title></head>
               <lg type="estrofa">
                  <l n="1" xml:id="id"/>
                  <l n="2" xml:id="id"/>
               </lg>
            </lg>
         </div>

         <div type="poema_traduccion" xml:id="id">
            <lg xml:lang="es">
               <l/>
            </lg>
         </div>

         <div type="bibliografia">
            <listBibl type="final">
               <bibl/>
               <bibl/>
            </listBibl>
         </div>
      </body>
   </text>
```

## TEXTO DEL POEMA

El cuerpo del poema se codifica en la sección: `div[@type= “poema”]`. Conviene llevar a cabo en primer lugar esta codificación para otorgar a cada verso su identificación (así cuando los enlaces de las otras secciones hacia los versos serán más fáciles de completar). El poema tiene tres partes esenciales: 

- `<head>` y `<title>`: contiene el título que aparecerá en la sección del poema a la izquierda de la pantalla. `<title>` lleva un identificador y a veces puede llevar una nota separada y general al poema (revisar, pues existe un tipo especial de nota introductoria). 
- `<lg>`: Toda la composición se incluye en un elemento `<lg>` que indica sólo la lengua del poema. 

```xml
<head>
    <title xml:id="Od4_t">Eiusdem ad Petrum Bembum</title>
</head>
```

- `<lg xml:id="id" type="estrofa" corresp=“#”>`: cada estrofa va contenida en un elemento `<lg>`, con un identificador (eg. Od_4_1 = Oda 4, verso 1), un atributo tipo “estrofa” y un `@corresp` que corresponde a la traducción. Hay poemas, como la Epístola a Boscán que no tienen estrofas, por consiguiente todo el poema se incluye dentro de la primera. 
- `<l>`: Cada verso va en un elemento `<l>`, seguido del número de verso `@n`. Además, cada uno de los elementos `<l>`debe llegar un identificador `@xml:id` que debe crearse con el identificador del poema + el número de verso, separados por un guión bajo `_` . Esta solución es preferible a la de identificador poema + número estrofa + número verso, porqué es más intuitiva y más efectiva (debe solo añadirse el número de verso, sin tener que buscar a qué estrofa corresponde). 
- Racional de los identificadores: 
	Od_4_1 =  Oda 4, verso 1 
	Od_4_9 = Oda 4, verso 9

Aquí un ejemplo de la codificación de los versos originales correspondiente a la Canción V: 

```xml
 <lg xml:lang="lat">
      <head>
         <title xml:id="cancion_5_t">Canción V</title>
      </head>

      <lg type="estrofa">
          <l n="1" xml:id="cancion_5_1">Si de mi baja lira </l>
          <l n="2" xml:id="cancion_5_2">tanto pudiese el son que en un momento</l>
          <l n="3" xml:id="cancion_5_3">aplacase la ira </l>
          <l n="4" xml:id="cancion_5_4">del animoso viento </l>
          <l n="5" xml:id="cancion_5_5">y la furia del mar y el movimiento,</l>
       </lg>
       <lg type="estrofa">
           <l n="6" xml:id="cancion_5_6">y en ásperas montañas</l>
           <l n="7" xml:id="cancion_5_7">con el süave canto enterneciese</l>
           <l n="8" xml:id="cancion_5_8">las fieras alimañas, </l>
           <l n="9" xml:id="cancion_5_9">los árboles moviese</l>
           <l n="10" xml:id="cancion_5_10">y al son confusamente los trujiese:</l>
        </lg>
```

Otro elemento esencial que se codifica dentro de los versos son los renvíos a las Notas, Comentarios y Loci similes. En el resultado de la edición digital, puede verse como los versos tiene una pequeña flecha que despliega un menú. Este menú enlaza con las Notas, Comentarios o Loci similes correspondientes. Al interno del mismo elemento `<l>` se añade un `<linkGrp>` con los diferentes enlaces `link`: 

- `linkGrp`: dentro de los versos puede ir `<linkGrp>` donde incluimos las referencias externas a notas, loci similes, o comentarios.
- `<link>`: Los enlaces pueden ser de tres tipos (`@type`) dependiendo si hacen referncia a las notas `type="a_notas"`, a los comentarios `type="a_comentarios"` y a los loci similes `type="a_ls"`. Además deben tener siempre un identificador (`@xml:id`) y una correspondencia con el identificador de la nota, comentario o loci similes (@corresp) para crear un camino de ida y vuelta. Los enlaces pueden repetirse, es decir, puede haber más de una referencia de un verso a múltiples notas.
- Los identificadores de los elementos `<link>`son los mismos que la anotación a la que hacen referencia pero precedidos de una `a_` (ancla). 

Aquí un ejemplo de un grupo de enlaces de un verso hacia sus correspondientes notas, comentarios y loci similes (Canción 5): 

```xml
<l n="1" xml:id="cancion_5_1">Si de mi baja lira
    <linkGrp>
      <link type="a_notas" xml:id="a_cancion_5_n1" corresp="#cancion_5_n1"/>
      <link type="a_comentarios" xml:id="a_cancion_5_c1" corresp="#cancion_5_c1"/>
      <link type="a_ls" xml:id="a_cancion_5_ls1" corresp="#cancion_5_ls1"/>
    </linkGrp>
</l>
```
- Racional de los identificadores: 
	- a_Od_4_n9: ancla Oda 4 a la nota 9
 	- a_Od_4_c7: ancla Oda 4 al comentario 7
	- a_Od_4_ls12: ancla Oda 4 al locus simile 12 

## TRADUCCIÓN DEL POEMA 

- La traducción se sitúa en una `<div type="poema_traduccion">`, al que se añade un identificador que es el mismo que el del texto original pero seguido de `_trad` (traducción). Por ahora, sólo tienen traducción al español las composiciones latinas: 
`<div type="poema_traduccion" xml:id="Oda_4_trad">`
- Racional del identificador genérico: Oda_4_trad = Oda 4 en traducción. 
- `<lg>`: engloba todo el poema y lleva solo un `@xml:lang` (`es`, `lat`). 
- `<head>`: contiene el título de la composición, con un identificador (igual que al original pero con `_trad`. E. g. Od_1_t_trad = Título de la Oda 1 en traducción) y un `@corresp` al título que se traduce. 
- `<lg type="estrofa">`: cada estrofa se señala con un `<lg>` y un `@type = “estrofa”`, un identificador paralelo a la estrofa original, más `_trad`, y tres atributos más: `@corresp`, `@n`, y `@select`.  
- Ejemplo: `<lg type="estrofa" xml:id="Od_1_11_trad" corresp="#Od_1_11" n="3" select="1-4">`
- `@corresp`: corresponde al número de estrofa en latín y al número del verso en el que comienza el enlace. 
- `@n`: se refiere al número de líneas a los que hace referencia a partir de la siguiente (es decir, si es del verso 13 al verso 16, serán 3 versos).
- `@select`: los números de líneas en donde debemos hacer highlight (esto responde más bien a una cuestión de visualización y salida web). 
- `<l>`: La traducción se realiza por estrofas, no por versos, así que en realidad los elementos `<l>` corresponden a toda la traducción de la estrofa.

Un ejemplo de la codificación de la traducción puede ser el siguiente extraído de la [Oda 1](https://pronapoli.com/ediciondigital/oda1): 

```xml
<div type="poema_traduccion" xml:id="Oda_1_trad">
     <lg xml:lang="es">
          <head xml:id="Od1_t_trad">Título</head>
          <lg type="estrofa" xml:id="Od_1_1_trad" corresp="#Od_1_1" n="3" select="1-4">
                  <l>Desterrado a un lugar frío, tras abandonar a esposa, hijos,
                     hermanos y patria, yo, siervo de las Musas, he aprendido ahora, a la fuerza, a
                     soportar la soberbia y las insolentes</l>
          </lg>
          <lg type="estrofa" xml:id="Od_1_2_trad" corresp="#Od_1_5" n="3" select="5-8">
                  <l>costumbres de los bárbaros y a aliviar mis lamentos al ronco murmullo del
                     Danubio, entre rocas que redoblaron mis voces y querellas.</l>
           </lg>
      </lg>
</div>
```

## CONTEXTO 
En esta sección se describe el contexto histórico en la que se compuso el poema y la datación del mismo. 

## MÉTRICA 
En esta sección se encuentra una explicación sobre la métrica de cada composición poética. 

## NOTAS 
La sección `div[@type=“notas”]` se divide en elementos `<note>` con un `@xml:id` (e.g. Od4_n1 > Oda 4, nota 1), un número `@n`, y una correspondencia `@corresp` con el ancla al texto. A su vez esta tiene dos notas descendientes con un identificador `@xml:id` (e.g. Od4_n1_en, Oda 4, nota 1, inglés), y la lengua de la nota (`xml:lang = en, es`). He aquí un ejemplo de notas procedente de la Canción 5: 

```xml
<div type="notas">
  <note xml:id="cancion_5_n1" n="01" corresp="#a_cancion_5_n1">
        <note xml:id="cancion_5_n1_es" xml:lang="es" resp="#EF">
          <span type="link" from="#cancion_5_1" n="0">1</span>
                  <ref type="texto_poema">mi baja lira</ref>: frente a la lira épica de Clío,
                  interpelada en la fuente de este pasaje (...).</note>
            </note>

            <note xml:id="cancion_5_n2" n="02" corresp="a_cancion_5_n2">
               <note xml:id="cancion_5_n2_es" xml:lang="es" resp="#EF">
                 <span type="link" from="#cancion_5_1" n="9">1-10</span> En los versos de
                    Garcilaso, como (...)</note>
            </note>
</div>
```

Las notas por lo general van encabezadas por el número de verso o versos al que hacen referencia, con el fin de poder crear un enlace a dichos versos utilizamos el elemento `<span>` con tres atributos: `@type="link"`, `@from` con el identificador del primer verso al que hace referencia, y un `@n` que señala el número de versos que deben iluminarse (sin contar el primero). Así si hace referencia a un solo verso, la codificación será: 

```xml
<span type="link" from="#cancion_5_1" n="0">1</span>
```
En cambio si hace referencia a más de un verso (en este caso se incluyen 9 versos) deberá ser: 

```xml
<span type="link" from="#cancion_5_1" n="9">1-10</span>
```
Este sistema de enlazar las notas a los versos es el mismo para los Comentarios y los Loci similes, y en cualquier caso que se quiera crear un enlace a los versos. 

En el caso que haya notas introductorias sin relación con el texto las codificamos (es decir, sin un enlace dónde apuntar), las codificaremos con un `@type="nota_intro"`

```xml
<note type="nota_intro" n="2">
     <note type="nota_intro_es" xml:id="comentario_intro_n2" xml:lang="es" resp="#EF"> …</note>
</note> 
```

## COMENTARIOS 

Tiene la misma estructura que las notas generales. Se divide en elementos `<note>` con un `@xml:id` (e.g. Od_4_c1 > Oda 4, comentario 1), un número, y una correspondencia con el `@corresp` al ancla en el texto. A su vez esta tiene dos notas descendientes con un identificador `@xml:id` (e.g. Od_4_n1_en, Oda 4, nota 1, inglés) y la lengua del comentario (`en, es`).  

Los comentarios, como las notas, van precedidos de un enlace a los versos a los que hacen referencia que se transforman en un link. Así si hace referencia a un solo verso, la codificación será: 

```xml
<span type="link" from="#cancion_5_1" n="0">1</span>
```
En cambio si hace referencia a más de un verso (en este caso se incluyen 9 versos) deberá ser: 

```xml
<span type="link" from="#cancion_5_1" n="9">1-10</span>
```
Este sistema de enlazar las notas a los versos es el mismo para los Comentarios y los Loci similes, y en cualquier caso que se quiera crear un enlace a los versos. 

Si hay comentarios introductorios sin relación con el texto las codificamos así:

```xml
<note type="comentario_intro" n="2">
   <note type="comentario_intro_es" xml:id="comentario_intro_n2" xml:lang="es" resp="#EF"> …</note>
</note> 
```

## LOCI SIMILES 

Por ahora, los loci similes, es decir, paralelismos con otros textos, sobretodo referencias o versos de clara inspiración horaciana se añaden en esta sección solo en español (más adelante deberán crearse dos secciones para el inglés y el español). Cada referencia se inscribe en un `<note>` con un identificador. 
- El racional de los identificadores es: 
		- Od_4_ls1 = Oda 4, locus simile 1 
		- Od_4_ls4 = Oda 4, locus simile 4 

En los locis similes, la nota va encabezada por el mismo sistema de `<span>` que enlaza con el texto del poema: 

```xml
<span type="link" from="#Od_4_5" n="3">5-8</span>
```

Aquí un ejemplo de un locus simile: 

```xml
<note xml:id="Od1_ls43"><span type="link" from="#Od1XX" n="0">37</span> [texto]</note>
<note xml:id="Od1_ls44"><span type="link" from="#Od1XX" n="0">37</span>[texto] </note>
```

## APARATO CRÍTICO
La estructura general se hace a través de una serie de elementos `<ab>`. A veces el aparato va precedido por una sección donde se listan los testimoinos utilizados, en cuyo caso lo marcamos, de momento, como si fuera una lista: 

```xml
<ab>
    <span type="link" from="#xx_00" n="0">00</span>
    <app>
        <lem>lema</lem>
        <rdg>variante <wit>testimoino</wit></rdg>
    </app>
    <note type="n_ApCrit">Nota explicativa</note>
</ab>

<ab>
    <span type="link" from="#xx_00" n="0">00</span>
    <app>
        <lem>lema</lem>
        <rdg>variante <wit>testimoino</wit></rdg>
    </app>
    <note type="n_ApCrit">Nota explicativa</note>
</ab>
```

Cuando aparece el número del verso, se usa el sistema de `<span type="link" from="#referencia_verso" n="0">00</span>`. Las composiciones en español presentan los aparatos críticos más simples y estandarizados (los de las Odas latina debe revisarse). Por norma general, codificamos el aparato crítico con el elemento `<app>` que incluye el lema o lectura crítica de la edición `<lem>` seguido, en el mismo nivel, de la o las diferentes variantes con el elemento `<rdg>`. Ambos elementos, tanto `<lem>`como `<rdg>`, suelen llevar la sigla del testimonio marcada con `<wit>`. Después del aparato, puede haber una nota explicativa. Aquí vemos un ejemplo de codificación de un aparato crítico extraído de la [Canción 5](https://pronapoli.com/ediciondigital/cancion5): 

```xml
<ab>
    <span type="link" from="#cancion_5_17" n="0">17</span>
    <app>
        <lem>ruedas</lem>
        <rdg>ruedes <wit>E</wit></rdg>
    </app>
    <note type="n_ApCrit">Tamayo de Vargas no entiende el plural de ruedas y
     propone reducir la lectura a singular, aunque después no lo lleva a
      cabo en su propia edición.</note>
</ab>
```

Algunos aparatos críticos también presentan simples anotaciones a una forma léxica determinada. En estos casos no lo consideramos aparato crítico propiamente (`<app>`), sino una simple referencia al texto: `<ref type="texto_poema"></ref>` (vid. infra). 

## ENLACES O REFERENCIAS INTERNOS

1. Cualquier referencia al texto del poema se hace con el elemento `<ref>`: 

```xml
<ref type="texto_poema">non animum pigeat patere</ref>
```

2. Todo enlace que sea interno a la página de Pronapoli, por ejemplo a Academias o Equipo, debe llevar el `@type “link_int”`: 

```xml
<ref type="link_interno" target="#Od_1_ls9">15-17</ref>
```

3. Si es un enlace al interno de la edición crítica que salta de tab debe especificarse: 
	- Hacia los comentarios: @type="link_int_c"
	- Hacia las notas: @type="link_int_n"
	- Hacia los loci similes: @type="link_int_ls"

```xml
<ref type="link_int_c" target="#Od_1_c1_es">Comentario v. 1</ref>
<ref type="link_int_n" target="#Od_1_n1_es">Nota v. 1</ref>
<ref type="link_int_ls" target="#Od_1_ls1">Loci similes v. 1</ref>
```
Cada uno de estos tipos de enlace genera, a través de la XSLT, un código HTML que tiene esta forma: 

```html
<a href="#Od_1_c1_es" data-eltab="comentarios">Comentario 1</a>
<a href="#Od_1_n1_es" data-eltab="notas">Nota v. 1</a>
<a href="#Od_1_c1_es" data-eltab="locisimiles">Loci similes v. 1</a>
```

Los valores en HTML para saltar de una página a otra son: 

```html
data-eltab="contexto"
data-eltab="metrica"
data-eltab="traduccion"
data-eltab="locisimiles"
data-eltab="notas"
data-eltab="comentarios"
data-eltab="aptcrit"
data-eltab="bibliografia"
```

4. Para los otros enlaces que apuntan a páginas externas al proyecto se usa `@type="link_externo"`:

```xml
<ref type="link_externo" target="http://etc.">texto</ref>
```

## CITAS BIBLIOGRÁFICAS

Cit > quote > bibl 
Especialmente en los loci similes aparecen referencias con citas, lo marcaremos así: 

```XML
<cit>
    <quote xml:lang="lat">"seu deos regesque canit […] sive […] pugilemve equomve
     / dicit […] flebili sponsae iuvenemve raptum / plorat"</quote>
    <bibl type="canon">Hor. Carm. IV. 2. 13–22</bibl>
</cit>
```

Existen diferentes tipos de referencias bibliográficas: 
- Para la bibliografía secundaria, se usa el `@type="main"`. En el futuro, las bibliografías se crearán importando los items de la biblioteca de Zotero, https://www.zotero.org/groups/5225301/Pronapoli, pero en estos momentos (mayo 2024) todavía no se ha podido completar. La idea es que cada item llevará el ID generado en la colección de Zotero. 

```XML
<bibl type="main" corresp="ZQCIPTZH">Czepiel (forthcoming)</bibl>
```

- Cuando son referencias canónicas o fuentes primarias de autores clásicos o italianos se usa el tipo “canon” `@type="canon"`:
- 
 ```XML 
<bibl type="canon">Virg. Aen. 4.66</bibl>
```

En el futuro, cada una de estas citas deberá ir dirigida, con su enlace, a una versión en línea del texto. 
- Para los textos clásicos, se usaría la [Persus Digital Library](http://www.perseus.tufts.edu/hopper/) apuntando siempre a la URI perenne del fragmento, la “Citation URI”. 
- Para los autores italianos en lengua latina, se debería usar el portal [Poeti d’Italia in Lingua Latina](https://mizar.unive.it/poetiditalia/public/) 

## Menciones de autoría 
Ciertos elementos llevan el `@resp` para señalar la autoría de ese fragmento. Por lo general suelen ser notas, comentarios, loci similes, pero también en los párrafos del Contexto y la Métrica, por ejemplo:

- `<p resp="#EF">`
- `<note xml:id="cancion_5_n1_es" xml:lang="es" resp="#EF">`

Estos iconos, a través de la XSLT, generan unos pequeños iconos con las iniciales del autor/editor. El código HTML es el siguiente: 

```html
<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
	data-bs-placement="top" data-bs-title="Nombre Apellidos"
	data-bs-content="20/04/2024">NA<i class="tooltiptext">Nombre Apellidos</i>
</span>
```

## Nombres de persona: persName

Debemos distinguir diferentes tipos de nombres de persona, cada uno deberá tener su identificador en el documento general. 

- Personajes que aparecen en nuestra galería de autores: `@corresp` y el enlace, ej. `<persName corresp=“https://pronapoli.com/autor/pietro-bembo/”>Pietro Bembo</persName>`
- Para los otros personajes, y a elección del editor, se podrá apuntar a otros sitios, como la [Wikipedia](https://es.wikipedia.org/wiki/Wikipedia:Portada), [Dizionario Biografico degli Italiani](https://www.treccani.it/biografico/), etc. 

## TIPOGRAFÍAS: 

El elemento `<hi>`se podrá utilizar con los siguientes atributos de estilo `@style` en función de lo que se necesite para el marcado semántico y la salida web: 

- `@style = "bold"`: negrita
- `@style = "italic"`: cursiva (vid. Cursivas)
- `@style = "error"`: errores o llamadas de atención que deja el editor digital para su posterior revisión.
- `@style = "superscript"`: para los números superíndices.

### Cursivas:

Cuando el texto tiene cursivas en principio debe corresponder a uno de estos casos: 

- `<mentioned>`: cuando se refiere a palabras o sintagmas del poema o al que se hace referencia dentro de la narrativa.  
- `<term>`: cuando se refiere a una palabra, un término en latín, por ejemplo. 
- `<hi style="italic">`: indica otras cursivas de difícil categorización. Se usará para casos como por ejemplo, “El niño de Venus” en que simplemente el editor quiere subrayar el término.
- `<foreign>`: palabras en otros idiomas, como *locus amoenus*, *emendatio*, etc.
  

### Errores

Para indicar los errores o dudas de codificación y que el equipo pueda verlo en el resultado y sean corregidos por los editores, se señala así para que después (a través de la xslt) aparezcan en rojo: 

```xml
`<hi style="error" select= “mensaje”>(5).</hi>`
```

