<?xml version="1.0" encoding="UTF-8"?>
<!-- This file is part of the DITA Open Toolkit project hosted on 
  Sourceforge.net. See the accompanying license.txt file for 
  applicable licenses.-->
<!-- (c) Copyright IBM Corp. 2011 All Rights Reserved. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">
    
  <xsl:attribute-set name="simple-page-master">
    <xsl:attribute name="page-width">
      <xsl:value-of select="$page-width"/>
    </xsl:attribute>
    <xsl:attribute name="page-height">
      <xsl:value-of select="$page-height"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!-- legacy attribute set -->
  <xsl:attribute-set name="region-body" use-attribute-sets="region-body.odd"/>
  
  <xsl:attribute-set name="region-body.odd">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="region-body.even">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-body.last">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC. Added to format body region of first pages-->
  <xsl:attribute-set name="region-body.first">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top-first"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC. Added to format body region of odd TOC pages-->
  <xsl:attribute-set name="region-body__toc.odd">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC. Added to format body region of even TOC pages-->
  <xsl:attribute-set name="region-body__toc.even">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC. Added to format body region of first TOC pages-->
  <xsl:attribute-set name="region-body__toc.first">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top-first-toc"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-body__backmatter.first">
    <xsl:attribute name="margin-top">1in</xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-body__backmatter.even">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-body__backmatter.odd">
    <xsl:attribute name="margin-top">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="margin-bottom">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-left)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-left configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-left"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-inside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
      <xsl:choose>
        <!-- support legacy parameter -->
        <xsl:when test="normalize-space($page-margin-right)">
          <xsl:call-template name="output-message">
            <xsl:with-param name="msg">[WARN]: The $page-margin-right configuration variable has been deprecated. Use $page-margin-inside and $page-margin-outside instead.</xsl:with-param>
          </xsl:call-template>
          <xsl:value-of select="$page-margin-right"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$page-margin-outside"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-body__backmatter.last">
    <xsl:attribute name="margin-top"><xsl:value-of select="$page-margin-top"/></xsl:attribute>
    <xsl:attribute name="margin-bottom">.5in</xsl:attribute>
	<xsl:attribute name="margin-left"><xsl:value-of select="$page-margin-outside"/></xsl:attribute>
	<xsl:attribute name="margin-right"><xsl:value-of select="$page-margin-inside"/></xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-body__frontmatter.odd" use-attribute-sets="region-body.odd">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-body__frontmatter.even" use-attribute-sets="region-body.even">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-body__frontmatter.first">
    <xsl:attribute name="margin-top">2in</xsl:attribute>
    <xsl:attribute name="margin-bottom">1in</xsl:attribute>
	<xsl:attribute name="margin-left">.7in</xsl:attribute>
	<xsl:attribute name="margin-right">.7in</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- legacy attribute set -->
  <xsl:attribute-set name="region-body__index" use-attribute-sets="region-body__index.odd"/>

  <xsl:attribute-set name="region-body__index.odd" use-attribute-sets="region-body.odd">
    <xsl:attribute name="column-count">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="region-body__index.even" use-attribute-sets="region-body.even">
    <xsl:attribute name="column-count">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="region-before-even">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-before-odd">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-before-first">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-before-toc-even">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-before-toc-odd">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-before-toc-first">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
    <!--GEHC-->
  <xsl:attribute-set name="region-before-index-first">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-top"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-after-even">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-after-odd">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-after-first">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <!--GEHC-->
  <xsl:attribute-set name="region-after-toc-even">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="region-after-toc-odd">
    <xsl:attribute name="extent">
      <xsl:value-of select="$page-margin-bottom"/>
    </xsl:attribute>
    <xsl:attribute name="display-align">after</xsl:attribute>
	<xsl:attribute name="padding-left">
	    <xsl:value-of select="$page-margin-inside"/>
	</xsl:attribute>
	<xsl:attribute name="padding-right">
	    <xsl:value-of select="$page-margin-outside"/>
	</xsl:attribute>
  </xsl:attribute-set>
    
</xsl:stylesheet>
