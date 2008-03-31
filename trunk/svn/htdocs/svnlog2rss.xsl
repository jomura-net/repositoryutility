<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output encoding="UTF-8" />

<xsl:template match="/log">
  <rss version="2.0" xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <channel>
      <title>Subversion log</title>
      <link>http://jomora.net/svnlog/feed.php</link>
      <description>RSS feed of Subversion log</description>
      <xsl:for-each select="logentry">
        <xsl:sort select="@revision" order="descending" data-type="number" />
        <xsl:apply-templates select="." />
      </xsl:for-each>
    </channel>
  </rss>
</xsl:template>

<xsl:template match="logentry">
  <item>
    <title>r<xsl:value-of select="@revision" />: 
      <xsl:call-template name="GetFirstRow">
        <xsl:with-param name="value"><xsl:value-of select="msg" /></xsl:with-param>
      </xsl:call-template>
    </title>
    <link></link>
    <description><xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
      <xsl:call-template name="ReplaceLineSeparator">
        <xsl:with-param name="value"><xsl:value-of select="msg" /></xsl:with-param>
      </xsl:call-template><br />
      <xsl:for-each select="paths/path">
        [<xsl:value-of select="@action"/>]<xsl:text> </xsl:text>
        <xsl:value-of select="."/><xsl:text disable-output-escaping="yes">&lt;br /&gt;
</xsl:text>
      </xsl:for-each>
<xsl:text disable-output-escaping="yes">]]&gt;</xsl:text></description>
    <pubDate>
      <xsl:value-of select="date"/>
    </pubDate>
    <author>
      <xsl:value-of select="author"/>
    </author>
  </item>
</xsl:template>

<xsl:template name="GetFirstRow">
    <xsl:param name="value"/>
    <xsl:choose>
        <xsl:when test="contains($value, '&#xA;')">
            <xsl:value-of select="substring-before($value, '&#xA;')"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$value"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="ReplaceLineSeparator">
    <xsl:param name="value"/>
    <xsl:choose>
        <xsl:when test="contains($value, '&#xA;')">
            <xsl:value-of select="substring-before($value, '&#xA;')"/>
            <br/>
            <xsl:call-template name="ReplaceLineSeparator">
                <xsl:with-param name="value" select="substring-after($value, '&#xA;')"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$value"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
