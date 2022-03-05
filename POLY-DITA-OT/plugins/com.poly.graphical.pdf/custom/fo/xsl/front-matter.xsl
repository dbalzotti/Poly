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

This file is part of the DITA Open Toolkit project.
See the accompanying LICENSE file for applicable license.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="2.0">

    <xsl:variable name="proddesc">
		<xsl:if test="//*[contains(@class, ' topic/othermeta ') and @name = 'proddesc']">
			<xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name = 'proddesc'][1]/@content"/>
		</xsl:if>
	</xsl:variable>
	
    <xsl:template name="createFrontMatter">
        <fo:page-sequence master-reference="front-matter-odd" format="i" xsl:use-attribute-sets="__force__page__count">
            <fo:static-content flow-name="odd-frontmatter-header">
                <xsl:call-template name="insertFrontmatterFooter"/>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
              <fo:block-container>
                 <fo:block xsl:use-attribute-sets="__frontmatter__title">
                          
                    <xsl:choose>
                        <xsl:when test="//*[contains(@class, ' topic/prodname ')]">
                            <!-- 29 jun 2016 0014640: allow 2 <prod infos> on the PDF cover am -->
                            <xsl:for-each select="$map/*[contains(@class, ' map/topicmeta ')]//*[contains(@class, ' topic/prodname ')]">
                              <fo:block>
                                <xsl:value-of select="."/>
                              </fo:block>
                          
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                        </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
					<xsl:choose>
						<xsl:when test="$map/*[contains(@class, ' map/topicmeta ')]//*[contains(@class, ' topic/othermeta ')][1]">
							<fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
								<xsl:value-of select="$map/*[contains(@class, ' map/topicmeta ')]//*[contains(@class, ' topic/othermeta ')][1]/@content"/>
							</fo:block>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="$map/*[contains(@class, ' map/topicmeta ')]//*[contains(@class, ' topic/othermeta ')][2]">
							<fo:block xsl:use-attribute-sets="__frontmatter__text">
								<xsl:value-of select="$map/*[contains(@class, ' map/topicmeta ')]//*[contains(@class, ' topic/othermeta ')][2]/@content"/>
							</fo:block>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
                <xsl:if test="//*[contains(@class, ' topic/othermeta ') and @name='lync']">
                    <fo:block xsl:use-attribute-sets="__frontmatter__text" margin-left="118pt" margin-right="118pt" padding-top="-7pt">
                        <!--Suite Jan-2015: 0012293: Replace Lync logo on front cover: PLT PDF - mk-->
                        <fo:external-graphic src="Customization/OpenTopic/common/artwork/MSLync-logo_UG.svg" content-width="110pt" content-height="60pt"/>
                    </fo:block>
                </xsl:if>
				</fo:block-container>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
	

  
    <xsl:template name="insertFrontmatterFooter">
        <xsl:variable name="outputformat">
            <xsl:call-template name="getJobTicketParam">
                <xsl:with-param name="varname">outputformat</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <fo:block-container position="absolute" top="15pt" left="0" text-align="center">
      
            
           
            <!--xsl:choose>
                <xsl:when test="contains($outputformat, '-Based PDF' )"-->
                    
                    <xsl:attribute name="top">1.0in</xsl:attribute>
					<xsl:attribute name="margin-left">-80pt</xsl:attribute>
                    <fo:block>
						<!-- ContentRules March 2021: Replace "tophat" logo on front cover: PLT PDF - dhb -->					
                        <fo:external-graphic xsl:use-attribute-sets="__frontmatter__footer__image"
                            src="Customization/OpenTopic/common/artwork/POLY_logo_lava-black_13FEB19.pdf" content-height="scale-to-fit" content-width="scale-to-fit" width="2.15in"
                        />
                    </fo:block>
                <!--/xsl:when>
                <xsl:otherwise>
                    <fo:block>     <fo:external-graphic xsl:use-attribute-sets="__frontmatter__footer__image" src="Customization/OpenTopic/common/artwork/white_paper_logo.svg"/></fo:block>
                </xsl:otherwise>
            </xsl:choose-->
                
           
        
        </fo:block-container>
    </xsl:template>
    
</xsl:stylesheet>