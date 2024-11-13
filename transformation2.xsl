<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="UTF-8" indent="no"/>
<!--  <xsl:output method="xml" omit-xml-declaration="yes"/>-->


    <xsl:template match="/">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        </head>
        <body>
          <xsl:apply-templates />
        </body>
      </html>
    </xsl:template>


<!--  add our own prefix to class-->
<!--  <xsl:template match="node()/@class">-->
<!--    <xsl:attribute name="class">myClassPrefix_<xsl:value-of select="."/></xsl:attribute>-->
<!--  </xsl:template>-->



<!--  add our own class value-->
  <xsl:template match="node()/@class">
    <xsl:attribute name="class">
    <xsl:choose>
      <xsl:when test="parent::li">MyLi</xsl:when>
      <xsl:otherwise>MyOther</xsl:otherwise>
    </xsl:choose>
    </xsl:attribute>
  </xsl:template>

<!--transform b to strong-->
  <xsl:template match="b">
    <xsl:element name="strong"><xsl:value-of select=".//text()"/></xsl:element>
  </xsl:template>

<!--  transform div to p-->
  <xsl:template match="div">
    <xsl:choose>
      <xsl:when test=".//text()"><xsl:apply-templates/></xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!--  <xsl:template match="node()/@class"/>-->
  <xsl:template match="node()/@id"/>
  <xsl:template match="node()/@style"/>

  <!-- Copy all nodes and attributes unless another rule indicates otherwise. -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>