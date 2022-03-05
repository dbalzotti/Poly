<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:attribute-set name="link__content">
        <xsl:attribute name="color">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'contact']) &gt; 0">blue</xsl:when>
                <xsl:otherwise>blue<!--xsl:value-of select="$color-light-black"/--></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="xref" use-attribute-sets="link__content"/>
</xsl:stylesheet>
