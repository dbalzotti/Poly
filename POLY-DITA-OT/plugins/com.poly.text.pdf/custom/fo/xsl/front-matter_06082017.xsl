<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="1.1">
    <xsl:template name="createFrontMatter">
        <fo:page-sequence master-reference="front-matter-odd" format="i" xsl:use-attribute-sets="__force__page__count">
            <fo:static-content flow-name="odd-frontmatter-header">
                <xsl:call-template name="insertFrontmatterFooter"/>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
               
                
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
                <xsl:if test="//*[contains(@class, ' topic/othermeta ') and @name = 'proddesc']">
                    <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
                        <xsl:value-of
                            select="//*[contains(@class, ' topic/othermeta ') and @name = 'proddesc']/@content"
                        />
                    </fo:block>
                </xsl:if>
                <fo:block xsl:use-attribute-sets="__frontmatter__text">
                    <xsl:value-of select="//*[contains(@class, ' topic/othermeta ') and @name='doctype']/@content"/>
                </fo:block>
                <xsl:if test="//*[contains(@class, ' topic/othermeta ') and @name='lync']">
                    <fo:block xsl:use-attribute-sets="__frontmatter__text" margin-left="118pt" margin-right="118pt" padding-top="-7pt">
                        <!-- Suite Jan-2015: 0012293: Replace Lync logo on front cover: PLT PDF - mk -->
                        <fo:external-graphic src="Customization/OpenTopic/common/artwork/MSLync-logo_UG.svg" content-width="110pt" content-height="60pt"/>
                    </fo:block>
                </xsl:if>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template name="insertFrontmatterFooter">
        <fo:block-container position="absolute" top="48pt">
        <fo:block xsl:use-attribute-sets="__frontmatter__footer">
            <fo:external-graphic xsl:use-attribute-sets="__frontmatter__footer__image" src="Customization/OpenTopic/common/artwork/white_paper_footer_logo.pdf"/>
        </fo:block>
        </fo:block-container>
    </xsl:template>
</xsl:stylesheet>
