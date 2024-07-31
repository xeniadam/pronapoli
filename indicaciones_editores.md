[Español](https://github.com/susannalles/pronapoli/blob/gh-pages/indicaciones_editores.md#indicaciones-para-los-editores) | [English](https://github.com/susannalles/pronapoli/blob/gh-pages/indicaciones_editores.md#guidelines-for-editors)

# <a id="Indicaciones">Indicaciones para los editores</a>

Cada editor debe ser responsable de revisar con mucha antención la versión web de la composición que ha editado. Esta revisión es tan crucial como cuando os mandan las primeras pruebas de maquetación. El texto nunca se revisa lo sufiente. Para llevar a cabo estas revisiones y también para facilitar la codificación posterior de los textos, es conveniente que la redacción se adapte a una serie de convenciones. 

Recordad que la edición es una versión beta, así que agradeceríamos también cualquier idea que pueda facilitar la comprensión y navegación de la edición digital, así como a su mejora en su diseño web. 

Sería interesante que los editores tuvieran en mente la codificación en XML-TEI que se lleva a cabo de sus textos <https://github.com/susannalles/pronapoli/blob/gh-pages/docs.md>. 

## El texto poético

El texto poético aparece siempre a la izquierda de la pantalla, normalmente sin separación de estrofas, y con todos los números de los versos indicados. En principio, no hay tabulaciones diferentes en función del número o tipo de verso. 

Cada verso puede contener un pequeño icono en donde aparecen, en caso de haberlos, las referencias a: Notas, Comentarios y Loci Similes. 

![Menú desplegable con enlace a Notas, Comentarios o Loci Similes](img/001.png)

## Notas, Comentarios,  

Cada nota, comentario o  va seguido de un icono que indica la responsabilidad intelectual de la nota y siempre aparece al final de la nota. La responsabilidad puede ser de uno o más editores, y en todo caso se firma conjuntamente (es decir, no puede haber un párrafo firmado por un editor y el siguiente párrafo por otro). 

![Icono de responsabilidad](img/002.png)

Cada Nota, Comentario o Locus similis va precedido por el número de verso al que hace referencia; este número es clicable y subraya el verso en cuestión. A continuación, puede o no aparecer la palabra o palabras del verso al que la nota hace referencia; esta referencia aparece en un color turquesa. 

## Enlaces

A lo largo de todas las secciones de la edición pueden aparecen enlaces. Es importante que se señale siempre dónde apuntan: 

- Si es un enlace externo, debe añadirse toda la URL. Ej. La Venus de Nilo <https://es.wikipedia.org/wiki/Venus_de_Milo>
- Si es un enlace dentro de la página de Pronapoli, también debe indicarse la URL completa.
- Si se hace referencia a una Nota, un Comentario, o un Loci simile debe indicarse exactamente el número de verso. Por ejemplo, en la [Elegía II](https://pronapoli.com/ediciondigital/elegia2), Nota vv. 1-2, aparece un enlace a Loci similes vv. 1-2. En este caso, el editor debe señalarlo así "Loci similes vv. 1-2". 

## Referencias bibliográficas secundarias

Las referencias bibliográficas secundarias se marcan todas en un elemento XML-TEI llamado `<bibl>` y aparecen después en HTML (en la versión web) con un fondo gris. Si se pasa el cursor por arriba aparece una "pop-up" que dice "Referencia Bibliográfica". Es importante que estas referencias en el cuerpo del texto aparezcan siempre completas (Autor año: página) porque la idea es poder otorgarles un identificador y recuperarlas de manera automática para después crear la bibliografía. Es decir, aunque se mencione el autor unas líneas más arriba, de igual manera ese paréntesis debe estar completo con toda la información.  

![Pop-up Refs secundarias](/img/003.png)

## Referencias bibliográficas primarias y citas

Las referencias bibliográficas primarias, ya sean fuentes clásicas o contemporáneas al autor, también aparecen en fondo gris pero con una pop-up que dice "Fuente". Si la referencia va acompañada de una cita textual, esta aparece en un fondo azul: 

![Citas](/img/004.png)

Todas estas referencias y citas primarias se marcan en XML para que después puedan recuperarse y hacer algunas estadísticas. Por ejemplo, ¿qué porcentaje hay de Cicerón, o de Virgilio, o de Horario? Por ello es muy importante que todos sigamos una misma manera de citar y que siempre aparezca claramente el autor. En la imagen anterior aparece un ejemplo correcto y de fácil recuperación: 

```
"Cita" Autor, Título abreviado, libro, verso
```
Editores: Revisad que todos los colores aparezcan correctamente (azul para citas, fondo gris para referencias bibliográficas). Poned atención si se detectan doblen camillas en las citas. 

## Aparto crítico 

El modelo a seguir es el de la [Elegía II](https://pronapoli.com/ediciondigital/elegia2). Primero se indica el término o lema (que aparece en turquesa) seguido de la variante y de los testimonios que incluyen esa variante. En una línea diferente se incluye cualquier tipo de nota explicativa ya sea sobre esa variante, sobre otros testimonios, la justificación del editor, etc. 

```txt
número de verso + lema + variantes + testimonios 
nota en un nuevo párrafo
```

Como aparece en la siguiente imagen: 

![Aparato crítico](/img/005.png)

## Otros consejos 

- Comprobad que las cursivas que habíais puesto en vuestros documentos se mantienen en la versión web.
- Comprobad que no haya ninguna paralabra o fragmento en rojo. Si algo aparece en rojo, es que hemos detectado un error.
- Comprobad que todos los enlaces funcionan (se nos puede haber escapado alguno o que haya algún error).
- Cuando se mandan las revisiones, por favor, seguid el modelo: 

```txt
Em la Composición <http//enlace>, sección X, Nota VV. 51-51: donde dice "bla bla" debe decir "ble ble".
En la Canción V, https://pronapoli.com/ediciondigital/cancion5, sección Notas 61-62: donde dice "de la tierra al sembrarla" debe decur "del cielo a la tierra".
En la Oda II, https://pronapoli.com/ediciondigital/oda2, sección Contexto, 2 párrafo: donde dice "un expediente" debe decir "un experimento".  
```
Cualquier duda que os pudiera surgir, podéis escribirnos a [Eugenia](mailto:eugeniafosalba@gmail.com) y [Susanna](mailto:susannalles@gmail.com).

# <a id="Guidelines">Guidelines for Editors</a>

Each editor must be responsible for carefully reviewing the web version of the composition they have edited. This review is as crucial as when you receive the first layout proofs. The text is never reviewed enough! To carry out these reviews and also to facilitate the subsequent encoding of the texts, it is advisable that the writing adapts to a series of conventions.

Remember that the edition is a beta version, so we would also appreciate any ideas that could facilitate the understanding and navigation of the digital edition, as well as its improvement in web design.

It would be interesting for the editors to keep in mind the XML-TEI encoding that is applied to their texts: <https://github.com/susannalles/pronapoli/blob/gh-pages/docs.md>.

## The Poem

Poems always appears on the left side of the screen, usually without stanza separation, and with all the line numbers indicated. In principle, there are no different tabulations based on the number or type of line.

Each line may contain a small icon where references to Notes, Comments, and Loci Similes appear, if there are any.

![Dropdown menu with links to Notes, Comments and Loci similes](img/001.png)

## Notes, Comments, Loci Similes

Each note, comment, or locus simili is followed by an icon indicating the intellectual responsibility for the note, which always appears at the end of the note. The responsibility can be attributed to one or more editors, and in any case, it is signed jointly (that is, a paragraph cannot be signed by one editor and the next paragraph by another).

![Responsability Icon](img/002.png)

Each Note, Comment, or Locus Simili is preceded by the line number it refers to; this number is clickable and highlights the line in question. Next, the word or words of the line to which the note refers may or may not appear; this reference appears in turquoise.

## Links

Throughout all the sections of the edition, links may appear. It is important to always indicate where they point to:

- If it is an external link, the full URL must be added. For example, La Venus de Milo <https://es.wikipedia.org/wiki/Venus_de_Milo>
- If it is a link within the Pronapoli page, the full URL must also be indicated.
- If referring to a Note, Comment, or Loci Similes, the exact line number must be indicated. For example, in [Elegy II](https://pronapoli.com/ediciondigital/elegia2), Note vv. 1-2, there is a link to Loci Similes vv. 1-2. In this case, the editor should indicate it as "Loci Similes vv. 1-2".

## Secondary Bibliographic References

All secondary bibliographic references are marked in an XML-TEI element called `<bibl>` and appear later in HTML (in the web version) with a gray background. When hovering over them, a pop-up appears that says "Bibliographic Reference." It is important that these references in the body of the text always appear complete (Author year: page) because the idea is to assign them an identifier and retrieve them automatically to create the bibliography. That is, even if the author is mentioned a few lines above, the parenthesis should still include all the information.

![Pop-up Refs secundarias](/img/003.png)

## Primary Bibliographic References and Quotes 

Las referencia bibliográficas primarias, ya sean fuentes clásicas o contemporáneas al autor, también aparecen en fondo gris pero con una pop-up que dice "Fuente". Si la referencia va acompañada de una cita textual, esta aparece en un fondo azul:

![Quotes](/img/004.png)

All these references and primary quotes are marked in XML so they can be retrieved later to generate some statistics. For example, what percentage is from Cicero, Virgil, or Horace? Therefore, it is very important that we all follow the same citation method and that the author always appears clearly. The previous image shows a correct and easily retrievable example:

```txt
"Quote" Author, Abbreviated Title, book, line
```

Editors: Check that all colors appear correctly (blue for quotes, gray background for bibliographic references). Pay attention if double quotation marks are detected in the quotes.

## Critical Apparatus

The model to follow is that of [Elegy II](https://pronapoli.com/ediciondigital/elegia2). First, the term or lemma is indicated (appearing in turquoise) followed by the variant and the testimonies that include that variant. Any explanatory note, whether about that variant, other testimonies, the editor's justification, etc., is included on a separate line.

```txt
line number + lemma + variants + testimonies 
note in a new paragraph
```

As shown in the following image:

![Critical apparatus](/img/005.png)

## Other Tips

- Check that the italics you included in your documents are preserved in the web version.
- Check that there are no words or fragments in red. If something appears in red, it means we have detected an error.
- Check that all links work (we may have missed some or there may be an error).
- When sending revisions, please follow this model:

```txt
In the Composition <http://link>, section X, Note vv. 51-51: where it says "bla bla" it should say "ble ble".
In Song V, https://pronapoli.com/ediciondigital/cancion5, section Notes 61-62: where it says "de la tierra al sembrarla" it should say "del cielo a la tierra".
In Ode II, https://pronapoli.com/ediciondigital/oda2, section Context, 2nd paragraph: where it says "un expediente" it should say "un experimento".
```

Any question you may have, please write to both of us [Eugenia](mailto:eugeniafosalba@gmail.com) and [Susanna](mailto:susannalles@gmail.com). 

