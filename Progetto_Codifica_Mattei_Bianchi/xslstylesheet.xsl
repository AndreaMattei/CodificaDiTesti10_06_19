<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template per l'elemento radice -->
    <xsl:template name="templateroot" match="/">
     <html>
          <head>
              <meta charset="UTF-8"/>
              <script src="javascript.js"> </script>
              <link rel="stylesheet" type="text/css" href="style.css" media="screen" /> 
              <title><xsl:value-of select="//tei:title"/></title>
          </head>
         <body> 
             <!-- Header: Titolo e minilink di navigazione -->
             <div id="header">
               <nav> 
                   <h1><xsl:value-of select="//tei:title"/></h1>
                   <ul id="menu">
                        <li><a href="#sezione150">Cartolina #150</a></li>
                        <li><a href="#sezione47">Cartolina #47</a></li>
                        <li><a href="#sezione65">Cartolina #65</a></li>
                       <li><a href="#about">About</a></li>
                   </ul>
               </nav>
             </div>
             <!-- Fine Header -->
             
             <div class="container" id="intro">
                 <p>                    
                     Lo scopo di questo progetto è quello di codificare tre cartoline del secondo decennio del 1900, provenienti dal <xsl:value-of select="//tei:org[@xml:id='MESP']/tei:orgName"/> della Spezia.
                     <br/>
                     Le nostre cartoline mostrano i rapporti tra Giovanni Coliola, Oliva Turtura e Giuseppe Turtura. <xsl:value-of select="//tei:listRelation"/>
                 </p>
             </div>
             
             <!-- Creo i div per le cartoline -->
              <xsl:apply-templates select="//tei:TEI"/>
             <!-- Fine div per le cartoline -->
             <div class="strisce" id="striscia4"></div>
             <footer id="about">
                 <h4>About</h4>
                 <p>
                     <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc"></xsl:apply-templates>
                 </p>
             </footer>
         </body>
     </html>        
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        Questo progetto è stato realizzato da <xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[1]"/> 
        e <xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[2]"/>, <xsl:value-of select="tei:editionStmt/tei:edition"/>. <br />
        <xsl:value-of select="tei:editionStmt/tei:respStmt[1]"/><br />
        <xsl:value-of select="tei:editionStmt/tei:respStmt[2]"/><br />
        <xsl:value-of select="tei:editionStmt/tei:respStmt[3]"/><br />
        <xsl:value-of select="tei:editionStmt/tei:respStmt[4]"/><br />
        Pubblicato da <xsl:value-of select="tei:publicationStmt/tei:publisher"/> nel <xsl:value-of select="tei:publicationStmt/tei:date"/>, <xsl:value-of select="tei:publicationStmt/tei:availability"/>. <br/>
        Distribuito dal <xsl:value-of select="tei:publicationStmt/tei:distributor"/> (<xsl:value-of select="tei:publicationStmt/tei:address/tei:addrLine[1]"/>)<br />
        Luogo di conservazione delle cartoline: <xsl:value-of select="tei:sourceDesc/tei:msDesc/tei:msIdentifier"/>    
    </xsl:template>
    
    <!-- crea un Div per ogni cartolina.  -->
    <!-- Cartolina 150 -->
    <xsl:template name="divcartolina150" match="tei:TEI[@xml:id='c150']">
            <div class="strisce" id="striscia1"></div>
            <div><xsl:attribute name="id">sezione150</xsl:attribute><xsl:attribute name="class">container</xsl:attribute>
            <h2><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2>
                <form>
                    <input type="button" name="Ruota150" id="buttonruota_150" class="buttons" value="Ruota"></input>
                    <input type="button" name="Fronte150" id="buttonfronte_150" class="buttons" value="Fronte"></input>
                    <input type="button" name="Retro150" id="buttonretro_150" class="buttons" value="Retro" ></input>
                    <input type="button" name="Info150" id="buttoninfo_150" class="buttons" value="Mostra Informazioni Aggiuntive"></input>
                </form>
                <div class="section" id="fronte150"> <!-- img fronte + desc fronte -->
                    
                    <table cellspacing="20" class="verticale">
                        <tr>
                            <td>
                                <div class="immaginesx" id="imgfronte150">
                                    
                                    <img>
                                        <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[1]/tei:graphic/@url"/></xsl:attribute>
                                    </img>
                                </div> 
                            </td>
                            <td>
                                <div class="descrizionedx" id="descfronte150">
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='frt']/tei:figure"></xsl:apply-templates>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <div class="section" id="retro150"> <!-- img retro + desc retro --><xsl:attribute name="hidden">hidden</xsl:attribute>
                    
                    <table cellspacing="10" class="orizzontale">
                        <tr>
                            <td>
                                <div class="immaginesx" id="imgretro150">
                                    <img>
                                        <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[2]/tei:graphic/@url"/></xsl:attribute>
                                    </img>
                                </div>
                            </td>
                            <td>
                                <div class="descrizionedxretro" id="descretro150">
                                    <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='rtr']"></xsl:apply-templates>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <div class="section" id="info150"><xsl:attribute name="hidden">hidden</xsl:attribute> <!-- info -->
                    <div class="info">
                        <hr></hr>
                        <br />
                        
                        <h3>Informazioni</h3>
                        <form>
                            <input type="button" name="ChiudiInfo150" id="buttonchiudiinfo_150" class="buttons" value="Chiudi"></input>
                        </form>
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"></xsl:apply-templates>
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"></xsl:apply-templates>
                        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
                    </div>    
                </div> 
                
           </div>
    </xsl:template>
    
    <!-- Cartolina 47 -->
    <xsl:template name="divcartolina47" match="tei:TEI[@xml:id='c47']">
        <div class="strisce" id="striscia2"></div>
        <div><xsl:attribute name="id">sezione47</xsl:attribute><xsl:attribute name="class">container</xsl:attribute>
            <h2><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2>
            <form>
                <input type="button" name="Ruota47" id="buttonruota_47" class="buttons" value="Ruota"></input>
                <input type="button" name="Fronte47" id="buttonfronte_47" class="buttons" value="Fronte"></input>
                <input type="button" name="Retro47" id="buttonretro_47" class="buttons" value="Retro" ></input>
                <input type="button" name="Info47" id="buttoninfo_47" class="buttons" value="Mostra Informazioni Aggiuntive"></input>
            </form>
            <div class="section" id="fronte47"> <!-- img fronte + desc fronte -->
                <table cellspacing="40" class="orizzontale">
                    <tr>
                        <td>
                            <div class="immaginefronte" id="imgfronte47">
                                <img>
                                    <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[1]/tei:graphic/@url"/></xsl:attribute>
                                </img>
                            </div> 
                        </td>
                        <td>
                            <div class="descrizionefronte" id="descfronte47">
                                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='frt']/tei:figure"></xsl:apply-templates>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="section" id="retro47"> <!-- img retro + desc retro --><xsl:attribute name="hidden">hidden</xsl:attribute>
                <table cellspacing="10" class="orizzontale">
                    <tr>
                        <td>
                            <div class="immaginesx" id="imgretro47">
                                <img>
                                    <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[2]/tei:graphic/@url"/></xsl:attribute>
                                </img>
                            </div>
                        </td>
                        <td>
                            <div class="descrizionedxretro" id="descretro47">
                                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='rtr']"></xsl:apply-templates>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            
            
            <div class="section" id="info47"> <!-- info --> <xsl:attribute name="hidden">hidden</xsl:attribute>
               
                <div class="info">
                    <hr></hr>
                    <br />
                    <h3>Informazioni</h3>
                    <form>
                        <input type="button" name="ChiudiInfo47" id="buttonchiudiinfo_47" class="buttons" value="Chiudi"></input>
                    </form>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"></xsl:apply-templates>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"></xsl:apply-templates>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
                </div>    
            </div> 
            
        </div>
    </xsl:template>
    
    <!-- Cartolina 65 -->
    <xsl:template name="divcartolina65" match="tei:TEI[@xml:id='c65']">
        <div class="strisce" id="striscia3"></div>
        <div><xsl:attribute name="id">sezione65</xsl:attribute><xsl:attribute name="class">container</xsl:attribute>
            <h2><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2>
            <form>
                <input type="button" name="Ruota65" id="buttonruota_65" class="buttons" value="Ruota"></input>
                <input type="button" name="Fronte65" id="buttonfronte_65" class="buttons" value="Fronte"></input>
                <input type="button" name="Retro65" id="buttonretro_65" class="buttons" value="Retro" ></input>
                <input type="button" name="Info65" id="buttoninfo_65" class="buttons" value="Mostra Informazioni Aggiuntive"></input>
            </form>
            <div class="section" id="fronte65"> <!-- img fronte + desc fronte -->
                <table cellspacing="40" class="verticale">
                    <tr>
                        <td>
                            <div class="immaginesx" id="imgfronte65">
                                <img>
                                    <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[1]/tei:graphic/@url"/></xsl:attribute>
                                </img>
                            </div> 
                        </td>
                        <td>
                            <div class="descrizionedx" id="descfronte65">
                                Descrizione: <br />                       
                                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='frt']/tei:figure"></xsl:apply-templates>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="section" id="retro65"> <!-- img retro + desc retro --> <xsl:attribute name="hidden">hidden</xsl:attribute>
                <table cellspacing="40" class="orizzontale">
                    <tr>
                        <td>
                            <div class="immaginesx" id="imgretro65">
                                <img>
                                    <xsl:attribute name="src"><xsl:value-of select="tei:facsimile/tei:surface[2]/tei:graphic/@url"/></xsl:attribute>
                                </img>
                            </div>
                        </td>
                        <td>
                            <div class="descrizionedxretro" id="descretro65">
                                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='rtr']"></xsl:apply-templates>
                            </div>
                        </td>
                    </tr>
                </table>
               
               
            </div>
           
            <div class="section" id="info65"> <!-- info --> <xsl:attribute name="hidden">hidden</xsl:attribute>
                <div class="info">
                    <hr></hr>
                    <br />
                    <h3>Informazioni</h3>
                    <form>
                    <input type="button" name="ChiudiInfo65" id="buttonchiudiinfo_65" class="buttons" value="Chiudi"></input>
                    </form>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"></xsl:apply-templates>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"></xsl:apply-templates>
                    <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
                </div>    
            </div> 
            
        </div>
    </xsl:template>
    
    <!-- Template per la descrizione delle info sulle cartoline -->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson">
       <h5>Persone</h5>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <ul>
            <li>Nome: <strong><xsl:value-of select="tei:persName/tei:forename"/></strong></li> 
            <li>Cognome: <strong><xsl:value-of select="tei:persName/tei:surname"/></strong></li>
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
                <li><a><xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>Fonte: <xsl:value-of select="."/></a></li>
            </xsl:for-each>
        </ul>
        <br></br>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace">
       <h5>Luoghi</h5>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:place">
        <ul>
            <xsl:choose>
                <xsl:when test="@xml:id='LaMag'">
                    <li><strong><xsl:value-of select="tei:geogName"/></strong></li>
                    
                    <xsl:for-each select="tei:country">
                        <li>Stato: <xsl:value-of select="."/></li>
                    </xsl:for-each>
                    
                    <xsl:for-each select="tei:district">
                        <li>Provincia: <xsl:value-of select="."/></li>
                    </xsl:for-each>
                    
                    <li><xsl:value-of select="tei:note" /></li>
                </xsl:when>
                <xsl:when test="@xml:id='PAR'">
                    <li><strong><xsl:value-of select="tei:placeName"/></strong></li>
                    <li><xsl:value-of select="tei:note" /></li>
                </xsl:when>
                <xsl:otherwise>
                    <li><strong><xsl:value-of select="tei:placeName"/></strong> (<xsl:value-of select="tei:district[@type='provincia']"/>)</li>
                        <li><xsl:value-of select="tei:note" /></li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
        <br></br>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg">
        <h5>Organizzazioni</h5>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:org">
        <ul>
            <li><a>
                 <xsl:attribute name="href">
                     <xsl:value-of select="tei:note/tei:ref/@target"/>
                 </xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="tei:orgName"/>
                </a></li>
            <li><xsl:value-of select="tei:event"/></li>
            <xsl:for-each select="tei:desc">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
            
        </ul>
        <br></br>
    </xsl:template>
    
    <!-- Template per la descrizione del fronte delle cartoline -->
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
    
    <xsl:template match="//tei:del">
        <mark><xsl:attribute name="style">text-decoration: line-through;</xsl:attribute><xsl:value-of select="."/></mark>
    </xsl:template>

</xsl:stylesheet>

