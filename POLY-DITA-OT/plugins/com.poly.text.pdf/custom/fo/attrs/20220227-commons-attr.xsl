<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="1.0">

    <xsl:variable name="color-light-black">rgb(89, 89, 89)</xsl:variable>
    <xsl:variable name="color-red">cmyk(0, 87, 99, 0)</xsl:variable>
	<!-- ContentRules March 2021: color red to color darker red: PLT PDF - dhb -->	
    <xsl:variable name="color-darkred">#cc0000</xsl:variable>
    <xsl:variable name="bodyLeftMargin">100pt</xsl:variable>
	
    
    <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body">
        <xsl:attribute name="space-after">6pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="p">
        <xsl:attribute name="text-indent">0em</xsl:attribute>
        <xsl:attribute name="margin-left">0</xsl:attribute>
        <xsl:attribute name="margin-right">0</xsl:attribute>
        <xsl:attribute name="orphans">2</xsl:attribute>
        <xsl:attribute name="widows">2</xsl:attribute>
        <xsl:attribute name="font-family">            <xsl:choose>
                <xsl:when test="ancestor::*[contains(@class, ' task/stepsection ')]">Sans</xsl:when>
                <xsl:otherwise>Sans</xsl:otherwise>
            </xsl:choose></xsl:attribute>
        <xsl:attribute name="padding-bottom">
            <xsl:choose>
                <xsl:when test="@outputclass = 'contactname'">2pt</xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">
            <xsl:choose>
                <xsl:when test="@outputclass = 'contact' or @outputclass = 'contactname'">bold</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="
                    @outputclass = 'contact' or
                    @outputclass = 'contactname' or
                    (count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 1) or
                    (count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0 and count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0)">
                    <xsl:text>9pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[@outputclass = 'compliance']) &gt; 0">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/simpletable ') or contains(@class, ' topic/table ') or @outputclass='with-number']) &gt; 0">
                    <xsl:text>8.5pt</xsl:text>
                </xsl:when>
                <xsl:when test="@outputclass = 'tablenote'">
                    <xsl:text>8.5pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:choose>
                <xsl:when test="
                    @outputclass = 'contact' or
                    @outputclass = 'contactname' or
                    (count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 1) or
                    (count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0 and count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0)">
                    <xsl:text>12pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage']) &gt; 0">
                    <xsl:text>7pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/simpletable ') or contains(@class, ' topic/table ') or @outputclass='with-number']) &gt; 0">
                    <xsl:text>10pt</xsl:text>
                </xsl:when>
                <xsl:when test="@outputclass = 'tablenote'">
                    <xsl:text>10pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/simpletable ') or contains(@class, ' topic/table ') or @outputclass='with-number']) &gt; 0">
                    <xsl:text>2pt</xsl:text>
                </xsl:when>
                <xsl:when test="@outputclass = 'tablenote' or @outputclass = 'contact' or @outputclass = 'contactname'">
                    <xsl:text>0</xsl:text>
                </xsl:when>
                <!-- When a paragraph has no preceding siblings, we do not want
                     to have any space before it. This allows for zero space
                     between a B head and content. Mantis 2966. Michael
                     Snoyman, Jan 25 2011 -->
                <xsl:when test="count(preceding-sibling::*[not(contains(@class, ' topic/title '))]) = 0">
                    <xsl:text>0</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>0.6em</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="@outputclass = 'info'">
                    4.74pt
                </xsl:when>
                <xsl:when test="@outputclass = 'legal'">
                    8pt
                </xsl:when>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/simpletable ') or contains(@class, ' topic/table ') or @outputclass='with-number']) &gt; 0">
                    2pt
                </xsl:when>
                <xsl:when test="@outputclass = 'contact' or @outputclass = 'contactname'">
                    <xsl:text>0px</xsl:text>
                </xsl:when>
                <xsl:when test="@outputclass = 'tablenote'">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    0.6em
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="keep-together">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/ul ') or contains(@class, ' topic/ol ')]) &gt; 0">
                    <xsl:text>5</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>auto</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic__abstract">
        <xsl:attribute name="color">black</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="line-height">16pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after">12pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- aka Page Title -->
    <xsl:attribute-set name="topic.title">
       <xsl:attribute name="page-break-before">avoid</xsl:attribute>
        <xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="margin-top">10pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">20pt</xsl:attribute>
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="line-height">28pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="padding-top">-96pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<!-- ContentRules March 2021: color red to color blue: PLT PDF - dhb -->	
		<!-- ContentRules May 2021: color blue to color blace: PLT PDF - dhb -->	
        <!--xsl:attribute name="color" select="$color-blue"/-->
       <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
    </xsl:attribute-set>

    <!-- A Head -->
    <xsl:attribute-set name="topic.topic.title">
        <xsl:attribute name="margin-top">10pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="text-indent">0</xsl:attribute>
		<xsl:attribute name="border-after-width">0pt</xsl:attribute>
        <xsl:attribute name="margin-left"><xsl:value-of select="$bodyLeftMargin"/></xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="/*[@xml:lang = 'th']">11pt</xsl:when>
                <xsl:otherwise>12pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="padding-top">0</xsl:attribute>
		<!-- ContentRules March 2021: color red to color blue: PLT PDF - dhb -->	
        <!--xsl:attribute name="color" select="$color-blue"/-->
       <!--xsl:attribute name="color">black</xsl:attribute-->
        <xsl:attribute name="color"><xsl:value-of select="$color-darkred"/></xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
        <xsl:attribute name="letter-spacing">
            <xsl:choose>
                <!-- Checks if the body of this topic is empty, in which case we have an "A Head with B Head" -->
                <xsl:when test="count(following-sibling::*[contains(@class, ' topic/body ')][1]/child::*) = 0 and count(following-sibling::*[contains(@class, ' topic/topic ')]) &gt; 0">
                    <xsl:text>-0.005em</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>-0.010em</xsl:text>00
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- B Head -->
    <xsl:attribute-set name="topic.topic.topic.title">
        <xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="border-bottom">0</xsl:attribute>
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <!-- Determine if this is a B-head following an A-head -->
                <xsl:when test="not(parent::*/preceding-sibling::*[contains(@class, ' topic/topic ')]) and count(parent::*/preceding-sibling::*[contains(@class, ' topic/body ')]/node()) = 0">
                    <xsl:text>0pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>12pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-top">10pt</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub)">
                    <xsl:value-of select="$bodyLeftMargin"/>
                </xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">
                    <xsl:value-of select="$bodyLeftMargin"/>
                </xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-size">10.5pt</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="padding-top">0</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<!-- ContentRules March 2021: color red to color blue: PLT PDF - dhb -->	
        <xsl:attribute name="color">black<!--xsl:value-of select="$color-darkred"/--></xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
        <xsl:attribute name="letter-spacing">-0.005em</xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:choose>
                <xsl:when test="count(following::*[1]/child::*[contains(@class, ' topic/simpletable ') or contains(@class, ' topic/table ')]) = 1">3pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- C Head -->
    <xsl:attribute-set name="topic.topic.topic.topic.title">
        <xsl:attribute name="text-indent">0</xsl:attribute>
        <!-- The first head should not have any top margin -->
        <xsl:attribute name="margin-top">6pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">auto</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="font-family">Sans-Title</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
		<!-- ContentRules March 2021: color red to color blue: PLT PDF - dhb -->	
        <xsl:attribute name="color"><xsl:value-of select="$color-darkred"/></xsl:attribute>
     </xsl:attribute-set>
    
    <!-- Suite 24Nov2015 0013342: Plantronics PDF: child headings -->
    <xsl:attribute-set name="topic.topic.topic.topic.topic.title" use-attribute-sets="topic.topic.topic.topic.title">
      <!--  <xsl:attribute name="text-indent">0</xsl:attribute>
       <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>-->
    </xsl:attribute-set>    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title" use-attribute-sets="topic.topic.topic.topic.title">
        <!--<xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>-->
    </xsl:attribute-set>    
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.topic.title" use-attribute-sets="topic.topic.topic.topic.title">
        <!--<xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>-->
    </xsl:attribute-set>
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.topic.topic.title" use-attribute-sets="topic.topic.topic.topic.title">
      <!-- <xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>-->
    </xsl:attribute-set>
    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.topic.topic.topic.title" use-attribute-sets="topic.topic.topic.topic.title">
      <!-- <xsl:attribute name="text-indent">0</xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>-->
    </xsl:attribute-set>
    
    <xsl:attribute-set name="image">
        <xsl:attribute name="space-before">6pt</xsl:attribute>
        <xsl:attribute name="space-after">6pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="image__block">
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage'])">
                    <xsl:text>2pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>15pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">5</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">
                    <xsl:text>12pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage']) &gt; 0">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$default-font-size"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-family">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">
                    <xsl:text>Sans</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">
                    <xsl:text>18pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage']) &gt; 0">
                    <xsl:text>8pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$default-line-height"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="color">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">
                   black <!--<xsl:value-of select="$color-light-black"/>-->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>black</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body__toplevel">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body__secondLevel">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise><xsl:value-of select="$bodyLeftMargin"/></xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub"><xsl:value-of select="$bodyLeftMargin"/></xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="letter-spacing">-0.005em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__cell">
        <xsl:attribute name="border-right">1px solid #666</xsl:attribute>
        <xsl:attribute name="padding-right">3pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__contents__cell">
        <xsl:attribute name="padding-left">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">0pt</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
        <xsl:attribute name="padding-right">
            <xsl:choose>
                <xsl:when test="not($rtl-pub='') and $rtl-pub">3pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>            
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <!-- Style NOTE labels in tables and embedded def lists
                     differently. -->
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0">
                    <xsl:text>8.5pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/dl ')]/ancestor::*[contains(@class, ' topic/dl ')]) &gt; 0">
                    <xsl:text>8.5pt</xsl:text>
                </xsl:when>
                <xsl:when test="/*[@xml:lang = 'th']">
                    <xsl:text>11.5pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>10pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0">
                    <xsl:text>10pt</xsl:text>
                </xsl:when>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/dl ')]/ancestor::*[contains(@class, ' topic/dl ')]) &gt; 0">
                    <xsl:text>10pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <!--xsl:attribute name="color" select="$color-light-black"/-->
		 <xsl:attribute name="color"><xsl:value-of select="$color-darkred"/></xsl:attribute>
		<!--xsl:attribute name="color">black</xsl:attribute-->
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="padding-right">3pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note">
        <xsl:attribute name="space-before">0px</xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[contains(@class, ' topic/table ')]) &gt; 0">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>9pt</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <!-- Suite Jan-2015: 12399: turn off the italics in the NOTE text for KO and ZH-CN - mk -->
        <xsl:attribute name="font-style">
            <xsl:choose>
                <xsl:when test="//*[contains(@class, ' map/map ')]/@xml:lang = 'zh-cn' or //*[contains(@class, ' map/map ')]/@xml:lang = 'ko'">normal</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>

    <!-- Refered to in specs as "C running head" -->
    <!-- Suite Mar-2014: 0010668: PLT PDF: change formatting of <term> - mk -->
    <xsl:attribute-set name="term">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="font-style">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$color-light-black"/></xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="keyword">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage']) &gt; 0">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section">
	    <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="space-before">
            <!-- 29 jun 2016 0014638: B head and text not aligning: plantronics PDF am -->
            <xsl:choose>
                <xsl:when test="preceding-sibling::*[contains(@class, ' topic/section ')]">0.6em</xsl:when>
                <xsl:otherwise>0em</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpage']) &gt; 0">
                    <xsl:text>6pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$default-font-size"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example">
        <xsl:attribute name="border">0</xsl:attribute>
        <xsl:attribute name="margin-left">0</xsl:attribute>
        <xsl:attribute name="margin-right">0</xsl:attribute>
    </xsl:attribute-set>

    <!-- Implement pagebreak outputclass -->
    <xsl:attribute-set name="topic">
        <xsl:attribute name="break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'pagebreak'">
                    <xsl:text>page</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>auto</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="reference">
        <xsl:attribute name="break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'pagebreak'">
                    <xsl:text>page</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>auto</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="concept">
        <xsl:attribute name="break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'pagebreak'">
                    <xsl:text>page</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>auto</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="task">
        <xsl:attribute name="break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'pagebreak'">
                    <xsl:text>page</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>auto</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fig.title__whatsinbox">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$color-light-black"/></xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fig">
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="ancestor::*[@outputclass = 'whatsinbox']">
                    <xsl:text>center</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Sans</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
