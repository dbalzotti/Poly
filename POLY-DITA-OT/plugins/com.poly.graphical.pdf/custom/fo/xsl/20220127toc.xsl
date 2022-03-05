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
	
    <xsl:template match="*[contains(@class, ' topic/topic ') and not(contains(@class, ' bkinfo/bkinfo '))]" mode="toc">
        <xsl:param name="include"/>
        <xsl:variable name="topicLevel" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
        <xsl:if test="$topicLevel &lt; $tocMaximumLevel">
            <xsl:variable name="topicTitle">
                <xsl:call-template name="getNavTitle" />
            </xsl:variable>
            <xsl:variable name="id" select="@id"/>
            <xsl:variable name="gid" select="generate-id()"/>
            <!--xsl:variable name="topicNumber" select="count(exsl:node-set($topicNumbers)/topic[@id = $id][following-sibling::topic[@guid = $gid]]) + 1"/-->
            <xsl:variable name="mapTopic">
                <xsl:copy-of select="$map//*[@id = $id]"/>
            </xsl:variable>
            <xsl:variable name="topicType">
                <xsl:call-template name="determineTopicType"/>
            </xsl:variable>

            <!-- Removing this variable - it is not used and matches on an invalid class attribute. -->
            <!--<xsl:variable name="parentTopicHead">
                <xsl:copy-of select="$map//*[@id = $id]/parent::*[contains(@class, ' mapgroup/topichead ')]"/>
            </xsl:variable>-->

            <!--        <xsl:if test="(($mapTopic/*[position() = $topicNumber][@toc = 'yes' or not(@toc)]) or (not($mapTopic/*) and $include = 'true')) and not($parentTopicHead/*[position() = $topicNumber]/@toc = 'no')">-->
                <!-- added by William on 2009-05-11 for toc bug start -->
                <xsl:choose>
                    <xsl:when test="($mapTopic/*[position() = $topicLevel][@toc = 'yes' or not(@toc)]) or (not($mapTopic/*) and $include = 'true')">
                        <fo:block xsl:use-attribute-sets="__toc__indent">
                            <xsl:variable name="tocItemContent">
                                <fo:basic-link internal-destination="{concat('_OPENTOPIC_TOC_PROCESSING_', generate-id())}" xsl:use-attribute-sets="__toc__link">
                                    <xsl:apply-templates select="$topicType" mode="toc-prefix-text">
                                        <xsl:with-param name="id" select="@id"/>
                                    </xsl:apply-templates>
                                    <fo:inline xsl:use-attribute-sets="__toc__title" keep-together.within-line="always">
                                        <xsl:value-of select="$topicTitle"/>
                                        <!--xsl:if test="$rtl-pub and not($rtl-pub='')">
                                            <xsl:text> </xsl:text>
                                        </xsl:if-->
                                    </fo:inline>
                                    
                                    <fo:inline keep-together.within-line="always">
                                        <fo:page-number-citation
                                            ref-id="{concat('_OPENTOPIC_TOC_PROCESSING_', generate-id())}"
                                            xsl:use-attribute-sets="__toc__number"/>
                                    </fo:inline>
                                </fo:basic-link>
                            </xsl:variable>
                            <xsl:apply-templates select="$topicType" mode="toc-topic-text">
                                <xsl:with-param name="tocItemContent" select="$tocItemContent"/>
                            </xsl:apply-templates>
                        </fo:block>
                        <!-- In a future version, suppressing Notices in the TOC should not be hard-coded. -->
                        <xsl:if test="not($topicType = 'topicNotices')">
                            <xsl:apply-templates mode="toc">
                                <xsl:with-param name="include" select="'true'"/>
                            </xsl:apply-templates>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates mode="toc">
                            <xsl:with-param name="include" select="'true'"/>
                        </xsl:apply-templates>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- added by William on 2009-05-11 for toc bug end -->
            </xsl:if>
        </xsl:template>

        <!-- Wrap the contents title in an absolutely positioned block container.  -->
        <xsl:template name="createTocHeader">
            <fo:block-container absolute-position="absolute">
                <fo:block xsl:use-attribute-sets="__toc__header">
                    <xsl:attribute name="id">ID_TOC_00-0F-EA-40-0D-4D</xsl:attribute>
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Table of Contents'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:block-container>
        </xsl:template>
		
   <!-- Gets navigation title of current topic, used for bookmarks/TOC -->
    <xsl:template name="getPolyNavTitle">
        <xsl:variable name="topicref" select="key('map-id', @id)[1]" as="element()?"/>
        <xsl:apply-templates select="*[contains(@class,' topic/title ')]" mode="getTitle"/>
    </xsl:template>


		
		
		
    </xsl:stylesheet>
