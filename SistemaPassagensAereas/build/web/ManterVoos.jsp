
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
<div id="featured">&nbsp;</div>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content">
			<div class="title">
				<h2>Adicionar Voo</h2>
				<span class="byline">Preencha todos os campos</span> 
                        </div>
                    
                    <div style="display:inline;">                        
                        <label style="display:block;">Número do voo</label>
                        <input type="text" id="numVoo" name="numVoo"></input>                                                
                        <label style="display:block; padding-top: 10px;">Assentos classe economica</label>                    
                        <input type="text" id="assentosEconDisponiveis" name="assentosEconDisponiveis"></input>                                               
                        <label style="display:block; padding-top: 10px;">Assentos primeira classe</label>
                        <input type="text" id="assentosPClasDisponiveis" name="assentosPClasDisponiveis"></input>
                        <label style="display:block; padding-top: 10px;">Partida</label>
                        <input type="text" id="dtHrPartida" name="dtHrPartida"></input>
                        <label style="display:block; padding-top: 10px;">Chegada</label>
                        <input type="text" id="dtHrChegada" name="dtHrChegada"></input>
                        <label style="display:block; padding-top: 10px;">Duração</label>
                        <input type="text" id="duracao" name="duracao"></input>
                        <label style="display:block; padding-top: 10px;">Aeronave</label>
                        <select id="ddlAeronaves" name="ddlAeronaves">
                            <option value="">(Selecione)</option>                      
                            
                        </select>
                        <label style="display:block; padding-top: 10px;">Trecho</label>
                        <select id="ddlTrecho" name="ddlTrecho">
                            <option value="" selected>(Selecione)</option>                            
                        </select>
                        <input type="button" id="enviar" name="enviar" value="Adicionar" onclick="inserirNovoVoo();"/>
                    </div>
                        
                </div>
	</div>
</div>
<div id="copyright" class="container">
	<p>Copyright (c) 2013 Mackenzie 6J. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
</div>
</body>

<script type="text/javascript">
    $(document).ready(function(){
        preencherAeronaves();
        preencherTrechos();
    });
    
    function preencherAeronaves(){
        $.post("AddVooServlet", {acao:"aeronaves"}, function(aeronaves){
            
            $.each(aeronaves, function(index, item){
                $("#ddlAeronaves").append($("<option />").val(item.id).text(item.modeloAeronave));
            });
            
        });
    }
    function preencherTrechos(){
        $.post("AddVooServlet", {acao:"trechos"}, function(trechos){
            
            $.each(trechos, function(index, item){
                $("#ddlTrecho").append($("<option />").val(item.id).text(item.idCidadeOrigem + " - " + item.idCidadeDestino));
            });
            
        });
    }
    
    function inserirNovoVoo(){
       var voo = preencherObjeto();
       
       $.post("AddVooServlet", voo, function(){});
    }
    
    function preencherObjeto(){
        var voo = {
             acao:"insert",
             numVoo:$('#numVoo').val(),
             assentosEconDisponiveis:$('#assentosEconDisponiveis').val(),
             assentosPClasDisponiveis:$('#assentosPClasDisponiveis').val(),
             partida:$('#dtHrPartida').val(),
             chegada:$('#dtHrChegada').val(),
             duracao:$('#duracao').val(),
             aeronave:$('#ddlAeronaves :selected').val(),
             trecho:$('#ddlTrecho :selected').val()
        }
        return voo;
    }


   
</script>
</html>
