/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Cidade;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CidadeRepository {

    public List GetCidades() {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Cidade.class);
            List lista = criteria.list();
            
            return lista;

        } catch (Exception e) {
            session.close();
        } 
        return null;
    }
    
    
}
