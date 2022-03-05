<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:attribute-set name="thead.row.entry" use-attribute-sets="common.border__top">
        <!--head cell-->
        <xsl:attribute name="background-color">rgb(219,221,223)</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="table.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="line-height">11pt</xsl:attribute>
    </xsl:attribute-set>    
    
    <xsl:attribute-set name="table" use-attribute-sets="base-font">
        <!--It is a table container -->
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">18pt</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tbody.row">
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="common.table.body.entry">
        <xsl:attribute name="space-before">6pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after">4pt</xsl:attribute>
        <xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
        <xsl:attribute name="start-indent">6pt</xsl:attribute>
        <xsl:attribute name="end-indent">6pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="common.table.head.entry">
        <xsl:attribute name="space-before">6pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="space-after">4pt</xsl:attribute>
        <xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
        <xsl:attribute name="start-indent">6pt</xsl:attribute>
        <xsl:attribute name="end-indent">6pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
	
	 <!-- LAL 03-21-2016 - Changed background-color to white per Julia request for choicetable.  Background for certain rows was antiquewhite -->
  <xsl:attribute-set name="sthead.stentry__keycol-content" use-attribute-sets="common.table.body.entry common.table.head.entry">
    <xsl:attribute name="background-color">white</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="strow.stentry__content" use-attribute-sets="common.table.body.entry">
  </xsl:attribute-set>

    <!-- LAL 03-21-2016 - Changed background-color to white per Julia request for choicetable.  Background for certain rows was antiquewhite -->
  <xsl:attribute-set name="strow.stentry__keycol-content" use-attribute-sets="common.table.body.entry common.table.head.entry">
    <xsl:attribute name="background-color">white</xsl:attribute>
  </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__top" use-attribute-sets="common.border__top">
        <xsl:attribute name="border-top-width">.2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__bottom" use-attribute-sets="common.border__bottom">
        <xsl:attribute name="border-after-width.conditionality">retain</xsl:attribute>
        <xsl:attribute name="border-bottom-width">.2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="thead__tableframe__bottom" use-attribute-sets="common.border__bottom">
<!--        <xsl:attribute name="border-bottom-width">.2pt</xsl:attribute>-->
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__left" use-attribute-sets="common.border__left">
        <xsl:attribute name="border-left-width">.2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__tableframe__right" use-attribute-sets="common.border__right">
        <xsl:attribute name="border-right-width">.2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="tgroup.tbody" use-attribute-sets="common.border__top common.border__bottom"/>
    
</xsl:stylesheet>