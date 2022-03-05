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
	
    <xsl:template match="*[contains(@class,' topic/xref ')]">
        <fo:inline id="{@id}"/>

        <xsl:variable name="destination" select="opentopic-func:getDestinationId(@href)"/>
        <xsl:variable name="element" select="key('key_anchor',$destination)[1]"/>

        <xsl:variable name="referenceTitle">
            <xsl:call-template name="insertReferenceTitle">
                <xsl:with-param name="href" select="@href"/>
                <xsl:with-param name="titlePrefix" select="''"/>
                <xsl:with-param name="destination" select="$destination"/>
                <xsl:with-param name="element" select="$element"/>
            </xsl:call-template>
        </xsl:variable>

        <fo:basic-link xsl:use-attribute-sets="xref">
            <xsl:call-template name="buildBasicLinkDestination">
                <xsl:with-param name="scope" select="@scope"/>
                <xsl:with-param name="href" select="@href"/>
            </xsl:call-template>

            <xsl:choose>
                <xsl:when test="not(@scope = 'external') and not($referenceTitle = '')">
                    <xsl:copy-of select="$referenceTitle"/>
                </xsl:when>
                <xsl:when test="not(@scope = 'external')">
                    <xsl:call-template name="insertPageNumberCitation">
                        <xsl:with-param name="isTitleEmpty" select="true"/>
                        <xsl:with-param name="destination" select="$destination"/>
                        <xsl:with-param name="element" select="$element"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="*[not(contains(@class,' topic/desc '))] | text()">
                            <xsl:variable name="linkContent"><xsl:apply-templates select="*[not(contains(@class,' topic/desc '))] | text()" /></xsl:variable>
                            <xsl:choose>
                                <xsl:when test="starts-with($linkContent, 'http://')">
                                    <xsl:value-of select="substring-after($linkContent, 'http://')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$linkContent"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>BAR</xsl:text>
                            <xsl:value-of select="@href"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </fo:basic-link>

        <!--
                Disable because of the CQ#8102 bug
                <xsl:if test="*[contains(@class,' topic/desc ')]">
                    <xsl:call-template name="insertLinkDesc"/>
                </xsl:if>
        -->

        <xsl:if test="not(@scope = 'external') and not($referenceTitle = '') and not($element[contains(@class, ' topic/fn ')])">
            <!-- SourceForge bug 1880097: should not include page number when xref includes author specified text -->
            <xsl:if test="not(processing-instruction()[name()='ditaot'][.='usertext'])">
                <xsl:call-template name="insertPageNumberCitation">
                    <xsl:with-param name="destination" select="$destination"/>
                    <xsl:with-param name="element" select="$element"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>

    </xsl:template>

    <!-- The insertReferenceTitle template is called from <xref> and <link> and is
         used to build link contents (using full FO syntax, not just the text). -->
    <xsl:template name="insertReferenceTitle">
        <xsl:param name="href"/>
        <xsl:param name="titlePrefix"/>
		<xsl:param name="destination"/>
		<xsl:param name="element"/>
        <xsl:apply-templates select="." mode="insertReferenceTitle">
            <xsl:with-param name="href" select="$href"/>
            <xsl:with-param name="titlePrefix" select="$titlePrefix"/>
            <xsl:with-param name="destination" select="$destination"/>
            <xsl:with-param name="element" select="$element"/>
        </xsl:apply-templates>
    </xsl:template>	

</xsl:stylesheet>
