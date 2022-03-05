<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">   
     
    <xsl:attribute-set name="note" use-attribute-sets="common.block">
        <xsl:attribute name="space-before">1pt</xsl:attribute>
        <xsl:attribute name="space-after">12pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__table" use-attribute-sets="common.block">
        <xsl:attribute name="border-top">thin black solid</xsl:attribute>
        <xsl:attribute name="border-bottom">thin black solid</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__text__column">
        <xsl:attribute name="column-number">2</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__image__entry">
        <xsl:attribute name="padding-right">5pt</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="padding-top">8pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">8pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__text__entry">
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="padding-top">8pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">8pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="note__label">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>
