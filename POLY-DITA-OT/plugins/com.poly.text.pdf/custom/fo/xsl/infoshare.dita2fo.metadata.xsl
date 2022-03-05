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
	
	<!-- ============================================================== -->
	<!-- Revision History -->
	<!-- ============================================================== -->
	<!--
       1/ Initial version
       2/ 20070813: Added span-style to metadata block in order to have
                    metadata table using complete pagewidth.
       3/ 20071108: EM/RS: added template to retrieve value of specific metadata field.
       4/ 20100218: RS changed @id to @oid for metadata (file) retrieval.
       5/ 20100921: RS added resolving of @oid/@id depending the existance of @oid (single topic's don't have @oid)
  -->
	<!-- ============================================================== -->
	<xsl:template match="ishfield">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- ============================================================== -->
   <xsl:template name="getMetadataValue">
      <xsl:param name="document.id" />
      <xsl:param name="fieldname" />
      <xsl:param name="fieldlevel" />
      <xsl:param name="default" />
      <xsl:choose>
         <xsl:when test="document(concat('file:///',$WORKDIR, '/', $document.id, $ext.metadata),/)//ishfield[@name=$fieldname and @level=$fieldlevel]">
            <xsl:value-of select="document(concat('file:///',$WORKDIR, '/', $document.id, $ext.metadata),/)//ishfield[@name=$fieldname and @level=$fieldlevel]"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$default"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
      <!-- ============================================================== -->
</xsl:stylesheet>
