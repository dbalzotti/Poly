<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="1.1">

    <xsl:variable name="map" select="//opentopic:map"/>
	
	<xsl:template name="createBackMatter">  
        <!--<fo:page-sequence master-reference="back-matter" format="1">-->
        <fo:page-sequence master-reference="back-matter">  		
            <fo:flow flow-name="xsl-region-body">    
                <fo:block id="endofdoc"/> 
				
				<!--GEHC. SDL: added to hard-code insert text from warranty topic-->
					<fo:block xsl:use-attribute-sets="__backmatter_title">
					    <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'warranty')]/title"/>
					</fo:block>
					
					<fo:block xsl:use-attribute-sets="__backmatter_warranty">
					    <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'warranty')]//p[1]"/>
					</fo:block>
					
					<fo:block xsl:use-attribute-sets="__backmatter_warranty">
					    <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'warranty')]//p[2]"/>
					</fo:block>
					
					<fo:block xsl:use-attribute-sets="__backmatter_warranty">
					    <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'warranty')]//p[3]"/>
					</fo:block>
					
					<fo:block xsl:use-attribute-sets="__backmatter_warranty.last">
					    <xsl:value-of select="//*[contains(@class, ' topic/topic ')][contains(@outputclass, 'warranty')]//p[4]"/>
					</fo:block>
				
				<fo:block-container absolute-position="absolute" top="8.6in" left="4.5in">
				<fo:block>
				 
				    <!--GEHC. Use the variable from root processing-->
					<fo:block  xsl:use-attribute-sets="__backmatter">
					    <xsl:value-of select="$productName"/>
					</fo:block>
					
					<!--GEHC. Hard-coded manual type-->
					<fo:block xsl:use-attribute-sets="__backmatter">
					    <xsl:text>User's Reference Manual</xsl:text>
                    </fo:block>
					
					<!--GEHC. Use the variable from root processing and convert it to the language name-->
					<fo:block xsl:use-attribute-sets="__backmatter">
					    <xsl:choose>
						    <xsl:when test="$printedLang = 'BG' or $printedLang = 'bg'">
							    <xsl:text>Bulgarian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'CS' or $printedLang = 'cs'">
							    <xsl:text>Czech</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'DA' or $printedLang = 'da'">
							    <xsl:text>Danish</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'DE' or $printedLang = 'de'">
							    <xsl:text>German</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'EL' or $printedLang = 'el'">
							    <xsl:text>Greek</xsl:text>
							</xsl:when>
						    <xsl:when test="$printedLang = 'EN' or $printedLang = 'en'">
							    <xsl:text>English</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'ES' or $printedLang = 'es'">
							    <xsl:text>Spanish</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'ET' or $printedLang = 'et'">
							    <xsl:text>Estonian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'FI' or $printedLang = 'fi'">
							    <xsl:text>Finnish</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'FR' or $printedLang = 'fr'">
							    <xsl:text>French</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'HR' or $printedLang = 'hr'">
							    <xsl:text>Croatian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'HU' or $printedLang = 'hu'">
							    <xsl:text>Hungarian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'ID' or $printedLang = 'id'">
							    <xsl:text>Indonesian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'IS' or $printedLang = 'is'">
							    <xsl:text>Icelandic</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'IT' or $printedLang = 'it'">
							    <xsl:text>Italian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'JA' or $printedLang = 'ja'">
							    <xsl:text>Japanese</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'KO' or $printedLang = 'ko'">
							    <xsl:text>Korean</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'LT' or $printedLang = 'lt'">
							    <xsl:text>Lithuanian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'LV' or $printedLang = 'lv'">
							    <xsl:text>Latvian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'NL' or $printedLang = 'nl'">
							    <xsl:text>Dutch</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'NO' or $printedLang = 'no'">
							    <xsl:text>Norwegian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'PL' or $printedLang = 'pl'">
							    <xsl:text>Polish</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'PT' or $printedLang = 'pt'">
							    <xsl:text>Portuguese</xsl:text>
							</xsl:when>
			                <xsl:when test="$printedLang = 'PT_BR' or $printedLang = 'pt_br' or $printedLang = 'pt_BR'">
							    <xsl:text>Brazilian Portuguese</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'RO' or $printedLang = 'ro'">
							    <xsl:text>Romanian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'SR' or $printedLang = 'sr'">
							    <xsl:text>Serbian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'RU' or $printedLang = 'ru'">
							    <xsl:text>Russian</xsl:text>
							</xsl:when>
							<xsl:when test="$printedLang = 'SK' or $printedLang = 'sk'">
							    <xsl:text>Slovak</xsl:text>
							</xsl:when>	
                            <xsl:when test="$printedLang = 'SL' or $printedLang = 'sl'">
							    <xsl:text>Slovenian</xsl:text>
							</xsl:when>	
                            <xsl:when test="$printedLang = 'SV' or $printedLang = 'sv'">
							    <xsl:text>Swedish</xsl:text>
							</xsl:when>
						    <xsl:when test="$printedLang = 'UK' or $printedLang = 'uk'">
							    <xsl:text>Ukrainian</xsl:text>
							</xsl:when>
                            <xsl:when test="$printedLang = 'TR' or $printedLang = 'tr'">
							    <xsl:text>Turkish</xsl:text>
							</xsl:when>
                            <xsl:when test="$printedLang = 'VI' or $printedLang = 'vi'">
							    <xsl:text>Vietnamese</xsl:text>
							</xsl:when>
                            <xsl:when test="$printedLang = 'ZH_CN' or $printedLang = 'zh_cn' or $printedLang = 'zh_CN'">
							    <xsl:text>Chinese</xsl:text>
							</xsl:when>							
							<xsl:otherwise>
							    <xsl:text>[Language]</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
					
					<!--GEHC. Use the variable from root processing-->
					<fo:block  xsl:use-attribute-sets="__backmatter">
					    <xsl:value-of select="$backCoverNo"/>
					</fo:block>
					
					<!--GEHC. Use the variables from root processing-->
					<fo:block  xsl:use-attribute-sets="__backmatter">
					    <fo:inline>
						    <xsl:value-of select="$revDate"/>
						</fo:inline>
						<xsl:text> </xsl:text>
						<fo:inline>
						    <xsl:value-of select="$isbn"/>
						</fo:inline>
					</fo:block>
					
					<fo:block xsl:use-attribute-sets="__backmatter">
					    <xsl:text></xsl:text>
					</fo:block>
				
                </fo:block>
               </fo:block-container>	
			   
            </fo:flow> 
			
        </fo:page-sequence> 
    </xsl:template>
	
	<!-- Added by SDL to process information in warranty topic -->
	<xsl:template match="*[contains(@class, ' topic/topic ')][contains (@outputclass, 'warranty')]"/>

</xsl:stylesheet>