<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:attribute-set name="b">
        <!--xsl:attribute name="color" select="$color-light-black"/-->
        <xsl:attribute name="color">black</xsl:attribute>
    </xsl:attribute-set>
    
    
    
    <xsl:attribute-set name="b_black" use-attribute-sets="b">
        <xsl:attribute name="color">black</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
