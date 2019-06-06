<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template per l'elemento radice -->
    <xsl:template name="templateroot" match="/">
     <html>
          <head>
              <meta charset="UTF-8"/>
              <script src="javascript.js"> </script>
              <!-- <link rel="stylesheet" type="text/css" href="style.css" media="screen" /> -->
              <title><xsl:value-of select="//tei:title"/></title>
          </head>
         <body> 
             <h1><xsl:value-of select="//tei:title"/></h1>
             <!-- Chiama il template iterativo che crea il div per le cartoline -->
              <xsl:call-template name="divcartoline"></xsl:call-template>  
             
             <footer><h3>Info Generali</h3><xsl:value-of select="/tei:teiCorpus/tei:teiHeader"/></footer>
             <h2></h2>
         </body>
     </html>        
    </xsl:template>
    
    <!-- Template iterativo: crea un Div per ogni cartolina. È una "funzione" generale -->
    <xsl:template name="divcartoline" match="//tei:TEI">
        <xsl:for-each select="//tei:TEI">
            <div>
            <h2>Cartolina <xsl:value-of select="@xml:id"/>: <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2><br /> 
                <div class="section"> <!-- img fronte + desc fronte -->
                    <div class="immaginefronte">
                        <img>
                            <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[1]/tei:graphic/@url"/></xsl:attribute>
                            <xsl:attribute name="height">200px</xsl:attribute>
                            <xsl:attribute name="width">200px</xsl:attribute>
                        </img>
                    </div>
                    <div class="descrizionefronte">
                        Descrizione fronte cartolina <xsl:value-of select="@xml:id"/>: <br />                       
                        <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='frt']/tei:figure"></xsl:apply-templates>
                    </div>
                </div>
                
                <div class="section"> <!-- img retro + desc retro -->
                    <div class="immagineretro">
                        <img>
                            <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[2]/tei:graphic/@url"/></xsl:attribute>
                            <xsl:attribute name="height">200px</xsl:attribute>
                            <xsl:attribute name="width">200px</xsl:attribute>
                        </img>
                    </div>
                    <div class="descrizioneretro">
                        <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='rtr']"></xsl:apply-templates>
                    </div>
                </div>
                
                <div class="section"> <!-- info -->
                    <h3>Informazioni sulla cartolina e sulla codifica:</h3>
                    <div class="info">
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"></xsl:apply-templates>
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"></xsl:apply-templates>
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
                    </div>    
                </div> 
                
           </div>
        </xsl:for-each>
    </xsl:template>
    
    <!-- SEI QUIIIIIIIIII Template per la descrizione delle info sulle cartoline -->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson">
        ListPerson <br />
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <ul>
            <li>Nome: <xsl:value-of select="tei:persName/tei:forename"/></li> 
            <li>Cognome: <xsl:value-of select="tei:persName/tei:surname"/></li>
            <li>Sesso: <xsl:value-of select="tei:sex" /> </li>
            
            <xsl:for-each select="tei:birth">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
            
            <xsl:for-each select="tei:death">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
            
            <xsl:for-each select="tei:education">
                <li>Istruzione: <xsl:value-of select="."/></li>
            </xsl:for-each>
            
            <xsl:for-each select="tei:occupation">
                <li>Occupazione: <xsl:value-of select="."/></li>
            </xsl:for-each>
            
            <xsl:for-each select="tei:certainty">
                <li><a><xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>Fonte: <xsl:value-of select="."/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace">
        ListPlace <br />
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:place">
        <ul>
            <xsl:choose>
                <xsl:when test="@xml:id='LaMag'">
                    <li><xsl:value-of select="tei:geogName"/></li>
                    
                    <xsl:for-each select="tei:country">
                        <li>Stato: <xsl:value-of select="."/></li>
                    </xsl:for-each>
                    
                    <xsl:for-each select="tei:district">
                        <li>Provincia: <xsl:value-of select="."/></li>
                    </xsl:for-each>
                    
                    <li><xsl:value-of select="tei:note" /></li>
                </xsl:when>
                <xsl:when test="@xml:id='PAR'">
                    <li><xsl:value-of select="tei:placeName"/></li>
                    <li><xsl:value-of select="tei:note" /></li>
                </xsl:when>
                <xsl:otherwise>
                        <li><xsl:value-of select="tei:placeName"/> (<xsl:value-of select="tei:district[@type='provincia']"/>)</li>
                        <li><xsl:value-of select="tei:note" /></li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg">
        ListOrg <br />
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:org">
        Anita <br />
    </xsl:template>
    
    <!-- Template per la descrizione del fronte delle cartoline -->
    <!-- Chiamato a riga 42 nel temp iterativo -->
    <xsl:template name="frontecartoline" match="tei:text/tei:body/tei:div[@type='frt']/tei:figure">
        <ul>
            <li>Titolo: <xsl:value-of select="tei:head" /></li>
            <li>Descrizione: <xsl:value-of select="tei:figDesc" /></li>
            <li>Autore: <xsl:value-of select="tei:p/tei:persName[@type='author']" /></li>
        </ul>        
    </xsl:template>
    
    <!-- Template per la codifica del retro delle cartoline Chiamato a riga 56 -->
    <xsl:template name="retrocartoline" match="tei:text/tei:body/tei:div[@type='rtr']">
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>   
    
    <!-- Cambio i line break in br -->
    <xsl:template match="tei:lb">
        <br />
    </xsl:template>
    
    <xsl:template match="tei:div[@type='logo']">
        <br />
        <xsl:value-of select="."/>
        <br />
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:id='copyright65']">
        <xsl:apply-templates></xsl:apply-templates>
        <br />
    </xsl:template>
    
    <!-- Template per i timbri e i francobolli e l'addressline -->
    <xsl:template match="tei:text/tei:body/tei:div[@type='rtr']/tei:div[@type='message']/tei:div[@type='destination']">
        <h4>Timbri e Francobolli</h4>
        <xsl:for-each select="tei:p/tei:stamp">
            <xsl:choose>
                <xsl:when test="@type='postmark'">
                    Timbro - <xsl:value-of select="."/>  
                    <br />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/> 
                    <br />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
        <h4>Indirizzo</h4> 
        <xsl:for-each select="tei:p/tei:address/tei:addrLine">
            <xsl:value-of select="."/>
            <br />
        </xsl:for-each>
        
    </xsl:template>

</xsl:stylesheet>

