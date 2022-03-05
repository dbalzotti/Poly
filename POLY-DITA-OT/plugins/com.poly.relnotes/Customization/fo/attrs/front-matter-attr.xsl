<?xml version='1.0'?>
<!-- 
    Polycom Cover attributes
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0"
                xmlns:opentopic="http://www.idiominc.com/opentopic">
    
    <xsl:variable name="map" select="//opentopic:map"/>
    <xsl:variable name="lang_dir" select="/*[contains(@class,' bookmap/bookmap ')]/@dir"/>
    <xsl:variable name="cat_length" select="string-length($map/*[contains(@class,' bookmap/bookmeta ')]/*[contains(@class,' topic/category ')])"/>
    <xsl:variable name="sep" select="' | '"/>
    <xsl:variable name="detail">
        <xsl:value-of select="$map//*[contains(@class,' bookmap/bookmeta ')]
                                    /*[contains(@class,' topic/prodinfo ')]
                                    /*[contains(@class,' topic/vrmlist ')]
                                    /*[contains(@class,' topic/vrm ')]/@version"/>
        <xsl:value-of select="$sep"/>
        <xsl:value-of select="($map//*[contains(@class,' bookmap/publisherinformation ')]
                                    /*[contains(@class,' bookmap/published ')]
                                    /*[contains(@class,' bookmap/completed ')]
                                    /*[contains(@class,' bookmap/month ')])[1]"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="($map//*[contains(@class,' bookmap/publisherinformation ')]
                                    /*[contains(@class,' bookmap/published ')]
                                    /*[contains(@class,' bookmap/completed ')]
                                    /*[contains(@class,' bookmap/year ')])[1]"/>
        <xsl:value-of select="$sep"/>
        <xsl:value-of select="$map//*[contains(@class,' bookmap/bookid ')]
                                    /*[contains(@class,' bookmap/bookpartno ')]"/>
    </xsl:variable>
    <xsl:variable name="mon_length" select="string-length(($map//*[contains(@class,' bookmap/publisherinformation ')]
                                    /*[contains(@class,' bookmap/published ')]
                                    /*[contains(@class,' bookmap/completed ')]
                                    /*[contains(@class,' bookmap/month ')])[1])"/>
    <xsl:variable name="total_length">
        <xsl:choose>
         <xsl:when test="($cat_length &lt; 15) and ($mon_length &gt; 3)">65</xsl:when>
         <xsl:when test="($cat_length &lt; 15) and ($mon_length &lt; 5)">58</xsl:when>
         <xsl:when test="$cat_length &gt; 15">60</xsl:when>
         <xsl:otherwise>56</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="det_length" select="string-length($detail)"/>
    <xsl:variable name="pad_length" select="$total_length - $det_length"/>
    
    <xsl:attribute-set name="__frontmatter">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="start-indent">15pt</xsl:attribute>
        <xsl:attribute name="padding-top">5mm</xsl:attribute>
        <xsl:attribute name="end-indent">5mm</xsl:attribute>
        <xsl:attribute name="margin-left">10mm</xsl:attribute>
        <xsl:attribute name="margin-right">10mm</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__notices">
        <xsl:attribute name="margin-top">-0.5in</xsl:attribute>
        <xsl:attribute name="margin-bottom">-0.5in</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__frontmatter__doctype" use-attribute-sets="common.title">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-indent">0.0in</xsl:attribute>
		<!-- LAL - This was .9in which left a space in the border below so changed to 0.0in -->
        <xsl:attribute name="start-indent">0.0in</xsl:attribute>
        <xsl:attribute name="space-before">6.0pt</xsl:attribute>
        <xsl:attribute name="space-after">3.0pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="border-bottom">#A8A8A8 solid 2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__cover__details">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
    </xsl:attribute-set> 

    <xsl:attribute-set name="__frontmatter__title" use-attribute-sets="common.title">
        <xsl:attribute name="margin-left">0in</xsl:attribute>
        <xsl:attribute name="margin-right">0in</xsl:attribute>
        <xsl:attribute name="margin-top">
            <xsl:choose>
                <xsl:when test="$DRAFT = 'yes'">2pc</xsl:when>
                <xsl:otherwise>2pc + 9.5pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
		<xsl:attribute name="margin-bottom">4pc</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">Arial</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="margin-left">1in</xsl:attribute>
        <xsl:attribute name="margin-right">1in</xsl:attribute>
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">36pt</xsl:attribute>
        <xsl:attribute name="font-size">11pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container">
        <xsl:attribute name="position">absolute</xsl:attribute>
        <xsl:attribute name="top">210mm</xsl:attribute>
        <xsl:attribute name="bottom">20mm</xsl:attribute>
        <xsl:attribute name="right">20mm</xsl:attribute>
        <xsl:attribute name="left">20mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__owner__container_content">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__mainbooktitle">
        <!--<xsl:attribute name=""></xsl:attribute>-->
		<xsl:attribute name="margin-top">1pc </xsl:attribute>
		<!-- LAL - This aligned the booktitle up with the bookmeta - not sure why -->
		<xsl:attribute name="margin-left">-6pc </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__booklibrary">
        <!--<xsl:attribute name=""></xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="bookmap.summary">
        <xsl:attribute name="font-size">9pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
