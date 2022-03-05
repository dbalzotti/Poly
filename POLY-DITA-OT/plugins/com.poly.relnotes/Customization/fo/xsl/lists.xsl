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

<!-- Elements for steps have been relocated to task-elements.xsl -->
<!-- Templates for <dl> are in tables.xsl -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
	
    <xsl:template match="*[contains(@class, ' topic/ul ')]/*[contains(@class, ' topic/li ')]">
        <xsl:variable name="ulnested_count" select="count(ancestor::*[contains(@class,' topic/ul ')])"/>
		<xsl:choose>
		<xsl:when test="$ulnested_count = 1">
        <fo:list-item xsl:use-attribute-sets="ul.li">
            <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
                <fo:block xsl:use-attribute-sets="ul.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="getVariable">
                        <xsl:with-param name="id">
                            <xsl:choose>
                                <xsl:when test="$ulnested_count = 1">Unordered List bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 2">Open list bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 3">Unordered list dash</xsl:when>
                                <xsl:when test="$ulnested_count = 4">Small list bullet</xsl:when>
                                <xsl:otherwise>Unordered List bullet</xsl:otherwise>
                            </xsl:choose>   
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--<xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID">
                            <xsl:choose>
                                <xsl:when test="$ulnested_count = 1">Unordered List bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 2">Open list bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 3">Unordered list dash</xsl:when>
                                <xsl:when test="$ulnested_count = 4">Small list bullet</xsl:when>
                                <xsl:otherwise>Unordered List bullet</xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>-->
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ul.li__body">
                <fo:block xsl:use-attribute-sets="ul.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
		</xsl:when>
		
		<xsl:when test="$ulnested_count = 2">
        <fo:list-item xsl:use-attribute-sets="ul.li">
            <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
                <fo:block xsl:use-attribute-sets="ul.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="getVariable">
                        <xsl:with-param name="id">
                         <xsl:choose>
                                <xsl:when test="$ulnested_count = 1">Unordered List bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 2">Open list bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 3">Unordered list dash</xsl:when>
                                <xsl:when test="$ulnested_count = 4">Small list bullet</xsl:when>
                                <xsl:otherwise>Unordered List bullet</xsl:otherwise>
                            </xsl:choose>   
                        </xsl:with-param>
                      </xsl:call-template>
                    <!--<xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID">
                            <xsl:choose>
                                <xsl:when test="$ulnested_count = 1">Unordered List bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 2">Open list bullet</xsl:when>
                                <xsl:when test="$ulnested_count = 3">Unordered list dash</xsl:when>
                                <xsl:when test="$ulnested_count = 4">Small list bullet</xsl:when>
                                <xsl:otherwise>Unordered List bullet</xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>-->
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ul.li__body">
                <fo:block xsl:use-attribute-sets="ul.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
		</xsl:when>
		<xsl:otherwise/>
		</xsl:choose>
				
    </xsl:template>
	
	
	
    <xsl:template match="*[contains(@class, ' topic/ol ')]/*[contains(@class, ' topic/li ')]">
	<xsl:choose>
	<xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
        <fo:list-item xsl:use-attribute-sets="ol.li">
            <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                <fo:block xsl:use-attribute-sets="ol.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Ordered List Number'"/>
                        <xsl:with-param name="params">
                            <number>
                                <xsl:choose>
                                    <xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
                                        <xsl:number format="a"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:number format="1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </number>
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--<xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Ordered List Number'"/>
                        <xsl:with-param name="theParameters">
                            <number>
                                <xsl:choose>
                                    <xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
                                        <xsl:number format="a"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    <xsl:number format="1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </number>
                        </xsl:with-param>
                    </xsl:call-template>-->
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                <fo:block xsl:use-attribute-sets="ol.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
		</xsl:when>
		<xsl:otherwise>
		
		       <fo:list-item xsl:use-attribute-sets="ol.li">
            <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                <fo:block xsl:use-attribute-sets="ol.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Ordered List Number'"/>
                        <xsl:with-param name="params">
                            <number>
                                <xsl:choose>
                                    <xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
                                        <xsl:number format="a"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:number format="1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </number>
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--<xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Ordered List Number'"/>
                        <xsl:with-param name="theParameters">
                            <number>
                                <xsl:choose>
                                    <xsl:when test="parent::*[contains(@class, ' topic/ol ')]/parent::*[contains(@class, ' topic/li ')]/parent::*[contains(@class, ' topic/ol ')]">
                                        <xsl:number format="a"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    <xsl:number format="1"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </number>
                        </xsl:with-param>
                    </xsl:call-template>-->
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                <fo:block xsl:use-attribute-sets="ol.li__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
		
		</xsl:otherwise>
		</xsl:choose>
    </xsl:template>



</xsl:stylesheet>