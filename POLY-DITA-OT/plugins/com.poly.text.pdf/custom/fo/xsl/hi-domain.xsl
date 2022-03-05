<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
    <xsl:include href="../attrs/hi-domain-attr.xsl"/>

    <xsl:template match="*[contains(@class,' hi-d/b ')]">
        <fo:inline xsl:use-attribute-sets="b" id="{@id}">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <xsl:template match="*[contains(@class,' hi-d/b ')][@outputclass='black']">
        <fo:inline xsl:use-attribute-sets="b_black" id="{@id}">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

</xsl:stylesheet>
