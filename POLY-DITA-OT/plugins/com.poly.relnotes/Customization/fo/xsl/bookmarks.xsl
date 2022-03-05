<?xml version='1.0'?>

<!--
Polycom override to suppress notices in PDF bookmarks.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:exsl="http://exslt.org/common"
                xmlns:opentopic="http://www.idiominc.com/opentopic"
                xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
                xmlns:exslf="http://exslt.org/functions"
                xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
                xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
                extension-element-prefixes="exsl"
                exclude-result-prefixes="opentopic-index opentopic exslf opentopic-func ot-placeholder"
                version="2.0">

    <xsl:variable name="map" select="//opentopic:map"/>

    <xsl:template match="*[contains(@class, ' topic/topic ')]" mode="bookmark">
        <xsl:variable name="mapTopicref" select="key('map-id', @id)[1]"/>
        <xsl:variable name="topicTitle">
            <xsl:call-template name="getNavTitle"/>
        </xsl:variable>
        
        <xsl:choose> 
          <xsl:when test="$mapTopicref[contains(@class, ' bookmap/notices ')]"/>
          <xsl:when test="$mapTopicref[@toc = 'yes' or not(@toc)] or
                          not($mapTopicref)">
            <fo:bookmark>
                <xsl:attribute name="internal-destination">
                    <xsl:call-template name="generate-toc-id"/>
                </xsl:attribute>
                    <xsl:if test="$bookmarkStyle!='EXPANDED'">
                        <xsl:attribute name="starting-state">hide</xsl:attribute>
                    </xsl:if>
                <fo:bookmark-title>
                    <xsl:value-of select="normalize-space($topicTitle)"/>
                </fo:bookmark-title>
                <xsl:apply-templates mode="bookmark"/>
            </fo:bookmark>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates mode="bookmark"/>
          </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createBookmarks">
      <xsl:variable name="bookmarks" as="element()*">
        <xsl:choose>
          <xsl:when test="$retain-bookmap-order">
            <xsl:apply-templates select="/" mode="bookmark"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="($ditaVersion &gt;= 1.1) and $map//*[contains(@class,' bookmap/toc ')][@href]"/>
                <xsl:when test="($ditaVersion &gt;= 1.1) and ($map//*[contains(@class,' bookmap/toc ')]
                          	or /*[contains(@class,' map/map ')][not(contains(@class,' bookmap/bookmap '))])">
                    <fo:bookmark internal-destination="{$id.toc}">
                        <fo:bookmark-title>
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Table of Contents'"/>
                            </xsl:call-template>
                        </fo:bookmark-title>
                    </fo:bookmark>
                </xsl:when>
  		          <xsl:when test="$ditaVersion &gt;= 1.1"/>
                <xsl:otherwise>
                    <fo:bookmark internal-destination="{$id.toc}">
                        <fo:bookmark-title>
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Table of Contents'"/>
                            </xsl:call-template>
                        </fo:bookmark-title>
                    </fo:bookmark>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="/*/*[contains(@class, ' topic/topic ')] |
                                  /*/ot-placeholder:glossarylist |
                                  /*/ot-placeholder:tablelist |
                                  /*/ot-placeholder:figurelist">
              <xsl:variable name="topicType">
                <xsl:call-template name="determineTopicType"/>
              </xsl:variable>
              <xsl:if test="not($topicType = 'topicNotices')">
                <xsl:apply-templates select="." mode="bookmark"/>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="//opentopic-index:index.groups//opentopic-index:index.entry">
                <xsl:choose>
                    <xsl:when test="($ditaVersion &gt;= 1.1) and $map//*[contains(@class,' bookmap/indexlist ')][@href]"/>
                    <xsl:when test="($ditaVersion &gt;= 1.1) and ($map//*[contains(@class,' bookmap/indexlist ')]
                          	or /*[contains(@class,' map/map ')][not(contains(@class,' bookmap/bookmap '))])">
                        <fo:bookmark internal-destination="{$id.index}">
                            <fo:bookmark-title>
                                <xsl:call-template name="insertVariable">
                                    <xsl:with-param name="theVariableID" select="'Index'"/>
                                </xsl:call-template>
                            </fo:bookmark-title>
                        </fo:bookmark>
                    </xsl:when>
                    <xsl:when test="$ditaVersion &gt;= 1.1"/>
                    <xsl:otherwise>
                        <fo:bookmark internal-destination="{$id.index}">
                            <fo:bookmark-title>
                                <xsl:call-template name="insertVariable">
                                    <xsl:with-param name="theVariableID" select="'Index'"/>
                                </xsl:call-template>
                            </fo:bookmark-title>
                        </fo:bookmark>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:if test="exists($bookmarks)">
        <fo:bookmark-tree>
          <xsl:copy-of select="$bookmarks"/>
        </fo:bookmark-tree>
      </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>