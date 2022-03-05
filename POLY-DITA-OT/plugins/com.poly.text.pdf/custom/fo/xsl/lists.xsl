<?xml version='1.0'?>

<!--
Copyright ? 2004-2006 by Idiom Technologies, Inc. All rights reserved.
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

This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    exclude-result-prefixes="dita-ot ot-placeholder opentopic opentopic-index opentopic-func dita2xslfo xs"
    version="2.0">
	
    <!-- Special handling for 2column ordered lists. -->
    <xsl:template match="*[contains(@class, ' topic/ol ') and @outputclass='2column']">
        <!-- We do this as two columns in a table. Each column is an ordered
             list.
          -->
        <xsl:variable name="firstColCount" select="ceiling(count(child::*[contains(@class, ' topic/li ')]) div 2)"/> 
        <fo:table>
            <fo:table-column column-number="1" column-width="proportional-column-width(1.00)"/>
            <fo:table-column column-number="2" column-width="proportional-column-width(1.00)"/>
            <fo:table-body>
                <xsl:for-each select="child::*[contains(@class, ' topic/li ') and position() &lt;= $firstColCount]">
                    <xsl:variable name="position" select="position()"/>
                    <xsl:variable name="secondCol" select="$position + $firstColCount"/>
                    <fo:table-row margin-right="0" end-indent="0">
                        <fo:table-cell padding-right="2mm">
                            <fo:list-block provisional-distance-between-starts="2em"
                                provisional-label-separation="1mm" start-indent="0mm"
                                id="{@id}">
                                <xsl:apply-templates
                                    select="parent::*/child::*[contains(@class, ' topic/li ')][$position]"
                                    />
                            </fo:list-block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:attribute name="padding-left">
                                <xsl:choose>
                                    <xsl:when test="not($rtl-pub)">2mm</xsl:when>
                                    <xsl:otherwise>0mm</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="padding-left">
                                <xsl:choose>
                                    <xsl:when test="not($rtl-pub)">0mm</xsl:when>
                                    <xsl:otherwise>2mm</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <fo:list-block provisional-distance-between-starts="2em"
                                provisional-label-separation="1mm" start-indent="0mm"
                                id="{@id}">
                                <xsl:apply-templates
                                    select="parent::*/child::*[contains(@class, ' topic/li ')][$secondCol]"
                                    />
                            </fo:list-block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <!-- Force the list label to just be a number. -->
    <xsl:template match="*[contains(@class, ' topic/ol ')]/*[contains(@class, ' topic/li ')]">
        <fo:list-item xsl:use-attribute-sets="ol.li">
            <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                <fo:block xsl:use-attribute-sets="ol.li__label__content">
                    <fo:inline id="{@id}"/>
                    <!-- Modifications here: don't do any variable lookup -->
                    <xsl:choose>
                        <xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
                            <xsl:number format="A"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:number/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                <fo:block xsl:use-attribute-sets="ol.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>
</xsl:stylesheet>
