package com.edu.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExtend;
import com.edu.mapper.EmployeeExtendMapper;
import com.edu.mapper.EmployeeMapper;
import com.edu.util.UUIDUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class EmployeeTest {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private EmployeeExtendMapper employeeExtendMapper;
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void test() {
        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            Employee employee = new Employee();
            employee.setEmpName(UUIDUtils.getCode().substring(1, 6));
            employee.setEmpEmail(UUIDUtils.getCode().substring(1, 11) + "qq.com");
            employee.setEmpBirthday(new Date());
            employee.setEmpSex("男");
            employee.setDeptId(1);
            employeeMapper.insertSelective(employee);
        }
    }

    @Test
    public void test1() {
        EmployeeExtend employee = employeeExtendMapper.selectDeptByPrimaryKey(2);
        System.out.print(employee.getEmpId() + "," + employee.getEmpName() + "," + employee.getDeptId());

    }

    @Test
    public void test2() {
        List<EmployeeExtend> employeeList = employeeExtendMapper.selectDeptByExample(null);
        employeeList.forEach((employee) -> {
            System.out.println(employee.getEmpId() + "," + employee.getEmpName() + "," + employee.getDepartment().getDeptName());
        });

    }
}
