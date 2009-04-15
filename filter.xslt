<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="schedules">170779635,170877167</xsl:param>  

    <xsl:template match="/program">
	<program>
            <xsl:apply-templates select="den"/>
	</program>
    </xsl:template>

    <xsl:template match="den">
	<den datum="{@datum}" date="{@date}">
    	    <xsl:call-template name="split-tokens">
		<xsl:with-param name="list"><xsl:value-of select="concat($schedules,',')"/></xsl:with-param>
	    </xsl:call-template>
        </den>
    </xsl:template>

    <xsl:template name="split-tokens">
	<xsl:param name="list" />
	<xsl:param name="separator" />
	<xsl:variable name="first" select="substring-before($list, ',')" />
        <xsl:variable name="remaining" select="substring-after($list, ',')" />
	<xsl:call-template name="copy-porad">
	    <xsl:with-param name="id" select="$first" />
	</xsl:call-template>
        <xsl:if test="$remaining">
	    <xsl:call-template name="split-tokens">
		<xsl:with-param name="list" select="$remaining" />
		<xsl:with-param name="separator" select="$separator" />
	    </xsl:call-template>
	</xsl:if>
    </xsl:template>

    <xsl:template name="copy-porad">
	<xsl:param name="id" />
	<xsl:copy-of select="porad[@id=$id]"/>
    </xsl:template>

</xsl:stylesheet>
