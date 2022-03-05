<?xml version='1.0'?>

<!--
Polycom TOC override.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:exsl="http://exslt.org/common"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:exslf="http://exslt.org/functions"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    extension-element-prefixes="exsl"
    exclude-result-prefixes="xs exsl opentopic exslf opentopic-func ot-placeholder"
    version="2.0">
	
	 <xsl:template name="createTocHeader">
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/topic ')]" mode="toc">
        <xsl:param name="include"/>
        <xsl:variable name="topicLevel" as="xs:integer">
          <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>
        <xsl:if test="$topicLevel &lt; $tocMaximumLevel">
            <xsl:variable name="mapTopicref" select="key('map-id', @id)[1]"/>
			
			
			
            <xsl:choose>
              <!-- In a future version, suppressing Notices in the TOC should not be hard-coded. -->
              <xsl:when test="$mapTopicref/self::*[contains(@class, ' bookmap/notices ')]"/>
              <xsl:when test="$mapTopicref[@toc = 'yes' or not(@toc)] or
                (not($mapTopicref) and $include = 'true')">
                <fo:block xsl:use-attribute-sets="__toc__indent">
                  <xsl:variable name="tocItemContent">
                          <fo:basic-link xsl:use-attribute-sets="__toc__link">
                            <xsl:attribute name="internal-destination">
                              <xsl:call-template name="generate-toc-id"/>
                            </xsl:attribute>
                            <xsl:apply-templates select="$mapTopicref" mode="tocPrefix"/>
                            <fo:inline xsl:use-attribute-sets="__toc__title">
                                <xsl:call-template name="getNavTitle" />
                            </fo:inline>
                            <fo:inline xsl:use-attribute-sets="__toc__page-number">
                                <fo:leader xsl:use-attribute-sets="__toc__leader"/>
                                <fo:page-number-citation>
                                  <xsl:attribute name="ref-id">
                                    <xsl:call-template name="generate-toc-id"/>
                                  </xsl:attribute>
                                </fo:page-number-citation>
                            </fo:inline>
                        </fo:basic-link>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="not($mapTopicref)">
                            <xsl:apply-templates select="." mode="tocText">
                              <xsl:with-param name="tocItemContent" select="$tocItemContent"/>
                              <xsl:with-param name="currentNode" select="."/>
                            </xsl:apply-templates>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:apply-templates select="$mapTopicref" mode="tocText">
                              <xsl:with-param name="tocItemContent" select="$tocItemContent"/>
                              <xsl:with-param name="currentNode" select="."/>
                            </xsl:apply-templates>
                          </xsl:otherwise>
                        </xsl:choose>
                    </fo:block>
                    <xsl:apply-templates mode="toc">
                        <xsl:with-param name="include" select="'true'"/>
                    </xsl:apply-templates>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates mode="toc">
                        <xsl:with-param name="include" select="'true'"/>
                </xsl:apply-templates>
              </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

  <xsl:template name="createToc">
    
    <xsl:variable name="toc">
      <xsl:choose>
        <xsl:when test="($ditaVersion &gt;= 1.1) and $map//*[contains(@class,' bookmap/toc ')][@href]"/>
        <xsl:when test="($ditaVersion &gt;= 1.1) and $map//*[contains(@class,' bookmap/toc ')]">
          <xsl:apply-templates select="/" mode="toc"/>
        </xsl:when>
        <xsl:when test="($ditaVersion &gt;= 1.1) and /*[contains(@class,' map/map ')][not(contains(@class,' bookmap/bookmap '))]">
          <xsl:apply-templates select="/" mode="toc"/>
        </xsl:when>
        <xsl:when test="$ditaVersion &gt;= 1.1"/>
        <xsl:otherwise>
          <xsl:apply-templates select="/" mode="toc"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:if test="count(exsl:node-set($toc)/*) > 0">
      <fo:page-sequence master-reference="toc-sequence" xsl:use-attribute-sets="__force__page__count" 
        format="1" force-page-count="no-force" initial-page-number="1">
        
        <xsl:call-template name="insertTocStaticContents"/>
        
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="createTocHeader"/>

		  		  <fo:block-container margin-left="0in">
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
                                        <fo:block color="#EB3C00" xsl:use-attribute-sets="__frontmatter__doctype">
                                            <fo:inline text-transform="uppercase" font-weight="bold">
                                                <xsl:value-of select="$map//*[contains(@class,' bookmap/bookmeta ')]/*
                                                    [contains(@class,' topic/category ')][1]"/>
                                            </fo:inline>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block xsl:use-attribute-sets="__cover__details __frontmatter__doctype">
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
				<fo:block margin-top="2pc" margin-bottom="18pt" margin-left="6pc">
						<xsl:apply-templates select="$map/*[contains(@class, ' bookmap/bookmeta ')]/*[contains(@class, ' map/shortdesc ')]"/>
						</fo:block>
		
        <fo:block xsl:use-attribute-sets="__toc__header" id="{$id.toc}">
            <xsl:call-template name="getVariable">
                <xsl:with-param name="id" select="'Table of Contents'"/>
            </xsl:call-template>
        </fo:block>


		  
          <fo:block>
            <fo:marker marker-class-name="current-header">
              <xsl:call-template name="insertVariable">
                <xsl:with-param name="theVariableID" select="'Table of Contents'"/>
              </xsl:call-template>
            </fo:marker>
            <xsl:copy-of select="exsl:node-set($toc)"/>
          </fo:block>
        </fo:flow>
        
      </fo:page-sequence>
    </xsl:if>
  </xsl:template>
  
  

</xsl:stylesheet>