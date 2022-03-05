<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="1.0">
    <xsl:attribute-set name="footer">
        <xsl:attribute name="border-top">none<!--0.5pt solid #666--></xsl:attribute>
        <xsl:attribute name="padding-top">2pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">18pt</xsl:attribute>
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="margin-left">190pt</xsl:attribute>
        <xsl:attribute name="margin-right">54pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="footer__page-number">
        <xsl:attribute name="font-size">7.5pt</xsl:attribute>
        <xsl:attribute name="line-height">9pt</xsl:attribute>
		<!-- ContentRules March 2021: all fonts to Arial: PLT PDF - dhb -->		
        <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="confidential">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
