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

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:exsl="http://exslt.org/common"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    extension-element-prefixes="exsl"
    exclude-result-prefixes="opentopic exsl opentopic-index dita2xslfo"
    version="2.0">

    <!-- Determines whether to generate titles for task sections. Values are YES and NO. -->
    <xsl:param name="GENERATE-TASK-LABELS">
        <xsl:choose>
            <xsl:when test="$antArgsGenerateTaskLabels='YES'"><xsl:value-of select="$antArgsGenerateTaskLabels"/></xsl:when>
            <xsl:otherwise>NO</xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xsl:template name="processTask">
        <xsl:apply-templates select="." mode="processTask"/>
    </xsl:template>
    
    <xsl:template match="*" mode="processTask">
        <fo:block xsl:use-attribute-sets="task">
            <xsl:apply-templates select="." mode="commonTopicProcessing"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/taskbody ')]">
        <fo:block xsl:use-attribute-sets="taskbody">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/prereq ')]">
        <fo:block xsl:use-attribute-sets="prereq">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Prereq'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>
            <fo:block xsl:use-attribute-sets="prereq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/context ')]">
        <fo:block xsl:use-attribute-sets="context">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Context'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>
            <fo:block xsl:use-attribute-sets="context__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/cmd ')]" priority="1">
        <fo:block xsl:use-attribute-sets="cmd">
            <xsl:call-template name="commonattributes"/>
            <xsl:if test="../@importance='optional'">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Optional Step'"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/info ')]">
        <fo:block xsl:use-attribute-sets="info">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/tutorialinfo ')]">
        <fo:block xsl:use-attribute-sets="tutorialinfo">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/stepresult ')]">
        <fo:block xsl:use-attribute-sets="stepresult">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/result ')]">
        <fo:block xsl:use-attribute-sets="result">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Result'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>
            <fo:block xsl:use-attribute-sets="result__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <!-- If example has a title, process it first; otherwise, create default title (if needed) -->
    <xsl:template match="*[contains(@class, ' task/taskbody ')]/*[contains(@class, ' topic/example ')]">
        <fo:block xsl:use-attribute-sets="task.example">
            <xsl:call-template name="commonattributes"/>
            <xsl:choose>
              <xsl:when test="*[contains(@class, ' topic/title ')]">
                <xsl:apply-templates select="*[contains(@class, ' topic/title ')]"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                  <xsl:with-param name="use-label">
                      <xsl:call-template name="insertVariable">
                          <xsl:with-param name="theVariableID" select="'Task Example'"/>
                      </xsl:call-template>
                  </xsl:with-param>
                </xsl:apply-templates>
              </xsl:otherwise>
            </xsl:choose>
            <fo:block xsl:use-attribute-sets="task.example__content">
              <xsl:apply-templates select="*[not(contains(@class, ' topic/title '))]|text()|processing-instruction()"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/postreq ')]">
        <fo:block xsl:use-attribute-sets="postreq">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Postreq'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>
            <fo:block xsl:use-attribute-sets="postreq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/stepxmp ')]">
        <fo:block xsl:use-attribute-sets="stepxmp">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!--Steps-->
    <xsl:template match="*[contains(@class, ' task/steps ')]">
        <xsl:choose>
            <xsl:when test="$GENERATE-TASK-LABELS='YES'">
              <fo:block>
                  <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                      <xsl:with-param name="use-label">
                          <xsl:call-template name="insertVariable">
                              <xsl:with-param name="theVariableID" select="'Task Steps'"/>
                          </xsl:call-template>
                      </xsl:with-param>
                  </xsl:apply-templates>
                  <fo:list-block xsl:use-attribute-sets="steps">
                      <xsl:call-template name="commonattributes"/>
                      <xsl:apply-templates/>
                  </fo:list-block>
              </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:list-block xsl:use-attribute-sets="steps">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates/>
                </fo:list-block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/steps-unordered ')]">
        <fo:list-block xsl:use-attribute-sets="steps-unordered">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')]">
        <!-- Switch to variable for the count rather than xsl:number, so that step specializations are also counted -->
        <xsl:variable name="actual-step-count" select="number(count(preceding-sibling::*[contains(@class, ' task/step ')])+1)"/>
        <fo:list-item xsl:use-attribute-sets="steps.step">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label">
                <fo:block xsl:use-attribute-sets="steps.step__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                        <xsl:call-template name="insertVariable">
                            <xsl:with-param name="theVariableID" select="'Ordered List Number'"/>
                            <xsl:with-param name="theParameters">
                                <number>
                                    <xsl:value-of select="$actual-step-count"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/steps-unordered ')]/*[contains(@class, ' task/step ')]">
        <fo:list-item xsl:use-attribute-sets="steps-unordered.step">
            <fo:list-item-label xsl:use-attribute-sets="steps-unordered.step__label">
                <fo:block xsl:use-attribute-sets="steps-unordered.step__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Unordered List bullet'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="steps-unordered.step__body">
                <fo:block xsl:use-attribute-sets="steps-unordered.step__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/stepsection ')]">
        <fo:list-item xsl:use-attribute-sets="stepsection">
            <fo:list-item-label xsl:use-attribute-sets="stepsection__label">
              <fo:block xsl:use-attribute-sets="stepsection__label__content">
                  <fo:inline>
                      <xsl:call-template name="commonattributes"/>
                  </fo:inline>
              </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="stepsection__body">
                <fo:block xsl:use-attribute-sets="stepsection__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>

        </fo:list-item>
    </xsl:template>

    <!--Substeps-->
    <xsl:template match="*[contains(@class, ' task/substeps ')]">
        <fo:list-block xsl:use-attribute-sets="substeps">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:list-block>
    </xsl:template>

    <!--GEHC. Changed substeps to be bulleted rather than numbered-->
	<xsl:template match="*[contains(@class, ' task/substeps ')]/*[contains(@class, ' task/substep ')]">
        <fo:list-item xsl:use-attribute-sets="ul.li">
            <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
                <fo:block xsl:use-attribute-sets="ul.li__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <!--<xsl:number format="a) "/>-->
					<xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Unordered List bullet'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body xsl:use-attribute-sets="substeps.substep__body">
                <fo:block xsl:use-attribute-sets="substeps.substep__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <!--Choices-->
    <xsl:template match="*[contains(@class, ' task/choices ')]">
        <fo:list-block xsl:use-attribute-sets="choices">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/choice ')]">
        <fo:list-item xsl:use-attribute-sets="choices.choice">
            <fo:list-item-label xsl:use-attribute-sets="choices.choice__label">
                <fo:block xsl:use-attribute-sets="choices.choice__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Unordered List bullet'"/>
                    </xsl:call-template>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body xsl:use-attribute-sets="choices.choice__body">
                <fo:block xsl:use-attribute-sets="choices.choice__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

  <xsl:template match="*[contains(@class, ' topic/example ')]" mode="dita2xslfo:task-heading">
    <xsl:param name="use-label"/>
    <xsl:if test="$GENERATE-TASK-LABELS='YES'">
      <fo:block xsl:use-attribute-sets="example.title">
        <fo:inline>
          <xsl:copy-of select="$use-label"/>
        </fo:inline>
      </fo:block>
    </xsl:if>
  </xsl:template>

    <xsl:template match="*" mode="dita2xslfo:task-heading">
        <xsl:param name="use-label"/>
        <xsl:if test="$GENERATE-TASK-LABELS='YES'">
            <fo:block xsl:use-attribute-sets="section.title">
                <fo:inline><xsl:copy-of select="$use-label"/></fo:inline>
            </fo:block>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
