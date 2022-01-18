import com.alex.bean.Department;
import com.alex.bean.Student;
import com.alex.dao.DepartmentMapper;
import com.alex.dao.StudentMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testStudentGetById() {
        System.out.println(studentMapper.getById(1));
    }
    @Test
    public void testStudentGetAll() {
        System.out.println(studentMapper.getAll());
    }
    @Test
    public void testStudentGetByIdWithDepartment() {
        System.out.println(studentMapper.getByIdWithDepartment(1));
    }
    @Test
    public void testStudentInsert() {
        Student student = new Student(1, "alex cao", "M", "alex.cao@my.wheaton.edu", 1);
        studentMapper.insert(student);
    }
    @Test
    public void testStudentUpdate() {
        Student student = new Student(1, "alex cao", "M", "qifang.cao1999@gmail.com", 1);
        studentMapper.update(student);
    }
    @Test
    public void testStudentDelete() {
        studentMapper.delete(1006);
    }

    @Test
    public void testDepartmentGetById(){ System.out.println(departmentMapper.getById(1));};
    @Test
    public void testDepartmentGetAll() { System.out.println(departmentMapper.getAll()); }
    @Test
    public void testDepartmentInsert() {
        Department department = new Department(1, "Computer Science");
        departmentMapper.insert(department);
    }
    @Test
    public void testDepartmentUpdate() {
        Department department = new Department(1, "Music");
        departmentMapper.update(department);
    }
    @Test
    public void testDepartmentDelete() {
        departmentMapper.delete(2);
    }

    @Test
    public void test() {
        List<Student> students = studentMapper.getAllWithDepartment();
        for (Student s: students) {
            System.out.println(s);
        }
    }
}
