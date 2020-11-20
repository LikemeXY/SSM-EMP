package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Department;
import com.edu.bean.EmployeeExtend;
import com.edu.mapper.DepartmentMapper;
import com.edu.mapper.EmployeeExtendMapper;
import com.edu.service.DepartmentService;
import com.edu.service.EmployeService;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getAll() {

        return departmentMapper.selectByExample(null);
    }


}
