package com.edu.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExtend;
import com.edu.bean.Message;
import com.edu.service.EmployeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/emp")
public class EmployeeController {
    @Autowired
    private EmployeService employeService;

    final static Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    //	@RequestMapping(value="/list",method= {RequestMethod.GET,RequestMethod.POST})
//	public String list(@RequestParam(name="pg",defaultValue="1") int pg,Model model) {
//		PageHelper.startPage(pg,6);
//		List<EmployeeExtend> employees = employeService.getAll();		
//		PageInfo pageInfo = new PageInfo(employees,6);
//		model.addAttribute("pageInfo", pageInfo);
//		return "list";
//	}
    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public Message list(@RequestParam(name = "pg", defaultValue = "1") int pg) {
        logger.debug("调用list方法");
        //pg代表页码   6代表每页显示的信息条数
        PageHelper.startPage(pg, 6);
        //用一个带部门信息的员工类接受查询出来的信息
        List<EmployeeExtend> employees = employeService.getAll();
        PageInfo pageInfo = new PageInfo(employees, 6);
        return Message.success().addInfo("pageInfo", pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public Message save(@Validated EmployeeExtend employeeExtend, BindingResult result) {
        if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            Map<String, Object> errosMap = new HashMap<String, Object>();
            fieldErrors.forEach((error) -> {
                errosMap.put(error.getField(), error.getDefaultMessage());
            });
            return Message.fail().addInfo("error", errosMap);
        }

        employeService.saveEmp(employeeExtend);
        return Message.success();
    }

    @ResponseBody
    @RequestMapping(value = "/edit/{empId}", method = RequestMethod.GET)
    public Message editUI(@PathVariable("empId") int empId) {
        Employee employee = employeService.getById(empId);
        return Message.success().addInfo("employee", employee);
    }

    @ResponseBody
    @RequestMapping(value = "/edit/{empId}", method = RequestMethod.PUT)
    public Message edit(Employee employee) {
        employeService.update(employee);
        return Message.success();
    }

    @ResponseBody
    @RequestMapping(value = "/edit/{empId}", method = RequestMethod.DELETE)
    public Message del(@PathVariable("empId") String empId) {
        if (empId.contains(",")) {
            String[] empIds = empId.split(",");
            for (int i = 0; i < empIds.length; i++) {
                employeService.del(Integer.valueOf(empIds[i]));
            }
        } else {
            employeService.del(Integer.valueOf(empId));
        }

        return Message.success();
    }

    @ResponseBody
    @RequestMapping(value = "/edit/checkUserName", method = RequestMethod.GET)
    public Message checkUserName(String empName) {
        //校验用户名是否符合格式要求
        String reg = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)";
        if (empName.matches(reg)) {
            Message.fail().addInfo("msg", "请输入3-16位的字符串或者2-6的中文");
        }
        boolean flag = employeService.checkUserName(empName);
        return Message.success().addInfo("flag", flag);

    }
}
