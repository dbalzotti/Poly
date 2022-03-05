<?xml version='1.0'?>
<!--
    Polycom Frontmatter styling. This includes cover and notices overrides.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="opentopic" version="2.0">

    <xsl:template name="createFrontMatter_1.0">
        <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="__noforce__page__count">
            <xsl:call-template name="insertFrontMatterStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block-container background-repeat="no-repeat" height="11in" width="8.5in">
                    <xsl:attribute name="background-image" select="
                            concat($customizationDir.url, 'common/artwork/',
                            'title_page_backgroundx.png')"/>
                    <fo:block xsl:use-attribute-sets="__frontmatter">
                        <!-- insert the logo or draft indication here. -->
                        
                        <xsl:if test="$DRAFT = 'yes'">
                            <fo:block text-align="center" font-size="20pt">
                                <xsl:text>DRAFT</xsl:text>
                            </fo:block>
                        </xsl:if>                        
                    </fo:block>

                    <xsl:variable name="cat_length" select="string-length($map/*[contains(@class,' bookmap/bookmeta ')]/*[contains(@class,' topic/category ')])"/>
                    
                    <xsl:variable name="left_col_length">
                        <xsl:choose>
                            <xsl:when test="$cat_length &gt; 36">54%</xsl:when>
                            <xsl:otherwise>53%</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <fo:block xsl:use-attribute-sets="__frontmatter__title">
                        <!-- Set the document type -->
                        <fo:table width="6.5in">
                            <fo:table-column column-number="1" text-align="left"/>
                            <fo:table-column column-number="2" text-align="right"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell column-number="1" width="{$left_col_length}" margin-right="0">
                                        <fo:block color="#cd0000" xsl:use-attribute-sets="__frontmatter__doctype">
                                            <fo:inline text-transform="uppercase">
                                                <xsl:value-of select="$map//*[contains(@class,' bookmap/bookmeta ')]/*
                                                    [contains(@class,' topic/category ')][1]"/>
                                            </fo:inline>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block xsl:use-attribute-sets="__cover__details __frontmatter__doctype" text-align="right">
                                            <xsl:value-of select="$map//*[contains(@class,' bookmap/bookmeta ')]
                                                /*[contains(@class,' topic/prodinfo ')]
                                                /*[contains(@class,' topic/vrmlist ')]
                                                /*[contains(@class,' topic/vrm ')]/@version"/>
                                            <xsl:text> | </xsl:text>
                                            <xsl:value-of select="($map//*[contains(@class,' bookmap/publisherinformation ')]
                                                /*[contains(@class,' bookmap/published ')]
                                                /*[contains(@class,' bookmap/completed ')]
                                                /*[contains(@class,' bookmap/month ')])[1]"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="($map//*[contains(@class,' bookmap/publisherinformation ')]
                                                /*[contains(@class,' bookmap/published ')]
                                                /*[contains(@class,' bookmap/completed ')]
                                                /*[contains(@class,' bookmap/year ')])[1]"/>
                                            <xsl:text> | </xsl:text>
                                            <xsl:value-of select="$map//*[contains(@class,' bookmap/bookid ')]
                                                /*[contains(@class,' bookmap/bookpartno ')]"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                        <!-- set the title -->
                        <xsl:choose>
                            <xsl:when test="$map/*[contains(@class, ' topic/title ')][1]">
                                <xsl:apply-templates select="$map/*[contains(@class, ' topic/title ')][1]"/>
                            </xsl:when>
                            <xsl:when test="$map//*[contains(@class, ' bookmap/mainbooktitle ')][1]">
                                <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/mainbooktitle ')][1]"/>
                            </xsl:when>
                            <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                                <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
                            <xsl:if test="$map//*[contains(@class, ' bookmap/booktitlealt ')][1]">
                                <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/booktitlealt ')][1]"/>
                            </xsl:if>
                        </fo:block>
                    </fo:block>
                  
                </fo:block-container>

                <!--<xsl:call-template name="createPreface"/>-->

            </fo:flow>
        </fo:page-sequence>
        
        <xsl:if test="not($retain-bookmap-order)">
            <xsl:call-template name="createNotices"/>
        </xsl:if>
    </xsl:template> 

    <xsl:template name="createNotices">
        <xsl:apply-templates select="/bookmap/*[contains(@class, ' topic/topic ')]" mode="process-notices"/>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/topic ')]" mode="process-notices">
        <xsl:variable name="topicType">
            <xsl:call-template name="determineTopicType"/>
        </xsl:variable>

        <xsl:if test="$topicType = 'topicNotices'">
            <xsl:call-template name="processTopicNotices"/>
        </xsl:if>
    </xsl:template>

    <!-- Added Notices processing here to change page formatting. -->

    <xsl:template name="processTopicNotices">
        <fo:page-sequence master-reference="body-sequence" format="i" xsl:use-attribute-sets="__noforce__page__count">
            <xsl:call-template name="insertFrontMatterStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="__notices" padding-left=".5in" padding-right=".5in">
                    <!--<xsl:if test="$DRAFT = 'yes'">
                        <xsl:attribute name="background-image" select="
                            concat($customizationDir.url, 'common/artwork/',
                            'draft.png')"/>
                    </xsl:if>-->
                    <xsl:call-template name="commonattributes"/>
                    <xsl:if test="not(ancestor::*[contains(@class, ' topic/topic ')])">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:number format="1"/>
                        </fo:marker>
                        <fo:marker marker-class-name="current-header">
                            <xsl:for-each select="child::*[contains(@class, ' topic/title ')]">
                                <xsl:apply-templates select="." mode="getTitle"/>
                            </xsl:for-each>
                        </fo:marker>
                    </xsl:if>

                    <xsl:apply-templates select="*[contains(@class, ' topic/prolog ')]"/>

                    <xsl:call-template name="insertChapterFirstpageStaticContent">
                        <xsl:with-param name="type" select="'notices'"/>
                    </xsl:call-template>

                    <!--<fo:block xsl:use-attribute-sets="topic.topic.title">
                        <xsl:call-template name="pullPrologIndexTerms"/>
                        <xsl:for-each select="child::*[contains(@class, ' topic/title ')]">
                            <xsl:apply-templates select="." mode="getTitle"/>
                        </xsl:for-each>
                    </fo:block>-->

<!--                    <xsl:call-template name="pullPrologIndexTerms"/>-->
                    <!--<xsl:for-each select="child::*[contains(@class, ' topic/title ')]">
                        <xsl:apply-templates select="." mode="getTitle"/>
                    </xsl:for-each>-->
                    
                    <xsl:choose>
                        <xsl:when test="$noticesLayout = 'BASIC'">
                            <xsl:apply-templates select="
                                    *[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                    contains(@class, ' topic/prolog '))]"/>
                            <xsl:apply-templates select="." mode="buildRelationships"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]"/>

                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

</xsl:stylesheet>
