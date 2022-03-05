<?xml version='1.0'?>

<!-- 
    
    WD list configurations
    
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:attribute-set name="linklist.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <!--Common-->
    <xsl:attribute-set name="li.itemgroup">
        <xsl:attribute name="space-after">3pt</xsl:attribute>
        <xsl:attribute name="space-before">3pt</xsl:attribute>
    </xsl:attribute-set>

    <!--Unordered list-->
    <xsl:attribute-set name="ul" use-attribute-sets="common.block">
        <xsl:attribute name="space-after">6pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="font-size">
			<xsl:choose>
					<xsl:when test="ancestor::*[contains(@class,' topic/entry ')]">9pt</xsl:when>
					<xsl:otherwise>10pt</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li">
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
		<xsl:attribute name="margin-left">
			<xsl:choose>
					<xsl:when test="ancestor::*[contains(@class,' topic/entry ')]">0pt</xsl:when>
					<xsl:otherwise>12pt</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>

    <xsl:attribute-set name="ul.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul.li__label__content">
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <!--Ordered list-->
    <xsl:attribute-set name="ol" use-attribute-sets="common.block">
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-size">
			<xsl:choose>
					<xsl:when test="ancestor::*[contains(@class,' topic/entry ')]">9pt</xsl:when>
					<xsl:otherwise>10pt</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li">
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="space-before">8pt</xsl:attribute>
        <xsl:attribute name="margin-left">
			<xsl:choose>
					<xsl:when test="ancestor::*[contains(@class,' topic/entry ')]">0pt</xsl:when>
					<xsl:otherwise>12pt</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li__label__content">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align-last">end</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="ol.li__content">
        <xsl:attribute name="margin-left">6pt</xsl:attribute>
    </xsl:attribute-set>

    <!--Simple list-->

    <xsl:attribute-set name="sl.sli">
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="margin-left">12pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>