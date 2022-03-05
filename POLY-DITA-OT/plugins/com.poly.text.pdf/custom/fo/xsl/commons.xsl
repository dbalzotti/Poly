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

   <xsl:variable name="rtl-pub" select="(/*[@xml:lang = 'ar']) or (/*[@xml:lang = 'he'])"/>
    <!-- suite 0011379: text within <data> tags won't print for print docs -->
    <xsl:template match="*[contains(@class, ' topic/data ')][@name = 'link']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Never show note images -->
    <xsl:template match="*[contains(@class,' topic/note ')]">
        <xsl:call-template name="placeNoteContent"/>
    </xsl:template>

    <!-- Suite Oct-2013: DO NOT process titlealts and navtitle elements in userguide output - MK -->
    <xsl:template match="*[contains(@class, ' topic/titlealts ')]" priority="9" />
    <xsl:template match="*[contains(@class, ' topic/navtitle ')]" priority="9" />

    <xsl:template match="*" mode="placeNoteContent">
        <!-- Show label as a "running head" instead of in a table. Mantis 2977. Michael Snoyman, Jan 11 2011 -->
        <fo:block xsl:use-attribute-sets="note" id="{@id}">
            <xsl:variable name="label">
                <xsl:choose>
                    <xsl:when test="@type='note' or not(@type)">
                        <fo:inline xsl:use-attribute-sets="note__label__note">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Note'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='tip'">
                        <fo:inline xsl:use-attribute-sets="note__label__tip">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Tip'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='fastpath'">
                        <fo:inline xsl:use-attribute-sets="note__label__fastpath">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Fastpath'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='restriction'">
                        <fo:inline xsl:use-attribute-sets="note__label__restriction">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Restriction'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='important'">
                        <fo:inline xsl:use-attribute-sets="note__label__important">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Important'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='remember'">
                        <fo:inline xsl:use-attribute-sets="note__label__remember">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Remember'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='attention'">
                        <fo:inline xsl:use-attribute-sets="note__label__attention">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Attention'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='caution'">
                        <fo:inline xsl:use-attribute-sets="note__label__caution">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Caution'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='danger'">
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Danger'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='other'">
                        <fo:inline xsl:use-attribute-sets="note__label__other">
                            <xsl:choose>
                                <xsl:when test="@othertype">
                                    <xsl:value-of select="@othertype"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="@type"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:inline>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <!-- Mantis 3105: Do not have label on the back cover. Michael Snoyman, Feb 1 2011.
                 Mantis 3415: Special warning icon.
              -->
            <xsl:choose>
                <xsl:when test="@type = 'warning'">
                    <fo:float>
                        <xsl:attribute name="float">
                            <xsl:attribute name="padding-left">
                                <xsl:choose>
                                    <xsl:when test="not($rtl-pub)">left</xsl:when>
                                    <xsl:otherwise>right</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:attribute>
                        <fo:block>
                            <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/warning_icon_PLT_pantone.pdf)" content-width="5.5mm">
                                <xsl:attribute name="padding-right">
                                    <xsl:choose>
                                        <xsl:when test="not($rtl-pub)">0.5mm</xsl:when>
                                        <xsl:otherwise>0mm</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:attribute name="padding-left">
                                    <xsl:choose>
                                        <xsl:when test="not($rtl-pub)">0mm</xsl:when>
                                        <xsl:otherwise>0.5mm</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </fo:external-graphic>
                        </fo:block>
                    </fo:float>
                </xsl:when>
                <xsl:when test="ancestor::*[@outputclass = 'backpage']"/>
                <xsl:otherwise>
                    <fo:inline xsl:use-attribute-sets="note__label">
                        <xsl:value-of select="upper-case($label)"/>
                    </fo:inline>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- For images within a note on the back cover, align with the top of the
         text. Mantis 3105, Michael Snoyman, Feb 1 2011. -->
    <xsl:template match="*[contains(@class, ' topic/image ') and count(ancestor::*[@outputclass = 'backpage']) &gt; 0]">
        <fo:float><!-- float="left">-->
            <xsl:attribute name="float">
                <xsl:choose>
                    <xsl:when test="not($rtl-pub)">left</xsl:when>
                    <xsl:otherwise>right</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <fo:block>
                <fo:external-graphic vertical-align="text-top" src="url({@href})"/>
            </fo:block>
        </fo:float>
    </xsl:template>

    <!-- Apply special styling for abstract. -->
    <xsl:template match="*[contains(@class,' topic/abstract ')]">
        <fo:block id="{@id}" xsl:use-attribute-sets="topic__abstract">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*" mode="createTopicAttrsName">
        <xsl:param name="theCounter"/>
        <xsl:param name="theName" select="''"/>
        <xsl:choose>
           <!-- <xsl:when test="number($theCounter) > 7">
                <xsl:call-template name="createTopicAttrsName">
                    <xsl:with-param name="theCounter" select="number($theCounter) - 1"/>
                    <xsl:with-param name="theName" select="''"/>
                </xsl:call-template>
            </xsl:when>-->
            <xsl:when test="number($theCounter) > 0">
                <xsl:call-template name="createTopicAttrsName">
                    <xsl:with-param name="theCounter" select="number($theCounter) - 1"/>
                    <xsl:with-param name="theName" select="concat($theName, 'topic.')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($theName, 'title')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- The chapter title needs to be wrapped in a absolutely positioned block container. -->
    <xsl:template match="*" mode="processTopicTitle">
        <xsl:variable name="level" select="count(ancestor::*[contains(@class,' topic/topic ')])"/>
        <xsl:variable name="attrSet1">
            <xsl:call-template name="createTopicAttrsName">
                <xsl:with-param name="theCounter" select="$level"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="attrSet2" select="concat($attrSet1, '__content')"/>
        <!-- We only want to absolutely position first-level topics. -->
        <xsl:variable name="inside">
            <fo:block id="{@id}" >
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="$attrSet1"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
                <fo:block>
                    <xsl:call-template name="processAttrSetReflection">
                        <xsl:with-param name="attrSet" select="$attrSet2"/>
                        <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                    </xsl:call-template>
                    <xsl:if test="$level = 1">
                        <fo:marker marker-class-name="current-header">
                            <xsl:call-template name="getTitle"/>
                        </fo:marker>
                    </xsl:if>
                    <xsl:if test="$level = 2">
                        <fo:marker marker-class-name="current-h2">
                            <xsl:call-template name="getTitle"/>
                        </fo:marker>
                    </xsl:if>
                    <fo:inline id="{parent::node()/@id}"/>
                    <fo:inline id="{concat('_OPENTOPIC_TOC_PROCESSING_', generate-id(..))}"/>
                    <!-- added by William on 2009-07-02 for indexterm bug:2815485 start-->
                    <xsl:call-template name="pullPrologIndexTerms"/>
                    <!-- added by William on 2009-07-02 for indexterm bug:2815485 end-->
                    <xsl:call-template name="getTitle"/>
                </fo:block>
            </fo:block>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$level = 1">
                <fo:block-container keep-with-next="5" absolute-position="absolute">
                    <xsl:copy-of select="$inside"/>
                </fo:block-container>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$inside"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Bottom align the backpagebottom -->
    <xsl:template match="*[contains(@class,' topic/section ')]">
        <fo:block xsl:use-attribute-sets="section" id="{@id}">
            <xsl:apply-templates select="." mode="dita2xslfo:section-heading"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class,' topic/section ') and @outputclass='backpagebottom']">
        <fo:block-container position="absolute" display-align="after" bottom="30pt">
            <fo:block xsl:use-attribute-sets="section" id="{@id}">
                <xsl:apply-templates select="." mode="dita2xslfo:section-heading"/>
                <xsl:apply-templates/>
            </fo:block>
        </fo:block-container>
    </xsl:template>

    <!-- Apply no special styling to certain elements in backpagebottom. Mantis
         3105, Michael Snoyman, Jan 26 2011. -->
    <xsl:template match="*[contains(@class,' topic/keyword ') and count(ancestor::*[@outputclass = 'backpagebottom']) = 1]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="*[contains(@class,' topic/ph ') and count(ancestor::*[@outputclass = 'backpagebottom']) = 1]">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Mantis 3284: Figures in What's in the Box are specially styled -->
    <xsl:template match="*[@outputclass = 'whatsinbox']//*[contains(@class,' topic/fig ')]/*[contains(@class,' topic/title ')]">
        <fo:block xsl:use-attribute-sets="fig.title__whatsinbox" id="{@id}">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- A heads (second level title) need to go in left margin -->
    <!--xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]">
        <xsl:choose>
            <xsl:when test="count(ancestor::*[contains(@class, ' topic/topic ')]) = 2">
                <suite aug-2018 0019788: figure out why column head and text is indented and fix: PLT PDF need to clear the float in case title is longer than topic content>
                <fo:block space-before="12pt" clear="both"/>
                <fo:float>
                    <xsl:attribute name="float">
                        <xsl:choose>
                            <xsl:when test="not($rtl-pub)">left</xsl:when>
                            <xsl:otherwise>right</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <fo:block margin-left="0" text-align="right" id="{@id}">
                        <fo:block id="{parent::node()/@id}"/>
                        <fo:block id="{concat('_OPENTOPIC_TOC_PROCESSING_', generate-id(..))}"/>
                        <fo:table width="108pt">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block xsl:use-attribute-sets="topic.topic.title">
                                            <xsl:apply-templates/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:float>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="topicType">
                    <xsl:call-template name="determineTopicType"/>
                </xsl:variable>
                <xsl:choose>
                    <Disable chapter title processing when mini TOC is created>
                    <xsl:when test="(topicType = 'topicChapter') or (topicType = 'topicAppendix')" />
                    <   Normal processing         >
                    <xsl:otherwise>
                        <xsl:call-template name="processTopicTitle"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template-->

    <xsl:template match="*[contains(@class, ' sw-d/msgph ')]">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Make sure nothing gets outputted for empty bodies. -->
    <xsl:template match="*[contains(@class, ' topic/body ')][not(node())]" priority="10"/>
    
    <xsl:template match="*[contains(@class, ' topic/tm ')]">
        <xsl:choose>
            <xsl:when test="not($rtl-pub)">
                <xsl:apply-templates select="." mode="ltr"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="rtl"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/tm ')]" mode="ltr">
        <fo:inline xsl:use-attribute-sets="tm">
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="@tmtype='service'">
                    <fo:inline xsl:use-attribute-sets="tm__content__service">SM</fo:inline>
                </xsl:when>
                <xsl:when test="@tmtype='tm'">
                    <fo:inline xsl:use-attribute-sets="tm__content">&#8482;</fo:inline>
                </xsl:when>
                <xsl:when test="@tmtype='reg'">
                    <fo:inline xsl:use-attribute-sets="tm__content">&#174;</fo:inline>
                </xsl:when>
                <xsl:otherwise>
                    <fo:inline xsl:use-attribute-sets="tm__content"><xsl:text>Error in tm type.</xsl:text></fo:inline>
                </xsl:otherwise>
            </xsl:choose>
        </fo:inline>
    </xsl:template>


    <xsl:template match="*[contains(@class, ' topic/tm ')]" mode="rtl">
        <fo:inline xsl:use-attribute-sets="tm">            
            <xsl:choose>
                <xsl:when test="@tmtype='service'">
                    <fo:inline xsl:use-attribute-sets="tm__content__service">SM</fo:inline>
                </xsl:when>
                <xsl:when test="@tmtype='tm'">
                    <fo:inline xsl:use-attribute-sets="tm__content">&#8482;</fo:inline>
                </xsl:when>
                <xsl:when test="@tmtype='reg'">
                    <fo:inline xsl:use-attribute-sets="tm__content">&#174;</fo:inline>
                </xsl:when>
                <xsl:otherwise>
                    <fo:inline xsl:use-attribute-sets="tm__content"><xsl:text>Error in tm type.</xsl:text></fo:inline>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <!-- Suite Aug-2013: do not process draft-comment - mk -->
    <xsl:template match="*[contains(@class,' topic/draft-comment ')]"/>
    

    
    <!-- 29 jun 2016 0014638: B head and text not aligning: plantronics PDF am -->
    <xsl:template match="*" mode="format-shortdesc-as-block">
    <!-- don't show shortdesc block if nothing is in it -->
        <xsl:if
            test="string-length(normalize-space(.)) &gt; 0 or descendant::*[contains(@class, ' topic/image ')]">
            <fo:block xsl:use-attribute-sets="topic__shortdesc" id="{@id}">
                <!-- If the shortdesc is sufficiently short, add keep-with-next. -->
                <xsl:if test="string-length(.) &lt;= $maxCharsInShortDesc">
                    <!-- Low-strength keep to avoid conflict with keeps on titles. -->
                    <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </fo:block>
        </xsl:if>
        <!--Edited by William on 2009-07-07 for bug:2815492 end-->
    </xsl:template>
	
    <xsl:template name="getTitle"><!-- get fully-processed title content by whatever mechanism -->
        <xsl:apply-templates select="." mode="getTitle"/>
    </xsl:template>
    <xsl:template match="*" mode="getTitle">
        <xsl:choose>
<!--             add keycol here once implemented-->
            <xsl:when test="@spectitle">
                <xsl:value-of select="@spectitle"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
    <xsl:template name="placeNoteContent">
        <xsl:apply-templates select="." mode="placeNoteContent"/>
    </xsl:template>
    <xsl:template match="*" mode="placeNoteContent">
        <fo:block xsl:use-attribute-sets="note" id="{@id}">
            <fo:inline xsl:use-attribute-sets="note__label">
                <xsl:choose>
                    <xsl:when test="@type='note' or not(@type)">
                        <fo:inline xsl:use-attribute-sets="note__label__note">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Note'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='tip'">
                        <fo:inline xsl:use-attribute-sets="note__label__tip">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Tip'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='fastpath'">
                        <fo:inline xsl:use-attribute-sets="note__label__fastpath">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Fastpath'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='restriction'">
                        <fo:inline xsl:use-attribute-sets="note__label__restriction">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Restriction'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='important'">
                        <fo:inline xsl:use-attribute-sets="note__label__important">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Important'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='remember'">
                        <fo:inline xsl:use-attribute-sets="note__label__remember">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Remember'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='attention'">
                        <fo:inline xsl:use-attribute-sets="note__label__attention">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Attention'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='caution'">
                        <fo:inline xsl:use-attribute-sets="note__label__caution">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Caution'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='danger'">
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Danger'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type='other'">
                        <fo:inline xsl:use-attribute-sets="note__label__other">
                            <xsl:choose>
                                <xsl:when test="@othertype">
                                    <xsl:value-of select="@othertype"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="@type"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:inline>
                    </xsl:when>
                </xsl:choose>
                <xsl:text>: </xsl:text>
            </fo:inline>
            <xsl:text>  </xsl:text>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
	
    <xsl:template name="createTopicAttrsName">
        <xsl:param name="theCounter"/>
        <xsl:param name="theName" select="''"/>
        <xsl:apply-templates select="." mode="createTopicAttrsName">
          <xsl:with-param name="theCounter" select="$theCounter"/>
          <xsl:with-param name="theName" select="$theName"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="*" mode="createTopicAttrsName">
      <xsl:param name="theCounter"/>
      <xsl:param name="theName" select="''"/>
        <xsl:choose>
            <xsl:when test="number($theCounter) > 0">
                <xsl:call-template name="createTopicAttrsName">
                    <xsl:with-param name="theCounter" select="number($theCounter) - 1"/>
                    <xsl:with-param name="theName" select="concat($theName, 'topic.')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($theName, 'title')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
    <xsl:template name="processTopicTitle">
        <xsl:apply-templates select="." mode="processTopicTitle"/>
    </xsl:template>
    <xsl:template match="*" mode="processTopicTitle">
        <xsl:variable name="level" select="count(ancestor::*[contains(@class,' topic/topic ')])"/>
        <xsl:variable name="attrSet1">
            <xsl:call-template name="createTopicAttrsName">
                <xsl:with-param name="theCounter" select="$level"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="attrSet2" select="concat($attrSet1, '__content')"/>
        <fo:block id="{@id}">
            <xsl:call-template name="processAttrSetReflection">
                <xsl:with-param name="attrSet" select="$attrSet1"/>
                <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
            </xsl:call-template>
            <fo:block>
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="$attrSet2"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
                <xsl:if test="$level = 1">
                    <fo:marker marker-class-name="current-header">
                        <xsl:call-template name="getTitle"/>
                    </fo:marker>
                </xsl:if>
                <xsl:if test="$level = 2">
                    <fo:marker marker-class-name="current-h2">
                        <xsl:call-template name="getTitle"/>
                    </fo:marker>
                </xsl:if>
                <fo:inline id="{parent::node()/@id}"/>
                <fo:inline id="{concat('_OPENTOPIC_TOC_PROCESSING_', generate-id(..))}"/>
                <!-- added by William on 2009-07-02 for indexterm bug:2815485 start-->
                <xsl:call-template name="pullPrologIndexTerms"/>
                <!-- added by William on 2009-07-02 for indexterm bug:2815485 end-->
                <xsl:call-template name="getTitle"/>
            </fo:block>
        </fo:block>
    </xsl:template>
	
    <xsl:template name="placeImage">
        <xsl:param name="imageAlign"/>
        <xsl:param name="href"/>
        <xsl:param name="height"/>
        <xsl:param name="width"/>
        <xsl:apply-templates select="." mode="placeImage">
            <xsl:with-param name="imageAlign" select="$imageAlign"/>
            <xsl:with-param name="href" select="$href"/>
            <xsl:with-param name="height" select="$height"/>
            <xsl:with-param name="width" select="$width"/>
        </xsl:apply-templates>
    </xsl:template>


    <!-- Gets navigation title of current topic, used for bookmarks/TOC -->
    <xsl:template name="getPolyNavTitle">
        <xsl:variable name="topicref" select="key('map-id', @id)[1]" as="element()?"/>
        <!--xsl:choose>
            <xsl:when test="$topicref/@locktitle='yes' and
                            $topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]">
               <xsl:apply-templates select="$topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]/node()"/>
            </xsl:when>
            <xsl:when test="$topicref/@locktitle='yes' and
                            $topicref/@navtitle">
                <xsl:value-of select="$topicref/@navtitle"/>
            </xsl:when>
            <xsl:when test="*[contains(@class,' topic/titlealts ')]/*[contains(@class,' topic/navtitle ')]">
                <xsl:apply-templates select="*[contains(@class,' topic/titlealts ')]/*[contains(@class,' topic/navtitle ')]/node()"/> 
            </xsl:when-->
            <!--xsl:otherwise-->
                <xsl:apply-templates select="*[contains(@class,' topic/title ')]" mode="getTitle"/>
            <!--/xsl:otherwise-->
        <!--/xsl:choose-->
    </xsl:template>

  <xsl:template match="*" mode="insertChapterFirstpageStaticContent">
        <xsl:param name="type" as="xs:string"/>
        <fo:block>
            <xsl:attribute name="id">
                <xsl:call-template name="generate-toc-id"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="$type = 'chapter'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <!--xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Chapter with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template-->
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'appendix'">
                        <!--fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Appendix with number'"/>
                                <xsl:with-param name="params">
                                    <number>
                                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                            <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                        </fo:block>
                                    </number>
                                </xsl:with-param>
                            </xsl:call-template>
                        </fo:block-->
                </xsl:when>
              <xsl:when test="$type = 'appendices'">
                <!--fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Appendix with number'"/>
                    <xsl:with-param name="params">
                      <number>
                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                          <xsl:text>&#xA0;</xsl:text>
                        </fo:block>
                      </number>
                    </xsl:with-param>
                  </xsl:call-template>
                </fo:block-->
              </xsl:when>
                <xsl:when test="$type = 'part'">
                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                            <!--xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Part with number'"/>
                                <xsl:with-param name="params">
                                    <number>
                                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                            <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                        </fo:block>
                                    </number>
                                </xsl:with-param>
                            </xsl:call-template-->
                        </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'preface'">
                        <!--fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Preface title'"/>
                            </xsl:call-template>
                        </fo:block-->
                </xsl:when>
                <xsl:when test="$type = 'notices'">
                        <!--fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Notices title'"/>
                            </xsl:call-template>
                        </fo:block-->
                </xsl:when>
            </xsl:choose>
        </fo:block>
    </xsl:template>
 
    
</xsl:stylesheet>
