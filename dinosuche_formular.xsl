<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
				<xsl:output method="html"/>
				<xsl:template match="/">
								<html>
												<head>
																<link rel="stylesheet" type="text/css" href="dinostyle.css"/>
																<title>DinosauRAWRiersuche</title>
												</head>
												<body>
																<xsl:apply-templates/>
												</body>
								</html>
				</xsl:template>
				<xsl:template match="dinosaurier"/>
				<xsl:template match="klassen">
								<table style="50%" id="dinos">
												<thead align="left">
																<tr>
																				<th>Name</th>
																				<th>Klasse</th>
																				<th>Ära</th>
																				<th>Nahrung</th>
																				<th>Fortbewegung</th>
																</tr>
												</thead>
												<tbody>
																<form method="get" action="dinosuche_ergebnis.html" target="_parent">
																				<td>
																								<xsl:element name="input">
																												<xsl:attribute name="type">type</xsl:attribute>
																												<xsl:attribute name="name">name</xsl:attribute>
																												<xsl:attribute name="autocomplete">on</xsl:attribute>
																												<xsl:attribute name="title">Den kompletten Namen oder einen Teil davon angeben. Groß und Kleinschreibung ist zu beachten!</xsl:attribute>
																								</xsl:element>
																				</td>
																				<td>
																								<select name="klasse">
																												<xsl:element name="option"/>
																												<xsl:for-each select="klassenBeschreibung">
																																<xsl:sort select="klasse"/>
																																<xsl:element name="option">
																																				<xsl:attribute name="title">
																																								<xsl:value-of select="beschreibung"/>
																																				</xsl:attribute>
																																				<xsl:attribute name="value">
																																								<xsl:value-of select="klasse"/>
																																				</xsl:attribute>
																																				<xsl:value-of select="klasse"/>
																																</xsl:element>
																												</xsl:for-each>
																								</select>
																				</td>
																				<td>
																								<select name="periode">
																												<xsl:element name="option">
																																<xsl:attribute name="value"/>
																												</xsl:element>
																												<xsl:for-each select="/dinosaurawrier/merkmale/periode">
																																<xsl:element name="option">
																																				<xsl:attribute name="value">
																																								<xsl:value-of select="periodeName"/>
																																				</xsl:attribute>
																																				<xsl:value-of select="periodeName"/>
																																</xsl:element>
																												</xsl:for-each>
																								</select>
																				</td>
																				<td>
																								<select name="nahrung">
																												<xsl:element name="option">
																																<xsl:attribute name="value"/>
																												</xsl:element>
																												<xsl:for-each select="/dinosaurawrier/merkmale/nahrung">
																																<xsl:sort select="nahrung"/>
																																<xsl:element name="option">
																																				<xsl:attribute name="value">
																																								<xsl:value-of select="."/>
																																				</xsl:attribute>
																																				<xsl:value-of select="."/>
																																</xsl:element>
																												</xsl:for-each>
																								</select>
																				</td>
																				<td>
																								<select name="fortbewegung">
																												<xsl:element name="option">
																																<xsl:attribute name="value"/>
																												</xsl:element>
																												<xsl:for-each select="/dinosaurawrier/merkmale/fortbewegung">
																																<xsl:sort select="fortbewegung"/>
																																<xsl:element name="option">
																																				<xsl:attribute name="value">
																																								<xsl:value-of select="."/>
																																				</xsl:attribute>
																																				<xsl:value-of select="."/>
																																</xsl:element>
																												</xsl:for-each>
																								</select>
																								<input type="submit" value="suchen"/>
																				</td>
																</form>
												</tbody>
								</table>
				</xsl:template>
				<xsl:template match="merkmale"/>
</xsl:stylesheet>
