package com.edu.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Department;
import com.edu.bean.Message;
import com.edu.service.DepartmentService;

@Controller
@RequestMapping(value = "/dept")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public Message list() {
        List<Department> departmentList = departmentService.getAll();
        return Message.success().addInfo("departmentList", departmentList);
    }
}
