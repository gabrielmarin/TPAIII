/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.Aeronave;
import Model.Trecho;
import Model.Voo;
import Repository.AeronaveRepository;
import Repository.TrechoRepository;
import Repository.VooRepository;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gabriel
 */
@WebServlet("/AddVooServlet")
public class AdicionarVooServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("aeronaves")) {
            ArrayList<Aeronave> aeronaves = getAeronaves();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(aeronaves));
        } else if (acao.equals("trechos")) {
            ArrayList<Trecho> trechos = getTrechos();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(trechos));
        } else if (acao.equals("insert")) {
            try {
                Voo voo = toVoo(request);
                VooRepository repository = new VooRepository();
                repository.AdicionarVoo(voo);
            } catch (ParseException ex) {
            } catch (Exception e) {
            }
        }

    }

    private ArrayList<Aeronave> getAeronaves() {
        AeronaveRepository repository = new AeronaveRepository();
        return repository.getAeronaves();
    }

    private ArrayList<Trecho> getTrechos() {
        TrechoRepository repository = new TrechoRepository();
        return repository.getTrechos();
    }

    private Voo toVoo(HttpServletRequest request) throws ParseException {
        Aeronave aeronave = new Aeronave();
        Trecho trecho = new Trecho();
        Voo voo = new Voo();

        int aeronaveId = Integer.parseInt(request.getParameter("aeronave"));
        int trechoId = Integer.parseInt(request.getParameter("trecho"));
        int assentosEconDisp = Integer.parseInt(request.getParameter("assentosEconDisponiveis"));
        int assentosPClasDisp = Integer.parseInt(request.getParameter("assentosPClasDisponiveis"));
        int numVoo = Integer.parseInt(request.getParameter("numVoo"));
        int duracao = Integer.parseInt(request.getParameter("duracao"));
        Date partida = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("partida"));
        Date chegada = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("chegada"));

        aeronave.setId(aeronaveId);
        trecho.setId(trechoId);
        voo.setAeronave(aeronave);
        voo.setTrecho(trecho);
        voo.setAssentosEconDisponiveis(assentosEconDisp);
        voo.setAssentosPClasDisponiveis(assentosPClasDisp);
        voo.setNumVoo(numVoo);
        voo.setDuracao(duracao);
        voo.setPartida(partida);
        voo.setChegada(chegada);

        return voo;

    }
}
