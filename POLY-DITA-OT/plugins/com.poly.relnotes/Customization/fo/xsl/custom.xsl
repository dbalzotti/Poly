<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet exclude-result-prefixes="e opentopic" version="2.0" xmlns:e="com.ivis.abbott.pdf"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic="http://www.idiominc.com/opentopic"
  xmlns:exsl="http://exslt.org/common" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/">
  
  <xsl:param name="ditaVersion" select="number(/*[contains(@class,' map/map ')]/@ditaarch:DITAArchVersion)"/>
  
  <xsl:param name="art_path">/common/artwork/</xsl:param>
  
  <!--xsl:include href="root-processing.xsl"/-->
  <xsl:include href="layout-masters.xsl"/>
  <!--<xsl:include href="front-matter.xsl"/>-->
  <xsl:include href="header_footer.xsl"/>
  <xsl:include href="bookparts.xsl"/>
  <xsl:include href="toc.xsl"/>
  <xsl:include href="bookmarks.xsl"/>
  <xsl:include href="note.xsl"/>
  <xsl:include href="task-elements.xsl"/>
  <xsl:include href="fig_cap.xsl"/>
  <xsl:include href="lists.xsl"/>
  <xsl:include href="tables.xsl"/>
  <xsl:include href="image_fix.xsl"/>
  <xsl:include href="top_minitoc.xsl"/>
  <xsl:include href="commons.xsl"/>

</xsl:stylesheet>
