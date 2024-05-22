package com.smsb.daoimpl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smsb.dao.UserDao;
import com.smsb.entities.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean registerUser(User user) {

		try {

			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.persist(user);
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public User getUserByEmailAndPassword(String email, String password) {
		String query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
		Query<User> createQuery = sessionFactory.getCurrentSession().createQuery(query);
		createQuery.setParameter("email", email);
		createQuery.setParameter("password", password);
		return createQuery.uniqueResult();
	}

}
