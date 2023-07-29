package com.alex.service;

import com.alex.bean.Student;
import com.alex.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// Class for student services
@Service
public class StudentService {

    @Autowired
    StudentMapper studentMapper;

    public List<Student> getAllWithDeparment() {
        return studentMapper.getAllWithDepartment();
    }

    public void saveStudent(Student student) {
        studentMapper.insert(student);
    }

    public Student getStudent(Integer id) {
        Student student = studentMapper.getById(id);
        return student;
    }

    public void updateStudent(Student student) {
        studentMapper.update(student);
    }

    public void deleteStudent(Integer id) {
        studentMapper.delete(id);
    }
}
