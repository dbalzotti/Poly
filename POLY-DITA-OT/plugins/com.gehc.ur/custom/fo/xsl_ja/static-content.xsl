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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:template name="insertBodyStaticContents">
        <xsl:call-template name="insertBodyFootnoteSeparator"/>
        <xsl:call-template name="insertBodyOddFooter"/>
        <xsl:call-template name="insertBodyEvenFooter"/>
        <xsl:call-template name="insertBodyOddHeader"/>
        <xsl:call-template name="insertBodyEvenHeader"/>
        <xsl:call-template name="insertBodyFirstHeader"/>
        <xsl:call-template name="insertBodyFirstFooter"/>
        <xsl:call-template name="insertBodyLastHeader"/>
        <xsl:call-template name="insertBodyLastFooter"/>
    </xsl:template>

    <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:call-template name="insertTocEvenFooter"/>
        <xsl:call-template name="insertTocOddHeader"/>
        <xsl:call-template name="insertTocEvenHeader"/>
    </xsl:template>

    <xsl:template name="insertIndexStaticContents">
        <xsl:call-template name="insertIndexOddFooter"/>
        <xsl:call-template name="insertIndexEvenFooter"/>
        <xsl:call-template name="insertIndexOddHeader"/>
        <xsl:call-template name="insertIndexEvenHeader"/>
    </xsl:template>

    <xsl:template name="insertPrefaceStaticContents">
        <xsl:call-template name="insertPrefaceFootnoteSeparator"/>
        <xsl:call-template name="insertPrefaceOddFooter"/>
        <xsl:call-template name="insertPrefaceEvenFooter"/>
        <xsl:call-template name="insertPrefaceOddHeader"/>
        <xsl:call-template name="insertPrefaceEvenHeader"/>
        <xsl:call-template name="insertPrefaceFirstHeader"/>
        <xsl:call-template name="insertPrefaceFirstFooter"/>
<!--        <xsl:call-template name="insertPrefaceLastHeader"/>-->
<!--        <xsl:call-template name="insertPrefaceLastFooter"/>-->
    </xsl:template>

    <xsl:template name="insertFrontMatterStaticContents">
        <xsl:call-template name="insertFrontMatterFootnoteSeparator"/>
        <xsl:call-template name="insertFrontMatterOddFooter"/>
        <xsl:call-template name="insertFrontMatterEvenFooter"/>
        <xsl:call-template name="insertFrontMatterOddHeader"/>
        <xsl:call-template name="insertFrontMatterEvenHeader"/>
<!--        <xsl:call-template name="insertPrefaceLastHeader"/>-->
<!--        <xsl:call-template name="insertPrefaceLastFooter"/>-->
    </xsl:template>

    <xsl:template name="insertGlossaryStaticContents">
        <xsl:call-template name="insertGlossaryOddFooter"/>
        <xsl:call-template name="insertGlossaryEvenFooter"/>
        <xsl:call-template name="insertGlossaryOddHeader"/>
        <xsl:call-template name="insertGlossaryEvenHeader"/>
    </xsl:template>
	
	<xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <fo:block xsl:use-attribute-sets="__body__first__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body first header'"/>
                    <xsl:with-param name="theParameters">
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <fo:block xsl:use-attribute-sets="__body__first__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface first header'"/>
                    <xsl:with-param name="theParameters">
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body even header URM'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertTocEvenHeader">
        <fo:static-content flow-name="even-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertIndexEvenHeader">
        <fo:static-content flow-name="even-index-header">
            <fo:block xsl:use-attribute-sets="__index__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Index even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	    <xsl:template name="insertFrontMatterEvenHeader">
        <fo:static-content flow-name="even-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertGlossaryEvenHeader">
        <fo:static-content flow-name="even-glossary-header">
            <fo:block xsl:use-attribute-sets="__glossary__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Glossary even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd header URM'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertTocOddHeader">
        <fo:static-content flow-name="odd-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc odd header'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertIndexOddHeader">
        <fo:static-content flow-name="odd-index-header">
            <fo:block xsl:use-attribute-sets="__index__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Index odd header'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface odd header'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertFrontMatterOddHeader">
        <fo:static-content flow-name="odd-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface odd header'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertGlossaryOddHeader">
        <fo:static-content flow-name="odd-glossary-header">
            <fo:block xsl:use-attribute-sets="__glossary__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Glossary odd header'"/>
                    <xsl:with-param name="theParameters">
                        <heading>
                            <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
							    <!--GEHC. This adds chapter number to header-->
							    <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>
								<xsl:text> </xsl:text><fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="__body__last__header">
			    <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd header URM'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="__body__last__header">
			    <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd header URM'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertFrontMatterLastHeader">
        <fo:static-content flow-name="last-frontmatter-header">
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even header'"/>
                    <xsl:with-param name="theParameters">
                        <prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__first__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body first footer'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__first__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface first footer'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body even footer URM'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>							
                        </machine-no>                      
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__even__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<!--<xsl:text>-</xsl:text>-->
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>
                        </machine-no> 
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <fo:block xsl:use-attribute-sets="__index__even__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Index even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>                          
                            <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
							<xsl:text>-</xsl:text>
							<fo:page-number/>
							<fo:leader leader-pattern="space"/>
                        </pagenum>
						<machine-no>
                            <fo:inline xsl:use-attribute-sets="__index__even__footer__machine">
							    <xsl:value-of select="$machineNo"/>
							</fo:inline>
                        </machine-no>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>
                        </machine-no> 
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertFrontMatterEvenFooter">
        <fo:static-content flow-name="even-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertGlossaryEvenFooter">
        <fo:static-content flow-name="even-glossary-footer">
            <fo:block xsl:use-attribute-sets="__glossary__even__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Glossary even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>
                        </machine-no> 
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd footer URM'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <fo:block xsl:use-attribute-sets="__toc__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Toc odd footer'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<!--<xsl:text>-</xsl:text>-->
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <fo:block xsl:use-attribute-sets="__index__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Index odd footer'"/>
                    <xsl:with-param name="theParameters">
						<machine-no>
                            <fo:inline xsl:use-attribute-sets="__index__odd__footer__machine">
							    <xsl:value-of select="$machineNo"/>
								<fo:leader leader-pattern="space"/>
							</fo:inline>
                        </machine-no>
                        <pagenum>
                            <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>						
						    <xsl:text>-</xsl:text>
							<fo:page-number/>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface odd footer'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertFrontMatterOddFooter">
        <fo:static-content flow-name="odd-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertGlossaryOddFooter">
        <fo:static-content flow-name="odd-glossary-footer">
            <fo:block xsl:use-attribute-sets="__glossary__odd__footer">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Glossary odd footer'"/>
                    <xsl:with-param name="theParameters">
                        <machine-no>
                            <xsl:value-of select="$machineNo"/>
							<fo:leader leader-pattern="space"/>
                        </machine-no>
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
                            </fo:inline>
                        </pagenum>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
			    <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body even footer URM'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>							
                        </machine-no>                      
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>			
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertPrefaceLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block xsl:use-attribute-sets="__body__last__footer">
			    <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Preface even footer'"/>
                    <xsl:with-param name="theParameters">
                        <pagenum>
                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                <fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
								<xsl:text>-</xsl:text>
								<fo:page-number/>
								<fo:leader leader-pattern="space"/>
                            </fo:inline>
                        </pagenum>
						<machine-no>
                            <xsl:value-of select="$machineNo"/>
                        </machine-no> 
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertFrontMatterLastFooter">
        <fo:static-content flow-name="last-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__last__footer">
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterFootnoteSeparator">
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader xsl:use-attribute-sets="__body__footnote__separator"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

</xsl:stylesheet>