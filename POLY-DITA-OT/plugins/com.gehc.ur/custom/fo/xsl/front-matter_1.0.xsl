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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic" exclude-result-prefixes="opentopic" version="2.0">

  <xsl:variable name="map" select="//opentopic:map"/>
  
     <xsl:variable name="publication_type">
      <xsl:call-template name="get-doc-ishfield-value">
        <xsl:with-param name="ishfield-name" select="'FISHPUBLICATIONTYPE'"/>
      </xsl:call-template>
    </xsl:variable>
	
     <xsl:variable name="translated_publication_type">
		<xsl:choose>
			<xsl:when test="$publication_type = 'User Manual'">	
				<xsl:call-template name="insertVariable">
					<xsl:with-param name="theVariableID" select="'URM'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>	
			</xsl:otherwise>
		</xsl:choose>	
    </xsl:variable>

  <xsl:template name="createFrontMatter">
    <xsl:choose>
      <xsl:when test="$ditaVersion &gt;= 1.1">
        <xsl:call-template name="createFrontMatter_1.0"/>
      </xsl:when>
      <xsl:otherwise>
        <fo:page-sequence master-reference="front-matter" format="i" initial-page-number="1"  xsl:use-attribute-sets="__force__page__count">
          <xsl:call-template name="insertFrontMatterStaticContents"/>
          <fo:flow flow-name="xsl-region-body">
            <fo:block xsl:use-attribute-sets="__frontmatter">
              <!-- set the title -->
              <fo:block xsl:use-attribute-sets="__frontmatter__title">
                <!--GEHC. Get the deliverable type from language-specific variables file -->
				   <xsl:choose>
					 <xsl:when test="$publication_type = 'User Manual'">	
					   <xsl:call-template name="insertVariable">
						  <xsl:with-param name="theVariableID" select="'URM'"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>	
					   <!--xsl:call-template name="insertVariable">
						  <xsl:with-param name="theVariableID" select="'URM'"/>
						</xsl:call-template-->
					  </xsl:otherwise>
				   </xsl:choose>	
              </fo:block>

              <!-- set the subtitle -->
              <xsl:apply-templates select="//*[contains(@class,' bkinfo/bkinfo ')][1]/*[contains(@class,' bkinfo/bktitlealts ')]/*[contains(@class,' bkinfo/bksubtitle ')]"/>

              <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                <xsl:choose>
                  <xsl:when test="//*[contains(@class,' bkinfo/bkowner ')]">
                    <xsl:apply-templates select="//*[contains(@class,' bkinfo/bkowner ')]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$map/*[contains(@class, ' map/topicmeta ')]"/>
                  </xsl:otherwise>
                </xsl:choose>
              </fo:block>

            </fo:block>

            <!--<xsl:call-template name="createPreface"/>-->

          </fo:flow>
        </fo:page-sequence>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="createFrontMatter_1.0">
    <fo:page-sequence master-reference="front-matter" format="i" initial-page-number="1" xsl:use-attribute-sets="__force__page__count">
      <xsl:call-template name="insertFrontMatterStaticContents"/>
      <fo:flow flow-name="xsl-region-body">
        <fo:block xsl:use-attribute-sets="__frontmatter">

          <!--GEHC. Use the variable from root processing-->
          <fo:block xsl:use-attribute-sets="__frontmatter__product">
            <xsl:value-of select="$productName"/>
          </fo:block>
		  
         <!--GEHC. Use the variable from root processing-->
			<xsl:if test="$optionalTitle">		 
			  <fo:block xsl:use-attribute-sets="__frontmatter__title">
					<xsl:value-of select="$optionalTitle"/>
			  </fo:block>
			</xsl:if>
			
		  <fo:block xsl:use-attribute-sets="__frontmatter__title">
			<!--GEHC. Get the deliverable type from language-specific variables file -->
				   <xsl:choose>
					 <xsl:when test="$publication_type = 'User Manual'">	
					   <xsl:call-template name="insertVariable">
						  <xsl:with-param name="theVariableID" select="'URM'"/>
						</xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>	
					   <!--xsl:call-template name="insertVariable">
						  <xsl:with-param name="theVariableID" select="'URM'"/>
						</xsl:call-template-->
					  </xsl:otherwise>
				   </xsl:choose>	
		  </fo:block>
         <fo:block xsl:use-attribute-sets="__frontmatter__ce_image">
            <fo:external-graphic>
              <xsl:variable name="url">
                <xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ce_icon')]/@href"/>
              </xsl:variable>
              <xsl:variable name="scale">
                <xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ce_icon')]/@scale"/>
              </xsl:variable>
              <xsl:attribute name="src"><xsl:value-of select="concat($input.dir.url, $url)" /></xsl:attribute>
              <xsl:choose>
                <xsl:when test="$scale">
                  <xsl:attribute name="content-height">
                    <xsl:value-of select="concat($scale,'%')"/>
                  </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="content-height">100%</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </fo:external-graphic>
          </fo:block>
          <!--GEHC. Replace above by SDL for best publishing practice from Trisoft -->
          <fo:block xsl:use-attribute-sets="__frontmatter__image">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'coverpageimage')]/@href">
					<fo:external-graphic>
					  <xsl:variable name="url">
						<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'coverpageimage')]/@href"/>
					  </xsl:variable>
					  <xsl:variable name="scale">
						<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'coverpageimage')]/@scale"/>
					  </xsl:variable>
					  <xsl:attribute name="src"><xsl:value-of select="concat($input.dir.url, $url)" /></xsl:attribute>
					  <xsl:choose>
						<xsl:when test="$scale">
						  <xsl:attribute name="content-height">
							<xsl:value-of select="concat($scale,'%')"/>
						  </xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
						  <xsl:attribute name="content-height">100%</xsl:attribute>
						</xsl:otherwise>
					  </xsl:choose>
					</fo:external-graphic>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
          </fo:block>
		  <fo:block-container absolute-position="absolute" top="7.5in" left="-.1in">						   
	          <fo:block xsl:use-attribute-sets="__frontmatter__ge_logo">
				<fo:external-graphic>
				  <xsl:variable name="url">
					<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ge_logo')]/@href"/>
				  </xsl:variable>
				  <xsl:variable name="scale">
					<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ge_logo')]/@scale"/>
				  </xsl:variable>
				  <xsl:attribute name="src"><xsl:value-of select="concat($input.dir.url, $url)" /></xsl:attribute>
				  <xsl:choose>
					<xsl:when test="$scale">
					  <xsl:attribute name="content-height">
						<xsl:value-of select="concat($scale,'%')"/>
					  </xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:attribute name="content-height">100%</xsl:attribute>
					</xsl:otherwise>
				  </xsl:choose>
				</fo:external-graphic>
			</fo:block>	  	  
		  </fo:block-container>
		  <fo:block-container absolute-position="absolute" top="7.25in" left="3in">		
			<fo:block xsl:use-attribute-sets="__frontmatter__ge_docinfo">
				<xsl:value-of select="$fullPartNumber"/>
				<xsl:choose>
					<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='ge_docinfo']">	
					   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='ge_docinfo']"/>
					</xsl:when>
					<xsl:otherwise>
						<fo:block/>
					</xsl:otherwise>
				</xsl:choose>
		   </fo:block>	   
		  </fo:block-container>		  		  	

          <!--GEHC. Output text after cover image 
					<fo:block  xsl:use-attribute-sets="__frontmatter__dba">
					    <xsl:text>Datex-Ohmeda, Inc., a General Electric Company, doing business as GE Healthcare.</xsl:text>
					</fo:block>-->

          <!--GEHC. SDL: added to hard-code insert text from user responsiblity topic-->
		 
          <xsl:variable name="is.trm.pub">
            <xsl:variable name="jobticket.file" select="concat($input.dir.url, 'ishjobticket.xml')"/>
            <xsl:if test=" doc-available($jobticket.file)">
              <xsl:value-of select="contains(lower-case(doc($jobticket.file)//parameter[@name='outputformat']), ' trm ')"/>
            </xsl:if>
          </xsl:variable>
          
          <xsl:if test="not($is.trm.pub)">
            <fo:block xsl:use-attribute-sets="__frontmatter_title__back">
              <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'user_responsibility')]/title"/>
            </fo:block>

            <fo:block xsl:use-attribute-sets="__frontmatter__back">
              <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'user_responsibility')]//p[1]"/>
            </fo:block>

            <fo:block xsl:use-attribute-sets="__frontmatter__back">
              <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'user_responsibility')]//p[2]"/>
            </fo:block>

            <fo:float float="start">
              <fo:block-container xsl:use-attribute-sets="block-container.frontmatter">
                <fo:block font-family="sans-serif">
                  <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Caution'"/>
                  </xsl:call-template>
                </fo:block>
              </fo:block-container>
            </fo:float>

            <fo:block xsl:use-attribute-sets="__frontmatter__back" font-size="12pt">
              <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'user_responsibility')]//p[3]"/>
            </fo:block>

            <!-- set the subtitle -->
            <xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')]"/>

            <fo:block xsl:use-attribute-sets="__frontmatter__owner">
              <xsl:apply-templates select="$map//*[contains(@class,' bookmap/bookmeta ')]"/>
            </fo:block>
          </xsl:if>
        </fo:block>
			
		<fo:block page-break-before="always" xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='backfrontcoverpageinfo']">
				   <fo:block font-size="16pt" font-weight="bold" padding-bottom="20pt">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='backfrontcoverpageinfo']/title[1]"/>
				   </fo:block>
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='backfrontcoverpageinfo']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>
	   </fo:block>
		  <fo:block-container absolute-position="absolute" top="7.75in" left="-.2in">						   
	          <fo:block xsl:use-attribute-sets="__frontmatter__ge_logo">
				<fo:external-graphic>
				  <xsl:variable name="url">
					<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ge_logo')]/@href"/>
				  </xsl:variable>
				  <xsl:variable name="scale">
					<xsl:value-of select="//*[contains(@class, ' topic/image ')][contains(@outputclass, 'ge_logo')]/@scale"/>
				  </xsl:variable>
				  <xsl:attribute name="src">url(..\<xsl:value-of select="$url"/>)</xsl:attribute>
				  <xsl:choose>
					<xsl:when test="$scale">
					  <xsl:attribute name="content-height">
						<xsl:value-of select="concat($scale,'%')"/>
					  </xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
					  <xsl:attribute name="content-height">100%</xsl:attribute>
					</xsl:otherwise>
				  </xsl:choose>
				</fo:external-graphic>
			</fo:block>	  	  
		  </fo:block-container>
		  <fo:block-container absolute-position="absolute" top="6.75in" left="2.25in">						   
			<fo:block>
				<xsl:choose>
					<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='ge_addresses']">
					   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='ge_addresses']"/>
					</xsl:when>
					<xsl:otherwise>
						<fo:block/>
					</xsl:otherwise>
				</xsl:choose>
		   </fo:block>	 	  
		  </fo:block-container>	   		  
				   
	  	
 		<fo:block page-break-before="always" xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='revision_history']">
				   <fo:block font-size="16pt" font-weight="bold">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='revision_history']/title[1]"/>
				   </fo:block>
				   <!--fo:block>
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='revision_history']/*[contains(@class,' topic/table ')]/title[1]"/>
				   </fo:block-->
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='revision_history']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>
	   </fo:block>	

 		<fo:block page-break-before="always" xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']">
				   <fo:block font-size="16pt" font-weight="bold" padding-bottom="20pt">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']/title[1]"/>
				   </fo:block>
				   <fo:block font-size="14pt" font-weight="bold">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']/title[2]"/>
				   </fo:block>
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>		
	   </fo:block>	
 		<fo:block xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='certifications']">
				   <fo:block font-size="14pt" font-weight="bold" padding-bottom="20pt">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='certifications']/title[1]"/>
				   </fo:block>
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='certifications']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>		
	   </fo:block>		   
 		<fo:block xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='original_documentation']">
				   <fo:block font-size="14pt" font-weight="bold" padding-bottom="20pt">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='original_documentation']/title[1]"/>
				   </fo:block>
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='original_documentation']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>		
	   </fo:block>		   
 		<fo:block xsl:use-attribute-sets="__frontmatter__back">
			<xsl:choose>
				<xsl:when test="//*[contains(@class, ' topic/section ') and @outputclass='importer_information']">
				   <fo:block font-size="14pt" font-weight="bold" padding-bottom="20pt">
				      <xsl:value-of select="//*[contains(@class, ' topic/section ') and @outputclass='importer_information']/title[1]"/>
				   </fo:block>
				   <xsl:apply-templates select="//*[contains(@class, ' topic/section ') and @outputclass='importer_information']"/>
				</xsl:when>
				<xsl:otherwise>
					<fo:block/>
				</xsl:otherwise>
			</xsl:choose>		
	   </fo:block>	
        <!--<xsl:call-template name="createPreface"/>-->

      </fo:flow>
    </fo:page-sequence>
	
	
	
    <xsl:if test="not($retain-bookmap-order)">
      <xsl:call-template name="createNotices"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/bookmeta ')]">
    <fo:block-container xsl:use-attribute-sets="__frontmatter__owner__container">
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:block-container>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/booktitlealt ')]" priority="+2">
    <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/booktitle ')]" priority="+2">
    <fo:block xsl:use-attribute-sets="__frontmatter__booklibrary">
      <xsl:apply-templates select="*[contains(@class, ' bookmap/booklibrary ')]"/>
    </fo:block>
    <fo:block xsl:use-attribute-sets="__frontmatter__mainbooktitle">
      <xsl:apply-templates select="*[contains(@class,' bookmap/mainbooktitle ')]"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/namedetails ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/addressdetails ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xnal-d/contactnumbers ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/bookowner ')]">
    <fo:block xsl:use-attribute-sets="author">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' bookmap/summary ')]">
    <fo:block xsl:use-attribute-sets="bookmap.summary">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <!--xsl:template name="createNotices">
	   <xsl:apply-templates select="/bookmap/*[contains(@class,' topic/topic ')]" mode="process-notices"/>
	</xsl:template>
	
	<xsl:template match="*[contains(@class, ' topic/topic ')]" mode="process-notices">
        <xsl:param name="include" select="'true'"/>
        <xsl:variable name="topicType">
            <xsl:call-template name="determineTopicType"/>
        </xsl:variable>

        <xsl:if test="$topicType = 'topicNotices'">
            <xsl:call-template name="processTopicNotices"/>
        </xsl:if>
    </xsl:template-->

  <!-- Added by SDL to process information in notices topics -->
  <!--xsl:template name="createNotices">
    <xsl:apply-templates select="/bookmap/*[contains(@class,' topic/topic ')and not(@outputclass='coverpageinfo')]" mode="process-notices"/>
  </xsl:template-->

  <!--xsl:template match="*[contains(@class, ' topic/topic ')and not(@outputclass='coverpageinfo')]" mode="process-notices">
    <xsl:param name="include" select="'false'"/>
    <xsl:variable name="topicType">
      <xsl:call-template name="determineTopicType"/>
    </xsl:variable>
    <xsl:if test="$topicType = 'topicNotices'">
      <xsl:call-template name="processTopicNotices"/>
    </xsl:if>
  </xsl:template-->

  <xsl:template match="*[contains(@class, ' topic/topic ')][contains (@outputclass, 'coverpageinfo')]"/>
  <xsl:template match="*[contains(@class, ' topic/topic ')][contains (@outputclass, 'coverpageinfo')]/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/image ')][contains(@outputclass, 'coverpageimage')]"/>
  <xsl:template match="*[contains(@class, ' topic/topic ')][contains (@outputclass, 'user_responsibility')]"/>
  <xsl:template match="*[contains(@class, ' topic/topic ')][contains (@outputclass, 'warranty')]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='backfrontcoverpageinfo']/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='revision_history']/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='regulatory_requirements']/title[2]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='certifications']/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='original_documentation']/title[1]"/>
  <xsl:template match="*[contains(@class, ' topic/section ') and @outputclass='importer_information']/title[1]"/>
</xsl:stylesheet>
