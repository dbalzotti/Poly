<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <xsl:attribute-set name="__frontmatter__title">
        <xsl:attribute name="color">black<!--xsl:value-of select="$color-red"/--></xsl:attribute>
        <xsl:attribute name="letter-spacing">-0.005em</xsl:attribute>
        <xsl:attribute name="space-after">3pt</xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- ContentRules May 2021: color blue to color blace: PLT PDF - dhb -->	
        <xsl:attribute name="font-size">26pt</xsl:attribute>
        <xsl:attribute name="line-height">34pt</xsl:attribute>
        <xsl:attribute name="margin-top">.9in</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>136pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">136pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle">
        <xsl:attribute name="color">black<!--xsl:value-of select="$color-red"/--></xsl:attribute>
        <xsl:attribute name="letter-spacing">-0.005em</xsl:attribute>
        <xsl:attribute name="space-after">30pt</xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size">23pt</xsl:attribute>
        <xsl:attribute name="line-height">30pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>136pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">136pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__text">
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">20pt</xsl:attribute>
		<!-- ContentRules May 2021: color blue to color blace: PLT PDF - dhb -->	
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="letter-spacing">-0.005em</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>136pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">136pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">17pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__footer">
        <xsl:attribute name="margin-bottom">18pt</xsl:attribute>
        <xsl:attribute name="margin-left">54pt</xsl:attribute>
        <xsl:attribute name="margin-right">54pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__footer__image">
       <!-- <xsl:attribute name="content-width">504pt</xsl:attribute>-->
    </xsl:attribute-set>

</xsl:stylesheet>
