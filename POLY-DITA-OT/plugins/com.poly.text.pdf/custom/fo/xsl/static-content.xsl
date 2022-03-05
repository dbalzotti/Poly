<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:template name="header">
        <fo:block-container absolute-position="fixed" height="{$page-height} - 12.5pt" left="55pt" display-align="after">
		    <!-- ContentRules March 2021: white_paper_footer_logo: PLT PDF - dhb -->	
            <fo:block><fo:external-graphic
                src="Customization/OpenTopic/common/artwork/POLY_logo_lava-black_13FEB19.pdf" content-width="scale-to-fit" content-height="25%" width="25%" scaling="uniform"/>
			</fo:block>
        </fo:block-container>
    </xsl:template>

    <xsl:template name="footer">
       
        <xsl:choose>
            <xsl:when test="count(ancestor-or-self::*[@outputclass = 'backpage']) = 0">

                <fo:block xsl:use-attribute-sets="footer">
                    <xsl:if test="lower-case(/*/@outputclass)='confidential'">
                        <fo:inline xsl:use-attribute-sets="confidential">
                        <xsl:call-template name="insertVariable">
                            <xsl:with-param name="theVariableID" select="lower-case(/*/@outputclass)"/>
                        </xsl:call-template>
                    </fo:inline>
                    </xsl:if>
                    <fo:leader/>
                    <fo:inline xsl:use-attribute-sets="footer__page-number">
                        <fo:page-number/>
                    </fo:inline>
                </fo:block>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <!--xsl:call-template name="header"/-->
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocOddHeader">
        <fo:static-content flow-name="odd-toc-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocEvenHeader">
        <fo:static-content flow-name="even-toc-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddHeader">
        <fo:static-content flow-name="odd-index-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexEvenHeader">
        <fo:static-content flow-name="even-index-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterOddHeader">
        <fo:static-content flow-name="odd-frontmatter-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterEvenHeader">
        <fo:static-content flow-name="even-frontmatter-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterLastHeader">
        <fo:static-content flow-name="last-frontmatter-header">
            <xsl:call-template name="header"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertPrefaceEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterLastFooter">
        <fo:static-content flow-name="last-frontmatter-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterOddFooter">
        <fo:static-content flow-name="odd-frontmatter-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertFrontMatterEvenFooter">
        <fo:static-content flow-name="even-frontmatter-footer">
            <xsl:call-template name="footer"/>
        </fo:static-content>
    </xsl:template>
</xsl:stylesheet>
