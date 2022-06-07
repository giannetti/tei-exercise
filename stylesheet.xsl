<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>TEI Exercise</title>
            </head>
            <body>
                <div style="text-align: center;" id="about">
                    <h2>
                        <xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title"/>
                    </h2>
                    <h4><xsl:text>Transcribed and encoded by </xsl:text>
                        <xsl:value-of
                            select="/TEI/teiHeader/fileDesc/titleStmt/respStmt/name"/>
                        <xsl:text> from digital images accessed at </xsl:text>
                        <br/>
                        <xsl:text>URL: </xsl:text>
                        <a href="{/TEI/teiHeader/fileDesc/publicationStmt/idno[@type='URI']}" target="_blank">
                            <xsl:value-of
                                select="/TEI/teiHeader/fileDesc/publicationStmt/idno[@type='URI']"
                            />
                        </a>
                    </h4>
                </div>
                <hr/>
               <xsl:for-each select="/TEI/text//div">
                   <xsl:apply-templates />
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="pb">
        <h4>Page: <xsl:value-of select="@n"/></h4>
        <xsl:if test="@facs">
            <a href="{@facs}"><img src="{@facs}" style="max-height: 60px; border: 1px solid #AAA;"/></a>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ref[@type = 'noteAnchor']">
        <sup><xsl:apply-templates select="hi"/></sup>
    </xsl:template>
    
    <xsl:template match="note[@type = 'footnote']">
        <ol class="footnotes">
            <li>
                <xsl:value-of select="text()"/>
            </li>
        </ol>
    </xsl:template>
    <xsl:template match="table">
        <table>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>
    
    <xsl:template match="row">
        <tr>
            <xsl:apply-templates select="*"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="row/*">
        <td>
            <xsl:apply-templates select="node()"/>
        </td>
    </xsl:template>
    
    <xsl:template match="list">
        <ul><xsl:apply-templates select="*"/></ul>
    </xsl:template>
    <xsl:template match="list/*">
        <li><xsl:apply-templates select="node()"/></li>
    </xsl:template>
    
    <xsl:template match="hi[@rend = 'italic']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="figure">
        <img src="{graphic/@url}" style="max-height: 250px; border: 1px solid #AAA;"/><br/>
        <small>[<xsl:apply-templates select="figDesc"/>]</small>
    </xsl:template>
    
    <xsl:template match="lb">
        <br><xsl:apply-templates/></br>
    </xsl:template>
</xsl:stylesheet>

