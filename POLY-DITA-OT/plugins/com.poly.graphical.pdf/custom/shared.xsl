<?xml version="1.0" encoding="utf-8"?>
<!-- Code shared amongst both the user guide and five/six column guides. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Mappings from two-character languages codes to two-digit product
         number suffixes. -->
    <xsl:variable name="productNumberSuffix">
        <suffix number="01" lang="ar"/>
        <suffix number="02" lang="cs"/>
        <suffix number="03" lang="da"/>
        <suffix number="04" lang="de"/>
        <suffix number="05" lang="el"/>
        <suffix number="06" lang="en"/>
        <suffix number="07" lang="en-gb"/>
        <suffix number="08" lang="es"/>
        <suffix number="09" lang="es-xl"/>
        <suffix number="10" lang="fi"/>
        <suffix number="11" lang="fr"/>
        <suffix number="12" lang="fr-ca"/>
        <suffix number="13" lang="he"/>
        <suffix number="14" lang="hu"/>
        <suffix number="15" lang="in"/>
        <suffix number="16" lang="it"/>
        <suffix number="17" lang="ja"/>
        <suffix number="18" lang="ko"/>
        <suffix number="19" lang="nl"/>
        <suffix number="20" lang="no"/>
        <suffix number="21" lang="pl"/>
        <suffix number="22" lang="pt"/>
        <suffix number="23" lang="pt-br"/>
        <suffix number="24" lang="ro"/>
        <suffix number="25" lang="ru"/>
        <suffix number="26" lang="sv"/>
        <suffix number="27" lang="th"/>
        <suffix number="28" lang="tr"/>
        <suffix number="29" lang="zh-cn"/>
        <suffix number="30" lang="zh-tw"/>



    </xsl:variable>

    <xsl:template match="*[contains(@class, ' topic/ph ') and @outputclass = 'month-year']">
        <xsl:variable name="month-int" select="month-from-date(current-date())"/>
        <xsl:variable name="month-padded" select="concat('0', month-from-date(current-date()))"/>
        <xsl:value-of select="concat(
            substring($month-padded, string-length($month-padded) - 1)
          , '.'
          , substring(year-from-date(current-date()), 3)
          )"/>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/ph ') and @outputclass = 'year']" priority="10">
        <xsl:value-of select="year-from-date(current-date())"/>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/ph ') and @outputclass = 'part-number']" priority="10">
        <xsl:value-of select="//*[contains(@class, ' topic/prognum ')]"/>
        <xsl:text>-</xsl:text>
        <xsl:variable name="lang" select="/*/@xml:lang"/>
        <xsl:value-of select="$productNumberSuffix/suffix[@lang = $lang]/@number"/>
    </xsl:template>
</xsl:stylesheet>
