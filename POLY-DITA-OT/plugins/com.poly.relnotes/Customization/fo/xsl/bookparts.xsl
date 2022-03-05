<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xs" version="2.0">    
    
    <xsl:variable name="dir" select="/*[contains(@class,' bookmap/bookmap ')]/@dir"/>
    
    <xsl:variable name="marg_left">
        <xsl:choose>
            <xsl:when test="($dir = 'rtl') or ($dir = 'rlo')">0</xsl:when>
            <xsl:otherwise>-1.1in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="marg_right">
        <xsl:choose>
            <xsl:when test="($dir = 'rtl') or ($dir = 'rlo')">-1.1in</xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="marg_title_right">
        <xsl:choose>
            <xsl:when test="($dir = 'rtl') or ($dir = 'rlo')">1.3in</xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="marg_title_left">
        <xsl:choose>
            <xsl:when test="($dir = 'rtl') or ($dir = 'rlo')">0</xsl:when>
            <xsl:otherwise>1.3in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!--  Bookmap Chapter processing  -->
    <xsl:template name="processTopicChapter">
        
        <xsl:variable name="level" as="xs:integer">
            <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>

        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="__force__page__count" force-page-count="no-force">
<!--            <xsl:call-template name="startPageNumbering"/>-->
            <xsl:call-template name="insertBodyStaticContents"/>            
            <fo:flow flow-name="xsl-region-body">
                
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:variable name="level" as="xs:integer">
                        <xsl:apply-templates select="." mode="get-topic-level"/>
                    </xsl:variable>
                    <xsl:if test="$level eq 1">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                            <xsl:for-each select="$topicref">
                                <xsl:number count="*[contains(@class,' bookmap/chapter ')]" format="1"/>
                            </xsl:for-each>
                        </fo:marker>
                        <fo:marker marker-class-name="current-header">
                            <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                <xsl:apply-templates select="." mode="getTitle"/>
                            </xsl:for-each>
                        </fo:marker>
                    </xsl:if>

                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>

                    <xsl:call-template name="insertChapterFirstpageStaticContent">
                        <xsl:with-param name="type" select="'chapter'"/>
                    </xsl:call-template>

                    <fo:block xsl:use-attribute-sets="topic.title"> 
                        <xsl:call-template name="pullPrologIndexTerms"/>                                           
                        <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                            <xsl:apply-templates select="." mode="getTitle"/>
                        </xsl:for-each>
                        <!--<fo:table>
                            <fo:table-column column-width=".8in" text-align="center" column-number="1"/>
                            <fo:table-column column-number="2"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell column-number="1">
                                        <fo:block xsl:use-attribute-sets="chapter_number">
                                            <xsl:value-of select="count(preceding-sibling::*[contains(@class, ' topic/topic ')])"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell column-number="2">
                                        <fo:block padding-left="3pt" margin-left="{$marg_title_left}"
                                            margin-right="{$marg_title_right}"> 
                                            <xsl:call-template name="pullPrologIndexTerms"/>                                           
                                            <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                                <xsl:apply-templates select="." mode="getTitle"/>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>-->
                    </fo:block>

                    <xsl:choose>
                        <xsl:when test="$chapterLayout='BASIC'">
                            <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                    contains(@class, ' topic/prolog '))]"/>
                            <xsl:apply-templates select="." mode="buildRelationships"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <!--  Bookmap Appendix processing  -->
    <xsl:template name="processTopicAppendix">
        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="__force__page__count">
            <xsl:call-template name="insertBodyStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:variable name="level" as="xs:integer">
                        <xsl:apply-templates select="." mode="get-topic-level"/>
                    </xsl:variable>
                    <xsl:if test="$level eq 1">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                            <xsl:for-each select="$topicref">
                                <xsl:number count="*[contains(@class,' bookmap/appendix ')]" format="1"/>
                            </xsl:for-each>
                        </fo:marker>
                        <fo:marker marker-class-name="current-header">
                            <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                <xsl:apply-templates select="." mode="getTitle"/>
                            </xsl:for-each>
                        </fo:marker>
                    </xsl:if>

                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>

                    <xsl:call-template name="insertChapterFirstpageStaticContent">
                        <xsl:with-param name="type" select="'appendix'"/>
                    </xsl:call-template>               
                    
                    <fo:block xsl:use-attribute-sets="topic.title" margin-left="{$marg_left}" margin-right="{$marg_right}">
                        <fo:table>
                            <fo:table-column column-width=".8in" text-align="center" column-number="1"/>
                            <fo:table-column column-number="2"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell column-number="1">
                                        <fo:block xsl:use-attribute-sets="chapter_number">                         
                                                <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                                                <xsl:for-each select="$topicref">
                                                    <xsl:number count="*[contains(@class,' bookmap/appendix ')]" format="A"/>
                                                </xsl:for-each>                                                 
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell column-number="2">
                                        <fo:block padding-left="3pt" margin-left="{$marg_title_left}" margin-right="{$marg_title_right}"> 
                                            <xsl:call-template name="pullPrologIndexTerms"/>                                           
                                            <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                                <xsl:apply-templates select="." mode="getTitle"/>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <xsl:choose>
                        <xsl:when test="$appendixLayout='BASIC'">
                            <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                contains(@class, ' topic/prolog '))]"/>
                            <xsl:apply-templates select="." mode="buildRelationships"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>

                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>    

    <xsl:template name="insertChapterFirstpageStaticContent">
        <xsl:param name="type"/>
        <fo:block>

            <xsl:attribute name="id">
                <xsl:call-template name="generate-toc-id"/>
            </xsl:attribute>

            <xsl:choose>
                <xsl:when test="$type = 'chapter'"/>

                <xsl:when test="$type = 'appendix'"/>

                <xsl:when test="$type = 'appendices'"/>

                <xsl:when test="$type = 'part'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="insertVariable">
                            <xsl:with-param name="theVariableID" select="'Part with number'"/>
                            <xsl:with-param name="theParameters">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'preface'"/>
                <xsl:when test="$type = 'notices'"/>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <xsl:template name="startPageNumbering">
        
        <xsl:variable name="id" select="ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id"/>
        <xsl:variable name="mapTopic" select="key('map-id', $id)"/>
        
        <xsl:if test="not(($mapTopic/preceding::*[contains(@class, ' bookmap/chapter ') or contains(@class, ' bookmap/part ')]))">
            <xsl:attribute name="initial-page-number">1</xsl:attribute>
        </xsl:if>
       
    </xsl:template>
    
</xsl:stylesheet>
