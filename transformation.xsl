<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    version="2.0"
    exclude-result-prefixes="xhtml">


<xsl:output method="html" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>
<!--  <xsl:output method="xml" omit-xml-declaration="yes"/>-->

  <!-- Remove the html parent element -->
  <xsl:template match="xhtml:html">
      <xsl:apply-templates/>
  </xsl:template>

  <!-- Remove the body parent element -->
  <xsl:template match="xhtml:body">
    <xsl:apply-templates/>
  </xsl:template>

<!--transform b to strong-->
  <xsl:template match="b">
    <xsl:element name="strong"><xsl:value-of select=".//text()"/></xsl:element>
  </xsl:template>

<!--  transform div to p-->
  <xsl:template match="div">
    <xsl:choose>
      <xsl:when test="./text()"><xsl:apply-templates/></xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="node()/@xmlns"/>

  <!--  add our own class value-->
<!--  for this to work add EXCLUTION for class attribute in EXCLUTION SECTION-->
<!--  <xsl:template match="node()/@class">-->
<!--    <xsl:attribute name="class">-->
<!--      <xsl:choose>-->
<!--        <xsl:when test="parent::li">MyLi</xsl:when>-->
<!--        <xsl:otherwise>MyOther</xsl:otherwise>-->
<!--      </xsl:choose>-->
<!--    </xsl:attribute>-->
<!--  </xsl:template>-->


  <!--  add our own prefix to class-->
  <!--  for this to work add EXCLUTION for class attribute in EXCLUTION SECTION-->
  <!--  <xsl:template match="node()/@class">-->
  <!--    <xsl:attribute name="class">myClassPrefix_<xsl:value-of select="."/></xsl:attribute>-->
  <!--  </xsl:template>-->



  <!--  EXCLUTION SECTION -->
  <!-- Remove all attributes that are not needed. 'href' or 'src' stay in any circumstance. -->
  <!--  just duplicate line with src-->
  <xsl:template match="@*[not(name()='href'
  or name()='src'
  )]"/>



  <!-- Copy all nodes and attributes unless another rule indicates otherwise. -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>





<!--Get rid of xmlns START-->

<!--  Get rid of xmlns attribute like in <div xmlns="http://www.w3.org/1999/xhtml"><div><h1>Sprint 102</h1></div></div>-->
  <!-- Copy everything but remove namespaces -->
  <xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>

  <!-- Copy attributes -->
<!--  <xsl:template match="@*">-->
<!--    <xsl:attribute name="{local-name()}">-->
<!--      <xsl:value-of select="."/>-->
<!--    </xsl:attribute>-->
<!--  </xsl:template>-->

  <!-- Copy remaining content -->
  <xsl:template match="comment()|text()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>

  <!--Get rid of xmlns END-->



</xsl:stylesheet>