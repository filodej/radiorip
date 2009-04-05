<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <program>
  <xsl:for-each select="/files/file">
      <xsl:copy-of select="document(text())/program/den"/>
  </xsl:for-each>
  </program>
</xsl:template>

</xsl:stylesheet>
