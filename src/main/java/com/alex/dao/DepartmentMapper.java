package com.alex.dao;

import com.alex.bean.Department;
import com.alex.bean.Student;

import java.util.List;

public interface DepartmentMapper {
    public Department getById(int deptId);
    public List<Department> getAll();
    public int insert(Department department);
    public int update(Department department);
    public int delete(int deptId);
}