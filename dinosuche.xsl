<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version="1.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
				<xsl:output method="html" indent="yes"/>
				<xsl:param name="klasse"/>
				<xsl:param name="name"/>
				<xsl:param name="periode"/>
				<xsl:param name="nahrung"/>
				<xsl:param name="fortbewegung"/>
				<xsl:variable name="leerzeichen">
								<xsl:text> </xsl:text>
				</xsl:variable>
				<xsl:template match="/">
								<html>
												<head>
																<link rel="stylesheet" type="text/css" href="dinostyle.css"/>
																<title>DinosauRAWRier Suche</title>
												</head>
												<body>
																<xsl:apply-templates/>
												</body>
								</html>
				</xsl:template>
				<xsl:template match="dinosaurier"><!--<xsl:value-of select="$klasse"/>
								<xsl:value-of select="$name"/>
								<xsl:value-of select="$nahrung"/>
								<xsl:value-of select="$fortbewegung"/>
								<xsl:value-of select="$periode"/>-->
								<xsl:variable name="test">
												<xsl:for-each select="dino">
																<xsl:if test="(klasse/name=$klasse)  or ($klasse='')"><!--TODO: lowercase check, lower-case or fn:lower-case geht nicht mit xalan?-->
																				<xsl:if test="contains(nameDe,$name) or (nameDe=$name) or (nameLat=$name) or ($name='')">
																								<xsl:if test="(periode/periodeName=$periode) or ($periode='')">
																												<xsl:if test="(klasse/nahrung=$nahrung) or ($nahrung='')">
																																<xsl:if test="(klasse/fortbewegung=$fortbewegung) or ($fortbewegung='')">
																																true
																																</xsl:if>
																												</xsl:if>
																								</xsl:if>
																				</xsl:if>
																</xsl:if>
												</xsl:for-each>
								</xsl:variable>
								<xsl:choose>
												<xsl:when test="contains($test,'true')">
																<table style="100%" sortable="true" id="dinos">
																				<caption>DinosauRAWRierübersicht
																				</caption>
																				<thead>
																								<tr>
																												<th>Bild</th>
																												<th>Name</th>
																												<th>Größe</th>
																												<th>Gewicht</th>
																												<th>Lebzeit</th>
																												<th>Klassifikation</th>
																												<th>Merkmale</th>
																												<th>Kurzbeschreibung</th>
																								</tr>
																				</thead>
																				<tbody>
																								<xsl:for-each select="dino">
																												<xsl:if test="(klasse/name=$klasse)  or ($klasse='')"><!--TODO: lowercase check, lower-case or fn:lower-case geht nicht?-->
																																<xsl:if test="contains(nameDe,$name) or (nameDe=$name) or (nameLat=$name) or ($name='')">
																																				<xsl:if test="(periode/periodeName=$periode) or ($periode='')">
																																								<xsl:if test="(klasse/nahrung=$nahrung) or ($nahrung='')">
																																												<xsl:if test="(klasse/fortbewegung=$fortbewegung) or ($fortbewegung='')">
																																																<tr>
																																																				<td>
																																																								<a href="{bild/url}">
																																																												<img src="{bild/url}" alt="Kein Bild vorhanden" heigth="150" width="150"/>
																																																												<br/>
																																																												<xsl:value-of select="bild/copyright"/>
																																																								</a>
																																																				</td>
																																																				<td>
																																																								<xsl:value-of select="nameDe"/>
																																																								<br/>
																																																								<xsl:value-of select="nameLat"/>
																																																				</td>
																																																				<td>Länge: <xsl:value-of select="größe/länge"/>m<br/>Breite: <xsl:value-of select="größe/breite"/>m<br/>Höhe: <xsl:value-of select="größe/höhe"/>m<br/>
																																																				</td>
																																																				<td>
																																																								<xsl:value-of select="gewicht/min"/>-<xsl:value-of select="gewicht/max"/>kg</td>
																																																				<td>Ära:
																																																								<xsl:for-each select="periode/periodeName">
																																																												<xsl:element name="a">
																																																																<xsl:attribute name="href">dinosuche_ergebnis.html?periode=<xsl:value-of select="."/>
																																																																</xsl:attribute>
																																																																<xsl:value-of select="."/>
																																																												</xsl:element>
																																																												<xsl:value-of select="$leerzeichen"/>
																																																								</xsl:for-each>
																																																								<br/>
																																																								<xsl:value-of select="periode/periodeVon"/>-<xsl:value-of select="periode/periodeBis"/> Mya
																																																				</td>
																																																				<td>
																																																								<xsl:element name="a">
																																																												<xsl:attribute name="href">dinosuche_ergebnis.html?klasse=<xsl:value-of select="klasse/name"/>
																																																												</xsl:attribute>
																																																												<xsl:value-of select="klasse/name"/>
																																																								</xsl:element>
																																																								<br/>
																																																								<xsl:element name="a">
																																																												<xsl:attribute name="href">dinosuche_ergebnis.html?fortbewegung=<xsl:value-of select="klasse/fortbewegung"/>
																																																												</xsl:attribute>
																																																												<xsl:value-of select="klasse/fortbewegung"/>
																																																								</xsl:element>
																																																								<br/>
																																																								<xsl:element name="a">
																																																												<xsl:attribute name="href">dinosuche_ergebnis.html?nahrung=<xsl:value-of select="klasse/nahrung"/>
																																																												</xsl:attribute>
																																																												<xsl:value-of select="klasse/nahrung"/>
																																																								</xsl:element>
																																																				</td>
																																																				<td>
																																																								<xsl:for-each select="merkmal">
																																																												<xsl:value-of select="."/>
																																																												<br/>
																																																								</xsl:for-each>
																																																				</td>
																																																				<td>
																																																								<a href="dinoprofil.html?dino={nameDe}">
																																																												<xsl:value-of select="beschreibung/kurzbeschreibung"/>
																																																								</a>
																																																				</td>
																																																</tr>
																																												</xsl:if>
																																								</xsl:if>
																																				</xsl:if>
																																</xsl:if>
																												</xsl:if>
																								</xsl:for-each>
																				</tbody>
																</table>
												</xsl:when>
												<xsl:otherwise>
																<xsl:element name="table">
																				<xsl:attribute name="align">left</xsl:attribute>
																				<xsl:attribute name="width">25%</xsl:attribute>
																				<xsl:element name="thead">
																								<xsl:element name="tr">
																												<xsl:element name="th">
																																								Keine Ergebnisse
																																								</xsl:element>
																								</xsl:element>
																				</xsl:element>
																				<xsl:element name="tbody">
																								<xsl:element name="td">
																												<xsl:element name="img">
																																<xsl:attribute name="src">dinocry.png</xsl:attribute>
																																<xsl:attribute name="title">Keine Ergebnisse ;(</xsl:attribute>
																																<xsl:attribute name="heigth">100%</xsl:attribute>
																																<xsl:attribute name="width">100%</xsl:attribute>
																												</xsl:element>
																								</xsl:element>
																				</xsl:element>
																</xsl:element>
												</xsl:otherwise>
								</xsl:choose>
				</xsl:template>
				<xsl:template match="klassen"/>
				<xsl:template match="merkmale"/>
</xsl:stylesheet>
