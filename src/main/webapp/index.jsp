<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: 他人使用
  Date: 2022/2/12
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <title>员工列表</title>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%--编辑员工模态框--%>
<div class="modal fade " id="updateEmpModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工编辑</h4>
            </div>
            <div class="modal-body">
                <%--需要编辑员工信息的表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static">email@example.com</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input" placeholder="cyy@qq.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>

                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="dId" >
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"  id="emp_update_btn">编辑保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

        <%--添加员工模态框--%>
        <div class="modal fade " id="addEmpModal" tabindex="-1" role="dialog" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">员工添加</h4>
                    </div>
                    <div class="modal-body">
                        <%--需要添加员工信息的表单--%>
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"  name="empName" id="empName_add_input" placeholder="empName">
                                    <span  class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="email" id="email_add_input" placeholder="cyy@qq.com">
                                    <span  class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">gender</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                    </label>
                                </div>

                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-5">
                                    <select class="form-control" name="dId" >
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary"  id="emp_add_btn">添加保存</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="container">
            <%--标题--%>
            <div class="row">
                <div class="col-lg-12">
                    <h1>SSM-CRUD</h1>
                </div>
            </div>
                <%--按钮--%>
             <div class="row">
                 <div class="col-xs-4 col-xs-offset-8">
                    <button class="btn btn-primary" id="emp_add_modal_btn" >新增</button>
                    <button class="btn btn-danger i" id="emp_del_all_btn">删除</button>
                 </div>
            </div>
                <%--显示表格数据--%>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="emps_table">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th>#</th>
                                <th>序号</th>
                                <th>empName</th>
                                <th>gender</th>
                                <th>email</th>
                                <th>deptName</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>

                    </table>
                </div>
            </div>
             <%--显示分页信息--%>
            <div class="row">
                <%--分页文字信息--%>
                <div class="col-xs-6" id="page_info_area">

                </div>
                    <%--分页条信息--%>
                <div class="col-xs-6" id="page_info_nav">
                    <nav aria-label="Page navigation" >
                    </nav>
                </div>
            </div>
        </div>
<script type="text/javascript">
    var total,currentPage;
    $(function () {
        to_page(1)
    });
    function to_page(pn) {
        $.ajax({
            url:"emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //员工信息
                build_emps_table(result);
                //分页信息
                build_page_info(result);
                //分页条
                build_page_nav(result)
            }

        })

    }
    function build_emps_table(result) {
        $('#check_all').prop("checked",false);

        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        var i=0;
        $.each(emps,function (index,item) {
            i++;
            var checkboxTd = $("<td></td>").append("<input type='checkbox' class='check_item'>");
            var empNum = $("<td></td>").append(i);
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptName = $("<td></td>").append(item.department.deptName);


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").attr("emp_id",item.empId)
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var delBtn = $("<button></button>").addClass("tn btn-danger btn-sm delete_btn").attr("emp_id",item.empId)
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var opption = $("<td></td>").append(editBtn).append(" ").append(delBtn);

            $("<tr></tr>")
                .append(checkboxTd)
                .append(empNum)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptName)
                .append(opption)
                .appendTo("#emps_table tbody");
        })
    }
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，" +
                "总共"+result.extend.pageInfo.pages+"页，" +
                "总记录"+result.extend.pageInfo.total);
        total = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        $("#page_info_nav nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>")
            .append($("<a></a>").attr("href","#").attr("aria-label","Previous")
                .append($("<span></span>").append("&laquo;").attr("aria-hidden","true")));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }
        else {
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        var nextPageLi = $("<li></li>")
            .append($("<a></a>").attr("href","#").attr("aria-label","Next")
                .append($("<span></span>").append("&raquo;").attr("aria-hidden","true")));
        if(result.extend.pageInfo.hasNextPage == false){
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        }
        else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1)
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_info_nav nav");

    }
    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //弹出添加员工信息框
    $("#emp_add_modal_btn").click(function () {
        reset_form("#addEmpModal form");
        getDepts("#addEmpModal select");
        $('#addEmpModal').modal({
            backdrop:"static"
        });

    });
    //当添加员工信息时回显部门的信息  添加与编辑通用
    function getDepts(ele) {
        //每次获取都要清除上次数据
        $(ele).empty();
        $.ajax({
            url:"depts",
            type:"GET",
            success:function (result) {
                $('#addEmpModal select').empty();
                $.each(result.extend.depts,function() {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    //使用Ajax添加员工信息
    $('#emp_save_btn').click(function () {
        console.log($('#addEmpModal form').serialize());
        /*使前端校验失败*/
        /*if(!validate_add_form()){
            return false;
        };*/
        if($(this).attr("ajax-va") == "error"){
            return false;
        };
        $.ajax({
            url:"saveEmp",
            type:"POST",
            data:$('#addEmpModal form').serialize(),
            success:function (result) {
                if(result.code == 200){
                    to_page(total);
                    $('#addEmpModal').modal('hide')
                }
                else {
                    if(undefined != result.extend.errorFields.email){
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.empName){
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                }

            }
        })
    });

    //对添加员工信息进行数据验证
    function validate_add_form() {
        var empName = $('#empName_add_input').val();
        var regName = /(^[a-zA-Z][a-zA-Z0-9_-]{6,15}$)|(^[\u4e00-\u9fa5]{2,8}$)/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_add_input","error","用户名可以是2-8位中文或6-16以字母开头，字母数字下划线");
            return false;
        }
        else {
            show_validate_msg("#empName_add-input","success","校验正确");
        }

        var email = $('#email_add_input').val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!regEmail.test(email)){
           show_validate_msg("#email_add_input","error","邮箱格式错误，例：ccy@qq.com");
            return false
        } else {
           show_validate_msg("#email_add_input","success","校验正确");
        }
        return true;
    }

    //校验用户名是否可用
    $('#empName_add_input').change(function () {
        console.log("aaa");
        var empName = this.value;
        $.ajax({
            url:"checkUser",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if (result.code==200){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $('#emp_save_btn').attr("ajax-va","success")
                }
                else {
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $('#emp_save_btn').attr("ajax-va","error");
                }
            }
        })
    });


    //处理校验信息  通用方法
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-error");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }
        else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }


    //弹出或开启员工编辑模态框
    $(document).on("click",".edit_btn",function () {
        var empId = $(this).attr("emp_id");

        //把员工的id传给更新保存按钮
        $('#emp_update_btn').attr("edit_id",empId);
        getEmp(empId);
        getDepts("#updateEmpModal select");
        $('#updateEmpModal').modal({
            backdrop:"static"
        });


    });

    function getEmp(id) {
        $.ajax({
            url:"getEmp/"+id,
            type:"GET",
            success:function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $('#email_update_input').val(empData.email);
                $('#updateEmpModal input[name=gender]').val([empData.gender]);
                $('#updateEmpModal select').val([empData.dId])

            }
        })

    }
    //点击更新，更新员工信息
    $('#emp_update_btn').click(function () {
        //验证邮箱是否合法
        //1.邮箱验证
        var email = $('#email_update_input').val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式错误，例：ccy@qq.com");
            return false
        } else {
            show_validate_msg("#email_update_input","success","校验正确");
        }

        $.ajax({
            url:"updateEmp/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$('#updateEmpModal form').serialize(),
            success:function (result) {
                if(result.code == 200){
                    $('#updateEmpModal').modal("hide");
                    to_page(currentPage);
                }

                else {
                    if(undefined != result)
                    show_validate_msg("#")
                }



            }
        })
    });

    //点击单个删除
    $(document).on("click",".delete_btn",function () {
        var empName =  $(this).parents("tr").find("td:eq(3)").text();
        var empId = $(this).attr("emp_id");
        if(confirm("确认删除，【"+empName+"】吗?")){
            $.ajax({
                url:"delEmp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }

    });
    //完成点击全选
    $('#check_all').click(function () {
        /*$(this).prop("checked")*/ //返回值是true或false，如果选中位true，否则为false
        // alert($(this).prop("checked"));
       $('.check_item').prop("checked",$(this).prop("checked")) ;
    });

    $(document).on("click",".check_item",function () {
        //判断当权checked是否已选满
        if($('.check_item:checked').length == $('.check_item').length){
            $('#check_all').prop("checked",true);
        }
        else {
            //同样成立
            /*$('#check_all').removeAttr("checked");*/
            $('#check_all').prop("checked",false);
        }
    });

    //批量删除
    $('#emp_del_all_btn').click(function () {
        var empNames="";
        var empIds="";
        $.each($('.check_item:checked'),function () {
            empNames += $(this).parents("tr").find("td:eq(3)").text()+",";
            empIds +=$(this).parents("tr").find("td:eq(2)").text()+"-";

        });
        empNames = empNames.substring(0,empNames.length-1);
        empIds = empIds.substring(0,empIds.length-1);
        if(confirm("确认删除，【"+empNames+"】吗？")){
               $.ajax({
                   url:"delEmp/"+empIds,
                   type:"DELETE",
                   success:function (result) {
                       alert(result.msg);
                       to_page(currentPage);
                   }
               })
        }
    })






</script>
</body>
</html>
