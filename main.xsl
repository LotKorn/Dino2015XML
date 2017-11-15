<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
				<xsl:import href="dinosuche_formular.xsl"/>
				<xsl:output method="html"/>
				<xsl:template match="/">
								<html>
												<head>
																<link rel="stylesheet" type="text/css" href="dinostyle.css"/>
																<title>Dinosaurawrier</title>
												</head>
												<body>
																<xsl:element name="table">
																				<xsl:attribute name="align">center</xsl:attribute>
																				<xsl:attribute name="width">50%</xsl:attribute>
																				<xsl:attribute name="id">dinos</xsl:attribute>
																				<xsl:element name="caption">
																								<xsl:attribute name="align">center</xsl:attribute>
																								DinosauRAWRier
																				</xsl:element><!--<xsl:element name="thead">
																								<xsl:element name="tr">
																												<xsl:element name="th">
																																								DinosauRAWRier
																																								</xsl:element>
																								</xsl:element>
																				</xsl:element>-->
																				<xsl:element name="tbody">
																								<xsl:element name="tr">
																												<xsl:element name="td">
																																<xsl:element name="table">
																																				<xsl:attribute name="id">dinos</xsl:attribute>
																																				<xsl:element name="tbody">
																																								<xsl:element name="td">
																																												<xsl:attribute name="width">15%</xsl:attribute>
																																												<xsl:for-each select="/samples/group/sample">
																																																<a href="{@href}">
																																																				<xsl:value-of select="@name"/>
																																																</a>
																																																<br/>
																																												</xsl:for-each>
																																								</xsl:element>
																																								<xsl:element name="td">
																																												<xsl:element name="img">
																																																<xsl:attribute name="src">dinorawr.png</xsl:attribute>
																																																<xsl:attribute name="title">DinosauRAWRier</xsl:attribute>
																																																<xsl:attribute name="heigth">100%</xsl:attribute>
																																																<xsl:attribute name="width">100%</xsl:attribute>
																																												</xsl:element>
																																								</xsl:element>
																																				</xsl:element>
																																</xsl:element>
																												</xsl:element>
																								</xsl:element>
																								<xsl:element name="tr">
																												<xsl:element name="td"><!--Die Tabelle wird korrekt importiert, allerdings fehlen die Werte, da es sich hierbei um 2 verschiedene xml datein handelt...)
																												<xsl:apply-imports/>
																												Daher einfach als iframe funktion von HTML mit den links mit target="_parent"-->
																																<iframe src="dinosuche.html" width="800" height="150" style="border:none" align="center"/>
																												</xsl:element>
																								</xsl:element>
																				</xsl:element>
																</xsl:element>
												</body>
								</html>
				</xsl:template>
				<xsl:template name="darstellungen">
								<xsl:for-each select="/samples/group/sample">
												<a href="{@href}">
																<xsl:value-of select="@name"/>
												</a>
												<br/>
								</xsl:for-each>
				</xsl:template>
</xsl:stylesheet>
