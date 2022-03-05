<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:variable name="table-border-width">0.5pt</xsl:variable>
    <!-- 65% black = 0.65 * 256 = 166 = 0xa6 -->
    <xsl:variable name="table-border-color">#666666</xsl:variable>
    <xsl:attribute-set name="__tableframe__top">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-top-color" select="$table-border-color"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-top-color" select="$table-border-color"/>
        <xsl:attribute name="border-bottom-color" select="$table-border-color"/>
        <xsl:attribute name="border-after-width.conditionality">retain</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-bottom-color" select="$table-border-color"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__tableframe__left">
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">0</xsl:attribute>
        <xsl:attribute name="border-left-color" select="$table-border-color"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__tableframe__right">
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">0</xsl:attribute>
        <xsl:attribute name="border-right-color" select="$table-border-color"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="table">
        <!--It is a table container -->
        <xsl:attribute name="font-size">8.5pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0px</xsl:when>
                <xsl:when test="string-length(string(ancestor::*[contains(@class, ' topic/topic ')][1]/child::*[contains(@class, ' topic/title ')][1]/node())) = 0">
                    12pt
                </xsl:when>
                <xsl:when test="not(preceding-sibling::*)">
                    <xsl:text>0pt</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    3pt
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0px</xsl:when>
                <!-- Followed by a table note -->
                <xsl:when test="following-sibling::*/@outputclass = 'tablenote'">
                    0px
                </xsl:when>
                <!-- Title for the table -->
                <xsl:when test="string-length(string(ancestor::*[contains(@class, ' topic/topic ')][1]/child::*[contains(@class, ' topic/title ')][1]/node())) = 0">
                    0pt
                </xsl:when>
                <xsl:otherwise>
                    3pt
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="simpletable">
        <!--It is a table container -->
        <xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">8.5pt</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0px</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0px</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table__tableframe__all">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-top-color" select="$table-border-color"/>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-bottom-color" select="$table-border-color"/>
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">0</xsl:attribute>
        <xsl:attribute name="border-left-color" select="$table-border-color"/>
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">0</xsl:attribute>
        <xsl:attribute name="border-right-color" select="$table-border-color"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="strow.stentry__content">
        <xsl:attribute name="padding">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt 4pt 0pt 0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-size">8.5pt</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
        <xsl:attribute name="color">
            <xsl:choose>
                <!-- First column in tables in troubleshooting are blue. -->
                <xsl:when test="count(ancestor::*[@outputclass = 'troubleshooting']) &gt; 0 and count(ancestor-or-self::*[contains(@class, ' topic/entry ')][1]/preceding-sibling::*[contains(@class, ' topic/entry ')]) = 0">
                    <xsl:value-of select="$color-light-black"/>
                </xsl:when>
                <xsl:otherwise>
                    black
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin">0</xsl:attribute>
        <xsl:attribute name="start-indent">0</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row.entry__content" use-attribute-sets="strow.stentry__content">
        <xsl:attribute name="padding">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>4pt 6pt 1pt 0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sthead.stentry__content">
        <xsl:attribute name="padding">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>6pt 4pt 6pt 0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
	    <xsl:attribute name="background-color">#d3d3d3</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">8.5pt</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="line-height"><xsl:value-of select="$default-line-height"/></xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0pt</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <!--xsl:attribute name="margin">0</xsl:attribute-->
		<xsl:attribute name="margin-top">-1pt</xsl:attribute>
		<xsl:attribute name="margin-bottom">-1pt</xsl:attribute>
        <xsl:attribute name="start-indent">0</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead.row.entry__content">
        <!--body cell contents-->
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>0pt 1pt 0pt 0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row.entry__content">
        <!--body cell contents-->
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt 3pt 3pt 0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead.row.entry__content">
        <xsl:attribute name="padding">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>6pt 6pt 6pt 0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="color">black</xsl:attribute>
        <!--xsl:attribute name="color" select="$color-light-black"/-->
        <xsl:attribute name="line-height"><xsl:value-of select="$default-line-height"/></xsl:attribute>
		<xsl:attribute name="background-color">#d3d3d3</xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0pt</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom' or @outputclass = 'whatsinbox']) &gt; 0">0</xsl:when>
                <xsl:when test="ancestor::*[contains(@class, ' topic/table ')][1][@frame = 'top' or @frame = 'sides' or @frame = 'none']">0</xsl:when>
                <xsl:otherwise><xsl:value-of select="$table-border-width"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="border-bottom-color" select="$table-border-color"/>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead.row.entry">
        <!--head cell-->
        <xsl:attribute name="background-color">#d3d3d3</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="line-height">10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sthead.stentry__keycol-content">
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="strow.stentry__keycol-content">
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="property.entry__keycol-content">
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="prophead.entry__keycol-content">
        <xsl:attribute name="margin">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">0</xsl:when>
                <xsl:otherwise>3pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.tgroup">
        <!--It is a table-->
        <xsl:attribute name="table-layout">fixed</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <!--xsl:attribute name=&quot;inline-progression-dimension&quot;&gt;auto&lt;/xsl:attribute-->
<!--        &lt;xsl:attribute name=&quot;background-color&quot;&gt;white&lt;/xsl:attribute&gt;-->
        <xsl:attribute name="space-before.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">12pt</xsl:when>
                <xsl:when test="not(preceding-sibling::*) and not(parent::*/preceding-sibling::*)">0pt</xsl:when>
                <xsl:otherwise>12pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'backpagebottom']) &gt; 0">24pt</xsl:when>
                <xsl:otherwise>5pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol-with-number" use-attribute-sets="ol">
        <!--xsl:attribute name="border-bottom">
            <xsl:choose>
                <xsl:when test="count(descendant::*[contains(@class, ' topic/dl ')]) &gt; 0">
                    0.5pt solid #666
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute-->
        <!-- Line up with tables. Mantis 3095. - Scratch that, Mantis 3980 -->
        <!--xsl:attribute name="margin-left">0pt</xsl:attribute>
        <xsl:attribute name="provisional-distance-between-starts">0pt</xsl:attribute-->
    </xsl:attribute-set>

    <xsl:attribute-set name="ol-with-number.li">
        <!--xsl:attribute name="padding">5pt 0</xsl:attribute-->
        <!--xsl:attribute name="border-top">
            <xsl:choose>
                <xsl:when test="count(*[contains(@class, ' topic/dd ')]/child::*[contains(@class, ' topic/dl ')]) &gt; 0">
                    0.5pt solid #666
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">6pt</xsl:attribute>
		<xsl:attribute name="margin-left">0pt</xsl:attribute-->
    </xsl:attribute-set>

    <xsl:attribute-set name="table">
        <xsl:attribute name="keep-together">
            <xsl:choose>
                <xsl:when test="count(ancestor::*[@outputclass = 'troubleshooting']) &gt; 0">
                    <xsl:text>auto</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>5</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row.entry">
        <xsl:attribute name="display-align">
            <xsl:if test="ancestor::*[@outputclass = 'whatsinbox']">
                <xsl:text>after</xsl:text>
            </xsl:if>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Suite Mar-2014: change TABLE TITLE color to the grey used in the PDF: Pantone Cool Grey 8C #10667 - mk -->
    <xsl:attribute-set name="table.title">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <!--xsl:attribute name="color"><xsl:value-of select="$color-light-black"/></xsl:attribute-->
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="margin-top">6pt</xsl:attribute>
		<xsl:attribute name="padding-bottom">0pt</xsl:attribute>		
        <!--xsl:attribute name="space-before.optimum">10pt</xsl:attribute-->
        <!--xsl:attribute name="space-after.optimum">10pt</xsl:attribute-->
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
