<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/program/den">
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
		<link rel="stylesheet" href="/templates/local.css" type="text/css" media="all" />
	</head>
	<body>
		<h1><xsl:value-of select="@date"/></h1>
		<h3>Filter podle typu</h3>
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
			        <xsl:for-each-group select="porad/typporadu_nazev" group-by="@id">
  				  <tr name="filter">
				    <td node="con:box" class="filter_box">
				      <input type="checkbox" checked="true" value="normal" onclick="hide_show( '0' , this.checked )" />
				    </td>
				    <td class="filter_name"><xsl:value-of select="text()"/></td>
				  </tr>
				</xsl:for-each-group>
			</tbody>
		</table>
	</body>
     </html>
</xsl:template>

</xsl:stylesheet>
