<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
<xsl:key name="group" match="*[local-name()='typporadu_nazev']" use="@id"/>

<xsl:param name="filters">,1,2,7,10,11,13,14,15,17,19,20,21,22,24,34,35,41,45,47,</xsl:param>  
<xsl:param name="uri-prefix">/radiorip/</xsl:param>  

<xsl:template match="/program">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    	<head>
		<title><xsl:value-of select="@date"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2" />
		<script language="JavaScript" type="text/javascript">
                
            	function toggle_display( id, show ) 
		{
                	 var text =  ( show == true  ) ? '' : 'none'
                	 var elements = document.getElementsByName( id );
                	 for ( var i=0; i &lt; elements.length; ++i ) 
			   elements[i].style.display = text
            	}

            	function toggle_filter( id, check ) 
		{
                	 var elements = document.getElementsByName( 'f' + id );
                	 for ( var i=0; i &lt; elements.length; ++i ) 
			   elements[i].checked = check
            	}

            	function toggle_schedule( id, check ) 
		{
		         alert( id );
                	 var element = document.getElementById( id );
			 element.checked = check;
            	}

		function setup_filters()
		{
		  var location = window.location.href + "&amp;";
                  var qi = location.indexOf("filters=");
                  if ( qi != -1 )
                  {
                     var filter_ids = location.substring(qi+8).split("&amp;")[0].split(",");
                     for ( var i=0; i &lt; filter_ids.length; ++i )
                     {
                       toggle_display( filter_ids[i], true );
                       toggle_filter( filter_ids[i], true );
                     }
                  }
		}

		function setup_schedule()
		{
		  var location = window.location.href + "&amp;";
                  var qi = location.indexOf("schedule=");
                  if ( qi != -1 )
                  {
                     var schedule_ids = location.substring(qi+9).split("&amp;")[0].split(",");
                     for ( var i=0; i &lt; schedule_ids.length; ++i )
                     {
                       toggle_schedule( schedule_ids[i], true );
                     }
                  }
		}
		
		function init()
		{
		    setup_filters();
		    setup_schedule();
		}
		</script>
		<link rel="stylesheet" href="{$uri-prefix}stylesheets/local.css" type="text/css" media="all" />
	</head>
	<body onLoad="init()">
		<script language="JavaScript" type="text/javascript" src="{$uri-prefix}scripts/wz_tooltip.js"></script>
		<!--<h3 onmouseover="TagToTip('filters', STICKY, true, HEIGHT, 400, CLOSEBTN, true )" onmouseout="UnTip()">Filter podle typu</h3>-->
		<span id="filters">
			<b>Filtr podle typu poradu:</b>
			<xsl:apply-templates select="den/porad/typporadu_nazev[count(.|key('group', @id)[1])=1]">
 				<xsl:sort select="@id" />
			</xsl:apply-templates>
		</span>
		<form action="schedule.py">
			<xsl:apply-templates select="den"/>
			<div width="90%" align="center"><input type="submit" value="Zaradit do fronty"/></div>
		</form>
	  </body>
    </html>
</xsl:template>

<xsl:template match="typporadu_nazev">
    <xsl:if test="not(contains($filters,concat(',',@id,',')))">
	<xsl:value-of select="@id"/>:
	<input name="f{@id}" type="checkbox" value="normal" onclick="toggle_display('{@id}',this.checked)" onmouseover="Tip('{text()}')" onmouseout="UnTip()"/>
    </xsl:if>
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
    <xsl:variable name="id" select="typporadu_nazev/@id"/>
    <xsl:if test="not(contains($filters,concat(',',$id,',')))">
	<tr name="{$id}" style="display:none">
		<td class="program_box"><input type="checkbox" id="{@id}" name="id" value="{@id}"/></td>
		<td class="program_hour"><b><xsl:value-of select="substring(substring-after(casvysilani/text(),' '),1,5)"/></b> (<xsl:value-of select="minutaz/text()"/> min.)</td>
		<td class="station"><img src="{$uri-prefix}images/{@stanice}.gif" alt="{@stanice}"/></td>
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
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
