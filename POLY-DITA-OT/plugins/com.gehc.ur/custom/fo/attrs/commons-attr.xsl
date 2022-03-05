<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
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

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:rx="http://www.renderx.com/XSL/Extensions" version="2.0">

  <!-- common attribute sets -->

  <xsl:attribute-set name="common.border__top">
    <xsl:attribute name="border-top-style">solid</xsl:attribute>
    <xsl:attribute name="border-top-width">1pt</xsl:attribute>
    <xsl:attribute name="border-top-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__bottom">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__right">
    <xsl:attribute name="border-right-style">solid</xsl:attribute>
    <xsl:attribute name="border-right-width">1pt</xsl:attribute>
    <xsl:attribute name="border-right-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__left">
    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border" use-attribute-sets="common.border__top common.border__right common.border__bottom common.border__left"/>

  <xsl:attribute-set name="base-font">
    <xsl:attribute name="font-size">
      <xsl:value-of select="$default-font-size"/>
    </xsl:attribute>
  </xsl:attribute-set>

  <!-- titles -->
  <xsl:attribute-set name="common.title">
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
  </xsl:attribute-set>

  <!-- paragraph-like blocks --> <!--GEHC-->
  <xsl:attribute-set name="common.block">
    <xsl:attribute name="space-before">0em</xsl:attribute>
    <xsl:attribute name="space-after">0em</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.link">
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
  </xsl:attribute-set>

  <!-- common element specific attribute sets -->

  <xsl:attribute-set name="tm">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="tm__content">
    <xsl:attribute name="font-size">75%</xsl:attribute>
    <xsl:attribute name="baseline-shift">20%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="tm__content__service">
    <xsl:attribute name="font-size">40%</xsl:attribute>
    <xsl:attribute name="baseline-shift">50%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="author"> </xsl:attribute-set>

  <xsl:attribute-set name="source"> </xsl:attribute-set>

  <xsl:attribute-set name="topic.title" use-attribute-sets="common.title"> <!--GEHC. "Hides" the repeated chapter title-->
    <xsl:attribute name="border-bottom">0pt solid black</xsl:attribute>
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">0pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="font-size">.1pt</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="color">#ffffff</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.title__content">
    <xsl:attribute name="line-height">100%</xsl:attribute>
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.title" use-attribute-sets="common.title"> <!--FM:Heading1--> <!--GEHC-->
    <xsl:attribute name="padding-top">22pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">12pt</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="line-height">17pt</xsl:attribute>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="break-before">page</xsl:attribute>
    <xsl:attribute name="border-bottom-style">none</xsl:attribute>
    <xsl:attribute name="border-bottom-width">0pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.title__content">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.title" use-attribute-sets="common.title"> <!--FM:Heading2--> <!--GEHC-->
    <xsl:attribute name="padding-top">18pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">12pt</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="line-height">15pt</xsl:attribute>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <!--xsl:attribute name="margin-left">.5in</xsl:attribute-->
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.title__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.title" use-attribute-sets="common.title"> <!--FM:Heading3--> <!--GEHC-->
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-bottom">0pt</xsl:attribute><!--was 6pt, 12pt-->
    <xsl:attribute name="margin-top">0pt</xsl:attribute>
    <xsl:attribute name="margin-left">0in</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.title__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.topic.title" use-attribute-sets="common.title">
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
    <xsl:attribute name="margin-top">0pt</xsl:attribute>
    <xsl:attribute name="margin-left">0in</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.topic.title__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
    <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="section.title" use-attribute-sets="common.title">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-before">15pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="example.title" use-attribute-sets="common.title">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="space-after">5pt</xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC. Adds space above figures and changes alignment based on @outputclass-->
  <xsl:attribute-set name="fig">
    <xsl:attribute name="padding-top">.13in</xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:choose>
        <xsl:when test="@outputclass='fullpg'">0in</xsl:when>
        <xsl:when test="@outputclass='incol'"><xsl:value-of select="$side-col-width"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$side-col-width"/></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC.This indents titles in "incol" figs 2.25in. Other fig titles are not indented.-->
  <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title"> <!--FM:FigCaption--> <!--GEHC-->
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:value-of select="$default-font-size"/>
    </xsl:attribute>
    <xsl:attribute name="space-before">5pt</xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">12pt</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:choose>
        <xsl:when test="ancestor::*[contains(@class, ' topic/fig ')]/@outputclass='incol'">
          <xsl:value-of select="$side-col-width"/>
        </xsl:when>
        <xsl:when test="ancestor::*[contains(@class, ' topic/fig ')]/@outputclass='fullpg'">0in</xsl:when>
        <xsl:otherwise>0in</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="topic" use-attribute-sets="base-font">
  </xsl:attribute-set>

  <xsl:attribute-set name="titlealts">
    <xsl:attribute name="background-color">#f0f0d0</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="navtitle" use-attribute-sets="common.title"> </xsl:attribute-set>

  <xsl:attribute-set name="navtitle__label">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="searchtitle">
  </xsl:attribute-set>

  <xsl:attribute-set name="searchtitle__label">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="body__toplevel" use-attribute-sets="base-font">
    <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="body__secondLevel" use-attribute-sets="base-font">
    <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="body" use-attribute-sets="base-font">
    <xsl:attribute name="start-indent"><xsl:value-of select="$side-col-width"/></xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="abstract" use-attribute-sets="body">
  </xsl:attribute-set>

  <xsl:attribute-set name="shortdesc">
  </xsl:attribute-set>

  <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body">
  </xsl:attribute-set>

  <!--GEHC-->
  <xsl:attribute-set name="section" use-attribute-sets="base-font">
    <xsl:attribute name="line-height"><xsl:value-of select="$default-line-height"/></xsl:attribute>
    <xsl:attribute name="space-before">0em</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="section__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="example" use-attribute-sets="base-font">
    <xsl:attribute name="line-height"><xsl:value-of select="$default-line-height"/></xsl:attribute>
    <xsl:attribute name="space-before">0.6em</xsl:attribute>
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
    <xsl:attribute name="end-indent">0pt</xsl:attribute>
    <xsl:attribute name="padding">5pt</xsl:attribute>
    <xsl:attribute name="border-top-style">solid</xsl:attribute>
    <xsl:attribute name="border-top-width">0pt</xsl:attribute>
    <xsl:attribute name="border-top-color">white</xsl:attribute>
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">0pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-left-color">white</xsl:attribute>
    <xsl:attribute name="border-right-style">solid</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-color">white</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="example__content">
  </xsl:attribute-set>

  <xsl:attribute-set name="desc">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="prolog" use-attribute-sets="base-font">
    <xsl:attribute name="start-indent">72pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="p"> <!--FM:Body--> <!--GEHC-->
    <xsl:attribute name="text-indent">0pt</xsl:attribute>
    <xsl:attribute name="space-before">
      <xsl:choose>
        <xsl:when test="count(preceding-sibling::*)=0">6pt</xsl:when>
        <xsl:otherwise>0pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="space-after">
      <xsl:choose>
        <xsl:when test="following-sibling::*[contains(@class, ' topic/note ')]">6pt</xsl:when>
        <xsl:when test="count(following-sibling::*)=0">12pt</xsl:when>
        <xsl:otherwise>4pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="p__note"> <!--FM:Notebody, Notebody Plain, Cautionbody, Cautionbody Plain, Warnbody, Warnbody Plain, Importantbody, Importantbody Plain--> <!--GEHC-->
    <!--<xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>-->
    <xsl:attribute name="space-before">3pt</xsl:attribute>
    <xsl:attribute name="space-after">
      <xsl:choose>
        <xsl:when test="count(following-sibling::*)=0">10pt</xsl:when>
        <xsl:otherwise>3pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="margin-left">
      <xsl:choose>
        <xsl:when test="ancestor::*[contains(@class, ' task/info ')]">-.25in</xsl:when>
        <!--GEHC.Not sure why, but notes within generic topics do not format correctly unless a special case is explicitly created for <body>-->
        <xsl:when test="ancestor::*[contains(@class,' topic/body ') and not (contains(@class,' concept/conbody ')) 
                                                                and not (contains(@class,' reference/refbody '))
                                                                and not (contains(@class,' task/taskbody '))]">
          <xsl:value-of select="$side-col-width"/>
        </xsl:when>
        <xsl:otherwise>0in</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="p__li__note">
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="p__table"> <!--FM:Body--> <!--GEHC-->
    <xsl:attribute name="text-indent">0em</xsl:attribute>
    <xsl:attribute name="space-before">0em</xsl:attribute>
    <xsl:attribute name="margin-top">0pt</xsl:attribute>
    <xsl:attribute name="margin-bottom">0pt</xsl:attribute>
    <xsl:attribute name="font-size">9pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="lq" use-attribute-sets="base-font">
    <xsl:attribute name="space-before">10pt</xsl:attribute>
    <xsl:attribute name="padding-left">6pt</xsl:attribute>
    <xsl:attribute name="start-indent">92pt</xsl:attribute>
    <xsl:attribute name="end-indent">92pt</xsl:attribute>
    <xsl:attribute name="text-align">start</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="lq_simple" use-attribute-sets="base-font">
    <xsl:attribute name="space-before">10pt</xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="padding-left">6pt</xsl:attribute>
    <xsl:attribute name="start-indent">92pt</xsl:attribute>
    <xsl:attribute name="end-indent">92pt</xsl:attribute>
    <xsl:attribute name="text-align">start</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="lq_link" use-attribute-sets="base-font common.link">
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="end-indent">92pt</xsl:attribute>
    <xsl:attribute name="text-align">end</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="lq_title" use-attribute-sets="base-font">
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="end-indent">92pt</xsl:attribute>
    <xsl:attribute name="text-align">end</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="q">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="figgroup">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note"> <!--FM:Notebody, Notebody Plain, Cautionbody, Cautionbody Plain, Importantbody, Importantbody Plain, Warnbody, Warnbody Plain--> <!--GEHC-->
    <xsl:attribute name="font-size"> <!-- PBG: As of 2017 August 7, we use 10pt for warning and caution note types -->
      <xsl:choose>
        <xsl:when test="@type='caution'">10pt</xsl:when>
        <xsl:when test="@type='warning'">10pt</xsl:when>
        <xsl:when test="@type ='other'">12pt</xsl:when>
        <xsl:otherwise>10pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="space-before">8pt</xsl:attribute> <!--was 3pt-->
    <xsl:attribute name="space-after">8pt</xsl:attribute> <!--was 6pt-->
  </xsl:attribute-set>

  <xsl:attribute-set name="note__table" use-attribute-sets="common.block">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__image__column">
    <xsl:attribute name="column-number">1</xsl:attribute>
    <xsl:attribute name="column-width">32pt</xsl:attribute>
	<xsl:attribute name="margin-left">-3in</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__text__column">
    <xsl:attribute name="column-number">2</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__image__entry">
    <xsl:attribute name="padding-right">5pt</xsl:attribute>
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__text__entry">
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC.This sizes cautions and warnings at 12pt and indents notes 2in into the sidehead area to make room for floating labels-->
  <xsl:attribute-set name="note__label__all">
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    <xsl:attribute name="text-align">right</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">auto</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    <xsl:attribute name="font-weight"> <!-- PBG: As of 2017 August 7, we do not bold warning, caution, danger note types -->
      <xsl:choose>
        <xsl:when test="@type='caution'">normal</xsl:when>
        <xsl:when test="@type='warning'">normal</xsl:when>
        <xsl:when test="@type ='danger'">normal</xsl:when>
        <xsl:otherwise>bold</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="font-size"> <!-- PBG: As of 2017 August 7, we use 10pt for warning and caution note types -->
      <xsl:choose>
        <xsl:when test="@type='caution'">10pt</xsl:when>
        <xsl:when test="@type='warning'">10pt</xsl:when>
        <xsl:when test="@othertype ='warnicon'">48pt</xsl:when>
        <xsl:otherwise>10pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="margin-top">0pt</xsl:attribute>
    <xsl:attribute name="margin-left">-2in</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__note" use-attribute-sets="note__label__all">
    <!--xsl:attribute name="margin-left">-2in</xsl:attribute-->
    <!--GEHC. This adjusts the right margin for the "Note" label-->
  </xsl:attribute-set>

  <!--GEHC. Added; formats caption differently in notes within step>info-->
  <xsl:attribute-set name="block-container.note">
    <xsl:attribute name="width">1.5in</xsl:attribute>
	<xsl:attribute name="margin-left">-1in</xsl:attribute>
    <xsl:attribute name="start-indent">
      <xsl:choose>
        <xsl:when test="ancestor::*[contains(@class, ' task/info ')]">0in</xsl:when> <!--was .25-->
        <xsl:otherwise>0in</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__notice" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__tip" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__fastpath" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__restriction" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__important" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__remember" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__attention" use-attribute-sets="note__label__all">
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__caution" use-attribute-sets="note__label__all"> <!--FM:CautionHead--> <!--GEHC-->
    <xsl:attribute name="font-size">10pt</xsl:attribute> <!-- PBG: As of 2017 August 7, we use 10pt for all note types -->
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__warning" use-attribute-sets="note__label__all"> <!--FM:WarningHead--> <!--GEHC-->
    <xsl:attribute name="font-size">10pt</xsl:attribute> <!-- PBG: As of 2017 August 7, we use 10pt for all note types -->
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__warnicon" use-attribute-sets="note__label__all"> <!--FM:WarningHead--> <!--GEHC-->
    <xsl:attribute name="font-size">10pt</xsl:attribute> <!-- PBG: As of 2017 August 7, we use 10pt for all note types -->
    <xsl:attribute name="margin-left">-2in</xsl:attribute>
    <!--GEHC. This adjusts the right margin for the "Warning" icon-->
  </xsl:attribute-set>

  <xsl:attribute-set name="note__label__danger" use-attribute-sets="note__label__all"> </xsl:attribute-set>

  <xsl:attribute-set name="note__label__other" use-attribute-sets="note__label__all"> </xsl:attribute-set>

  <xsl:attribute-set name="pre" use-attribute-sets="base-font common.block">
    <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
    <xsl:attribute name="font-family">monospace</xsl:attribute>
    <xsl:attribute name="line-height">106%</xsl:attribute>
    <xsl:attribute name="space-before">1.2em</xsl:attribute>
    <xsl:attribute name="space-after">0.8em</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__spectitle">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__border__top">
    <xsl:attribute name="border-top-color">black</xsl:attribute>
    <xsl:attribute name="border-top-width">thin</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__border__bot">
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
    <xsl:attribute name="border-bottom-width">thin</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__border__sides">
    <xsl:attribute name="border-left-color">black</xsl:attribute>
    <xsl:attribute name="border-left-width">thin</xsl:attribute>
    <xsl:attribute name="border-right-color">black</xsl:attribute>
    <xsl:attribute name="border-right-width">thin</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__border__all" use-attribute-sets="common.border"> </xsl:attribute-set>

  <xsl:attribute-set name="lines" use-attribute-sets="base-font">
    <xsl:attribute name="space-before">0.8em</xsl:attribute>
    <xsl:attribute name="space-after">0.8em</xsl:attribute>
    <!-- <xsl:attribute name="white-space-treatment">ignore-if-after-linefeed</xsl:attribute> -->
    <xsl:attribute name="white-space-collapse">true</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="keyword">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="term">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC-->
  <xsl:attribute-set name="ph">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="font-weight">
      <xsl:choose>
        <xsl:when test="@outputclass='trademark'">bold</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="font-style">
      <xsl:choose>
        <xsl:when test="@outputclass='trademark'">italic</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="boolean">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="color">green</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="state">
    <xsl:attribute name="border-left-width">0pt</xsl:attribute>
    <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    <xsl:attribute name="color">red</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="alt">
  </xsl:attribute-set>

  <xsl:attribute-set name="object">
  </xsl:attribute-set>

  <xsl:attribute-set name="param">
  </xsl:attribute-set>

  <xsl:attribute-set name="draft-comment" use-attribute-sets="common.border">
    <xsl:attribute name="background-color">#FF99FF</xsl:attribute>
    <xsl:attribute name="color">#CC3333</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="draft-comment__label">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="required-cleanup">
    <xsl:attribute name="background">yellow</xsl:attribute>
    <xsl:attribute name="color">#CC3333</xsl:attribute>
  </xsl:attribute-set>

  <!--GEHC-->
  <xsl:attribute-set name="required-cleanup-list">
    <xsl:attribute name="background">white</xsl:attribute>
    <xsl:attribute name="color">#000000</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="required-cleanup__label">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="fn">
    <xsl:attribute name="font-size">8pt</xsl:attribute>
    <xsl:attribute name="color">purple</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="fn__id">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="fn__callout">
    <xsl:attribute name="keep-with-previous.within-line">always</xsl:attribute>
    <xsl:attribute name="baseline-shift">super</xsl:attribute>
    <xsl:attribute name="font-size">75%</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="fn__body" use-attribute-sets="base-font">
    <xsl:attribute name="provisional-distance-between-starts">8mm</xsl:attribute>
    <xsl:attribute name="provisional-label-separation">2mm</xsl:attribute>
    <xsl:attribute name="line-height">1.2</xsl:attribute>
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__align__left">
    <xsl:attribute name="text-align">start</xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__align__right">
    <xsl:attribute name="text-align">end</xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__align__center">
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__align__justify">
    <xsl:attribute name="text-align">justify</xsl:attribute>
    <xsl:attribute name="display-align">before</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="indextermref">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="cite">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="concept">
  </xsl:attribute-set>

  <xsl:attribute-set name="conbody">
  </xsl:attribute-set>

  <xsl:attribute-set name="topichead">
  </xsl:attribute-set>

  <xsl:attribute-set name="topicgroup">
  </xsl:attribute-set>

  <xsl:attribute-set name="topicmeta">
  </xsl:attribute-set>

  <xsl:attribute-set name="searchtitle">
  </xsl:attribute-set>

  <xsl:attribute-set name="searchtitle__label">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="publisher">
  </xsl:attribute-set>

  <xsl:attribute-set name="copyright">
  </xsl:attribute-set>

  <xsl:attribute-set name="copyryear">
  </xsl:attribute-set>

  <xsl:attribute-set name="copyrholder">
  </xsl:attribute-set>

  <xsl:attribute-set name="critdates">
  </xsl:attribute-set>

  <xsl:attribute-set name="created">
  </xsl:attribute-set>

  <xsl:attribute-set name="revised">
  </xsl:attribute-set>

  <xsl:attribute-set name="permissions">
  </xsl:attribute-set>

  <xsl:attribute-set name="category">
  </xsl:attribute-set>

  <xsl:attribute-set name="audience">
  </xsl:attribute-set>

  <xsl:attribute-set name="keywords">
  </xsl:attribute-set>

  <xsl:attribute-set name="prodinfo">
  </xsl:attribute-set>

  <xsl:attribute-set name="prodname">
  </xsl:attribute-set>

  <xsl:attribute-set name="vrmlist">
  </xsl:attribute-set>

  <xsl:attribute-set name="vrm">
  </xsl:attribute-set>

  <xsl:attribute-set name="brand">
  </xsl:attribute-set>

  <xsl:attribute-set name="series">
  </xsl:attribute-set>

  <xsl:attribute-set name="platform">
  </xsl:attribute-set>

  <xsl:attribute-set name="prognum">
  </xsl:attribute-set>

  <xsl:attribute-set name="featnum">
  </xsl:attribute-set>

  <xsl:attribute-set name="component">
  </xsl:attribute-set>

  <xsl:attribute-set name="othermeta">
  </xsl:attribute-set>

  <xsl:attribute-set name="resourceid">
  </xsl:attribute-set>

  <xsl:attribute-set name="reference">
  </xsl:attribute-set>

  <xsl:attribute-set name="refbody">
  </xsl:attribute-set>

  <xsl:attribute-set name="refsyn">
  </xsl:attribute-set>

  <xsl:attribute-set name="metadata">
  </xsl:attribute-set>

  <xsl:attribute-set name="image__float">
  </xsl:attribute-set>

  <xsl:attribute-set name="image__block">
  </xsl:attribute-set>

  <xsl:attribute-set name="image__inline">
  </xsl:attribute-set>

  <xsl:attribute-set name="image">
    <!--GEHC. Comment these attributes back in to re-enable dynamic image scaling
		<xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
        <xsl:attribute name="content-height">100%</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="scaling">uniform</xsl:attribute>
		--> </xsl:attribute-set>

  <xsl:attribute-set name="__unresolved__conref">
    <xsl:attribute name="color">#CC3333</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="__fo__root" use-attribute-sets="base-font">
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    <xsl:attribute name="xml:lang" select="translate($locale, '_', '-')"/>
    <xsl:attribute name="writing-mode" select="$writing-mode"/>
  </xsl:attribute-set>

  <xsl:attribute-set name="__force__page__count">
    <xsl:attribute name="force-page-count">
      <xsl:choose>
        <xsl:when test="name(/*) = 'bookmap'">
          <xsl:value-of select="'even'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="'auto'"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>
