/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Voo;
import Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Gabriel
 */
public class VooRepository {
    
     public void AdicionarVoo(Voo voo) throws Exception{

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Transaction t = session.beginTransaction();
            session.saveOrUpdate(voo);
            t.commit();
            

        } catch (Exception e) {
            session.close();
        } finally {
            session.close();
        }
        
    }
}
