<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version="1.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
				<xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg"/>
				<xsl:param name="von"></xsl:param>
				<xsl:param name="bis"></xsl:param>
				<xsl:template match="/">
								<svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid"><!--<rect x="10" y="10" width="50" height="50" fill="red" stroke="black"/>-->
												<line x1="1%" y1="1%" x2="100%" y2="1%" style="stroke:rgb(255,0,0);stroke-width:2"/>
												<xsl:for-each select="dinosaurawrier/merkmale/periode">
																
																<xsl:element name="text">
																				<xsl:attribute name="x">
																								<xsl:value-of select="periodeVon"/>
																				</xsl:attribute>
																				<xsl:attribute name="y">4%</xsl:attribute>
																				<xsl:attribute name="fill">black</xsl:attribute>
																				<!--Rotate sollte eigentlich jeden Text einzelnd rotieren, aber er behandelt den ganzen text als ein element und rotiert das dann insgesamt-->
																				<!--<xsl:attribute name="transform">rotate(20)</xsl:attribute>-->
																				<xsl:value-of select="periodeName"/>
																</xsl:element>
																<xsl:element name="line">
																				<xsl:attribute name="x1"><xsl:value-of select="periodeVon"/></xsl:attribute>
																				<xsl:attribute name="y1">0%</xsl:attribute>
																				<xsl:attribute name="x2"><xsl:value-of select="periodeVon"/></xsl:attribute>
																				<xsl:attribute name="y2">2%</xsl:attribute>
																				<xsl:attribute name="style">stroke:rgb(255,0,0);stroke-width:2</xsl:attribute>
																</xsl:element>
												</xsl:for-each>
												<xsl:element name="line">
																				<xsl:attribute name="x1"><xsl:value-of select="$von"/></xsl:attribute>
																				<xsl:attribute name="y1">1%</xsl:attribute>
																				<xsl:attribute name="x2"><xsl:value-of select="$bis"/></xsl:attribute>
																				<xsl:attribute name="y2">1%</xsl:attribute>
																				<xsl:attribute name="style">stroke:rgb(0,0,0);stroke-width:7</xsl:attribute>
																</xsl:element>
								</svg>
				</xsl:template>
</xsl:stylesheet>
