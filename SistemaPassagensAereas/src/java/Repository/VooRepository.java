/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Voo;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Gabriel
 */
public class VooRepository {

    public void AdicionarVoo(Voo voo) throws Exception {

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

    public List GetAllVoos() {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Voo.class);
            List lista = criteria.list();

            return lista;

        } catch (Exception e) {
            session.close();
        }
        return null;
    }

    public List GetVoos(int numVoo, String origem, String destino) {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Voo.class);
            Query query = null;
            List list = null;
            if (numVoo != 0) {
                query = session.createQuery("from Voo where numVoo = :nVoo ");
                query.setParameter("nVoo", numVoo);
                list = query.list();
            } else {
                list = GetAllVoos();
            }
            return list;

        } catch (Exception e) {
            session.close();
        }
        return null;
    }

    public Voo GetVooByNum(int numVoo) {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Voo.class);
            Query query = null;
            List list = null;
            Voo flight = null;
            query = session.createQuery("from Voo where numVoo = :nVoo ");
            query.setParameter("nVoo", numVoo);
            list = query.list();
            
            String strAero = null;
            for (Object voo : list) {
                flight = (Voo) voo;
            }
            return flight;

        } catch (Exception e) {
            session.close();
        }
        return null;
    }
}
