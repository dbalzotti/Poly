<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
  <!--GEHC. Get the product name from bookmap or ditamap-->
  <xsl:variable name="productName">
	<xsl:value-of select="//*[contains(@class, ' sw-d/msgph ')][contains(@varref, 'PRODUCT_NAME')]"/>
  </xsl:variable>
    
    <!--xsl:variable name="prodPartNo">
        <xsl:call-template name="getMetadataValue">
            <xsl:with-param name="fieldname">FGEHCPARTNO</xsl:with-param>
            <xsl:with-param name="fieldlevel">lng</xsl:with-param>
            <xsl:with-param name="document.id" select="$export-document-id"/>
        </xsl:call-template>
    </xsl:variable-->
    
    <!--xsl:variable name="softwareRevision">
        <xsl:call-template name="getMetadataValue">
            <xsl:with-param name="fieldname">FGEHCSOFTWAREREVISION</xsl:with-param>
            <xsl:with-param name="fieldlevel">lng</xsl:with-param>
            <xsl:with-param name="document.id" select="$export-document-id"/>
        </xsl:call-template>
    </xsl:variable-->
    
    <!--xsl:variable name="copyrightDate">
        <!-- product version -->
        <xsl:call-template name="getMetadataValue">
            <xsl:with-param name="fieldname">FGEHCCOPYRIGHT</xsl:with-param>
            <xsl:with-param name="fieldlevel">lng</xsl:with-param>
            <xsl:with-param name="document.id" select="$export-document-id"/>
        </xsl:call-template>
    </xsl:variable-->
    
	
<!-- For GEHC outputs -->
   <ishfield name='FGEHCPARTNO' level='lng'/>
   <ishfield name='FGEHCSOFTWAREREVISION' level='lng'/>
   <ishfield name='FGEHCCOPYRIGHT' level='lng'/>
    
</xsl:stylesheet>