<?xml version='1.0'?>

<!--
Polycom override to enable heading on steps without others.
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
            <!--<xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Prereq'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>-->
            <fo:block xsl:use-attribute-sets="prereq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/context ')]">
        <fo:block xsl:use-attribute-sets="context">
            <xsl:call-template name="commonattributes"/>
           <!-- <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Context'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>-->
            <fo:block xsl:use-attribute-sets="context__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/result ')]">
        <fo:block xsl:use-attribute-sets="result">
            <xsl:call-template name="commonattributes"/>
           <!-- <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Result'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>-->
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
               <!-- <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                  <xsl:with-param name="use-label">
                      <xsl:call-template name="insertVariable">
                          <xsl:with-param name="theVariableID" select="'Task Example'"/>
                      </xsl:call-template>
                  </xsl:with-param>
                </xsl:apply-templates>-->
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
            <!--<xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="insertVariable">
                        <xsl:with-param name="theVariableID" select="'Task Postreq'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>-->
            <fo:block xsl:use-attribute-sets="postreq__content">
              <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <!--Steps-->
    <xsl:template match="*[contains(@class, ' task/steps ')]">
        <xsl:variable name="count-steps" select="count(child::*[contains(@class,' task/step ')])"/>
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
                      <xsl:apply-templates>
                          <xsl:with-param name="step-count" select="$count-steps"/>
                      </xsl:apply-templates>
                  </fo:list-block>
              </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:list-block xsl:use-attribute-sets="steps">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates>
                        <xsl:with-param name="step-count" select="$count-steps"/>
                    </xsl:apply-templates>
                </fo:list-block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/steps-unordered ')]">
        <xsl:variable name="count-steps" select="count(child::*[contains(@class,' task/step ')])"/>
    <xsl:choose>
      <xsl:when test="$GENERATE-TASK-LABELS='YES'">
        <fo:block>
          <xsl:apply-templates select="." mode="dita2xslfo:task-heading">
            <xsl:with-param name="use-label">
              <xsl:call-template name="insertVariable">
                <xsl:with-param name="theVariableID" select="'#steps-unordered-label'"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:apply-templates>
          <fo:list-block xsl:use-attribute-sets="steps-unordered">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates mode="unordered">
                <xsl:with-param name="step-count" select="$count-steps"/>
            </xsl:apply-templates>
          </fo:list-block>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:list-block xsl:use-attribute-sets="steps-unordered">
          <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates mode="unordered">
                <xsl:with-param name="step-count" select="$count-steps"/>
            </xsl:apply-templates>
        </fo:list-block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


    <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')][not(contains(@class, ' topic/li '))]">
        <xsl:param name="step-count"/>
        <!-- Switch to variable for the count rather than xsl:number, so that step specializations are also counted -->
        <xsl:variable name="actual-step-count" select="number(count(preceding-sibling::*[contains(@class, ' task/step ')])+1)"/>        
        <fo:list-item xsl:use-attribute-sets="steps.step">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label">
                <fo:block xsl:use-attribute-sets="steps.step__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                        <!--<xsl:call-template name="insertVariable">
                            <xsl:with-param name="theVariableID" select="'Ordered List Number'"/>
                            <xsl:with-param name="theParameters">
                                <number>
                                    <xsl:value-of select="$actual-step-count"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>-->
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <xsl:value-of select="$actual-step-count"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    
                    <xsl:if test="$step-count = 1">
                        <xsl:text>&#x00BB; </xsl:text>
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

    <xsl:template match="*[contains(@class, ' task/steps-unordered ')]/*[contains(@class, ' task/step ')]" mode="unordered">
        <xsl:param name="step-count"/>
        <fo:list-item xsl:use-attribute-sets="steps-unordered.step">
            <fo:list-item-label xsl:use-attribute-sets="steps-unordered.step__label">
                <fo:block xsl:use-attribute-sets="steps-unordered.step__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:choose>
                        <xsl:when test="$step-count = 1">  
                            <xsl:text>&#x00BB; </xsl:text>                                                        
                        </xsl:when>
                        <xsl:otherwise>                            
                            <xsl:call-template name="insertVariable">
                                <xsl:with-param name="theVariableID" select="'Unordered List bullet'"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
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

    <xsl:template match="*[contains(@class, ' task/substeps ')]/*[contains(@class, ' task/substep ')]">
        <fo:list-item xsl:use-attribute-sets="substeps.substep">
            <fo:list-item-label xsl:use-attribute-sets="substeps.substep__label">
                <fo:block xsl:use-attribute-sets="substeps.substep__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:number format="a) "/>
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
