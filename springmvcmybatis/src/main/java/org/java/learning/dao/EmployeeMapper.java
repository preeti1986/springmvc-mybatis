package org.java.learning.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.java.learning.entity.Employee;
import org.java.learning.util.MyBatisUtil;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeMapper {
	
	public List<Employee> getAllEmployees(){
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		List<Employee> employeeList = session.selectList("getAllEmployees");
		session.commit();
		session.close();
		return employeeList;
	}

	public void saveEmployee(Employee employee) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.insert("insertEmployee",employee);
		session.commit();
		session.close();
	}

	public void deleteEmployee(int employeeId) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteEmployee",employeeId);
		session.commit();
		session.close();
	}
	
	
	public Employee findById(int employeeId) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		Employee employee = (Employee)session.selectOne("findById",employeeId);
		session.commit();
		session.close();
		return employee;
	}
	
	
	public void updateEmployee(Employee employee) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.update("updateEmployee",employee);
		session.commit();
		session.close();
		
	}
	
}
