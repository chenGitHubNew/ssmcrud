package com.cyy.crud.text;

import com.cyy.crud.bean.Department;
import com.cyy.crud.bean.Employee;
import com.cyy.crud.dao.DepartmentMapper;
import com.cyy.crud.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Test
    public void testCrud(){
        System.out.println(departmentMapper);
        departmentMapper.insertSelective(new Department(null,"开发部"));

//        employeeMapper.insertSelective(new Employee(null,"陈琳","1","chenlin@qq.com",90,null));
    }

}
