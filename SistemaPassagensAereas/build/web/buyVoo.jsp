<%-- 
    Document   : buyVoo
    Created on : Nov 24, 2013, 2:24:40 PM
    Author     : Vidica
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Aeroporto"%>
<%@page import="Model.Cidade"%>
<%@page import="Model.Voo"%>
<%@page import="Repository.AeroportoRepository"%>
<%@page import="Repository.CidadeRepository"%>
<%@page import="Repository.VooRepository"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" />
        <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/cssTableGenerator.css" rel="stylesheet" type="text/css" media="all" />

        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

    </head>
    <body>
        <div id="header-wrapper">
            <!--Menu-->    
            <div id="header" class="container">
                <div id="logo">
                    <h1><a href="#">Decolando</a></h1>
                </div>
                <div id="menu">
                    <ul>
                        <%@include file="menu.jsp" %>
                    </ul>
                </div>
            </div>
        </div>
        <%
            //inicializar
            int numVoo = Integer.parseInt(request.getParameter("numVoo"));

            Voo flight = new VooRepository().GetVooByNum(numVoo);
            String cityOrigem = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeOrigem());
            String cityDestino = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeDestino());
            String AeroOrigem = new AeroportoRepository().GetAeroportoByIdCity(flight.getTrecho().getIdCidadeOrigem());
            String AeroDestino = new AeroportoRepository().GetAeroportoByIdCity(flight.getTrecho().getIdCidadeDestino());
            String newDatePart = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(flight.getPartida());
            String newDateCheg = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(flight.getChegada());
        %>
        <div id="banner-wrapper">
            <div id="banner" class="container">
                <div style="float: left; width:30%;">

                    <h3>Voo <%=numVoo%></h3>
                    De: <%=cityOrigem%> - <%=AeroOrigem%></br>
                    Para: <%=cityDestino%> - <%=AeroDestino%></br>
                    Partida: <%=newDatePart%></br>
                    Chegada: <%=newDateCheg%></br>
                    Preço: R$<%=flight.getTrecho().getDistancia() * 0.50%>
                </div>
                <div style="float: right; width: 70%;">
                    <h3>Informações do Passageiro</h3>
                    <form action ="EmissaoBilhete" method="post">
                        <div>Nome</div>
                        <input type="text" size="50" name ="nomePassageiro" />  <br/>
                        <div>Idade</div> 
                        <input type="text" size="10" name ="idadePassageiro" />  <br/>
                        <div>RG</div>
                        <input type="text" id="dtPartida" name="RG" class="required"></input><br/>
                        <div>Classe</div>
                        <select name="classe" >
                            <option value="" selected>(Selecione)</option>
                            <option value="Primeira">Primeira</option>
                            <option value="Economica">Econômica</option>
                        </select>
                        <br/>
                        <input type="checkbox" name="assentoEspecial" /> Assento Especial &nbsp&nbsp&nbsp    
                        <br/>
                        <br/>
                        <input type="hidden" value="<%=flight.getId()%>" name="numVoo"/>
                        <input type="hidden" value="<%=cityOrigem%>" name="cidadeOrigem"/>
                        <input type="hidden" value="<%=cityDestino%>" name="cidadeDestino"/>
                        <input type="hidden" value="<%=AeroOrigem%>" name="aeroportoOrigem"/>
                        <input type="hidden" value="<%=AeroDestino%>" name="aeroportoDestino"/>
                        <input type="hidden" value="<%=newDatePart%>" name="dtPartida"/>
                        <input type="hidden" value="<%=newDateCheg%>" name="dtChegada"/>
                        
                        <input type="submit" class="button" value="Comprar"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
   
</html>
