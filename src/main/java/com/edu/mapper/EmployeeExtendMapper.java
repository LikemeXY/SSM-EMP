package com.edu.mapper;

import com.edu.bean.EmployeeExample;
import com.edu.bean.EmployeeExtend;

import java.util.List;

public interface EmployeeExtendMapper {
    //带有部门信息的多条件查询
    List<EmployeeExtend> selectDeptByExample(EmployeeExample example);

    //带有部门的信息的根据主键查询
    EmployeeExtend selectDeptByPrimaryKey(Integer empId);

    //批量删除
    void batchDel(int[] ids);
}