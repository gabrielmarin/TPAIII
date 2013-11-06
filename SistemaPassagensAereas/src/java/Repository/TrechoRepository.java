/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Aeronave;
import Model.Trecho;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 *
 * @author Gabriel
 */
public class TrechoRepository {
 
     public ArrayList<Trecho> getTrechos() {
         
        ArrayList<Trecho> trechos = new ArrayList<Trecho>();
        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Trecho.class);
            List lista = criteria.list();
            
            for (Object item : lista) 
                trechos.add((Trecho)item);            
            
            return trechos;

        } catch (Exception e) {
            session.close();
        } 
        finally{
            session.close();
        }
        return null;
    }
    
}
