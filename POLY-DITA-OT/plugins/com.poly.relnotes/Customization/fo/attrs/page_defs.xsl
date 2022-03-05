<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:param name="chapterLayout">MINITOC</xsl:param>
<!--    <xsl:param name="chapterLayout">BASIC</xsl:param>-->
    <xsl:param name="noticesLayout">BASIC</xsl:param>

    <xsl:variable name="page-width">8.5in</xsl:variable>
    <xsl:variable name="page-height">11in</xsl:variable>
    <xsl:variable name="mirror-page-margins" select="false()"/>
    <xsl:variable name="default-line-height">110%</xsl:variable>
    <xsl:variable name="side-col-width">0pt</xsl:variable>
    <xsl:variable name="page-margin-inside" select="'1in'"/>
    <xsl:variable name="page-margin-outside" select="'1in'"/>
    <xsl:variable name="page-margin-top" select="'1in'"/>
    <xsl:variable name="page-margin-bottom" select="'1.25in'"/>

    <xsl:attribute-set name="pagenum">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="common.link">
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
        <xsl:attribute name="border-bottom">thin solid #0031C7</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="image">
    </xsl:attribute-set>

    <xsl:attribute-set name="__force__page__count">
        <xsl:attribute name="force-page-count" select="'auto'"/>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__noforce__page__count">
        <xsl:attribute name="force-page-count" select="'no-force'"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic">
        <xsl:attribute name="padding-left">9pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__fo__root" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">Arial</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="body" use-attribute-sets="base-font">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-indent">0.0in</xsl:attribute>
        <xsl:attribute name="start-indent">0.0in</xsl:attribute>
        <xsl:attribute name="end-indent">0.0in</xsl:attribute>
        <xsl:attribute name="space-before">5.0pt</xsl:attribute>
        <xsl:attribute name="space-after">2.0pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-size">10.0pt</xsl:attribute>
        <xsl:attribute name="color">Black</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="fn">
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-indent">0.0in</xsl:attribute>
        <xsl:attribute name="start-indent">0.16667in</xsl:attribute>
        <xsl:attribute name="end-indent">0.0in</xsl:attribute>
        <xsl:attribute name="space-before">3.0pt</xsl:attribute>
        <xsl:attribute name="space-after">0.0pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-size">9.0pt</xsl:attribute>
        <xsl:attribute name="color">Black</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-indent">0.0in</xsl:attribute>
        <xsl:attribute name="start-indent">0.0in</xsl:attribute>
        <xsl:attribute name="end-indent">0.0in</xsl:attribute>
        <xsl:attribute name="space-before">6.0pt</xsl:attribute>
        <xsl:attribute name="space-after">0.0pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
    </xsl:attribute-set> 
    
</xsl:stylesheet>
