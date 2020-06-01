<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
  <html>
   <link rel="stylesheet" href="css/xsltdb.css"/>
  <body>
    <div class="title">Biblioteka</div>
    <xsl:apply-templates/>  
  </body>
  </html>
</xsl:template>


<xsl:template match="katalog">
	<xsl:for-each select="ksiazka">
		<xsl:sort select="dostepnosc" order="ascending"/>
		<xsl:choose>
			<xsl:when test="dostepnosc='niedostepne'"> 
				<div class="ksiazka ksiazkaNiedostepna">
					<div class="id"><xsl:value-of select="@id"/></div>
					<div class="gatunek"><xsl:value-of select="@gatunek"/></div>
					<xsl:choose>
						<xsl:when test="@czyEdukacyjna='tak'">
							<div class="tytul tytulEdukacyjny"><xsl:value-of select="tytul"/></div>
						</xsl:when>
						<xsl:otherwise>
							<div class="tytul"><xsl:value-of select="tytul"/></div>
						</xsl:otherwise>
					</xsl:choose> 
					<div class="dostepnosc-kontener">
						<div class="dostepnosc niedostepnosc"><xsl:value-of select="dostepnosc"/></div>
						<div class="cena"><xsl:value-of select="cena"/><xsl:value-of select="cena/@waluta"/></div>
					</div>
					<xsl:if test="opis">
						<div class="opis">
							<xsl:value-of select="opis"/>
						</div>
					</xsl:if>
					<xsl:if test="wypozyczenia/wypozyczenie">
						<div class="wypozyczenia">
							<xsl:apply-templates select="wypozyczenia"/> 
						</div>
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="ksiazka">
					<div class="id"><xsl:value-of select="@id"/></div>
					<div class="gatunek"><xsl:value-of select="@gatunek"/></div>
					<xsl:choose>
						<xsl:when test="@czyEdukacyjna='tak'">
							<div class="tytul tytulEdukacyjny"><xsl:value-of select="tytul"/></div>
						</xsl:when>
						<xsl:otherwise>
							<div class="tytul"><xsl:value-of select="tytul"/></div>
						</xsl:otherwise>
					</xsl:choose> 
					<div class="dostepnosc-kontener">
						<div class="dostepnosc"><xsl:value-of select="dostepnosc"/></div>
						<div class="cena"><xsl:value-of select="cena"/><xsl:value-of select="cena/@waluta"/></div>
					</div>
					<xsl:if test="opis">
						<div class="opis">
							<xsl:value-of select="opis"/>
						</div>
					</xsl:if>
					<xsl:if test="wypozyczenia/wypozyczenie">
						<div class="wypozyczenia">
							<xsl:apply-templates select="wypozyczenia"/> 
						</div>
					</xsl:if>
				</div>
			</xsl:otherwise>
		</xsl:choose> 
	</xsl:for-each>
</xsl:template>

<xsl:template match="wypozyczenia">
	<xsl:for-each select="wypozyczenie">
		<div class="wypozyczenie">
			<div class="klient"><xsl:value-of select="klient"/></div>
			<div class="data_wypozyczenia"><xsl:value-of select="data_wypozyczenia"/></div>
			<div class="termin"><xsl:value-of select="termin"/></div>
		</div>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gatunki">
 <xsl:for-each select="gatunek">
    <div class="gatunekt">
    <div class="gatunek_nazwa"><xsl:value-of select="nazwaGatunku"/></div>
    </div>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet> 