package com.jfsd_lab.exp_6.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.springframework.http.HttpStatus;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.jfsd_lab.exp_6.model.User;

public class UserDAO_Impl implements UserDAO {

	private HibernateTemplate ht;

	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@Override
	public HttpStatus addUser(User user) {
		try {
			ht.save(user);
			System.out.println("Added user");
			return HttpStatus.CREATED;
		} catch (Exception e) {
			System.out.println("Error adding user: " + e.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public HttpStatus addAdmin(User admin) {
		try {
			if (admin.isAdmin()) {
				ht.save(admin);
				System.out.println("Added admin");
				return HttpStatus.CREATED;
			} else {
				System.out.println("Check if user is actually admin");
				return HttpStatus.FORBIDDEN;
			}
		} catch (Exception e) {
			System.out.println("Error adding admin: " + e.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public List<User> getAllUsers() {
		try {
			return ht.loadAll(User.class);
		} catch (Exception e) {
			System.out.println("Error fetching users: " + e.getMessage());
			return null;
		}
	}

	@Override
	public User findByUsername(String username) {
		return ht.execute(new HibernateCallback<User>() {
			@Override
			public User doInHibernate(Session session) {
				// Use TypedQuery instead of deprecated Query<User>
				TypedQuery<User> query = session.createQuery("FROM User WHERE username = :username", User.class);
				query.setParameter("username", username);
				List<User> users = query.getResultList();
				if (users != null && !users.isEmpty()) {
					return users.get(0);
				}
				return null; // User not found
			}
		});
	}
}
