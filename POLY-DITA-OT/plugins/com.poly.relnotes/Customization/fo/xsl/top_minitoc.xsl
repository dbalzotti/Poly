<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*" mode="createMiniToc">
        
        <fo:block xsl:use-attribute-sets="__toc__mini">
            <xsl:if test="*[contains(@class, ' topic/topic ')]">
                <fo:block xsl:use-attribute-sets="__toc__mini__header">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Mini Toc'"/>
                    </xsl:call-template>
                </fo:block>
                <fo:list-block xsl:use-attribute-sets="__toc__mini__list">
                    <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]" mode="in-this-chapter-list"/>
                </fo:list-block>
            </xsl:if>
        </fo:block>
        
        <fo:block>
            <xsl:apply-templates select="*[contains(@class,' topic/titlealts ')]"/>
            <xsl:if test="*[contains(@class,' topic/shortdesc ')
                or contains(@class, ' topic/abstract ')]/node()">
                <fo:block xsl:use-attribute-sets="p">
                    <xsl:apply-templates select="*[contains(@class,' topic/shortdesc ')
                        or contains(@class, ' topic/abstract ')]/node()"/>
                </fo:block>
            </xsl:if>
            <xsl:apply-templates select="*[contains(@class,' topic/body ')]/*"/>
            
            <xsl:if test="*[contains(@class,' topic/related-links ')]//
                *[contains(@class,' topic/link ')][not(@role) or @role!='child']">
                <xsl:apply-templates select="*[contains(@class,' topic/related-links ')]"/>
            </xsl:if>            
        </fo:block>        
        
    </xsl:template>
    
</xsl:stylesheet>