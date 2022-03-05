<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="1.0">

    <xsl:attribute-set name="steps-unordered">
        <xsl:attribute name="relative-align">baseline</xsl:attribute>        
        <xsl:attribute name="provisional-distance-between-starts">15pt</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>        
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>1pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">-15pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps">
         <xsl:attribute name="relative-align">baseline</xsl:attribute>       
		 <xsl:attribute name="provisional-distance-between-starts">15pt</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>-14pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">-15pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps-unordered.step__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps.step__label">
        <xsl:attribute name="space-after.optimum">3pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">3pt</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <!--xsl:attribute name="color">#a9a9a9</xsl:attribute-->
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">9.5pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps.step">
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="not(preceding-sibling::*) and not(parent::*/preceding-sibling::*)">
                    <xsl:text>0pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>3pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

<!-- may 31 2015 - Suite: 0012761: Plantronics PDF: add styling for STEPSECTION tag - am -->
    <xsl:attribute-set name="steps.stepsection" use-attribute-sets="steps.step">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0pt</xsl:attribute>        
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="info">
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
	
	<xsl:attribute-set name="substeps">
	    <xsl:attribute name="provisional-label-separation">20pt</xsl:attribute>
		<xsl:attribute name="margin-left">10pt</xsl:attribute>
	</xsl:attribute-set>

    <xsl:attribute-set name="substeps.substep">
        <xsl:attribute name="margin-top">6pt</xsl:attribute>
	   <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>


    <xsl:attribute-set name="substeps.substep__label"  use-attribute-sets="ol.li__label">
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>

    </xsl:attribute-set>
	

    <xsl:attribute-set name="substeps.substep__label__content" use-attribute-sets="ol.li__label__content">
        <xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="text-align">right</xsl:attribute>
		
    </xsl:attribute-set>
	
    <xsl:attribute-set name="substeps.substep__body" use-attribute-sets="ol.li__body">    
    </xsl:attribute-set>

    <xsl:attribute-set name="substeps.substep__content" use-attribute-sets="ol.li__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="cmd">
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <!--xsl:attribute name="font-weight">
            <xsl:choose>
                <xsl:when test="ancestor::*[contains(@class, ' task/substep ')]">
                    <xsl:text>normal</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute-->
    </xsl:attribute-set>
    <!--Choices-->
    <xsl:attribute-set name="choices">
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">7pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">7pt</xsl:attribute>
        <!--        <xsl:attribute name="margin-left">-8pt</xsl:attribute>-->
        
        <xsl:attribute name="provisional-distance-between-starts">7pt</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">4pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>-7pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">-7pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice">
        <xsl:attribute name="space-after.optimum">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">1.5pt</xsl:attribute>
        
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
		<xsl:attribute name="margin-left">10pt</xsl:attribute>
		
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice__label">
        <xsl:attribute name="keep-together.within-line">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-line">always</xsl:attribute>
        <xsl:attribute name="end-indent">label-end()</xsl:attribute>
        
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice__label__content">
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">right</xsl:when>
                <xsl:otherwise>right</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice__body">
        <xsl:attribute name="start-indent">body-start()</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="choices.choice__content">
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
	

    <xsl:attribute-set name="stepresult">
		<xsl:attribute name="font-family">Sans</xsl:attribute>	
    </xsl:attribute-set>


    <xsl:attribute-set name="context" >
		<xsl:attribute name="font-family">Sans</xsl:attribute>	
    </xsl:attribute-set>
    <xsl:attribute-set name="context__content">
	   <xsl:attribute name="font-family">Sans</xsl:attribute>	
    </xsl:attribute-set>
	
	
	
</xsl:stylesheet>
