package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExample;
import com.edu.bean.EmployeeExtend;
import com.edu.mapper.EmployeeExtendMapper;
import com.edu.mapper.EmployeeMapper;
import com.edu.service.EmployeService;

@Service
@Transactional
public class EmployeServiceImpl implements EmployeService {
    @Autowired
    private EmployeeExtendMapper employeeExtendMapper;
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<EmployeeExtend> getAll() {
        // TODO Auto-generated method stub
        return employeeExtendMapper.selectDeptByExample(null);
    }

    @Override
    public void saveEmp(EmployeeExtend employeeExtend) {
        employeeMapper.insertSelective(employeeExtend);

    }

    @Override
    public Employee getById(int empId) {

        return employeeMapper.selectByPrimaryKey(empId);
    }

    @Override
    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);

    }

    @Override
    public void del(int empId) {
        employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public boolean checkUserName(String empName) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpNameEqualTo(empName);
        long countByExample = employeeMapper.countByExample(example);
        return countByExample > 0;
    }
}
