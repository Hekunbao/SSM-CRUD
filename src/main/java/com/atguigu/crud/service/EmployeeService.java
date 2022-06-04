package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    public boolean checkUser(String empName){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        if(employeeMapper.countByExample(example) != 0)
            return false;
        return true;
    }

    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public Employee getEmp(Integer empId){
        return employeeMapper.selectByPrimaryKeyWithDept(empId);
    }

    public void updateEmpById(Integer empId, Employee employee){
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdEqualTo(empId);
        employeeMapper.updateByExampleSelective(employee, example);
    }

    public void deleteEmpById(Integer empId){
        employeeMapper.deleteByPrimaryKey(empId);
    }

    public void deleteBatch(List<Integer> idList){
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdIn(idList);
        employeeMapper.deleteByExample(example);
    }
}
