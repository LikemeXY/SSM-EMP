package com.edu.service;

import java.util.List;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExtend;

public interface EmployeService {

    List<EmployeeExtend> getAll();

    void saveEmp(EmployeeExtend employeeExtend);

    Employee getById(int empId);

    void update(Employee employee);

    void del(int empId);

    boolean checkUserName(String empName);

}
