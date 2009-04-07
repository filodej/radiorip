<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
<xsl:key name="group" match="*[local-name()='typporadu_nazev']" use="@id"/>

<xsl:template match="/program">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    	<head>
		<title><xsl:value-of select="@date"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2" />
		<script language="JavaScript" type="text/javascript">
            	function hide_show( id, show ) 
		{
                	 var text =  ( show == true  ) ? '' : 'none'
                	 var elements = document.getElementsByName( id );
                	 for ( var i=0; i &lt; elements.length; ++i  ) { elements[i].style.display = text }
            	}
		</script>
		<link rel="stylesheet" href="local.css" type="text/css" media="all" />
	</head>
	<body>
		<script language="JavaScript" type="text/javascript" src="wz_tooltip.js"></script>
		<!--<h3 onmouseover="TagToTip('filters', STICKY, true, HEIGHT, 400, CLOSEBTN, true )" onmouseout="UnTip()">Filter podle typu</h3>-->
		<span id="filters">
		<table class="filters_table">
		       <thead>
				<tr>
					<th class="filter_box">
					    <input type="checkbox" checked="true" value="normal" onclick="hide_show( 'filter' , this.checked )" />
					</th>
					<th>Typ poradu</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="den/porad/typporadu_nazev[count(.|key('group', @id)[1])=1]">
 				    <xsl:sort select="@id" />
				</xsl:apply-templates>
			</tbody>
		</table>
		</span>
		<form action="schedule.py">
			<xsl:apply-templates select="den"/>
			<div width="90%" align="center"><input type="submit" value="Zaradit do fronty"/></div>
		</form>
	  </body>
    </html>
</xsl:template>

<xsl:template match="typporadu_nazev">
  	<tr name="filter">
	    <td class="filter_box">
		<input type="checkbox" checked="true" value="normal" onclick="hide_show( '{@id}' , this.checked )" />
	    </td>
	    <td class="filter_name"><xsl:value-of select="text()"/></td>
	</tr>
</xsl:template>

<xsl:template match="den">
	<div>
		<h3><xsl:value-of select="@datum"/></h3>
		<table class="days_table">
			<xsl:apply-templates select="porad"/>
		</table>
	</div>
</xsl:template>

<xsl:template match="porad">
	<tr name="{typporadu_nazev/@id}">
		<td class="program_box"><input type="checkbox" value="normal" /></td>
		<td class="program_hour"><b><xsl:value-of select="substring(substring-after(casvysilani/text(),' '),1,5)"/></b> (<xsl:value-of select="minutaz/text()"/> min.)</td>
		<td class="station"><img src="img/{@stanice}.gif" alt="{@stanice}"/></td>
		<td class="program_name">
			<xsl:choose>
				<xsl:when test="url">
					<a href="http://www.rozhlas.cz/{url/text()}">
						<xsl:if test="popis/text()">
							<xsl:attribute name="onmouseover">Tip('<xsl:value-of select="popis/text()"/>')</xsl:attribute>
							<xsl:attribute name="onmouseout">UnTip()</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="nazev/text()"/>
					</a>
				</xsl:when>
				<xsl:when test="popis/text()">
					<span onmouseover="Tip('{popis/text()}')" onmouseout="UnTip()">
						<xsl:value-of select="nazev/text()"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="nazev/text()"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>
</xsl:template>

</xsl:stylesheet>
