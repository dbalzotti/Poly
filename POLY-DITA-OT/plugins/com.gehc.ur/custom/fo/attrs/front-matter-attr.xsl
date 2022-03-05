<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__product"> <!--FM:MachineName--> <!--GEHC-->
        <xsl:attribute name="margin-top">0in</xsl:attribute>
		<!--xsl:attribute name="margin-bottom">6pt</xsl:attribute-->
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">24pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__title" use-attribute-sets="common.title"> <!--FM:ManualName--> <!--GEHC-->
        <xsl:attribute name="space-before">0mm</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">24pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-family">
		    <xsl:choose>
			    <xsl:when test="$printedLang = 'VI' or $printedLang = 'vi'">sans-serif</xsl:when>
				<xsl:when test="$printedLang2 = 'VI' or $printedLang2 = 'vi'">sans-serif</xsl:when>
				<xsl:otherwise>sans-serif</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__version"> <!--FM:SoftwareRev--> <!--GEHC-->
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">19pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-style">italic</xsl:attribute>
		<xsl:attribute name="font-family">
		    <xsl:choose>
			    <xsl:when test="$printedLang = 'VI' or $printedLang = 'vi'">sans-serif</xsl:when>
				<xsl:when test="$printedLang2 = 'VI' or $printedLang2 = 'vi'">sans-serif</xsl:when>
				<xsl:otherwise>sans-serif</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
    </xsl:attribute-set>
	
  <xsl:attribute-set name="__frontmatter_main_title" use-attribute-sets="common.title"> <!--FM:Heading1--> <!--GEHC-->
    <xsl:attribute name="padding-top">22pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">12pt</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="line-height">17pt</xsl:attribute>
    <xsl:attribute name="font-size">16pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="break-before">page</xsl:attribute>
    <xsl:attribute name="border-bottom-style">none</xsl:attribute>
    <xsl:attribute name="border-bottom-width">0pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
  </xsl:attribute-set>

	
	<xsl:attribute-set name="__frontmatter__image"> <!--GEHC-->
        <xsl:attribute name="margin-top">.5in</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__ce_image"> <!--GEHC-->
        <xsl:attribute name="margin-top">10pt</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__ge_logo"> <!--GEHC-->
		<xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

	<xsl:attribute-set name="__frontmatter__ge_docinfo"> <!--GEHC-->
		<xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">9pt</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__dba"> <!--GEHC-->
        <xsl:attribute name="margin-top">.25in</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">36pt</xsl:attribute>
        <xsl:attribute name="font-size">11pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="top">210mm</xsl:attribute>
        <xsl:attribute name="bottom">20mm</xsl:attribute>
        <xsl:attribute name="right">20mm</xsl:attribute>
        <xsl:attribute name="left">20mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container_content">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__mainbooktitle">
        <!--<xsl:attribute name=""></xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__booklibrary">
        <!--<xsl:attribute name=""></xsl:attribute>-->
    </xsl:attribute-set>

	<xsl:attribute-set name="bookmap.summary">
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__table"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="start-indent">0in</xsl:attribute>
		<xsl:attribute name="margin-top">3pt</xsl:attribute>
		<xsl:attribute name="margin-left">3pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="block-container.frontmatter"> <!--GEHC-->
	    <xsl:attribute name="width">2in</xsl:attribute>
		<xsl:attribute name="start-indent">0in</xsl:attribute>
		<xsl:attribute name="text-align">right</xsl:attribute>
		<xsl:attribute name="margin-top">5pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size">12pt</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__back"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <!--xsl:attribute name="font-weight">normal</xsl:attribute-->
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
		<xsl:attribute name="margin-top">5pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter__caution"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<!--xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute-->
		<xsl:attribute name="margin-top">5pt</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="__frontmatter_title__back"> <!--GEHC-->
	    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#000000</xsl:attribute>
		<xsl:attribute name="margin-bottom">12pt</xsl:attribute>
		<xsl:attribute name="margin-top">24pt</xsl:attribute>
		<xsl:attribute name="break-before">page</xsl:attribute>
		<xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/> + 1.5in</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>