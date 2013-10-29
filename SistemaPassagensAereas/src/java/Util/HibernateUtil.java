/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Model.Cidade;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.hibernate.metamodel.Metadata;
import org.hibernate.metamodel.MetadataSources;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {

    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {

//            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().configure().buildServiceRegistry();
//            MetadataSources metadataSources = new MetadataSources(serviceRegistry);
//            metadataSources.addAnnotatedClass(Cidade.class);
//            Metadata metadata = metadataSources.buildMetadata();
//            return metadata.buildSessionFactory();

            Configuration config = new Configuration();
            config.configure();
            ServiceRegistryBuilder srBuilder = new ServiceRegistryBuilder();
            srBuilder.applySettings(config.getProperties());
            ServiceRegistry serviceRegistry = srBuilder.buildServiceRegistry();
            SessionFactory factory = config.buildSessionFactory(serviceRegistry);
            return factory;

        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
