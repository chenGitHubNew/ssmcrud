package com.cyy.crud.service;


import com.cyy.crud.bean.Department;
import com.cyy.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts(){

        List<Department> departments = departmentMapper.selectByExample(null);

        return departments;
    }
}
