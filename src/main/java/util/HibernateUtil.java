package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@SuppressWarnings("deprecation")
public class HibernateUtil {

    private static HibernateUtil instance = new HibernateUtil();
    private SessionFactory sessionFactory;

    public static HibernateUtil getInstance() {
        return instance;
    }

    private HibernateUtil() {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");

        String dbUrl = System.getenv("DB_URL");
        String dbUser = System.getenv("DB_USERNAME");
        String dbPass = System.getenv("DB_PASSWORD");

        cfg.setProperty("hibernate.connection.url", dbUrl);
        cfg.setProperty("hibernate.connection.username", dbUser);
        cfg.setProperty("hibernate.connection.password", dbPass);

        sessionFactory = configuration.buildSessionFactory();
    }
    

    public static Session getSession() {
        Session session = getInstance().sessionFactory.openSession();
        return session;
    }
}
