
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
                        <h2>Adicionar Voo</h2>
                        <span class="byline">Preencha todos os campos</span> 
                    </div>
                    <form id="formCadastroVoo">
                        <div style="display:inline;">                        
                            <label style="display:block;">Número do voo</label>
                            <input type="text" id="numVoo" name="numVoo" max="4" class="required numeric"></input>                                                
                            <label style="display:block; padding-top: 10px;">Assentos classe economica</label>                    
                            <input type="text" id="assentosEconDisponiveis" name="assentosEconDisponiveis" max="3" class="required numeric"></input>                                               
                            <label style="display:block; padding-top: 10px;">Assentos primeira classe</label>
                            <input type="text" id="assentosPClasDisponiveis" name="assentosPClasDisponiveis" max="3" class="required numeric"></input>
                            <label style="display:block; padding-top: 10px;">Data Partida</label>
                            <input type="text" id="dtPartida" name="dtPartida" class="required"></input>
                            <label style="display:block; padding-top: 10px;">Hora Partida</label>
                            <input type="text" id="hrPartida" name="hrPartida" max="2" class="required numeric"></input>
                            <label style="display:block; padding-top: 10px;">Data Chegada</label>
                            <input type="text" id="dtChegada" name="dtChegada" class="required"></input>
                            <label style="display:block; padding-top: 10px;">Hora Chegada</label>
                            <input type="text" id="hrChegada" name="hrChegada" max="2" class="required numeric"></input>
                            <label style="display:block; padding-top: 10px;">Duração</label>
                            <input type="text" id="duracao" name="duracao"  class="required"></input>
                            <label style="display:block; padding-top: 10px;">Aeronave</label>
                            <select id="ddlAeronaves" name="ddlAeronaves"  class="required">
                                <option value="">(Selecione)</option>                      

                            </select>
                            <label style="display:block; padding-top: 10px;">Trecho</label>
                            <select id="ddlTrecho" name="ddlTrecho"  class="required">
                                <option value="" selected>(Selecione)</option>                            
                            </select>
                            <input type="button" id="enviar" name="enviar" value="Adicionar" onclick="return validarCampos();"/>
                            
                            <p id="validate_message">&nbsp;</p>
                        </div>
                    </form>

                </div>

            </div>

        </div>
        <div id="copyright" class="container">
            <p>Copyright (c) 2013 Mackenzie 6J. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
        </div>
    </body>

    <script type="text/javascript">
                                $(document).ready(function() {
                                    preencherAeronaves();
                                    preencherTrechos();
                                });

                                function preencherAeronaves() {
                                    $.post("AddVooServlet", {acao: "aeronaves"}, function(aeronaves) {

                                        $.each(aeronaves, function(index, item) {
                                            $("#ddlAeronaves").append($("<option />").val(item.id).text(item.modeloAeronave));
                                        });

                                    });
                                }
                                function preencherTrechos() {
                                    $.post("AddVooServlet", {acao: "trechos"}, function(trechos) {

                                        $.each(trechos, function(index, item) {
                                            $("#ddlTrecho").append($("<option />").val(item.id).text(item.idCidadeOrigem + " - " + item.idCidadeDestino));
                                        });

                                    });
                                }

                                function inserirNovoVoo() {
                                    var voo = preencherObjeto();
                                    $.post("AddVooServlet", voo, function() {
                                    });
                                }

                                function preencherObjeto() {
                                    var voo = {
                                        acao: "insert",
                                        numVoo: $('#numVoo').val(),
                                        assentosEconDisponiveis: $('#assentosEconDisponiveis').val(),
                                        assentosPClasDisponiveis: $('#assentosPClasDisponiveis').val(),
                                        dtPartida: $('#dtPartida').val(),
                                        dtChegada: $('#dtChegada').val(),
                                        hrChegada: $('#hrChegada').val(),
                                        hrPartida: $('#hrPartida').val(),
                                        duracao: $('#duracao').val(),
                                        aeronave: $('#ddlAeronaves :selected').val(),
                                        trecho: $('#ddlTrecho :selected').val()
                                    }
                                    return voo;
                                }
                                
                                
                                function validarCampos() {
                                    validate('formCadastroVoo');

                                    if (validateState) {
                                       try{ 
                                           inserirNovoVoo();                                           
                                           alert("Voo inserido com sucesso!");
                                       } catch(e){
                                           alert(e);
                                       }
                                    }
                                }
                                
                                function limparCampos()
                                {
                                    $('#numVoo').empty();
                                    $('#assentosEconDisponiveis').empty();
                                    $('#assentosPClasDisponiveis').empty();
                                    $('#dtPartida').empty();
                                    $('#dtChegada').empty();
                                    $('#hrChegada').empty();
                                    $('#hrPartida').empty();
                                    $('#duracao').empty();
                                    $('#ddlAeronaves :selected').empty();
                                    $('#ddlTrecho :selected').empty();
                                }

                                $(function() {
                                    $("#dtPartida, #dtChegada")
                                            .datepicker(
                                            {
                                                dateFormat: 'dd/mm/yy',
                                                dayNames: ['Domingo', 'Segunda', 'Terça',
                                                    'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                                                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S',
                                                    'S', 'D'],
                                                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua',
                                                    'Qui', 'Sex', 'SÃ¡b', 'Dom'],
                                                monthNames: ['Janeiro', 'Fevereiro', 'Março',
                                                    'Abril', 'Maio', 'Junho', 'Julho',
                                                    'Agosto', 'Setembro', 'Outubro',
                                                    'Novembro', 'Dezembro'],
                                                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr',
                                                    'Mai', 'Jun', 'Jul', 'Ago', 'Set',
                                                    'Out', 'Nov', 'Dez'],
                                                nextText: 'Próximo',
                                                prevText: 'Anterior'
                                            });
                                });



    </script>
</html>
