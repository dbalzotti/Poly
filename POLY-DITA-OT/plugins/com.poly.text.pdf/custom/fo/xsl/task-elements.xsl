<?xml version='1.0'?>

<!--
Copyright ? 2004-2006 by Idiom Technologies, Inc. All rights reserved.
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
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    exclude-result-prefixes="dita-ot ot-placeholder opentopic opentopic-index opentopic-func dita2xslfo xs"
    version="2.0">

    <!-- Force the list label to just be a number. -->
    <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')]">
        <!-- Switch to variable for the count rather than xsl:number, so that step specializations are also counted -->
        <!-- may 31 2015 - Suite: 0012761: Plantronics PDF: add styling for STEPSECTION tag - am -->
        <xsl:variable name="preceding-step-section" select="count(preceding-sibling::*[contains(@class, ' task/stepsection ')])"/>
        <xsl:variable name="actual-step-count" >
           <xsl:choose>
                <xsl:when test="preceding-sibling::*[contains(@class, ' task/stepsection ')]">
                  <xsl:value-of select="number(count(preceding-sibling::*[contains(@class, ' task/step ')][count(preceding::*[contains(@class, ' task/stepsection ')])=$preceding-step-section])+1)"/>
          </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number(count(preceding-sibling::*[contains(@class, ' task/step ')])+1)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        <fo:list-item xsl:use-attribute-sets="steps.step">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label">
                <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                    <fo:block xsl:use-attribute-sets="steps.step__label__content">
                        <fo:inline id="{@id}"/>
                        <!-- Modifications here: don't do any variable lookup -->
                        <xsl:value-of select="$actual-step-count"/>
                    </fo:block>
                </xsl:if>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>

    <!-- may 31 2015 - Suite: 0012761: Plantronics PDF: add styling for STEPSECTION tag - am -->
    <xsl:template match="*[contains(@class,' task/stepsection ')]">
        <fo:list-item xsl:use-attribute-sets="steps.stepsection">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label">
                <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                    <fo:block xsl:use-attribute-sets="steps.step__label__content">
                        <fo:inline id="{@id}"/>
                        <!-- Modifications here: don't do any variable lookup -->
                      <!--  <xsl:value-of select="$actual-step-count"/>-->
                    </fo:block>
                </xsl:if>
            </fo:list-item-label>
            
            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
            
        </fo:list-item>
    </xsl:template>
    
    <!-- Mantis 3387: Use A -->
    <xsl:template match="*[contains(@class, ' task/substeps ')]/*[contains(@class, ' task/substep ')]">
        <fo:list-item xsl:use-attribute-sets="substeps.substep">
            <fo:list-item-label xsl:use-attribute-sets="substeps.substep__label">
                <fo:block xsl:use-attribute-sets="substeps.substep__label__content">
                    <fo:inline id="{@id}"/>
                    <xsl:number format="A"/>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body xsl:use-attribute-sets="substeps.substep__body">
                <fo:block xsl:use-attribute-sets="substeps.substep__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

</xsl:stylesheet>
