<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Polycom Header and Footer processing. -->
    
    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="buildHeader"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>    

    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="buildHeader"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>    

    <xsl:template name="insertBodyFirstHeader">        
        <!--<xsl:if test="not(parent::*[contains(@class,' bookmap/bookmap ')])">
            <fo:static-content flow-name="first-body-header">
                <fo:block xsl:use-attribute-sets="__body__odd__header">
                    <xsl:call-template name="buildHeader"/>
                </fo:block>
            </fo:static-content>
        </xsl:if>-->
    </xsl:template> 
    
    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="buildHeader"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>   

    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <!--<xsl:call-template name="buildFooter"/>-->
            </fo:block>
        </fo:static-content>

    </xsl:template>    

    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <!--<xsl:call-template name="buildFooter"/>-->
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyOddFooter">

        <fo:static-content flow-name="odd-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <!--<xsl:call-template name="buildFooter"/>-->
            </fo:block>
        </fo:static-content>

    </xsl:template>

    <xsl:template name="insertBodyEvenFooter">

        <fo:static-content flow-name="even-body-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <!--<xsl:call-template name="buildFooter"/>-->
            </fo:block>
        </fo:static-content>

    </xsl:template>
    
    <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertTocEvenFooter"/>
        </xsl:if>
        <xsl:call-template name="insertTocOddHeader"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertTocEvenHeader"/>
        </xsl:if>
        <xsl:call-template name="insertTocFirstFooter"/>
        <xsl:call-template name="insertTocFirstHeader"/>
        <xsl:call-template name="insertTocLastFooter"/>
        <xsl:call-template name="insertTocLastHeader"/>
    </xsl:template>
    
    <xsl:template name="insertTocFirstHeader">
	<fo:static-content flow-name="first-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="buildHeaderTOC"/>
            </fo:block>
        </fo:static-content>
	</xsl:template>

    <xsl:template name="insertTocOddHeader">
        <fo:static-content flow-name="odd-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="buildHeaderTOC"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>    

    <xsl:template name="insertTocEvenHeader">
        <fo:static-content flow-name="even-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="buildHeader"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>    
    
    <xsl:template name="insertTocLastHeader">
        <fo:static-content flow-name="last-toc-header">
            <fo:block xsl:use-attribute-sets="__toc__odd__header">
                <xsl:call-template name="buildHeader"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>    

    <xsl:template name="insertTocFirstFooter">
            <fo:static-content flow-name="first-toc-footer">
                <fo:block xsl:use-attribute-sets="__body__odd__footer">
                    <xsl:call-template name="buildFooter"/>
                </fo:block>
            </fo:static-content>        
    </xsl:template>

    <xsl:template name="insertTocOddFooter">
            <fo:static-content flow-name="odd-toc-footer">
                <fo:block xsl:use-attribute-sets="__body__odd__footer">
                    <!--<xsl:call-template name="buildFooter"/>-->
                </fo:block>
            </fo:static-content>        
    </xsl:template>

    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <!--<xsl:call-template name="buildFooter"/>-->
            </fo:block>
        </fo:static-content>        
    </xsl:template>
        
        <xsl:template name="insertTocLastFooter">
            <fo:static-content flow-name="last-toc-footer">
                <fo:block xsl:use-attribute-sets="__body__odd__footer">
                    <!--<xsl:call-template name="buildFooter"/>-->
                </fo:block>
            </fo:static-content>
        </xsl:template>

    <xsl:template name="insertIndexOddHeader"/>    

    <xsl:template name="insertIndexEvenHeader"/>
    

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>

    </xsl:template>

    <xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>

    </xsl:template>
    
    <xsl:template name="insertFrontMatterOddHeader"/>

    <xsl:template name="insertFrontMatterEvenHeader"/>

    <xsl:template name="insertFrontMatterLastHeader"/>

    <xsl:template name="insertFrontMatterLastFooter">
        <fo:static-content flow-name="last-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content></xsl:template>

    <xsl:template name="insertFrontMatterOddFooter">
        <fo:static-content flow-name="odd-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterEvenFooter">
        <fo:static-content flow-name="even-frontmatter-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryOddHeader"/>

    <xsl:template name="insertGlossaryEvenHeader"/>

    <xsl:template name="insertGlossaryOddFooter">
        <fo:static-content flow-name="odd-glossary-footer">
            <fo:block xsl:use-attribute-sets="__body__odd__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryEvenFooter">
        <fo:static-content flow-name="even-glossary-footer">
            <fo:block xsl:use-attribute-sets="__body__even__footer">
                <xsl:call-template name="buildFooter"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="buildHeaderTOC">
        <fo:block>
			<fo:inline>
			    <fo:external-graphic  content-width="scale-to-fit" content-height=".631in" src="url({'Customization/OpenTopic/common/artwork/Poly_logo.emf'})"/>
			</fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="buildHeader">
        <fo:block>
            <fo:inline>
                <fo:retrieve-marker retrieve-class-name="current-header"/>
            </fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="buildFooter">
        <fo:table width="100%">
            <fo:table-column column-number="1" width="99%" text-align="start"/>
            <fo:table-column column-number="2" width="1%" text-align="end"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell column-number="1" display-align="before">
                        <fo:block xsl:use-attribute-sets="Poly_footer">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Poly_footer'"/>
                             </xsl:call-template>
                        </fo:block> 
                        <fo:block xsl:use-attribute-sets="Poly_slogan">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Poly_slogan'"/>
                            </xsl:call-template>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell column-number="2" display-align="before">
                        <fo:block>
                           <fo:page-number/>                            
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
</xsl:stylesheet>