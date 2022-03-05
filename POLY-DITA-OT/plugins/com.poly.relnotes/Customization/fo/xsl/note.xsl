<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*[contains(@class,' topic/note ')]">
        <xsl:variable name="noteType">
            <xsl:choose>
                <xsl:when test="@type = 'other' and @othertype">
                    <xsl:value-of select="@othertype"/>
                </xsl:when>
                <xsl:when test="@type">
                    <xsl:value-of select="@type"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'note'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="currtype" select="$noteType"/>
        <xsl:variable name="lang" select="/*[contains(@class,' bookmap/bookmap ')]/@xml:lang"/> 
        <xsl:variable name="label_width">
            <xsl:choose>
                <xsl:when test="($currtype = 'note') or ($currtype = '')
                    or ($currtype = 'tip')">
                	<xsl:choose>
                		<xsl:when test="substring($lang,1) = 'en'">32pt</xsl:when>
                		<xsl:otherwise>35pt</xsl:otherwise>
                	</xsl:choose>
                </xsl:when>
                <xsl:when test="($currtype = 'caution') or ($currtype = 'warning')
                    or ($currtype = 'danger') or ($currtype = 'notice')">
                	<xsl:choose>
                		<xsl:when test="substring($lang,1) = 'en'">50pt</xsl:when>
                		<xsl:otherwise>50pt</xsl:otherwise>
                	</xsl:choose>
                </xsl:when>
                <xsl:when test="($currtype = 'important') or ($currtype = 'remember') or ($currtype = 'attention')
                    or ($currtype = 'restriction') or ($currtype =  'fastpath')">
                	<xsl:choose>
                		<xsl:when test="substring($lang,1) = 'en'">60pt</xsl:when>
                		<xsl:otherwise>120pt</xsl:otherwise>
                	</xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                	<xsl:choose>
                		<xsl:when test="substring($lang,1) = 'en'">32pt</xsl:when>
                		<xsl:otherwise>70pt</xsl:otherwise>
                	</xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
                <fo:table xsl:use-attribute-sets="note__table">
                    <fo:table-column column-number="1" xsl:use-attribute-sets="note__image__entry"
                    column-width="{$label_width}"/>
                    <fo:table-column column-number="2" xsl:use-attribute-sets="note__text__entry"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="note__image__entry">
                                <fo:block xsl:use-attribute-sets="note" hyphenate="true">
                                    <xsl:call-template name="commonattributes"/>
                                    <fo:inline xsl:use-attribute-sets="note__label">
                                        <xsl:choose>
                                            <xsl:when test="@type='note' or not(@type)">
                                                <fo:inline xsl:use-attribute-sets="note__label__note">
                                                    <xsl:call-template name="insertVariable">
                                                        <xsl:with-param name="theVariableID" select="'Note'"/>
                                                    </xsl:call-template>
                                                </fo:inline>
                                            </xsl:when>
                                            <xsl:when test="@type='notice'">
                                                <fo:inline xsl:use-attribute-sets="note__label__notice">
                                                    <xsl:call-template name="insertVariable">
                                                        <xsl:with-param name="theVariableID" select="'Notice'"/>
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
                                            <xsl:when test="@type='warning'">
                                                <fo:inline xsl:use-attribute-sets="note__label__danger">
                                                    <xsl:call-template name="insertVariable">
                                                        <xsl:with-param name="theVariableID" select="'Warning'"/>
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
                                        <xsl:call-template name="insertVariable">
                                            <xsl:with-param name="theVariableID" select="'#note-separator'"/>
                                        </xsl:call-template>
                                    </fo:inline>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="note__text__entry">
                                <fo:block>
                                    <xsl:apply-templates/> 
                                </fo:block>                               
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            
  </xsl:template>  
    
</xsl:stylesheet>