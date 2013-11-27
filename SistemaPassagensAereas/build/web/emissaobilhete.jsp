
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
        <% String trecho = request.getParameter("cidadeOrigem") + " - "
                    + request.getParameter("aeroportoOrigem") + " /  "
                    + request.getParameter("cidadeDestino") + " - "
                    + request.getParameter("aeroportoDestino");
        %>
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
                    <div class="containerBilhete" id="bilhete">
                        <div class="bilheteLeft">
                            <div class="bilheteTitle">
                                <span>Decolando</span>
                            </div>  
                            <div class="nome">
                                <fieldset class="bilheteFieldset">
                                    <legend>Nome</legend>
                                    <span><%=request.getParameter("nomePassageiro")%></span>
                                </fieldset>                                    
                            </div>
                            <div class="idade">
                                <fieldset class="bilheteFieldset">
                                    <legend>Idade</legend>
                                    <span><%=request.getParameter("idadePassageiro")%></span>
                                </fieldset>                                    
                            </div>
                            <br/>
                            <div class="trecho">
                                <fieldset class="bilheteFieldset">
                                    <legend>Trecho</legend>
                                    <span><%=trecho%></span>
                                </fieldset>                                    
                            </div>
                            <br/>
                            <div class="classe">
                                <fieldset class="bilheteFieldset">
                                    <legend>Classe</legend>
                                    <span><%=request.getParameter("classe")%></span>
                                </fieldset>                                    
                            </div>
                            <br/>
                            <div class="dataVoo">
                                <fieldset class="bilheteFieldset">
                                    <legend>Data de Embarque</legend>
                                    <span><%=request.getAttribute("dtPartida")%></span>
                                </fieldset>                                    
                            </div>
                            <div class="horaVoo">
                                <fieldset class="bilheteFieldset">
                                    <legend>Hora Embarque</legend>
                                    <span><%=request.getAttribute("hrPartida")%></span>
                                </fieldset>                                    
                            </div>                            
                            <div class="numVoo">
                                <fieldset class="bilheteFieldset">
                                    <legend>Voo</legend>
                                    <span><%=request.getParameter("numVoo")%></span>
                                </fieldset>                                    
                            </div>
                            <div class="assentoEspecial">
                                <fieldset class="bilheteFieldset">
                                    <legend>Assento Especial</legend>
                                    <span><%=request.getAttribute("assentoEspecial")%></span>
                                </fieldset>                                    
                            </div> 
                        </div>
                        <div class="bilheteRight">
                            <div class="bilheteSummary">
                                <div class="bilheteDestaque">
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Nome</span>
                                        <span class="destaqueDados"><%=request.getParameter("nomePassageiro")%></span>
                                    </div>
                                    <br/>
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Idade</span>
                                        <span class="destaqueDados"><%=request.getParameter("idadePassageiro")%></span>
                                    </div>
                                    <div style="display: inline-block; float:right;">
                                        <span class="destaqueTitle">Classe</span>
                                        <span class="destaqueDados"><%=request.getParameter("classe")%></span>
                                    </div>
                                    <br/>
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Trecho</span>
                                        <span class="destaqueDados"><%=trecho%></span>    
                                    </div>  
                                    <br/>
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Data de Embarque</span>
                                        <span class="destaqueDados"><%=request.getAttribute("dtPartida")%></span>
                                    </div>  
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Hora Embarque</span>
                                        <span class="destaqueDados"><%=request.getAttribute("hrPartida")%></span>
                                    </div>  
                                    <br/>
                                    <div style="display: inline-block;">
                                        <span class="destaqueTitle">Voo</span>
                                        <span class="destaqueDados"><%=request.getParameter("numVoo")%></span>
                                    </div>  
                                    <div style="display: inline-block; float:right;">
                                        <span class="destaqueTitle">Assento Especial</span>      
                                        <span class="destaqueDados"><%=request.getAttribute("assentoEspecial")%></span>
                                    </div>  
                                </div>                                
                            </div>
                        </div>                        
                    </div>
                    <br/>
                    <input type="button" onclick="printSelection(document.getElementById('bilhete'));" value="Imprimir"/>
                </div>

            </div>

        </div>
        <div id="copyright" class="container">
            <p>Copyright (c) 2013 Mackenzie 6J. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
        </div>
    </body>
    <script type="text/javascript">
                        function printSelection(node) {

                            var content = node.innerHTML;
                            var pwin = window.open('', 'print_content');

                            pwin.document.open();
                            pwin.document.write('<html><link rel="stylesheet" type="text/css" href="css/bilhete.css"/><body onload="window.print()">' + content + '</body></html>');
                            pwin.document.close();

                            setTimeout(function() {
                                pwin.close();
                            }, 1000);

                        }

    </script>
</html>
