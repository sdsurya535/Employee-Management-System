package com.smsb.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smsb.dao.EmployeeDao;
import com.smsb.entities.Employee;

@Repository
@Transactional
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addEmployee(Employee employee) {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.persist(employee);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Employee> viewAllEmployees() {
		String listQuery = "SELECT e FROM Employee e ";
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Employee> createQuery = currentSession.createQuery(listQuery);

		return createQuery.getResultList();
	}

	@Override
	public boolean updatEmployee(Employee employee) {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.update(employee);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Employee getEmployeeById(Long eid) {
		Session currentSession = sessionFactory.getCurrentSession();
		Employee employee = currentSession.get(Employee.class, eid);
		return employee;
	}

	@Override
	public void deleteEmployee(Long eid) {
		String deleteQuery = "DELETE FROM Employee u WHERE u.eid = :eid ";
		Session currentSession = sessionFactory.getCurrentSession();
		Query createQuery = currentSession.createQuery(deleteQuery);
		createQuery.setParameter("eid", eid);
		createQuery.executeUpdate();

	}

	@Override
	public List<Employee> getEmployeesByUser(Long user_id) {
		String userQuery = "from Employee as e where e.user.id = :user_id";
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Employee> createQuery = currentSession.createQuery(userQuery);
		createQuery.setParameter("user_id", user_id);
		return createQuery.getResultList();
	}

	

}
