<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
	
	   <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertTocEvenFooter"/>
        </xsl:if>
        <xsl:call-template name="insertTocOddHeader"/>
        <xsl:if test="$mirror-page-margins">
          <xsl:call-template name="insertTocEvenHeader"/>
        </xsl:if>
		<xsl:call-template name="insertTocFirstHeader"/>
       </xsl:template>
	   
	
	<xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <fo:block xsl:use-attribute-sets="header_classification">
                <xsl:call-template name="insert_classification"/>
            </fo:block>
            <fo:block xsl:use-attribute-sets="__body__even__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body even header URM'"/>
                    <xsl:with-param name="theParameters">
                        <!--prodname>
                            <xsl:value-of select="$productName"/>
                        </prodname-->
                       <heading>
                            <fo:inline>
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
	<xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <fo:block xsl:use-attribute-sets="header_classification">
                <xsl:call-template name="insert_classification"/>
            </fo:block>
            <fo:block xsl:use-attribute-sets="__body__odd__header">
                <xsl:call-template name="insertVariable">
                    <xsl:with-param name="theVariableID" select="'Body odd header URM'"/>
                    <xsl:with-param name="theParameters">
                       <heading>
                            <fo:inline>
                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                            </fo:inline>
                        </heading>
                    </xsl:with-param>
                </xsl:call-template>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    <!-- use the same footer and header throughout the document -->
    <!--xsl:template name="insertEvenHeader">
        <fo:table xsl:use-attribute-sets="header" width="21cm">
            <fo:table-body>
                <fo:table-cell>
                    <fo:block-container xsl:use-attribute-sets="titleHeaderEven">
                        <fo:block>
							<xsl:choose>
								<xsl:when test="$mapType = 'bookmap'">
									<fo:retrieve-marker retrieve-class-name="current-header"/>
								</xsl:when>
								<xsl:otherwise>
									<fo:retrieve-marker retrieve-class-name="current-simple-header"/>
								</xsl:otherwise>
							</xsl:choose>
                        </fo:block>
                    </fo:block-container>
                </fo:table-cell>
            </fo:table-body>
        </fo:table>

    </xsl:template-->
    
    <!--xsl:template name="insertOddHeader">
        <fo:table xsl:use-attribute-sets="header" width="21cm">
            <fo:table-body>
                <fo:table-cell>
                    <fo:block-container xsl:use-attribute-sets="titleHeaderOdd">
                        <fo:block>
							<xsl:choose>
								<xsl:when test="$mapType = 'bookmap'">
									<fo:retrieve-marker retrieve-class-name="current-header"/>
								</xsl:when>
								<xsl:otherwise>
									<fo:retrieve-marker retrieve-class-name="current-simple-header"/>
								</xsl:otherwise>
							</xsl:choose>
                        </fo:block>
                    </fo:block-container>
                </fo:table-cell>
            </fo:table-body>
        </fo:table>
        
    </xsl:template-->
	
	
    <xsl:template name="insertEvenFooter">
        <fo:block-container xsl:use-attribute-sets="footer">
            <fo:table width="7in">
                <fo:table-body>
                    <fo:table-row>
					    <!--xsl:choose>
							<xsl:when test="$PageSize != 'A4'">
							   <fo:table-cell xsl:use-attribute-sets="pagenum" width="3.5cm">
									<fo:block padding-top="5pt">
										<fo:page-number/>
									</fo:block>
								</fo:table-cell>							
							</xsl:when-->
							<!--xsl:otherwise-->
							   <fo:table-cell xsl:use-attribute-sets="pagenum" width="3.0cm" text-align="left">
									<fo:block padding-top="5pt">
										<xsl:call-template name="insertVariable">
											<xsl:with-param name="theVariableID" select="'Body even footer URM'"/>
											<xsl:with-param name="theParameters">
												<!--prodname>
													<xsl:value-of select="$productName"/>
												</prodname-->
												<!--machine-no> 
													<xsl:value-of select="$machineNo"/>
													<fo:leader leader-pattern="space"/>
												</machine-no-->
												<pagenum>
													<fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
														<fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
														<xsl:text>-</xsl:text>
														<fo:page-number/>
													</fo:inline>
												</pagenum>
											</xsl:with-param>
										</xsl:call-template>
										<!--fo:page-number/-->
									</fo:block>
								</fo:table-cell>							
							<!--/xsl:otherwise>
						</xsl:choose-->
                        <fo:table-cell width="14cm" text-align="right">
                               <fo:block padding-top="5pt">
							   		<xsl:choose>
										<xsl:when test="$productName != 'None'">	
											<xsl:call-template name="insertVariable">
												<xsl:with-param name="theVariableID"
													select="'docInfoFooterLine1'"/>
												<xsl:with-param name="theParameters">
													<prodname>
														<xsl:value-of select="concat($productName, ' - ',$translated_publication_type)"/>
													</prodname>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>	
										  <!--xsl:value-of select="$pubTitle"/>
											 <xsl:text> &#x2014; </xsl:text>
											<xsl:choose>
												<xsl:when test="$fullPartNumber != ''">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="$fullPartNumber"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template>											
												</xsl:when>
												<xsl:otherwise>													
												</xsl:otherwise>	
											</xsl:choose-->
										</xsl:otherwise>
									</xsl:choose>				
                                </fo:block>						
						</fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell/>
                        <fo:table-cell text-align="right">
                                <fo:block>
							   		<xsl:choose>
										<xsl:when test="$productName != 'None'">	
										  <!--xsl:value-of select="$pubTitle"/>
											 <xsl:text> &#x2014; </xsl:text-->
											<xsl:choose>
												<xsl:when test="$fullPartNumber != ''">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="$fullPartNumber"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template>												
												</xsl:when>
												<xsl:otherwise>
													<!--xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="concat($pubMonth, '&#x2002;', $pubYear)"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template-->													
												</xsl:otherwise>	
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>									
                                </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block-container>
    </xsl:template>
    <xsl:template name="insertOddFooter">
        <fo:block-container xsl:use-attribute-sets="footer">
            <fo:table width="7in">
                <fo:table-body>
                    <fo:table-row >
                        <fo:table-cell  width="14cm" text-align="left">
                                <fo:block padding-top="5pt">
							   		<xsl:choose>
										<xsl:when test="$productName != 'None'">	
											<xsl:call-template name="insertVariable">
												<xsl:with-param name="theVariableID"
													select="'docInfoFooterLine1'"/>
												<xsl:with-param name="theParameters">
													<prodname>
														<xsl:value-of select="concat($productName, ' - ',$translated_publication_type)"/>
													</prodname>
												</xsl:with-param>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>	
										  <!--xsl:value-of select="$pubTitle"/>
											 <xsl:text> &#x2014; </xsl:text>
											<xsl:choose>
												<xsl:when test="$pubStatus != ''">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="$pubStatus"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template>												
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="concat($pubMonth, '&#x2002;', $pubYear)"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template>													
												</xsl:otherwise>	
											</xsl:choose-->
										</xsl:otherwise>
									</xsl:choose>		
                                </fo:block>						
						</fo:table-cell>
					    <!--xsl:choose>
							<xsl:when test="$PageSize != 'A4'">
							   <fo:table-cell xsl:use-attribute-sets="pagenum" width="3.5cm">
									<fo:block padding-top="5pt">
										<fo:page-number/>
									</fo:block>
								</fo:table-cell>							
							</xsl:when>
							<xsl:otherwise-->
							   <fo:table-cell xsl:use-attribute-sets="pagenum" width="3.0cm" text-align="right">
									<fo:block padding-top="5pt">
										<xsl:call-template name="insertVariable">
											<xsl:with-param name="theVariableID" select="'Body odd footer URM'"/>
											<xsl:with-param name="theParameters">
												<!--prodname>
													<xsl:value-of select="$productName"/>
												</prodname-->
												<!--machine-no> 
													<xsl:value-of select="$machineNo"/>
													<fo:leader leader-pattern="space"/>
												</machine-no-->
												<pagenum>
													<fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
														<fo:retrieve-marker retrieve-class-name="current-chapter-number"/>							
														<xsl:text>-</xsl:text>
														<fo:page-number/>
													</fo:inline>
												</pagenum>
											</xsl:with-param>
										</xsl:call-template>
										<!--fo:page-number/-->
									</fo:block>
								</fo:table-cell>							
							<!--/xsl:otherwise>
						</xsl:choose-->
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                                <fo:block>
							   		<xsl:choose>
										<xsl:when test="$productName != 'None'">	
										  <!--xsl:value-of select="$pubTitle"/>
											 <xsl:text> &#x2014; </xsl:text-->
											<xsl:choose>
												<xsl:when test="$fullPartNumber != ''">
													<xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="$fullPartNumber"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template>												
												</xsl:when>
												<xsl:otherwise>
													<!--xsl:call-template name="insertVariable">
														<xsl:with-param name="theVariableID"
															select="'docInfoFooterLine2'"/>
													   <xsl:with-param name="theParameters">
																<pubstatus>
																	<xsl:value-of select="concat($pubMonth, '&#x2002;', $pubYear)"/>
																</pubstatus>
														</xsl:with-param>
													</xsl:call-template-->													
												</xsl:otherwise>	
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
                                </fo:block>

                        </fo:table-cell>
                        <fo:table-cell/>						
                    </fo:table-row>
                </fo:table-body>
            </fo:table>


        </fo:block-container>
    </xsl:template>

    <!-- frontmatter -->
    <xsl:template name="insertFrontMatterEvenHeader">
        <fo:static-content flow-name="even-frontmatter-header">
            <!--xsl:call-template name="insertEvenHeader"/-->
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertFrontMatterOddHeader">
        <fo:static-content flow-name="odd-frontmatter-header">
            <xsl:call-template name="insertOddHeader"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertFrontMatterOddFooter">
        <fo:static-content flow-name="odd-frontmatter-footer">
            <!--xsl:call-template name="insertOddFooter"/-->
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertFrontMatterEvenFooter">
        <fo:static-content flow-name="even-frontmatter-footer">
            <!--xsl:call-template name="insertEvenFooter"/-->
        </fo:static-content>
    </xsl:template>
    <!-- body -->
    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <!--xsl:call-template name="insertEvenHeader"/-->
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <xsl:call-template name="insertOddHeader"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <xsl:call-template name="insertEvenFooter"/>
        </fo:static-content>
    </xsl:template>



    <!-- Glossary -->
    <xsl:template name="insertGlossaryEvenFooter">
        <fo:static-content flow-name="even-glossary-footer">
            <xsl:call-template name="insertEvenFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertGlossaryOddFooter">
        <fo:static-content flow-name="odd-glossary-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertGlossaryEvenHeader">
        <fo:static-content flow-name="even-glossary-header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertGlossaryOddHeader">
        <fo:static-content flow-name="odd-glossary-header">
            <xsl:call-template name="insertOddHeader"/>
        </fo:static-content>
    </xsl:template>
    
    <!-- Index -->

    <xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <xsl:call-template name="insertEvenFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="even-index-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertIndexEvenHeader">
        <fo:static-content flow-name="even-index-Header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertIndexOddHeader">
        <fo:static-content flow-name="even-index-header">
            <xsl:call-template name="insertOddHeader"/>
        </fo:static-content>
    </xsl:template>
    <!-- Preface -->
    <xsl:template name="insertPrefaceEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <xsl:call-template name="insertEvenFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <xsl:call-template name="insertOddFooter"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceLastFooter">
        <fo:static-content flow-name="even-body-footer">
            <xsl:call-template name="insertEvenFooter"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertPrefaceEvenheader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertPrefaceOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <xsl:call-template name="insertOddHeader"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertPrefaceFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <!--xsl:call-template name="insertEvenHeader"/-->
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertPrefaceLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="insertEvenHeader"/>
        </fo:static-content>
    </xsl:template>
    <!-- TOC -->

    <xsl:template name="insertTocFirstHeader">
       <fo:static-content flow-name="odd-body-header">
            <!--xsl:call-template name="insertEvenHeader"/-->
        </fo:static-content>
    </xsl:template>
	
	
    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <fo:block>
                <xsl:call-template name="insertOddFooter"/>
            </fo:block>
        </fo:static-content>

    </xsl:template>

    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <fo:block>
                <xsl:call-template name="insertEvenFooter"/>
            </fo:block>
        </fo:static-content>
    </xsl:template>
	
        <xsl:template name="insertTocOddHeader">
            <fo:static-content flow-name="odd-toc-header">
                <fo:block>
                    <!--xsl:call-template name="insertOddHeader"/-->
                </fo:block>
            </fo:static-content>
            
        </xsl:template>
        
        <xsl:template name="insertTocEvenHeader">
            <fo:static-content flow-name="even-toc-header">
                <fo:block>
                    <xsl:call-template name="insertEvenHeader"/>
                </fo:block>
            </fo:static-content>

    </xsl:template>
	

    <xsl:variable name="header-classification-string">
      <xsl:variable name="class-metadata">
        <xsl:call-template name="get-doc-ishfield-value">
          <xsl:with-param name="ishfield-name" select="'FGEHCCLASSIFICATION'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="lower-case($class-metadata)='c'">
          <xsl:text>GE Confidential</xsl:text>
        </xsl:when>
        <xsl:when test="lower-case($class-metadata)='m'">
          <xsl:text>GE Restricted</xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:template name="insert_classification">
      <xsl:value-of select="$header-classification-string"/>
    </xsl:template>

<!-- ********************************************************** -->
<!-- Metadata handling related to the overall job               -->
<!-- ********************************************************** -->

<!-- get-job-param-value gets a job parameter
     (from the ishjobticket.xml file associated with the overall document) -->
<xsl:variable name="ishjobticket-file-path"
              select="concat(replace($input.dir.url,'\\','/'),'ishjobticket.xml')"/>
<xsl:variable name="ishjobticket-file-doc-node" select="document($ishjobticket-file-path)"/>

<xsl:template name="get-job-param-value">
    <xsl:param name="param-name"/>
  <xsl:value-of select="$ishjobticket-file-doc-node//parameter[@name=$param-name][1]"/>
</xsl:template>

<!-- get-doc-ishfield-value gets an ishfield value
     from the *.met file associated with the overall document -->
<xsl:variable name="document-met-file-path">
  <!-- Get it from the ishjobticket.xml file -->
  <xsl:variable name="export-doc"
                select="string(document($ishjobticket-file-path)//parameter[@name='export-document'])"/>
  <xsl:value-of select="concat(replace($input.dir.url,'\\','/'),$export-doc,'.met')"/>
</xsl:variable>
<xsl:variable name="document-met-file-doc-node" select="document($document-met-file-path)"/>

<xsl:template name="get-doc-ishfield-value">
    <xsl:param name="ishfield-name"/>
  <xsl:value-of select="$document-met-file-doc-node//ishfield[@name=$ishfield-name][1]"/>
</xsl:template>


 
</xsl:stylesheet>
