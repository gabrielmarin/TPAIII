/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Aeroporto;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class AeroportoRepository {

    public List GetAeroporto() {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Aeroporto.class);
            List lista = criteria.list();

            return lista;

        } catch (Exception e) {
            session.close();
        }
        return null;
    }

    public String GetAeroportoByIdCity(int id) {
        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Aeroporto.class);
            Query query = session.createQuery("from Aeroporto where cidade_id = :id");
            query.setParameter("id", id);

            List list = query.list();
            String strAero = null;
            for (Object aeroporto : list) {
                Aeroporto aero = (Aeroporto) aeroporto;
                strAero = aero.getSigla();
            }

            return strAero;

        } catch (Exception e) {
            session.close();
        }
        return null;

    }
}
