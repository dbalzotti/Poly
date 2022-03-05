<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*" mode="placeImage">
        <xsl:param name="imageAlign"/>
        <xsl:param name="href"/>
        <xsl:param name="height"/>
        <xsl:param name="width"/>
        <!--Using align attribute set according to image @align attribute-->
        <xsl:call-template name="processAttrSetReflection">
            <xsl:with-param name="attrSet" select="concat('__align__', $imageAlign)"/>
            <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
        </xsl:call-template>
        <fo:external-graphic src="url({$href})" xsl:use-attribute-sets="image">
            <xsl:choose>
                <xsl:when test="@placement='inline'">
                    <xsl:attribute name="content-height" select="'12pt'"/>
                    <xsl:attribute name="alignment-baseline" select="'before-edge'"/>
                </xsl:when>
                <xsl:otherwise>
                    <!--Setting image height if defined-->
                    <xsl:if test="$height">
                        <xsl:attribute name="content-height">
                            <!--The following test was commented out because most people found the behavior
                 surprising.  It used to force images with a number specified for the dimensions
                 *but no units* to act as a measure of pixels, *if* you were printing at 72 DPI.
                 Uncomment if you really want it. -->
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($height)) = 'NaN')">
                        <xsl:value-of select="concat($height div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($height)) = 'NaN')">
                                    <xsl:value-of select="concat($height, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$height"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <!--Setting image width if defined-->
                    <xsl:if test="$width">
                        <xsl:attribute name="content-width">
                            <xsl:choose>
                                <!--xsl:when test="not(string(number($width)) = 'NaN')">
                        <xsl:value-of select="concat($width div 72,'in')"/>
                      </xsl:when-->
                                <xsl:when test="not(string(number($width)) = 'NaN')">
                                    <xsl:value-of select="concat($width, 'px')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$width"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="not($width) and not($height) and @scale">
                        <xsl:attribute name="content-width">
                            <xsl:value-of select="concat(@scale,'%')"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </fo:external-graphic>
    </xsl:template>
    
</xsl:stylesheet>