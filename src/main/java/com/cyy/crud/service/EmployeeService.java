package com.cyy.crud.service;


import com.cyy.crud.bean.Employee;
import com.cyy.crud.bean.EmployeeExample;
import com.cyy.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;


    public List<Employee> getAll(){
        List<Employee> employees = employeeMapper.selectByExampleWithDepartment(null);
        return employees;
    }

    public void   saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public boolean checkUser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long employees = employeeMapper.countByExample(employeeExample);
        //==0 即为true，表示没有重复数据，该用户名可用
        return employees ==0;
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        //按照主键有选择地更新
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public int delEmp(Integer id) {
        int i = employeeMapper.deleteByPrimaryKey(id);
        return i;
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample employeeExample= new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
