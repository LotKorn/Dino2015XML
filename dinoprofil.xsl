<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version="1.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
				<xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg"/>
				<xsl:param name="dino"/>
				<xsl:variable name="leerzeichen">
								<xsl:text> </xsl:text>
				</xsl:variable>
				<xsl:variable name="enter">
								<xsl:text/>
				</xsl:variable>
				<xsl:template match="/">
								<html>
												<head>
																<link rel="stylesheet" type="text/css" href="dinostyle.css"/>
																<title>
																				<xsl:value-of select="$dino"/>Profil - DinosauRAWRier</title>
												</head>
												<body>
																<xsl:apply-templates/>
												</body>
								</html>
				</xsl:template>
				<xsl:template match="dinosaurier">
								<xsl:for-each select="dino">
												<xsl:if test="nameDe=$dino">
																<xsl:element name="table">
																				<xsl:attribute name="width">100%</xsl:attribute>
																				<xsl:attribute name="id">dinos</xsl:attribute>
																				<xsl:element name="caption">
																								<xsl:attribute name="align">center</xsl:attribute>
																								DinosauRAWRier Überblick
																								</xsl:element>
																				<xsl:element name="tbody">
																								<xsl:element name="td">
																												<xsl:element name="table">
																																<xsl:attribute name="align">left</xsl:attribute>
																																<xsl:attribute name="width">100%</xsl:attribute>
																																<xsl:attribute name="id">dinos</xsl:attribute>
																																<xsl:element name="tbody">
																																				<xsl:element name="td">
																																								<xsl:element name="table">
																																												<xsl:attribute name="align">left</xsl:attribute>
																																												<xsl:attribute name="width">100%</xsl:attribute>
																																												<xsl:element name="thead">
																																																<xsl:element name="tr">
																																																				<xsl:element name="th">Körperdaten</xsl:element>
																																																</xsl:element>
																																												</xsl:element>
																																												<xsl:element name="tbody">
																																																<xsl:element name="td">Länge: <xsl:value-of select="größe/länge"/>m<br/>Breite: <xsl:value-of select="größe/breite"/>m<br/>Höhe: <xsl:value-of select="größe/höhe"/>m<br/>Gewicht: <xsl:value-of select="gewicht/min"/>-<xsl:value-of select="gewicht/max"/>kg
																																																				<br/>
																																																				<br/>
																																																				<xsl:value-of select="klasse/fortbewegung"/>
																																																				<br/>
																																																				<xsl:value-of select="klasse/nahrung"/>
																																																				<br/>
																																																				<xsl:for-each select="merkmal">
																																																								<xsl:value-of select="."/>
																																																								<br/>
																																																				</xsl:for-each>
																																																</xsl:element>
																																												</xsl:element>
																																								</xsl:element>
																																								<xsl:element name="table">
																																												<xsl:element name="thead">
																																																<xsl:element name="tr">
																																																				<xsl:element name="th">Ära</xsl:element>
																																																</xsl:element>
																																												</xsl:element>
																																												<xsl:element name="tbody">
																																																<xsl:element name="td">
																																																				<xsl:for-each select="periode/periodeName">
																																																								<xsl:value-of select="."/>
																																																								<xsl:value-of select="$leerzeichen"/>
																																																				</xsl:for-each>
																																																				<br/>
																																																				<xsl:value-of select="periode/periodeVon"/>-<xsl:value-of select="periode/periodeBis"/> Mya
																																								<br/>
																																																				<br/>
																																																				<xsl:for-each select="verbreitung">
																																																								<xsl:value-of select="."/>
																																																								<br/>
																																																				</xsl:for-each>
																																																</xsl:element>
																																																<xsl:element name="td">
																																																				<!--Hier sollte eigentlich ein Import der zeitaltersvg.svg stattfinden, allerdings ist dies in einer for each schleife nicht möglich und ich wollte nicht die gesamte lösung umstrukturieren (z.b. mit id abfragen), um das zu machen-->
																																																				<xsl:call-template name="svg">
																																																								<xsl:with-param name="von">
																																																												<xsl:value-of select="periode/periodeVon"/>
																																																								</xsl:with-param>
																																																								<xsl:with-param name="bis">
																																																												<xsl:value-of select="periode/periodeBis"/>
																																																								</xsl:with-param>
																																																				</xsl:call-template><!--
																																																				veraltet: ein standardbild
																																																				<xsl:element name="img">
																																																								<xsl:attribute name="src">http://www.diercke.de/bilder/omeda/501/2122_026_2.jpg</xsl:attribute>
																																																								<xsl:attribute name="title">Erdzeitalter</xsl:attribute>
																																																								<xsl:attribute name="heigth">100%</xsl:attribute>
																																																								<xsl:attribute name="width">100%</xsl:attribute>
																																																				</xsl:element>
																																																				<a href="http://www.diercke.de/kartenansicht.xtp?artId=978-3-14-100782-4&amp;stichwort=Erdzeitalter&amp;fs=1">http://www.diercke.de
</a>
-->
																																																</xsl:element>
																																												</xsl:element>
																																								</xsl:element>
																																				</xsl:element>
																																</xsl:element>
																												</xsl:element>
																								</xsl:element>
																								<xsl:element name="td">
																												<xsl:for-each select="beschreibung/texte">
																																<xsl:element name="table">
																																				<xsl:attribute name="id">dinos</xsl:attribute>
																																				<xsl:element name="thead">
																																								<xsl:element name="tr">
																																												<xsl:element name="th">
																																																<xsl:value-of select="titel"/>
																																												</xsl:element>
																																								</xsl:element>
																																				</xsl:element>
																																				<xsl:element name="tbody">
																																								<xsl:element name="td">
																																												<xsl:value-of select="text"/>
																																								</xsl:element>
																																				</xsl:element>
																																</xsl:element>
																												</xsl:for-each>
																												<xsl:for-each select="link">
																																<xsl:element name="table">
																																				<xsl:attribute name="id">dinos</xsl:attribute>
																																				<xsl:attribute name="width">100%</xsl:attribute>
																																				<xsl:element name="td">
																																								<xsl:element name="a">
																																												<xsl:attribute name="href">
																																																<xsl:value-of select="."/>
																																												</xsl:attribute>
																																												<xsl:value-of select="."/>
																																								</xsl:element>
																																								<xsl:value-of select="$enter"/>
																																				</xsl:element>
																																</xsl:element>
																												</xsl:for-each>
																								</xsl:element>
																								<xsl:element name="td">
																												<xsl:element name="table">
																																<xsl:attribute name="id">dinos</xsl:attribute>
																																<xsl:for-each select="bild">
																																				<xsl:element name="thead">
																																								<xsl:element name="tr">
																																												<xsl:element name="th">
																																																<xsl:value-of select="titel"/>
																																												</xsl:element>
																																								</xsl:element>
																																				</xsl:element>
																																				<xsl:element name="tbody">
																																								<xsl:element name="tr">
																																												<xsl:element name="td">
																																																<xsl:element name="a">
																																																				<xsl:attribute name="href">
																																																								<xsl:value-of select="url"/>
																																																				</xsl:attribute>
																																																				<xsl:element name="img">
																																																								<xsl:attribute name="src">
																																																												<xsl:value-of select="url"/>
																																																								</xsl:attribute>
																																																								<xsl:attribute name="title">
																																																												<xsl:value-of select="beschreibung"/>
																																																								</xsl:attribute>
																																																								<xsl:attribute name="alt">
																																																												<xsl:variable name="titel"/>
																																																								</xsl:attribute>
																																																								<xsl:attribute name="heigth">100%</xsl:attribute>
																																																								<xsl:attribute name="width">100%</xsl:attribute>
																																																				</xsl:element>
																																																</xsl:element>
																																												</xsl:element>
																																								</xsl:element>
																																								<xsl:element name="td">
																																												<xsl:value-of select="beschreibung"/>
																																								</xsl:element>
																																				</xsl:element>
																																</xsl:for-each>
																												</xsl:element>
																								</xsl:element>
																				</xsl:element>
																</xsl:element>
												</xsl:if>
								</xsl:for-each>
				</xsl:template>
				<xsl:template match="klassen"/>
				<xsl:template match="merkmale"/>
				<xsl:template name="svg">
								<xsl:param name="von"/>
								<xsl:param name="bis"/>
								<svg width="300" height="200" xmlns="http://www.w3.org/2000/svg"><!--<rect x="10" y="10" width="50" height="50" fill="red" stroke="black"/>-->
												<line x1="1%" y1="10%" x2="100%" y2="10%" style="stroke:rgb(255,0,0);stroke-width:2"/>
												<xsl:for-each select="//dinosaurawrier/merkmale/periode">
																<xsl:element name="text">
																				<xsl:attribute name="x">
																								<xsl:value-of select="periodeVon"/>
																				</xsl:attribute>
																				<xsl:attribute name="y">20%</xsl:attribute>
																				<xsl:attribute name="fill">black</xsl:attribute><!--Rotate sollte eigentlich jeden Text einzelnd rotieren, aber er behandelt den ganzen text als ein element und rotiert das dann insgesamt--><!--<xsl:attribute name="transform">rotate(20)</xsl:attribute>-->
																				<xsl:value-of select="periodeName"/>
																</xsl:element>
																<xsl:element name="line">
																				<xsl:attribute name="x1">
																								<xsl:value-of select="periodeVon"/>
																				</xsl:attribute>
																				<xsl:attribute name="y1">7%</xsl:attribute>
																				<xsl:attribute name="x2">
																								<xsl:value-of select="periodeVon"/>
																				</xsl:attribute>
																				<xsl:attribute name="y2">13%</xsl:attribute>
																				<xsl:attribute name="style">stroke:rgb(255,0,0);stroke-width:2</xsl:attribute>
																</xsl:element>
												</xsl:for-each>
												<xsl:element name="line">
																<xsl:attribute name="x1">
																				<xsl:value-of select="$von"/>
																</xsl:attribute>
																<xsl:attribute name="y1">10%</xsl:attribute>
																<xsl:attribute name="x2">
																				<xsl:value-of select="$bis"/>
																</xsl:attribute>
																<xsl:attribute name="y2">10%</xsl:attribute>
																<xsl:attribute name="style">stroke:rgb(0,0,0);stroke-width:14</xsl:attribute>
												</xsl:element>
												<xsl:element name="text">
																<xsl:attribute name="x">
																				<xsl:value-of select="$von"/>
																</xsl:attribute>
																<xsl:attribute name="y">6%</xsl:attribute>
																<xsl:attribute name="dx">-5%</xsl:attribute>
																<xsl:attribute name="fill">black</xsl:attribute>
																<xsl:value-of select="$von"/>
												</xsl:element>
												<xsl:element name="text">
																<xsl:attribute name="x">
																				<xsl:value-of select="$bis"/>
																</xsl:attribute>
																<xsl:attribute name="y">6%</xsl:attribute>
																<xsl:attribute name="dx">0%</xsl:attribute>
																<xsl:attribute name="fill">black</xsl:attribute>
																<xsl:value-of select="$bis"/>
												</xsl:element>
								</svg>
				</xsl:template>
</xsl:stylesheet>
