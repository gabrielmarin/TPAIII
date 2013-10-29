
import Model.Cidade;
import Util.HibernateUtil;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Gabriel
 */
public class TesteEJB {

    
    public static void main(String[] args) {
//        try {
//            //Método que faz o lookup para encontrar o EJB de HelloWorldRemote. 
//            InitialContext ctx = new InitialContext();
//            HelloWorldRemote ejb = (HelloWorldRemote) ctx.lookup("HelloWorldRemote");
//            System.out.println(ejb.Ola());
//        } catch (NamingException ex) {
//            ex.printStackTrace();
//            System.out.println("Não encontrou o EJB.");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            System.out.println(ex.getMessage());
            
//        }
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();

		Cidade cidade = new Cidade();
                cidade.setNomeCidade("teste");
                cidade.setUf("SP");
		session.save(cidade);
		
		session.getTransaction().commit();
		session.close();
        
        
        
    }
}
