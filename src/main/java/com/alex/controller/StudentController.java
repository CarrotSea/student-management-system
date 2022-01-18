package com.alex.controller;

import com.alex.bean.Msg;
import com.alex.bean.Student;
import com.alex.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    @RequestMapping("/students")
    @ResponseBody
    public Msg getStudentsWithJson(@RequestParam(value="pn", defaultValue = "1")Integer pn, Model model) {
        PageHelper.startPage(pn, 5);
        List<Student> students = studentService.getAllWithDeparment();
        PageInfo page = new PageInfo(students, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value="/student", method=RequestMethod.POST)
    @ResponseBody
    public Msg saveStudent(Student student) {
        studentService.saveStudent(student);
        return Msg.success();
    }

    @RequestMapping(value="/student/{id}", method=RequestMethod.GET)
    @ResponseBody
    public Msg getStudent(@PathVariable("id")Integer id) {
        Student student = studentService.getStudent(id);
        return Msg.success().add("student", student);
    }

    @RequestMapping(value="/student/{stuId}", method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateStudent(Student student) {
        System.out.println(student);
        studentService.updateStudent(student);
        return Msg.success();
    }

    @RequestMapping(value="/student/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteStudent(@PathVariable("id")Integer id) {
        studentService.deleteStudent(id);
        return Msg.success();
    }
}
