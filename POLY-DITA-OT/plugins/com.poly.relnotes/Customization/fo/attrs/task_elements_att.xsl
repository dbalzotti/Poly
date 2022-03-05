<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">    
    
    <xsl:attribute-set name="stepresult">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="info">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">2pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="Poly_footer" use-attribute-sets="Poly_slogan">
        <xsl:attribute name="color">#EB3C00</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="Poly_slogan">
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-size">8pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>