<%-- 
    Document   : resultVoos
    Created on : Oct 29, 2013, 7:09:14 PM
    Author     : Vidica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

    </head>
    <body>
        <!--Get Data-->
        <%
            String NumVoo = (String) request.getParameter("numVoo");
            String DtPartida = (String) request.getParameter("dtPartida");
            String preco = (String) request.getParameter("preco");
        %>
        <!--Header-->
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
                No data available.
            </div>
        </div>
    </body>
</html>
