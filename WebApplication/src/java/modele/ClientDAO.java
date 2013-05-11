/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import org.hibernate.Session;
import stockvente.HibernateUtil;

/**
 *
 * @author Assistants
 */
public class ClientDAO {
     Session session = null;

    public ClientDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

}
