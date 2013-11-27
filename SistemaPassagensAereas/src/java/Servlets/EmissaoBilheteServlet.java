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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gabriel
 */@WebServlet("/EmissaoBilhete")
public class EmissaoBilheteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        

        String dtPartida = request.getParameter("dtPartida").substring(0, 10);
        String hrPartida = request.getParameter("dtPartida").substring(10, 16);        
        String assentoEspecial =  (request.getParameter("assentoEspecial") != null) ? "Sim" : "Não";
        
        
        request.setAttribute("dtPartida", dtPartida);
        request.setAttribute("hrPartida", hrPartida);
        request.setAttribute("assentoEspecial", assentoEspecial);
  
        request.getRequestDispatcher("emissaobilhete.jsp")
							.forward(request, response);

    }

    
}
