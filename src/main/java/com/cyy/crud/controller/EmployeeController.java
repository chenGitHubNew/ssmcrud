package com.cyy.crud.controller;


import com.cyy.crud.bean.Employee;
import com.cyy.crud.bean.Msg;
import com.cyy.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public  Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //紧跟查询
        List<Employee> list = employeeService.getAll();
        //封装的分页的详细信息，包括我们查询出来的数据
        PageInfo page  = new PageInfo(list,5);
        System.out.println("aaaaa");
        //返回PageInfo的json数据
        return Msg.success().add("pageInfo",page);
    }
    //按照主键删除员工信息
    /*@ResponseBody
    @RequestMapping(value = "/delEmp/{empId}",method = RequestMethod.DELETE)
    public Msg delEmp(@PathVariable("empId")Integer id){
        int i = employeeService.delEmp(id);
            return Msg.success();
    }*/

    //批量删除与单个删除二合一
    @ResponseBody
    @RequestMapping(value = "/delEmp/{empIds}",method = RequestMethod.DELETE)
    public Msg delEmp(@PathVariable("empIds")String ids){
        if(ids.contains("-")){
            List<Integer> list = new ArrayList<>();
            String[] str =ids.split("-");
            for(String string: str) {
                list.add(Integer.valueOf(string));
            }
            employeeService.deleteBatch(list);
        }
        else {
            int i = employeeService.delEmp(Integer.valueOf(ids));
        }
        return Msg.success();

    }

    //更新员工信息
    @RequestMapping(value = "/updateEmp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();

    }

    //使用Ajax获取单个员工信息
    @RequestMapping(value = "/getEmp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){
        Employee emp = employeeService.getEmp(id);
        return  Msg.success().add("emp",emp);

    }


    //旧用法无数据校验
    /*@RequestMapping(value = "/saveEmp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        employeeService.saveEmp(employee);
        return Msg.success();

    }*/



    //新用法加入数据校验
    @RequestMapping(value = "/saveEmp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(/*数据校验*/@Valid Employee employee, /*封装校验结果*/BindingResult result){

        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<>();

            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError: fieldErrors){
                System.out.println("错误字段："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    //校验用户名是否可用
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        //判断用户名是否合法
        String regEmpName = "(^[a-zA-Z][a-zA-Z0-9_-]{6,15}$)|(^[\\u4e00-\\u9fa5]{2,8}$)";
        if(!empName.matches(regEmpName)){
            return Msg.fail().add("va_msg","用户名只能是2-8位中文或6-16以字母开头，字母数字下划线");
        }
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success().add("va_msg","用户名可用");
        }
        else {
            return Msg.fail().add("va_msg","用户名已使用");
        }
    }



    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //紧跟查询
        List<Employee> list = employeeService.getAll();
        //封装的分页的详细信息，包括我们查询出来的数据
        PageInfo page  = new PageInfo(list);
        System.out.println("aaaaa");
        model.addAttribute("pageInfo",page);
        return "list";
    }
}
