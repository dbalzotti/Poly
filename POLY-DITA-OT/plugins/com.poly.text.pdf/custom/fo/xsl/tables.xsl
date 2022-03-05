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

    <!-- Suite Mar-2014: Remove table title variable #0010667 - mk -->
    <xsl:template match="*[contains(@class,' topic/table ')]/*[contains(@class,' topic/title ')]">
        <fo:block xsl:use-attribute-sets="table.title" id="{@id}">
                       <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Definition list with-number -->
    <xsl:template match="*[contains(@class, ' topic/dl ') and @outputclass='with-number']">
        <fo:list-block xsl:use-attribute-sets="ol-with-number" id="{@id}">
            <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]" mode="with-number"/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dlentry ')]" mode="with-number">
        <fo:list-item xsl:use-attribute-sets="ol-with-number.li">
            <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                <fo:block xsl:use-attribute-sets="ol.li__label__content">
                    <fo:inline id="{@id}"/>
                    <xsl:number/>
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                <fo:block xsl:use-attribute-sets="ol.li__content" keep-together="8">
                    <fo:inline font-weight="bold" padding-right="5pt">
                        <xsl:attribute name="color">
                            <xsl:choose>
                                <xsl:when test="../descendant::*[contains(@class, ' topic/dl ')]">
                                    <xsl:value-of select="$color-light-black"/>
                                </xsl:when>
                                <xsl:otherwise>black</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:value-of select="*[contains(@class, ' topic/dt ')]"/>
                    </fo:inline>
                    <xsl:choose>
                        <xsl:when test="count(*[contains(@class, ' topic/dd ')]/child::*[contains(@class, ' topic/dl ')]) &gt; 0">
                            <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]/child::*[contains(@class, ' topic/dl ')]" mode="with-number-sub"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]" mode="with-number"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>

    <!-- We do not want the contents wrapped in a block so that the term and
         definition appear on the same line. -->
    <xsl:template match="*[contains(@class, ' topic/dd ')]" mode="with-number">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Some special styling for a dl within a dl outputclass=with-number. In
         particular, we need blue terms and fixed width columns. -->
    <xsl:template match="*[contains(@class, ' topic/dl ')]" mode="with-number-sub">
        <fo:table>
            <fo:table-body start-indent="0">
                <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]" mode="with-number-sub"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dlentry ')]" mode="with-number-sub">
        <fo:table-row>
            <fo:table-cell>
                <fo:block color="{$color-light-black}">
                    <xsl:value-of select="*[contains(@class, ' topic/dt ')]"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell width="1em"/>
            <fo:table-cell>
                <fo:block>
                    <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]/node()"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <!-- Special styling for dl within a table, as per Mantis 2973. -->
    <xsl:template match="*[contains(@class, ' topic/dl ') and count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0]">
        <fo:block id="{@id}"/>
        <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]" mode="inside-table"/>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dt ')]" mode="inside-table">
        <fo:block font-weight="bold"><xsl:apply-templates select="node()"/></fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dd ')]" mode="inside-table">
        <fo:block><xsl:apply-templates select="node()"/></fo:block>
    </xsl:template>

</xsl:stylesheet>
