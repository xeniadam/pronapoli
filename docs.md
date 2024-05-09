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

## >> /TEI/teiHeader/revisionDesc

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

### TRADUCCIÓN

- La traducción se sitúa en una `<div type="poema_traduccion">`, al que se añade un identificador: 
`<div type="poema_traduccion" xml:id="Oda_4_trad">`
- Racional del identificador genérico: Oda_4_trad = Oda 4 en traducción. 
- `<lg>`: engloba todo el poema y lleva solo un `@xml:lang` (es, lat). 
- `<head>`: contiene el título de la composición, con un identificador (igual que al original pero con `_trad`. E. g. Od4_t_trad = Título de la Oda 4 en traducción) y un `@corresp` al título que se traduce. 
- `<lg type="estrofa">` cada estrofa se señala con un `<lg>` y un `@type = “estrofa”`, un identificador paralelo a la estrofa original, más `_trad`, y tres atributos más: `@corresp`, `@n`, y `@select`.  
- `<lg type="estrofa" xml:id="Od_4_1_trad" corresp="#Od_4_3_11" n="3" select="1-4">`
- `@corresp`: corresponde al número de estrofa en latín y al número del verso en el que comienza el enlace. 
- `@n`: se refiere al número de líneas a los que hace referencia a partir de la siguiente (es decir, si es del verso 13 al verso 16, serán 3 versos).
- `@select`: los números de líneas en donde debemos hacer highlight (esto responde más bien a una cuestión de visualización y salida web). 
- `<l>`: La traducción se realiza por estrofas, no por versos, así que en realidad los elementos `<l>` corresponden a toda la traducción de la estrofa. 

## ANOTACIÓN PARATEXTUAL:
Hay tres niveles de anotación: 

- Notas generales de comprensión 
- Comentarios eruditos 
- Loci similes 

### Notas 
La sección div[@type=“notas”] se divide en elementos <note> con un @xml:id (e.g. Od4_n1 > Oda 4, nota 1), un número @n, y una correspondencia con el @corresp al ancla en el texto. A su vez esta tiene dos notas descendientes con un identificador @xml:id (e.g. Od4_n1_en, Oda 4, nota 1, inglés), y la lengua de la nota (xml:lang = en, es).  
Las notas van encabezadas por un el enlace a los versos a los que hacen referencia que se transforman en un link: 
Si hacen referencia a un solo verso: 
<span type="link" from="#Od411" n="0">1</span>
Si hacen referencia a más de un verso (en este caso se incluyen 4 versos): 
<span type="link" from="#Od414" n="4">4–8</span>
Racional de los identificadores: 
Od414 = Oda 4, estrofa 1, verso 4
Od428 = Oda 4, estrofa 2, verso 8
Este marcado señalando un @n se ha adoptado para saber cuántas líneas deben iluminarse en la salida web: 
<span type="link" from="#Od414" to="#Od4520" n="16">ll. 4–20</span>
<span type="link" from="#Od411" n="0">1</span>

Si hay notas introductorias sin relación con el texto las codificamos así: 

<note type="nota_intro" n="2">
         <note type="nota_intro_es" xml:id="comentario_intro_n2" xml:lang="es"
              	resp="#EF"> …</note>
</note> 

### Comentarios 

Tiene la misma estructura que las notas generales. Se divide en elementos <note> con un @xml:id (e.g. Od4_c1 > Oda 4, comentario 1), un número, y una correspondencia con el @corresp al ancla en el texto. A su vez esta tiene dos notas descendientes con un identificador @xml:id (e.g. Od4_n1_en, Oda 4, nota 1, inglés) y la lengua del comentario (en, es).  
Los comentarios van precedidos de un enlace a los versos a los que hacen referencia que se transforman en un link: 
Si hacen referencia a un solo verso: 
<span type="link" from="#Od4829" n="0">29</span>
Si hacen referencia a más de un verso: 
<span type="link" from="#Od411" n="2">1–3</span>
Racional de los identificadores: 
Od414 = Oda 4, estrofa 1, verso 4
Od428 = Oda 4, estrofa 2, verso 8

Si hay comentarios introductorios sin relación con el texto las codificamos así: 
<note type="comentario_intro" n="2">
   <note type="comentario_intro_es" xml:id="comentario_intro_n2" xml:lang="es"
              	resp="#EF"> …</note>
</note> 

### Loci similes 
Por ahora, los loci similes, es decir, paralelismos con otros textos, sobretodo referencias o versos de clara inspiración horaciana se añaden en esta sección. Cada referencia se inscribe en un <note> con un identificador. 
El racional de los identificadores es: 
Od4_ls1 = Oda 4, locus simile 1 
Od4_ls4 = Oda 4, locus simile 4 

En los locis similes, la nota va seguida de un span que enlaza el loci similee con el texto del poema: 
<span type="link" from="#Od425" n="3">5-8</span>
From: Oda 4, estrofa 2, verso 5
N: es el número de versos que debe contar. 

Ejemplo: 
<note xml:id="Od1_ls43"><span type="link" from="#Od1XX" n="0">37</span> [texto]</note>
<note xml:id="Od1_ls44"><span type="link" from="#Od1XX" n="0">37</span>[texto] </note>

## APARATO CRÍTICO
La estructura general se hace a través de una serie de elementos <ab>; los títulos con <label>. 
Cuando aparece el número del verso, se usa el sistema de <span type="link" from="#referencia_verso" n="0">18</span>. 
De momento no se usan elementos <app> <lem> <rdg> porqué la estructura no es sistemática y hubiera sido mucho más complicado. 
La primera palabra que suele hacer referencia al texto (que aparece al inicio del aparato crítico) se usa <ref type="texto_poema">. 
Para todas las otras cursivas, de momento usamos <foreign> cuando son palabras en latín. 

En la pestaña de Aparato crítico puede haber dos tipos de secciones: 
Una propiamente de aparato crítico que señala lectura y variantes con los testimonios. 
Por ejemplo: 74 pulchras V, pulcras Na Nb JR
La codificación sería esta: 
<ab resp="#JR">
<span type="link" from="#Od_3_74" n="0">74</span>
        <app>
<lem>pulchras</lem> <wit>V</wit>
</app>, 
<app>
              <rdg>pulcras</rdg> <wit>Na</wit> <wit>Nb</wit> 
</app>
</ab>
Una segunda, la más común, que contiene la referencia al texto y un comentario. 
Se podrían utilizar otros elementos como: 
<term> (términos en latín, prefijos, comentarios sobre las variantes) 
<mentioned> para palabras citadas. 
Sistema de referencias cruzadas: linkGrp, link 

Al final del verso /TEI/text/body/div[@type=“poema”/lg/lg[@type=“estrofa”/l para poder aglutinar todos los comentarios en un dropmenu, se usa un grupo de links o anclas y cada una de ellas contiene uno o diversos elemento <link>. 

<linkGrp>
<link type="a_notas" xml:id="a_Od4_n9"corresp="#Od4_n9"/>
<link type="a_comentarios" xml:id="a_Od4_c7" corresp="#Od4_c7"/>
<link type="a_ls" xml:id="a_Od4_ls12" corresp="#Od4_ls12"/>
</linkGrp>

Racional de los identificadores: 
a_Od4_n9: ancla Oda 4 a la nota 9
a_Od4_c7: ancla Oda 4 al comentario 7
a_Od4_ls12: ancla Oda 4 al locus simile 12 
ENLACES O REFERENCIAS INTERNOS

Cualquier cita al texto del poema se hace con el elemento <ref>: 

<ref type="texto_poema">non animum pigeat patere</ref>

Todo enlace que sea interno a la página de Pronapoli, por ejemplo a Academias o Equipo, debe llevar el @type “link_int”: 
<ref type="link_interno" target="#Od1_ls9">15-17</ref>

Si es un enlace al interno de la edición crítica que salta de tab debe especificarse: 
Hacia los comentarios: @type="link_int_c"
Hacia las notas: @type="link_int_n"
Hacia los loci similes: @type="link_int_ls"

<ref type="link_int_c" target="#Od1_c1_es">Comentario 1</ref>
<ref type="link_int_n" target="#Od1_n12_es">Nota v. 26</ref>
<ref type="link_int_ls" target="#Od1_ls31">Loci similes vv. 49-50</ref>

Para los otros enlaces, se usa este:
<ref type="link_externo" target="http://etc.">texto</ref>

Citas 

Cit > quote > bibl 
Especialmente en los loci similes aparecen referencias con citas, lo marcaremos así: 
<cit>
<quote xml:lang="lat">"seu deos regesque canit […] sive […] pugilemve equomve / dicit […] flebili sponsae iuvenemve raptum / plorat"</quote>
            <bibl type="canon">Hor. Carm. IV. 2. 13–22</bibl>
</cit>

Diferentes tipos de referencias bibliográficas: 

Se añade el tipo genérico y la correspondencia con el identificación de la colección de Zotero, https://www.zotero.org/groups/5225301/pronapoli 
<bibl type="main" corresp="ZQCIPTZH">Czepiel (forthcoming)</bibl>

Cuando son referencias canónicas de autores clásicos o italianos se usa el tipo “canon” y el enlace a una versión en línea del texto. 
<bibl type="canon">Virg. Aen. 4.66</bibl> 
2.1. Para los textos clásicos, se usa la Persus Digital Library http://www.perseus.tufts.edu/hopper/  Debe utilizarse siempre la URI perenne del fragmento, la “Citation URI”. 
2.2. Para los italianos en lengua latina, el portal Poeti d’Italia in Lingua Latina 
Nombres de persona: persName

Debemos distinguir diferentes tipos de nombres de persona, cada uno deberá tener su identificador en el documento general. 
Personajes que aparecen en nuestra galería de autores: @corresp y el enlace. <persName corresp=“https://pronapoli.com/autor/pietro-bembo/”>Pietro Bembo</persName>
¿Qué hacemos con los otros personajes? Ej. Ambrosio de Morales, María de Mendoza, etc. 

CURSIVAS 
Cuando el texto tiene cursivas en principio debe corresponder a uno de estos casos: 
<mentioned>: cuando se refiere a palabras o sintagmas del poema o al que se hace referencia dentro de la narrativa.  
<term>: cuando se refiere a una palabra, un término en latín, por ejemplo. 
<hi>: indica otras cursivas de difícil categorización. Se usará para casos como por ejemplo, “El niño de Venus” en que simplemente el editor quiere subrayar el término.
<foreign>: palabras en otros idiomas, como locus amoenus, emendatio, etc.  
ERRORES
Para indicar los errores o dudas de codificación y que el equipo pueda verlo en el resultado y sean corregidos por los editores, se señala así para que después (a través de la xslt) aparezcan en rojo: 

<hi style="error" select= “mensaje”>(5).</hi>
