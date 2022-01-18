package com.alex.controller;

import com.alex.bean.Department;
import com.alex.bean.Msg;
import com.alex.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/departments")
    @ResponseBody
    public Msg getDepartmentsWithJson() {
        List<Department> departments = departmentService.getDepartments();
        return Msg.success().add("departments", departments);
    }
}
