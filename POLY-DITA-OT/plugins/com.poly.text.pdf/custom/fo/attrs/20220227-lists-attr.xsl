<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    <xsl:attribute-set name="ol">
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="relative-align">baseline</xsl:attribute>  
		<xsl:attribute name="provisional-distance-between-starts">7pt</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">.5mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <!--xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="ancestor::*[contains(@class, ' topic/ol ') or contains(@class, ' topic/ul ')]">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>0pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="ancestor::*[contains(@class, ' topic/ol ') or contains(@class, ' topic/ul ')]">
                            <xsl:text>-7pt</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>-10pt</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute-->
        <!--xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">
                    <xsl:choose>
                        <xsl:when test="ancestor::*[contains(@class, ' topic/ol ') or contains(@class, ' topic/ul ')]">
                            <xsl:text>-7pt</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>-10pt</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute-->
    </xsl:attribute-set>

    <xsl:attribute-set name="ul">
	<xsl:attribute name="font-family">Sans</xsl:attribute>
    <xsl:attribute name="provisional-label-separation">.5mm</xsl:attribute>
   <!--xsl:attribute name="relative-align">baseline</xsl:attribute>       <xsl:attribute name="provisional-distance-between-starts">7pt</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>1pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">1pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute-->
    </xsl:attribute-set>

    <!--xsl:attribute-set name="ol.li__label">
	
        <xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="end-indent">label-end()</xsl:attribute>
    </xsl:attribute-set-->

    <xsl:attribute-set name="ul.li__label">
        <xsl:attribute name="text-align">start</xsl:attribute>
	    <xsl:attribute name="provisional-label-separation">.5mm</xsl:attribute>
    </xsl:attribute-set>

    <!--xsl:attribute-set name="ol.li__label__content">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="margin-left">10pt</xsl:attribute>
    </xsl:attribute-set-->

    <!--xsl:attribute-set name="ul.li">
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set-->

    <!--xsl:attribute-set name="ol.li">
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set-->
</xsl:stylesheet>
