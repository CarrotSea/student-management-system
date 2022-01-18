import com.alex.bean.Student;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springMVC.xml"})
public class MVCTest {

    @Autowired
    WebApplicationContext webApplicationContext;
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Test
    public void testPage() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/students").param("pageNumber", "5"))
                                .andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("Current index: " + pageInfo.getPageNum());
        System.out.println("Total number of indexes: " + pageInfo.getPages());
        System.out.println("Total number of pages: " + pageInfo.getTotal());
        System.out.println("Number of indexes per page");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i: nums) {
            System.out.print(" " + i);
        }
        List<Student> list = pageInfo.getList();
        for (Student s : list) {
            System.out.println("ID: " + s.getStuId() + "==>Name: " + s.getStuName());
        }
    }
}
