<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    >

    <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
    <xsl:variable name="page-width">8.5in</xsl:variable>
    <xsl:variable name="page-height">11in</xsl:variable>

    <!-- Change these if your page has different margins on different sides. -->
    <xsl:variable name="page-margin-left">54pt</xsl:variable>
    <xsl:variable name="page-margin-right">54pt</xsl:variable>
    <xsl:variable name="page-margin-bottom">36pt</xsl:variable>
    <xsl:variable name="page-margin-top">80pt</xsl:variable>

    <xsl:variable name="default-font-size">
        <xsl:choose>
            <xsl:when test="/*[@xml:lang = 'th']">11pt</xsl:when>
            <xsl:otherwise>9.5pt</xsl:otherwise>
        </xsl:choose>
     </xsl:variable>
    <xsl:variable name="default-line-height">
        <xsl:choose>
            <xsl:when test="/*[@xml:lang = 'th']">11.5pt</xsl:when>
            <xsl:otherwise>11pt</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="rtl-pub" select="(/*[@xml:lang = 'ar']) or (/*[@xml:lang = 'he'])"/>
</xsl:stylesheet>
