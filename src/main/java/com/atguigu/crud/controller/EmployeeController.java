package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(name = "page", defaultValue = "1")String page){
        PageHelper.startPage(Integer.parseInt(page), 5);
        List<Employee> employeeList = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employeeList,5);

        return Msg.success().add("pageInfo", pageInfo);
    }

//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(name = "page", defaultValue = "1")String page, Model model){
        PageHelper.startPage(Integer.parseInt(page), 5);
        List<Employee> employeeList = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employeeList,5);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam(name="empName")String empName){
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            //用户名必须是6-16位数字和字母的组合或者2-5位中文
            return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }
    @PostMapping("/emp")
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String, Object> fieldErrors = new HashMap<>();

            for(FieldError fieldError : result.getFieldErrors()){
                fieldErrors.put(fieldError.getField(), fieldError.getDefaultMessage());
            }

            return Msg.fail().add("fieldErrors", fieldErrors);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }
    @GetMapping("/emp/{id}")
    @ResponseBody
    public Msg getEmp(@PathVariable Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("emp", emp);
    }

    @PutMapping("/emp/{id}")
    @ResponseBody
    public Msg updateEmp(@PathVariable Integer id, Employee employee){
        employeeService.updateEmpById(id, employee);
        return Msg.success();
    }

    @DeleteMapping("/emp/{ids}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable String ids){
        if(ids.contains("-")){
            List<Integer> idList = new ArrayList<>();
            String[] idsStr = ids.split("-");
            for(String id: idsStr){
                idList.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(idList);
        }else {
            employeeService.deleteEmpById(Integer.parseInt(ids));
        }
        return Msg.success();
    }
}
