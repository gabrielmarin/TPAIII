
<%@page import="Repository.CidadeRepository"%>
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
                        <%
                            int numVoo = Integer.parseInt(request.getParameter("numVoo"));

                            List teste = new VooRepository().GetVoos(numVoo);
                            for (Object voo : teste) {
                                Voo flight = (Voo) voo;
                                String cityOrigem = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeOrigem());
                                String cityDestino = new CidadeRepository().GetCidadeById(flight.getTrecho().getIdCidadeDestino());

                        %>
                        <tr>
                            <td>
                                Nº do Voo
                            </td>
                            <td>
                                Origem
                            </td>
                            <td>
                                Destino
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
                            <td>
                                Assentos Classe Econômica
                            </td>

                        </tr>
                        <tr>
                            <td >
                                <%=flight.getNumVoo()%>
                            </td>
                            <td>
                                <%=cityOrigem%>
                            </td>
                            <td>
                                <%=cityDestino%>
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
                                <%=flight.getAssentosEconDisponiveis()%>
                            </td>
                        </tr>
                        <%    }%>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
