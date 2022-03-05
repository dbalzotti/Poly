<?xml version="1.0" encoding="UTF-8"?>
<!--
    ============================================================
    Copyright (c) 2006 Antenna House, Inc. All rights reserved.
    Antenna House is a trademark of Antenna House, Inc.
    URL    : http://www.antennahouse.com/
    E-mail : info@antennahouse.com
    ============================================================
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!--GEHC. Also found in index-attr.xsl-->
<xsl:attribute-set name="__index__label"> <!--FM:SectionIndex--> <!--GEHC-->
    <xsl:attribute name="space-before">20pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
    <xsl:attribute name="font-size">24pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <!--<xsl:attribute name="span">all</xsl:attribute>-->
	<xsl:attribute name="margin-bottom">40pt</xsl:attribute>
	<xsl:attribute name="font-family">sans-serif</xsl:attribute>
	<xsl:attribute name="text-align">right</xsl:attribute>
	<xsl:attribute name="line-height">26pt</xsl:attribute>
</xsl:attribute-set>

<!--GEHC. Also found in index-attr.xsl-->
<xsl:attribute-set name="__index__letter-group"> <!--FM:GroupTitlesIX--> <!--GEHC-->
    <xsl:attribute name="font-size">13pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
	<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
	<xsl:attribute name="space-before">13pt</xsl:attribute>
    <xsl:attribute name="margin-bottom">6pt</xsl:attribute>
	<xsl:attribute name="font-family">sans-serif</xsl:attribute>
	<xsl:attribute name="text-align">left</xsl:attribute>
	<xsl:attribute name="line-height">15pt</xsl:attribute>
</xsl:attribute-set>
	
</xsl:stylesheet>
