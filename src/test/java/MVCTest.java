import com.atguigu.crud.bean.Employee;
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
import java.util.Map;

@ContextConfiguration(locations={"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/DispatcherServlet-servlet.xml"})
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
public class MVCTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @Before
    public void initMVC(){
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testMVC() throws Exception {

        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("page", "5")).andReturn();

        MockHttpServletRequest request = result.getRequest();

        System.out.println("page:" +  request.getParameter("page"));

        Map<String, Object> model = result.getModelAndView().getModel();

        PageInfo pageInfo = (PageInfo)model.get("pageInfo");

        System.out.println("Total record: " + pageInfo.getTotal());

        System.out.println("lastPage :"+ pageInfo.getNavigateLastPage());

        System.out.println("firstPage :"+ pageInfo.getNavigateFirstPage());

        System.out.println("NavigatePages :" + pageInfo.getNavigatePages());


        int[] navigatePageNums = pageInfo.getNavigatepageNums();

        List<Employee> employeeList = (List<Employee>)model.get("employeeList");
        for(Employee employee : employeeList){
            System.out.println(employee);
        }

        for(int i :  navigatePageNums){
            System.out.printf(" "+i);
        }

    }
}
