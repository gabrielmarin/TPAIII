
<%@page import="Model.Cidade"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="Repository.CidadeRepository"%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" />
        <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
        <%@include file="header.jsp" %>

        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

    </head>
    <body>
        <!--Menu-->
        <div id="header-wrapper">
            <div id="header" class="container">
                <div id="logo">
                    <h1><a href="#">Decolando</a></h1>
                </div>
                <div id="menu">
                    <%@include file="menu.jsp" %>
                </div>
            </div>
        </div>
        <div id="featured">&nbsp;</div>
        <div id="wrapper">
            <div id="page" class="container">
                <div id="content">
                    <div class="title">
                        <h2>Emissão do Bilhete</h2>                        
                    </div>
                    <div class="containerBilhete">
                        <div class="bilheteLeft">
                            <div class="bilheteTitle">
                                <span>Decolando</span>
                              </div>  
                                <div class="nome">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Nome</legend>
                                    </fieldset>                                    
                                </div>
                                 <div class="idade">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Idade</legend>
                                    </fieldset>                                    
                                </div>
                            <br/>
                             <div class="trecho">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Trecho</legend>
                                    </fieldset>                                    
                             </div>
                            <br/>
                            <div class="classe">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Classe</legend>
                                    </fieldset>                                    
                             </div>
                            <br/>
                            <div class="dataVoo">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Data</legend>
                                    </fieldset>                                    
                             </div>
                            <div class="horaVoo">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Hora</legend>
                                    </fieldset>                                    
                             </div>                            
                             <div class="numVoo">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Voo</legend>
                                    </fieldset>                                    
                             </div>
                             <div class="assentoEspecial">
                                    <fieldset class="bilheteFieldset">
                                        <legend>Assento Especial</legend>
                                    </fieldset>                                    
                             </div> 
                        </div>
                        <div class="bilheteRight">
                            <div class="bilheteSummary">
                                
                            </div>
                        </div>                        
                    </div>
                </div>

            </div>

        </div>
        <div id="copyright" class="container">
            <p>Copyright (c) 2013 Mackenzie 6J. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
        </div>
    </body>
    
</html>
