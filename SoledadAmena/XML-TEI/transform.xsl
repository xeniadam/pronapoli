<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">

	<xsl:strip-space elements="tei:cit"/>

	<!-- ESTRUCTURA HTML -->
	<xsl:template match="/">
		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>

				<title>Edición digital: <xsl:apply-templates
						select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang = 'es']"
					/>, <xsl:apply-templates
						select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></title>

				<link href="css/halfmoon.min.css" rel="stylesheet"/>
				<link href="css/estilo.css" rel="stylesheet"/>
				<link
					href="//fonts.googleapis.com/css?family=Playfair+Display:400,700|Roboto:100,300,400"
					rel="stylesheet" type="text/css"/>

			</head>
			<body class="ps-md-sbwidth">
				<div id="header" class="header">
					<div class="logo">
						<a href="https://pronapoli.com">
							<img
								src="https://pronapoli.com/wp-content/themes/garcilaso/dist/images/logo.png"
								alt="Pronapoli"/>
						</a>
					</div>
					<div class="headercentro">
						<a href="/soledadamena/">Soledad amena</a>
					</div>
					<div class="headerderecha">
						<!-- <a href="#">Español</a> | <a href="#">Inglés</a> -->
						<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
							data-bs-target="#menuprin">
							<span class="navbar-toggler-icon"/>
						</button>
					</div>
				</div>
				<div class="encabezado" id="encabezado">
					<div class="infos text-start">
						<h2><xsl:apply-templates
								select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>,
								<xsl:apply-templates
								select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang = 'es']"
							/></h2>
					</div>
				</div>

				<nav class="sidebar offcanvas-start offcanvas-md" tabindex="-1" id="elpoema">
					<div
						class="offcanvas-header border-bottom border-secondary border-opacity-25 titulopoema">
						<xsl:apply-templates select="//tei:div[@type = 'poema']/tei:lg/tei:head"/>
						<!-- Ajuste para la égloga 2: -->
						<xsl:apply-templates select="//tei:div[@type = 'poema']/tei:head"/>

					</div>
					<div class="offcanvas-body text-start" id="poemacont">
						<div class="mt-2 mb-3">
							<div class="poema" id="poema">
								<button id="closepoema" type="button" class="btn-close"
									aria-label="Close"/>

								<!---->
								<xsl:apply-templates
									select="//tei:div[@type = 'poema']/tei:lg/tei:lg"/>
								<!-- Ajuste para la égloga 2: -->
								<xsl:apply-templates select="//tei:div[@type = 'poema']/tei:sp"/>
							</div>
						</div>

					</div>
				</nav>

				<div class="container creditos" id="creditos">
					<div class="row">
						<div class="col">

							<div class="creditoscont text-start">
								<!-- Cómo citar la oda -->
								<p>
									<xsl:apply-templates
										select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>
									<xsl:text>, </xsl:text>
									<i>
										<xsl:apply-templates
											select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang = 'es']"
										/><xsl:text>, </xsl:text>
									</i>
									<xsl:text> editada por </xsl:text>
									<xsl:apply-templates
										select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[@resp = 'editor_filologico']/tei:persName"/>
									<xsl:text>. En: </xsl:text>
									<i>
										<xsl:text>Soledad amena. </xsl:text>
									</i>
									<xsl:text>Edición crítica y digital de la obra poética de Garcilaso de la Vega, dir. E. Fosalba, Pronapoli, 2024. </xsl:text>
									<xsl:text>&lt;</xsl:text>
									<xsl:apply-templates
										select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type = 'url_poema']"
									/><xsl:text>&gt;</xsl:text>.
									<xsl:text>[Fecha de consulta]</xsl:text>
								</p>
							</div>
						</div>

					</div>
					<div class="descargar" id="descargar">
						<img src="images/tei.png" alt="TEI"/>
						<a
							href="https://github.com/susannalles/pronapoli/tree/gh-pages/SoledadAmena"
							>Descarga el archivo XML-TEI</a>
					</div>
				</div>

				<div class="container contenido">

					<div class="row mt-4">
						<div class="col">
							<nav>
								<div class="nav nav-tabs" id="js-tabs-2" role="tablist">
									<button class="nav-link active" id="nav-contexto-tab"
										data-bs-toggle="tab" data-bs-target="#nav-contexto"
										type="button" role="tab" aria-controls="nav-contexto"
										aria-selected="true">Contexto</button>

									<button class="nav-link" id="nav-metrica-tab"
										data-bs-toggle="tab" data-bs-target="#nav-metrica"
										type="button" role="tab" aria-controls="nav-metrica"
										aria-selected="false">Métrica</button>
									<!-- La pestaña de traducción aparece solo si existe una: -->
									<xsl:if
										test="//tei:text/tei:body/tei:div[@type = 'poema_traduccion']">
										<button class="nav-link" id="nav-traduccion-tab"
											data-bs-toggle="tab" data-bs-target="#nav-traduccion"
											type="button" role="tab" aria-controls="nav-traduccion"
											aria-selected="false">Traducción</button>
									</xsl:if>
									<button class="nav-link" id="nav-notas-tab" data-bs-toggle="tab"
										data-bs-target="#nav-notas" type="button" role="tab"
										aria-controls="nav-notas" aria-selected="false"
										>Notas</button>
									<button class="nav-link" id="nav-comentarios-tab"
										data-bs-toggle="tab" data-bs-target="#nav-comentarios"
										type="button" role="tab" aria-controls="nav-comentarios"
										aria-selected="false">Comentarios</button>
									<button class="nav-link" id="nav-locisimiles-tab"
										data-bs-toggle="tab" data-bs-target="#nav-locisimiles"
										type="button" role="tab" aria-controls="nav-locisimiles"
										aria-selected="false">Loci similes</button>
									<button class="nav-link" id="nav-aptcrit-tab"
										data-bs-toggle="tab" data-bs-target="#nav-aptcrit"
										type="button" role="tab" aria-controls="nav-aptcrit"
										aria-selected="false">AptCrit</button>
									<button class="nav-link" id="nav-bibliografia-tab"
										data-bs-toggle="tab" data-bs-target="#nav-bibliografia"
										type="button" role="tab" aria-controls="nav-bibliografia"
										aria-selected="false">Bibliografía</button>
								</div>
							</nav>
							<div class="tab-content text-start" id="js-tabs-content-2">
								<div class="tab-pane fade show active" id="nav-contexto"
									role="tabpanel" aria-labelledby="nav-contexto-tab" tabindex="0">
									<h3>Contexto y datación</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'contexto']/tei:div[@xml:lang = 'es']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-metrica" role="tabpanel"
									aria-labelledby="nav-metrica-tab" tabindex="0">
									<h3>Métrica</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'metrica']/tei:div[@xml:lang = 'es']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-traduccion" role="tabpanel"
									aria-labelledby="nav-traduccion-tab" tabindex="0">
									<h3>Traducción</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'poema_traduccion']/tei:lg[@xml:lang = 'es']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-notas" role="tabpanel"
									aria-labelledby="nav-notas-tab" tabindex="0">
									<h3>Notas</h3>

									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'notas']/tei:note/tei:note[@xml:lang = 'es']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-comentarios" role="tabpanel"
									aria-labelledby="nav-comentarios-tab" tabindex="0">
									<h3>Comentarios</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'comentarios']/tei:note/tei:note[@xml:lang = 'es']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-locisimiles" role="tabpanel"
									aria-labelledby="nav-locisimiles-tab" tabindex="0">
									<h3>Loci similes</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'loci_similes']"
									/>
								</div>
								<div class="tab-pane fade" id="nav-aptcrit" role="tabpanel"
									aria-labelledby="nav-aptcrit-tab" tabindex="0">
									<h3>Aparato Crítico</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'ApCrit']"/>
								</div>
								<div class="tab-pane fade" id="nav-bibliografia" role="tabpanel"
									aria-labelledby="nav-bibliografia-tab" tabindex="0">
									<h3>Bibliografía</h3>
									<xsl:apply-templates
										select="//tei:text/tei:body/tei:div[@type = 'bibliografia']/tei:listBibl"
									/>
								</div>
							</div>
						</div>
					</div>



				</div>

				<!-- Menu principal de Pronapoli (fijo): -->
				<div class="offcanvas offcanvas-start" tabindex="-1" id="menuprin"
					aria-labelledby="offcanvas-title-1">
					<button type="button" class="btn-close closemenuprin"
						data-bs-dismiss="offcanvas" aria-label="Close"/>
					<div class="menuprincont">
						<a class="brand" href="https://pronapoli.com/">
							<img
								src="https://pronapoli.com/wp-content/themes/garcilaso/dist/images/logo.png"
								class="hidden-xs hidden-sm" alt="Pronapoli"/>
						</a>
						<ul>
							<li>
								<a title="Acerca del proyecto"
									href="https://pronapoli.com/acerca-del-proyecto/">Acerca del
									proyecto</a>
							</li>
							<li>
								<a title="Galería de autores" href="https://pronapoli.com/autores/"
									>Galería de autores</a>
							</li>
							<li>
								<a title="Academias" href="https://pronapoli.com/academias/"
									>Academias</a>
							</li>
							<li>
								<a title="Biblioteca Digital"
									href="https://pronapoli.com/biblioteca-digital/">Biblioteca
									Digital</a>
							</li>
							<li>
								<a title="Bibliografía" href="#menu-bibliografia"
									class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#menu-bibliografia"
									aria-expanded="true" aria-controls="menu-bibliografia"
									>Bibliografía <span class="chevron"/></a>
								<ul role="menu" class="accordion-collapse collapse"
									id="menu-bibliografia">
									<li
										class="menu-item menu-item-type-post_type_archive menu-item-object-bib_primaria menu-item-75">
										<a title="Bibliografía primaria"
											href="https://pronapoli.com/bibliografia/primaria/"
											>Bibliografía primaria</a>
									</li>
									<li
										class="menu-item menu-item-type-post_type_archive menu-item-object-bib_secundaria menu-item-76">
										<a title="Bibliografía secundaria"
											href="https://pronapoli.com/bibliografia/secundaria/"
											>Bibliografía secundaria</a>
									</li>
								</ul>
							</li>
							<li>
								<a title="Publicaciones" href="https://pronapoli.com/publicaciones/"
									>Publicaciones</a>
							</li>
							<li>
								<a title="Equipo" href="https://pronapoli.com/equipo/">Equipo</a>
							</li>
							<li>
								<a title="Catálogo de impresos"
									href="https://pronapoli.com/impresos/">Catálogo de impresos</a>
							</li>
							<li>
								<a title="Centros de documentación"
									href="https://pronapoli.com/centros-de-documentacion-2/">Centros
									de documentación</a>
							</li>
							<li>
								<a title="Blog" href="https://pronapoli.com/blog/">Blog</a>
							</li>
							<li>
								<a title="Studia Aurea" href="https://pronapoli.com/studia-aurea/"
									>Studia Aurea</a>
							</li>
							<li>
								<a title="Política y derechos Pronapoli"
									href="https://pronapoli.com/politica-y-derechos-pronapoli/"
									>Política y derechos Pronapoli</a>
							</li>
						</ul>

						<div class="header-contact">
							<h2>Contacto</h2>
							<a href="mailto:garcilasoenitalia@gmail.com"
								>garcilasoenitalia@gmail.com</a>
							<a href="http://www.udg.edu/" target="_blank">
								<img
									src="https://pronapoli.com/wp-content/themes/garcilaso/dist/images/universitat-de-girona.png"
									alt="Universitat de Girona"/>
							</a>
						</div>

					</div>
				</div>
				<div id="footercont"/>
				<script src="js/getfooter.js"/>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"/>
				<script src="js/scroll.js"/>
				<script src="js/scripts.js"/>

			</body>
		</html>
	</xsl:template>


	<xsl:template match="titleStmt/title[@xml:lang = 'es'] | titleStmt/author">
		<h2>
			<xsl:apply-templates/>
		</h2>
	</xsl:template>
	<xsl:template match="titleStmt/title[@xml:lang = 'en']"/>


	<!-- Sintagmas o palabras en cursiva:-->
	<xsl:template match="tei:title | tei:mentioned | tei:foreign | tei:term | tei:abbr">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>

	<xsl:template match="tei:hi">
		<xsl:if test="contains(@style, 'italic')">
			<i>
				<xsl:apply-templates/>
			</i>
		</xsl:if>
		<xsl:if test="contains(@style, 'superscript')">
			<sup>
				<xsl:apply-templates/>
			</sup>
		</xsl:if>
		<xsl:if test="contains(@style, 'bold')">
			<b>
				<xsl:apply-templates/>
			</b>
		</xsl:if>
		<xsl:if test="contains(@style, 'error')">
			<span style="color:red" class="ttip" data-bs-toggle="tooltip" data-bs-title="revisar">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</xsl:template>

	<!-- Secciones que no aparecen en la salida web: -->
	<xsl:template match="sourceDesc"/>
	<xsl:template match="profileDesc"/>
	<xsl:template match="encodingDesc"/>
	<xsl:template match="revisionDesc"/>

	<!-- Modelo para crear enlace web con el contenido de elemento: -->
	<!--<xsl:template match="idno | licence | ref | span">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="."/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>-->

	<!-- PÁRRAFOS Y SECCIONES CON iICONO, IDENTIFICADOR Y AUTORÍA  -->
	<xsl:template match="tei:ab | tei:note | tei:p">
		<p>
			<xsl:apply-templates/>

			<xsl:if test="contains(@resp, '#BM')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">BM<i class="tooltiptext">Bienvenido
					Morros</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#CC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati"
					data-bs-content="20/04/2024">CC<i class="tooltiptext">Claudia
					Corfiati</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1CC-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Laura Avella"
					data-bs-content="20/04/2024">CC &amp; LA<i class="tooltiptext">Claudia Corfiati
						&amp; Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2CC-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC &amp; VC<i class="tooltiptext">Claudia Corfiati
						&amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3CC-FE-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Claudia Corfiati, Francisco Escobar &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC, FE &amp; VC<i class="tooltiptext">Claudia
						Corfiati, Francisco Escobar &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4CC-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Francisco Escobar"
					data-bs-content="20/04/2024">CC, &amp; FE <i class="tooltiptext">Claudia
						Corfiati &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5CC-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Lara Vilà"
					data-bs-content="20/04/2024">CC, &amp; LV <i class="tooltiptext">Claudia
						Corfiati &amp; Lara Vilà</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#EF')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Eugenia Fosalba"
					data-bs-content="20/04/2024">EF<i class="tooltiptext">Eugenia Fosalba</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francesco Tateo"
					data-bs-content="20/04/2024">FT<i class="tooltiptext">Francesco Tateo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francisco Escobar"
					data-bs-content="20/06/2024">FE<i class="tooltiptext">Francisco
					Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">GT<i class="tooltiptext">Gáldrick de la
					Torre</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1GT-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT &amp; FE<i class="tooltiptext">Gáldrick de la
						Torre &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2GT-RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Roland Béhar"
					data-bs-content="20/04/2024">GT &amp; RB<i class="tooltiptext">Gáldrick de la
						Torre &amp; Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3GT-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Veronica Copello"
					data-bs-content="20/04/2024">GT &amp; VC<i class="tooltiptext">Gáldrick de la
						Torre &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4GT-LV-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre, Lara Vila &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT, LV &amp; FE<i class="tooltiptext">Gáldrick de
						la Torre, Lara Vila &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5GT-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Lara Vila"
					data-bs-content="20/04/2024">GT &amp; LV <i class="tooltiptext">Gáldrick de la
						Torre &amp; Lara Vila </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Guada Guassardo"
					data-bs-content="20/06/2024">GG<i class="tooltiptext">Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Joseph Reed" data-bs-content="20/04/2024"
						>JR<i class="tooltiptext">Joseph Reed</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Juan Alcina" data-bs-content="20/04/2024"
						>JA<i class="tooltiptext">Juan Alcina</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Laura Avella"
					data-bs-content="20/06/2024">LA<i class="tooltiptext">Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà" data-bs-content="20/06/2024"
						>LV<i class="tooltiptext">Lara Vilà</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1LV-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Veronica Copello"
					data-bs-content="20/06/2024">LV &amp; VC<i class="tooltiptext">Lara Vilà &amp;
						Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2LV-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Laura Avella"
					data-bs-content="20/06/2024">LV &amp; LA<i class="tooltiptext">Lara Vilà &amp;
						Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3LV-GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Guada Guassardo"
					data-bs-content="20/06/2024">LV &amp; GG<i class="tooltiptext">Lara Vilà &amp;
						Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Maria Czepiel"
					data-bs-content="20/04/2024">MC<i class="tooltiptext">Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Mark Riley" data-bs-content="20/04/2024"
						>MR<i class="tooltiptext">Mark Riley</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RL')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Rodney Lokaj"
					data-bs-content="20/04/2024">RL<i class="tooltiptext">Rodney Lokaj </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar"
					data-bs-content="20/04/2024">RB<i class="tooltiptext">Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1RB-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar &amp; Francisco Escobar"
					data-bs-content="20/04/2024">RB &amp; FE<i class="tooltiptext">Roland Béhar
						&amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#EuFoMaCz')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">EF &amp; MC<i class="tooltiptext">Eugenia Fosalba
						&amp; Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Veronica Copello"
					data-bs-content="20/06/2024">VC<i class="tooltiptext">Veronica
					Copello</i></span>
			</xsl:if>


		</p>

	</xsl:template>

	<xsl:template match="tei:expan">
		<xsl:apply-templates/>
		<xsl:if test="contains(@resp, '#BM')">
			<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
				data-bs-placement="top" data-bs-title="Bienvenido Morros"
				data-bs-content="20/04/2024">BM<i class="tooltiptext">Bienvenido Morros</i></span>
		</xsl:if>
		<xsl:if test="contains(@resp, '#EF')">
			<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
				data-bs-placement="top" data-bs-title="Eugenia Fosalba" data-bs-content="20/04/2024"
					>EF<i class="tooltiptext">Eugenia Fosalba</i></span>
		</xsl:if>
	</xsl:template>

	<xsl:template
		match="//tei:text/tei:body/tei:div[@type = 'comentarios']/tei:note/tei:note | //tei:text/tei:body/tei:div[@type = 'notas']/tei:note/tei:note">
		<xsl:element name="p">
			<xsl:attribute name="id">
				<xsl:value-of select="@xml:id"/>
			</xsl:attribute>

			<xsl:if test="contains(@type, 'comentario_intro_es')">
				<xsl:attribute name="class">
					<xsl:text>p_intro</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<!-- para las notas no funciona (8 mayo 2024) -->
			<xsl:if test="contains(@type, 'nota_intro_es')">
				<xsl:attribute name="class">
					<xsl:text>p_intro</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="contains(@type, 'ls_intro')">
				<xsl:attribute name="class">
					<xsl:text>p_intro</xsl:text>
				</xsl:attribute>
			</xsl:if>

			<!--<p id="{@xml:id}">-->
			<xsl:apply-templates/>
			<!-- aquí poner Autorías -->
			<xsl:if test="contains(@resp, '#BM')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">BM<i class="tooltiptext">Bienvenido
					Morros</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#CC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati"
					data-bs-content="20/04/2024">CC<i class="tooltiptext">Claudia
					Corfiati</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1CC-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Laura Avella"
					data-bs-content="20/04/2024">CC &amp; LA<i class="tooltiptext">Claudia Corfiati
						&amp; Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2CC-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC &amp; VC<i class="tooltiptext">Claudia Corfiati
						&amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3CC-FE-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Claudia Corfiati, Francisco Escobar &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC, FE &amp; VC<i class="tooltiptext">Claudia
						Corfiati, Francisco Escobar &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4CC-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Francisco Escobar"
					data-bs-content="20/04/2024">CC, &amp; FE <i class="tooltiptext">Claudia
						Corfiati &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5CC-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Lara Vilà"
					data-bs-content="20/04/2024">CC, &amp; LV <i class="tooltiptext">Claudia
						Corfiati &amp; Laura Vilà</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#EF')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Eugenia Fosalba"
					data-bs-content="20/04/2024">EF<i class="tooltiptext">Eugenia Fosalba</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francesco Tateo"
					data-bs-content="20/04/2024">FT<i class="tooltiptext">Francesco Tateo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francisco Escobar"
					data-bs-content="20/06/2024">FE<i class="tooltiptext">Francisco
					Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">GT<i class="tooltiptext">Gáldrick de la
					Torre</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1GT-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT &amp; FE<i class="tooltiptext">Gáldrick de la
						Torre &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2GT-RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Roland Béhar"
					data-bs-content="20/04/2024">GT &amp; RB<i class="tooltiptext">Gáldrick de la
						Torre &amp; Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3GT-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Veronica Copello"
					data-bs-content="20/04/2024">GT &amp; VC<i class="tooltiptext">Gáldrick de la
						Torre &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4GT-LV-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre, Lara Vila &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT, LV &amp; FE<i class="tooltiptext">Gáldrick de
						la Torre, Lara Vila &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5GT-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Lara Vila"
					data-bs-content="20/04/2024">GT &amp; LV <i class="tooltiptext">Gáldrick de la
						Torre &amp; Lara Vila </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Guada Guassardo"
					data-bs-content="20/06/2024">GG<i class="tooltiptext">Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Joseph Reed" data-bs-content="20/04/2024"
						>JR<i class="tooltiptext">Joseph Reed</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Juan Alcina" data-bs-content="20/04/2024"
						>JA<i class="tooltiptext">Juan Alcina</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Laura Avella"
					data-bs-content="20/06/2024">LA<i class="tooltiptext">Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà" data-bs-content="20/06/2024"
						>LV<i class="tooltiptext">Lara Vilà</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1LV-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Veronica Copello"
					data-bs-content="20/06/2024">LV &amp; VC<i class="tooltiptext">Lara Vilà &amp;
						Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2LV-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Laura Avella"
					data-bs-content="20/06/2024">LV &amp; LA<i class="tooltiptext">Lara Vilà &amp;
						Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3LV-GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Guada Guassardo"
					data-bs-content="20/06/2024">LV &amp; GG<i class="tooltiptext">Lara Vilà &amp;
						Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Maria Czepiel"
					data-bs-content="20/04/2024">MC<i class="tooltiptext">Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Mark Riley" data-bs-content="20/04/2024"
						>MR<i class="tooltiptext">Mark Riley</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RL')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Rodney Lokaj"
					data-bs-content="20/04/2024">RL<i class="tooltiptext">Rodney Lokaj </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar"
					data-bs-content="20/04/2024">RB<i class="tooltiptext">Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1RB-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar &amp; Francisco Escobar"
					data-bs-content="20/04/2024">RB &amp; FE<i class="tooltiptext">Roland Béhar
						&amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#EuFoMaCz')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">EF &amp; MC<i class="tooltiptext">Eugenia Fosalba
						&amp; Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Veronica Copello"
					data-bs-content="20/06/2024">VC<i class="tooltiptext">Veronica
					Copello</i></span>
			</xsl:if>
			<!--</p>-->
		</xsl:element>
	</xsl:template>


	<xsl:template match="tei:div[@type = 'loci_similes']/tei:note">
		<p id="{@xml:id}">
			<xsl:apply-templates/>
			<xsl:if test="contains(@resp, '#BM')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">BM<i class="tooltiptext">Bienvenido
					Morros</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#CC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati"
					data-bs-content="20/04/2024">CC<i class="tooltiptext">Claudia
					Corfiati</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1CC-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Laura Avella"
					data-bs-content="20/04/2024">CC &amp; LA<i class="tooltiptext">Claudia Corfiati
						&amp; Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2CC-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC &amp; VC<i class="tooltiptext">Claudia Corfiati
						&amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3CC-FE-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Claudia Corfiati, Francisco Escobar &amp; Veronica Copello"
					data-bs-content="20/04/2024">CC, FE &amp; VC<i class="tooltiptext">Claudia
						Corfiati, Francisco Escobar &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4CC-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Francisco Escobar"
					data-bs-content="20/04/2024">CC, &amp; FE <i class="tooltiptext">Claudia
						Corfiati &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5CC-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Claudia Corfiati  Lara Vilà"
					data-bs-content="20/04/2024">CC, &amp; LV <i class="tooltiptext">Claudia
						Corfiati &amp; Lara Vilà</i></span>
			</xsl:if>

			<xsl:if test="contains(@resp, '#EF')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Eugenia Fosalba"
					data-bs-content="20/04/2024">EF<i class="tooltiptext">Eugenia Fosalba</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francesco Tateo"
					data-bs-content="20/04/2024">FT<i class="tooltiptext">Francesco Tateo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Francisco Escobar"
					data-bs-content="20/06/2024">FE<i class="tooltiptext">Francisco
					Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GT')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">GT<i class="tooltiptext">Gáldrick de la
					Torre</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1GT-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT &amp; FE<i class="tooltiptext">Gáldrick de la
						Torre &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2GT-RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Roland Béhar"
					data-bs-content="20/04/2024">GT &amp; RB<i class="tooltiptext">Gáldrick de la
						Torre &amp; Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3GT-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre &amp; Veronica Copello"
					data-bs-content="20/04/2024">GT &amp; VC<i class="tooltiptext">Gáldrick de la
						Torre &amp; Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#4GT-LV-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top"
					data-bs-title="Galdrick de la Torre, Lara Vila &amp; Francisco Escobar"
					data-bs-content="20/04/2024">GT, LV &amp; FE<i class="tooltiptext">Gáldrick de
						la Torre, Lara Vila &amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#5GT-LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Galdrick de la Torre &amp; Lara Vila"
					data-bs-content="20/04/2024">GT &amp; LV <i class="tooltiptext">Gáldrick de la
						Torre &amp; Lara Vila </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Guada Guassardo"
					data-bs-content="20/06/2024">GG<i class="tooltiptext">Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Joseph Reed" data-bs-content="20/04/2024"
						>JR<i class="tooltiptext">Joseph Reed</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#JA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Juan Alcina" data-bs-content="20/04/2024"
						>JA<i class="tooltiptext">Juan Alcina</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Laura Avella"
					data-bs-content="20/06/2024">LA<i class="tooltiptext">Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#LV')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà" data-bs-content="20/06/2024"
						>LV<i class="tooltiptext">Lara Vilà</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1LV-VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Veronica Copello"
					data-bs-content="20/06/2024">LV &amp; VC<i class="tooltiptext">Lara Vilà &amp;
						Veronica Copello</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#2LV-LA')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Laura Avella"
					data-bs-content="20/06/2024">LV &amp; LA<i class="tooltiptext">Lara Vilà &amp;
						Laura Avella</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#3LV-GG')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Lara Vilà &amp; Guada Guassardo"
					data-bs-content="20/06/2024">LV &amp; GG<i class="tooltiptext">Lara Vilà &amp;
						Guada Guassardo</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Maria Czepiel"
					data-bs-content="20/04/2024">MC<i class="tooltiptext">Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#MR')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Mark Riley" data-bs-content="20/04/2024"
						>MR<i class="tooltiptext">Mark Riley</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RL')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Rodney Lokaj"
					data-bs-content="20/04/2024">RL<i class="tooltiptext">Rodney Lokaj </i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#RB')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar"
					data-bs-content="20/04/2024">RB<i class="tooltiptext">Roland Béhar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#1RB-FE')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Roland Béhar &amp; Francisco Escobar"
					data-bs-content="20/04/2024">RB &amp; FE<i class="tooltiptext">Roland Béhar
						&amp; Francisco Escobar</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#EuFoMaCz')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Bienvenido Morros"
					data-bs-content="20/04/2024">EF &amp; MC<i class="tooltiptext">Eugenia Fosalba
						&amp; Maria Czepiel</i></span>
			</xsl:if>
			<xsl:if test="contains(@resp, '#VC')">
				<span class="tooltipx ttip infoicon2 popo" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-title="Veronica Copello"
					data-bs-content="20/06/2024">VC<i class="tooltiptext">Veronica
					Copello</i></span>
			</xsl:if>
		</p>
	</xsl:template>

	<!-- SECCIONES GENERALES PARA COMENTARIOS Y NOTAS  -->

	<xsl:template match="//tei:text/tei:body/tei:div[@type = 'notas']">
		<div class="notas">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!--<xsl:template match="div[@type = 'comentarios']">
		<div class="comentarios">
			<xsl:apply-templates/>
		</div>
	</xsl:template>-->

	<!--<xsl:template match="div[@type = 'loci_similes']">
		<div class="loci_similes">
			<xsl:apply-templates/>
		</div>
	</xsl:template>-->

	<!--	<xsl:template match="div[@type = 'loci_similes']/note">
		<p id="{@xml:id}">
			<xsl:apply-templates/>
		</p>
	</xsl:template>-->

	<!--	<xsl:template match="//tei:text/tei:body/tei:div[@type = 'loci_similes']/tei:note">
		<p id="{@xml:id}">
			<xsl:apply-templates/>
		</p>
	</xsl:template>-->

	<!--	<xsl:template match="div[@type = 'metrica']/div[@xml:lang = 'en']">
		<div class="metrica">
			<xsl:apply-templates/>
		</div>
	</xsl:template>-->

	<!-- OTROS TIPOS DE NOTAS DIFERENTES-->

	<xsl:template match="tei:note[@type = 'n_ApCrit']">
		<xsl:if test="preceding-sibling::tei:app">
			<br/>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="//tei:note[@type = 'n_ApCrit']/tei:lg[@type = 'estrofa']">
		<div class="estrofa">
			<xsl:for-each select="tei:l">
				<xsl:apply-templates/>
				<span class="num_espacio_versos">
					<xsl:value-of select="@n"/>
				</span>
				<br/>
			</xsl:for-each>

		</div>
	</xsl:template>


	<!--LISTAS -->
	<xsl:template match="tei:p/tei:lg/tei:l">
		<div>
			<xsl:apply-templates/>
			<br/>
		</div>
	</xsl:template>

	<xsl:template match="tei:list">
		<ol type="a">
			<xsl:for-each select="tei:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>

		</ol>
	</xsl:template>

	<xsl:template match="tei:list[@style = 'ul_list']">
		<ul>
			<h5>
				<xsl:apply-templates select="tei:head"/>
			</h5>
			<xsl:for-each select="tei:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>

		</ul>
	</xsl:template>


	<xsl:template match="tei:lb">
		<xsl:apply-templates/>
		<br/>

	</xsl:template>

	<xsl:template match="tei:label">
		<h4>
			<xsl:apply-templates/>
		</h4>
	</xsl:template>


	<!-- NOMBRES DE PERSONAS -->
	<xsl:template match="tei:persName">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@ref"/>
			</xsl:attribute>
			<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


	<!-- CITAS Y BIBLIOGRAFÍA -->

	<xsl:template match="tei:bibl[@type = 'main']">
		<span class="ttip" data-bs-toggle="tooltip" data-bs-title="Referencia bibliográfica">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="tei:listBibl[@type = 'final']/tei:bibl">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="tei:bibl[@type = 'canon']">
		<span class="ttip" data-bs-toggle="tooltip" data-bs-title="Fuente">
			<xsl:apply-templates/>
		</span>
		<xsl:if test="following-sibling::tei:quote">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="tei:quote">
		<!--<xsl:text>  </xsl:text>-->
		<q>
			<xsl:apply-templates/>
		</q>
		<xsl:text>  </xsl:text>
	</xsl:template>

	<xsl:template match="tei:cit[@type = 'blockquote']">
		<blockquote>
			<xsl:apply-templates/>
		</blockquote>
	</xsl:template>

	<!-- BIBLIOGRAFÍA FINAL  -->
	<xsl:template match="tei:div[@type = 'bibliografia']/tei:listBibl/tei:bibl/tei:title">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>


	<!-- SECCIÓN DEL POEMA ORIGINAL -->

	<!-- Modificación para la Égloga 2 que no tiene lg -->
	<xsl:template
		match="tei:div[@type = 'poema']/tei:lg/tei:head/tei:title | tei:div[@type = 'poema']/tei:head/tei:title">
		<h4 id="{@xml:id}">
			<xsl:apply-templates/>
		</h4>
	</xsl:template>

	<xsl:template match="//tei:div[@type = 'poema']/tei:lg/tei:lg[@type = 'estrofa']">
		<div class="estrofa">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!-- Sólo para la Égloga 2: -->
	<xsl:template match="//tei:div[@type = 'poema']/tei:sp">
		<div class="estrofa">
			<span class="speaker">
				<xsl:value-of select="tei:speaker"/>
			</span>
			<br/>
			<xsl:apply-templates select="tei:lg/tei:l"/>
		</div>
	</xsl:template>

	<!-- 10 julio 2024: añado los atributos del elemento l -->
	<xsl:template
		match="//tei:div[@type = 'poema']/tei:lg/tei:lg[@type = 'estrofa']/tei:l[@n and @xml:id] | //tei:div[@type = 'poema']/tei:sp/tei:lg/tei:l[@n and @xml:id]">
		<xsl:value-of select="@n"/>
		<span class="verso" id="{@xml:id}">
			<!-- <xsl:apply-templates/> -->
			<xsl:value-of select="text()"/>
		</span>

		<xsl:if test="child::tei:linkGrp">
			<div class="dropdown dropinline">
				<a href="#" class="btn btn-link dropdown-toggle noZensmooth"
					data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="0, 10"/>
				<ul class="dropdown-menu">
					<xsl:for-each select="node()/tei:link">
						<xsl:if test="contains(@type, 'a_notas')">
							<li>
								<a href="{@corresp}_es" data-eltab="notas" class="dropdown-item"
									>Nota</a>
							</li>
						</xsl:if>
						<xsl:if test="contains(@type, 'a_comentarios')">
							<li>
								<a href="{@corresp}_es" data-eltab="comentarios"
									class="dropdown-item">Comentario</a>
							</li>
						</xsl:if>
						<xsl:if test="contains(@type, 'a_ls')">
							<li>
								<a href="{@corresp}" data-eltab="locisimiles" class="dropdown-item"
									>Loci similes</a>
							</li>
						</xsl:if>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>

		<xsl:if test="child::tei:hi">
			<xsl:apply-templates/>
		</xsl:if>
		<br/>
	</xsl:template>

	<xsl:template
		match="//tei:div[@type = 'poema']/tei:lg/tei:lg[@type = 'estrofa']/tei:l[not(@n) and not(@xml:id)] | //tei:div[@type = 'poema']/tei:sp/tei:lg/tei:l[not(@n) and not(@xml:id)]">
		<span class="verso_indent">
			<!-- <xsl:apply-templates/> -->
			<xsl:value-of select="text()"/>
		</span>
		<br/>
	</xsl:template>


	<!--SECCIÓN TRADUCCIÓN -->
	<xsl:template
		match="//tei:text/tei:body/tei:div[@type = 'poema_traduccion']/tei:lg[@xml:lang = 'es']/tei:head">
		<h5>
			<xsl:apply-templates/>
		</h5>
	</xsl:template>

	<xsl:template
		match="//tei:text/tei:body/tei:div[@type = 'poema_traduccion']/tei:lg[@xml:lang = 'es']/tei:lg[@type = 'estrofa']">
		<p id="{@xml:id}">
			<a href="{@corresp}" class="noZensmooth btn refpoem" data-lineas="{@n}">
				<xsl:value-of select="@select"/>
			</a>
			<xsl:apply-templates/>
		</p>
	</xsl:template>


	<!-- ENLACES -->

	<!-- Enlace al número de verso del poema -->
	<xsl:template match="tei:span[@type = 'link']">
		<a href="{@from}" class="noZensmooth btn refpoem" data-lineas="{@n}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<!-- Enlace no activo/ subrayado al texto del poema -->
	<xsl:template match="tei:ref[@type = 'texto_poema']">
		<span class="texto_poema">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- Enlace interno a una sección de los comentarios -->
	<xsl:template match="tei:ref[@type = 'link_int_c']">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="data-eltab">comentarios</xsl:attribute>
			<!--<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>-->
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!-- Enlace interno a una sección de las notas -->
	<xsl:template match="tei:ref[@type = 'link_int_n']">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="data-eltab">notas</xsl:attribute>
			<!--<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>-->
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!-- Enlace interno a una sección de los Loci similes -->
	<xsl:template match="tei:ref[@type = 'link_int_ls']">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="data-eltab">locisimiles</xsl:attribute>
			<!--<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>-->
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!-- Modelo para las popup de los enlaces:
		<ref type="link_int" target="#Od2_c1">Comentario vv. 1-6</ref>
		<a href="#Od1_c1_es" data-eltab="comentarios">Comentario 1-2</a>-->
	<!--	data-eltab="contexto"
	data-eltab="metrica"
	data-eltab="traduccion"
	data-eltab="locisimiles"
	data-eltab="notas"
	data-eltab="comentarios"
	data-eltab="aptcrit"
	data-eltab="bibliografia"-->

	<xsl:template match="tei:ref[@type = 'link_interno']">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:ref[@type = 'link_externo']">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="class">extlink link-offset-1 link-underline-dark
				link-underline-opacity-25 link-underline-opacity-100-hover</xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


	<!-- Nombre Poema 
	<xsl:template match="tei:div[@type = 'poema']/tei:lg/tei:head/tei:title">              
			<h4 id="{@xml:id}"><xsl:apply-templates/></h4>
        </xsl:template>
-->

	<!-- APARATO CRÍTICO -->

	<xsl:template match="tei:app">
		<span class="lem">
			<xsl:value-of select="tei:lem"/>
		</span>
		<xsl:text>:  </xsl:text>

		<xsl:for-each select="tei:rdg">
			<span class="rdg">
				<xsl:apply-templates/>
			</span>
			<xsl:text> </xsl:text>

			<!--<xsl:for-each select="tei:wit">
				<span class="wit">
					<xsl:apply-templates/>
				</span>
				<xsl:text>  </xsl:text>
			</xsl:for-each>-->
		</xsl:for-each>

		<!--	<xsl:if test="following-sibling::tei:note[@type='n_ApCrit']">
			<br/>
		</xsl:if>-->

	</xsl:template>

	<xsl:template match="tei:wit">
		<span class="wit">
			<xsl:apply-templates/>
		</span>
	</xsl:template>


	<!-- SISTEMA DE ANCLAS: renvíos a las Notas, Comentarios y Loci similes para el Dropdown Menu -->
	<xsl:template match="tei:head/tei:linkGrp">
		<div class="dropdown dropinline">
			<a href="#" class="btn btn-link dropdown-toggle noZensmooth" data-bs-toggle="dropdown"
				aria-expanded="false" data-bs-offset="0, 10"/>
			<ul class="dropdown-menu">
				<xsl:for-each select="tei:link">
					<xsl:if test="contains(@type, 'a_notas')">
						<li>
							<a href="{@corresp}_es" data-eltab="notas" class="dropdown-item"
								>Nota</a>
						</li>
					</xsl:if>
					<xsl:if test="contains(@type, 'a_comentarios')">
						<li>
							<a href="{@corresp}_es" data-eltab="comentarios" class="dropdown-item"
								>Comentario</a>
						</li>
					</xsl:if>
					<xsl:if test="contains(@type, 'a_ls')">
						<li>
							<a href="{@corresp}" data-eltab="locisimiles" class="dropdown-item">Loci
								simile</a>
						</li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>


	<xsl:template match="tei:figure">
		<!-- Capture the head content in a variable -->
		<xsl:variable name="altText" select="tei:head"/>
		<!-- Apply templates to graphic elements, passing the altText variable -->
		<xsl:apply-templates select="tei:graphic">
			<xsl:with-param name="altText" select="$altText"/>
		</xsl:apply-templates>
	</xsl:template>

	<!-- Template to match the graphic element and generate an img tag -->
	<xsl:template match="tei:graphic">
		<xsl:param name="altText"/>
		<img src="{@url}" alt="{$altText}" style="max-width: 100%;"/>
	</xsl:template>

	<!-- ESto también funcionaría: -->
	<!--	<xsl:template match="tei:figure">
		<img>
			<!-\- Set the alt attribute to the content of tei:head -\->
			<xsl:attribute name="alt">
				<xsl:value-of select="tei:head"/>
			</xsl:attribute>
			<!-\- Set the src attribute to the url attribute of tei:graphic -\->
			<xsl:attribute name="src">
				<xsl:value-of select="tei:graphic/@url"/>
			</xsl:attribute>
		</img>
	</xsl:template>-->

	<!-- TEIHEADER (NO SE USA DE MOMENTO) -->
	<xsl:template match="tei:affiliation">
		<xsl:text>(</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template
		match="publicationStmt/publisher | publicationStmt/address | publicationStmt/availability">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="sourceDesc">
		<h4>SourceDesc</h4>
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="settlement | repository">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/*[position() != last()]">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>

	<xsl:template
		match="//tei:sourceDesc/tei:msDesc/tei:msContents/tei:summary/tei:note[@xml:lang = 'es']/tei:p">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

</xsl:stylesheet>
