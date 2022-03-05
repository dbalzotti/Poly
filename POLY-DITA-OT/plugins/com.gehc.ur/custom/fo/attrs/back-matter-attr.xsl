<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
	
	<xsl:attribute-set name="__backmatter"> <!--GEHC-->
        <xsl:attribute name="font-family">GEInspira</xsl:attribute>
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">7.5pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
    </xsl:attribute-set>

<xsl:attribute-set name="__backmatter.first"> <!--GEHC-->
        <xsl:attribute name="font-family">GEInspira</xsl:attribute>
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">7.5pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="break-before">page</xsl:attribute>
    </xsl:attribute-set>	

    <xsl:attribute-set name="__backmatter_title"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="margin-bottom">12pt</xsl:attribute>
    </xsl:attribute-set>	
	
	<xsl:attribute-set name="__backmatter_warranty"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="margin-top">5pt</xsl:attribute>
		<xsl:attribute name="start-indent">0in</xsl:attribute>		
		<xsl:attribute name="margin-left">0pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="__backmatter_warranty.last"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="break-after">page</xsl:attribute>
		<xsl:attribute name="margin-top">5pt</xsl:attribute>
		<xsl:attribute name="start-indent">0in</xsl:attribute>
		<xsl:attribute name="margin-left">0pt</xsl:attribute>		
	</xsl:attribute-set>

</xsl:stylesheet>