
<%@page import="Repository.CidadeRepository"%>
<%@page import="Repository.AeroportoRepository"%>
<%@page import="Model.Aeroporto"%>
<%@page import="Model.Cidade"%>
<%@page import="Model.Voo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="Repository.VooRepository"%>
<!DOCTYPE html>
-->
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
                        <li class="current_page_item"><a href="index.html" accesskey="1" title="">Homepage</a></li>
                        <li><a href="#" accesskey="2" title="">Passagens</a></li>
                        <li><a href="#" accesskey="3" title="">Voos</a></li>
                        <li><a href="#" accesskey="4" title="">Aeronaves</a></li>
                        <li><a href="#" accesskey="5" title="">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="wrapper">
            <div id="page" class="container">
                <h3>Voos</h3>
                <div class="CSSTableGenerator" >
                    <table width="80%">
                        <tr>
                            <td>
                                Nº do Voo
                            </td>
                            <td>
                                Origem / Aeroporto
                            </td>
                            <td>
                                Destino / Aeroporto
                            </td>
                            <td>
                                Partida
                            </td>
                            <td>
                                Chegada
                            </td>
                            <td >
                                Duracao
                            </td>
                            <td >
                                Aeronave
                            </td>
                            <td>
                                Assentos Classe Econômica
                            </td>
                            <td>
                                Assentos Primeira Classe
                            </td>
                            <td>
                                Distância
                            </td>
                            <td>
                                Preço
                            </td>
                        </tr>
                        <%
                            //inicializar
                            int numVoo = 0;
                            String sorigem = request.getParameter("origem");
                            String destino = request.getParameter("destino");
                            //Get Parameters
                            String snumVoo = request.getParameter("numVoo");
                            //Consistency
                            if (snumVoo != "") {
                                numVoo = Integer.parseInt(snumVoo);
                            }

                            List teste = new VooRepository().GetVoos(numVoo, sorigem, destino);
                            for (Object voo : teste) {
                                Voo flight = (Voo) voo;
                                String cityOrigem = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeOrigem());
                                String cityDestino = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeDestino());
                                String AeroOrigem = new AeroportoRepository().GetAeroportoByIdCity(flight.getTrecho().getIdCidadeOrigem());
                                String AeroDestino = new AeroportoRepository().GetAeroportoByIdCity(flight.getTrecho().getIdCidadeDestino());
                        %>
                        <tr>
                            <td >
                                <%=flight.getNumVoo()%>
                            </td>
                            <td>
                                <%=cityOrigem%> / <%=AeroOrigem%>
                            </td>
                            <td>
                                <%=cityDestino%> / <%=AeroDestino%>
                            </td>
                            <td>
                                <%=flight.getPartida()%>
                            </td>
                            <td>
                                <%=flight.getChegada()%>
                            </td>
                            <td>
                                <%=flight.getDuracao()%> hora
                            </td>
                            <td>
                                <%=flight.getAeronave().getModeloAeronave()%>
                            </td>
                            <td>
                                <%=flight.getAssentosEconDisponiveis()%>
                            </td>
                            <td>
                                <%=flight.getAssentosPClasDisponiveis()%>
                            </td>                            
                            <td>
                                <%=flight.getTrecho().getDistancia()%>
                            </td>
                            <td>
                                R$<%=flight.getTrecho().getDistancia()*0.50%>
                            </td>
                        </tr>
                        <%    }%>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
