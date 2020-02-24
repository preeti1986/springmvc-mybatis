package org.java.learning.controller;

import org.java.learning.dao.EmployeeMapper;
import org.java.learning.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@RequestMapping(value="/")
	public ModelAndView index() {
		//System.out.println(employeeMapper.getAllEmployees());
		ModelAndView mav = new ModelAndView("list-employees");
		mav.addObject("listemployees",employeeMapper.getAllEmployees());
		return mav;
	}
	
	@RequestMapping("/showFormForAddEmployee")
	public ModelAndView showForm() {
		ModelAndView mav = new ModelAndView("add-employee");
		mav.addObject("employee",new Employee());
		return mav;
		
	}
	
	@RequestMapping("/saveProcess")
	public String saveProcess(@ModelAttribute("employee") Employee employee) {
	 if(String.valueOf(employee.getId()) == null)
		employeeMapper.saveEmployee(employee);
	 else
		 employeeMapper.updateEmployee(employee);
		return "redirect:/";
	}
	
	@RequestMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
		employeeMapper.deleteEmployee(employeeId);
		return "redirect:/";
	}
	
	@RequestMapping("/editEmployee")
	public ModelAndView editEmployee(@RequestParam("employeeId") int employeeId) {
		ModelAndView mav = new ModelAndView("add-employee");
		Employee employee = employeeMapper.findById(employeeId);
		mav.addObject("employee",employee);
		return mav;
	}
	
	

}
