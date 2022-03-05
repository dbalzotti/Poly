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

    <!-- Add the document-info tag for fitwindow -->
    <xsl:template name="rootTemplate">
        <xsl:call-template name="validateTopicRefs"/>

        <fo:root xsl:use-attribute-sets="__fo__root">
            <!--xsl:if test="($rtl-pub -ne 'ar' or $rtl-pub != 'he') ">
				<xsl:attribute name="writing-mode">rl-tb</xsl:attribute>
            </xsl:if-->
            <xsl:attribute name="xml:lang"><xsl:value-of select="//*[contains(@class, ' map/map ')]/@xml:lang"/></xsl:attribute>
            <xsl:message>"xml:lang": <xsl:value-of select="//*[contains(@class, ' map/map ')]/@xml:lang"/></xsl:message>
            <!--xsl:message>rtl-pub: <xsl:value-of select="not($rtl-pub)"/></xsl:message-->
            <!--axf:document-info name="fitwindow" value="true"/-->

            <!--xsl:comment>
                <xsl:text>Layout masters = </xsl:text>
                <xsl:value-of select="$layout-masters"/>
            </xsl:comment-->

            <xsl:call-template name="createLayoutMasters"/>

            <xsl:call-template name="createBookmarks"/>

            <xsl:call-template name="createFrontMatter"/>

            <xsl:call-template name="createToc"/>

<!--            <xsl:call-template name="createPreface"/>-->

            <xsl:apply-templates/>

            <xsl:call-template name="createIndex"/>
			<xsl:call-template name="createBackCover"/>

        </fo:root>
    </xsl:template>
</xsl:stylesheet>
