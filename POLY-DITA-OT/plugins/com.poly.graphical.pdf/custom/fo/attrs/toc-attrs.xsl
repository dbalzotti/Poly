<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    <xsl:variable name="tocMaximumLevel">3</xsl:variable>
    <xsl:attribute-set name="__toc__header" use-attribute-sets="topic.title"/>

    <xsl:attribute-set name="__toc__indent">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">
                    <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
                    <xsl:value-of select="concat(string(100 + number($level) * 12), 'pt')"/>
                </xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">0pt</xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
                    <xsl:value-of select="concat(string(100 + number($level) * 12), 'pt')"/>
                </xsl:otherwise>                
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-top">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1">0pt</xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- DHB Added for a starting point when moving to DITA-OT 3.x -->

    <xsl:attribute-set name="__toc__chapter__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-size">9.5pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="padding-top">2pt</xsl:attribute>
    </xsl:attribute-set>	
	
    <xsl:attribute-set name="__toc__topic__content">
        <xsl:attribute name="last-line-end-indent">0</xsl:attribute>
        <xsl:attribute name="end-indent">0</xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">left</xsl:when>
                <xsl:otherwise>right</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="text-align-last">left</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1">9.5pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$default-font-size"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1">normal</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="__toc__leader">
        <xsl:attribute name="leader-pattern">space</xsl:attribute>
    </xsl:attribute-set>
	
    <!--xsl:attribute-set name="__toc__topic__content">
        <xsl:attribute name="last-line-end-indent">0</xsl:attribute>
        <xsl:attribute name="end-indent">0</xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">left</xsl:when>
                <xsl:otherwise>right</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="text-align-last">left</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">30pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">0pt</xsl:when>
                <xsl:otherwise>00pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
		<ContentRules March 2021: all fonts to Arial: PLT PDF - dhb>		
        <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="__toc__leader">
        <xsl:attribute name="leader-pattern">space</xsl:attribute>
    </xsl:attribute-set-->

    <xsl:attribute-set name="__toc__page-number">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">9.5pt</xsl:attribute>
		<!-- ContentRules March 2021: all fonts to Arial: PLT PDF - dhb -->		
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="padding-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">12pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="padding-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">0pt</xsl:when>
                <xsl:otherwise>12pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
  
</xsl:stylesheet>
