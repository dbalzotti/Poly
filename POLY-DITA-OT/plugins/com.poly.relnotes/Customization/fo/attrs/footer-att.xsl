<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:attribute-set name="header_footer_font">
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-size">9.0pt</xsl:attribute>
        <xsl:attribute name="color">Black</xsl:attribute>
        <xsl:attribute name="text-indent">0.0in</xsl:attribute>
        <xsl:attribute name="start-indent">0.0in</xsl:attribute>
        <xsl:attribute name="end-indent">0.0in</xsl:attribute>
        <xsl:attribute name="space-before">0.0pt</xsl:attribute>
        <xsl:attribute name="space-after">0.0pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__footer" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">.5in</xsl:attribute>
        <xsl:attribute name="margin-right">.5in</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">.3in</xsl:attribute>
     </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__odd__header" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
        <xsl:attribute name="space-before">3.0pt</xsl:attribute>
        <xsl:attribute name="padding-top">.3in</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
     </xsl:attribute-set>
    
    <xsl:attribute-set name="__body__even__header" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
        <xsl:attribute name="space-before">3.0pt</xsl:attribute>
        <xsl:attribute name="padding-top">.3in</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__odd__footer" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">.5in</xsl:attribute>
        <xsl:attribute name="margin-right">.5in</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">.3in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__odd__header" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
        <xsl:attribute name="space-before">3.0pt</xsl:attribute>
        <xsl:attribute name="padding-top">.443in</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__even__header" use-attribute-sets="header_footer_font">
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
        <xsl:attribute name="space-before">3.0pt</xsl:attribute>
        <xsl:attribute name="padding-top">.3in</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
    </xsl:attribute-set>
    
</xsl:stylesheet>