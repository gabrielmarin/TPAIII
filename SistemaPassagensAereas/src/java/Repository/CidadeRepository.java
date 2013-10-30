/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import Model.Cidade;
import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
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

    public String GetCidadeByUF(String uf) {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Cidade.class);
            Query query = session.createQuery("from Cidade where uf = :uf");
            query.setParameter("uf", uf);

            Cidade list = (Cidade) query.list();

            return list.getNomeCidade();

        } catch (Exception e) {
            session.close();
        }
        return null;
    }

    public String GetCidadeById(int id) {

        Session session = null;
        try {
            SessionFactory sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            session.beginTransaction();

            Criteria criteria = session.createCriteria(Cidade.class);
            Query query = session.createQuery("from Cidade where id = :id");
            query.setParameter("id", id);

            List list = query.list();
            String strCityOrigem = null;
            for (Object cidade : list) {
                Cidade city = (Cidade) cidade;
                strCityOrigem = city.getNomeCidade();
            }

            return strCityOrigem;

        } catch (Exception e) {
            session.close();
        }
        return null;
    }
}
