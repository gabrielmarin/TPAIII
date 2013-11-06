/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Aeronave;
import Model.Cidade;
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
public class AeronaveRepository {
 
     public ArrayList<Aeronave> getAeronaves() {
         
        ArrayList<Aeronave> aeronaves = new ArrayList<Aeronave>();
        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Aeronave.class);
            List lista = criteria.list();
            
            for (Object item : lista) 
                aeronaves.add((Aeronave)item);
            
            
            return aeronaves;

        } catch (Exception e) {
            session.close();
        } 
        finally{
            session.close();
        }
        return null;
    }
    
}
