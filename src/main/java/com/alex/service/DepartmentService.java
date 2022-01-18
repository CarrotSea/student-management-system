package com.alex.service;

import com.alex.bean.Department;
import com.alex.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepartments() {
        List<Department> departments = departmentMapper.getAll();
        return departments;
    }
}
