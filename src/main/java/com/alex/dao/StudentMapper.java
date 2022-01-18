package com.alex.dao;

import com.alex.bean.Student;

import java.util.List;

public interface StudentMapper {
    public Student getById(int stuId);
    public Student getByIdWithDepartment(int stuId);
    public List<Student> getAll();
    public List<Student> getAllWithDepartment();
    public int insert(Student student);
    public int update(Student student);
    public int delete(int stuId);
}