<%--
  Created by IntelliJ IDEA.
  User: shawn
  Date: 2022/5/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setAttribute("APP_PATH", request.getContextPath());

%>
<html>
<head>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>CRUD QUREY</title>
</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h1>SSM-CRUD</h1>
        </div>
        <div class="col-md-4 col-md-offset-8" >
            <button class="btn btn-primary" id="btn_addNew">
                addNew
            </button>
            <button class="btn btn-danger" id="emp_del_all_btn">
                delete
            </button>
        </div>
    </div>
    <div class="row">
        <table class="table table-striped table-hover" id="emps_tbl">
            <thead>
            <tr>
                <th><input type="checkbox" id="check_all"></th>
                <th>#</th>
                <th>empName</th>
                <th>email</th>
                <th>gender</th>
                <th>depName</th>
                <th>action</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
    <div class="row">
        <div class="col-md-6" id="page_info">

        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation" id="page_nav">
            </nav>
        </div>
    </div>

</div>
<div class="modal fade" tabindex="-1" role="dialog" id="modal_addNew_emp">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form  class="form-horizontal">
                    <div class="form-group">
                        <label for="emp_add_empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="emp_add_empName" name="empName" placeholder="aaabbb">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_add_email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="emp_add_email" name="email" placeholder="aaa@aaaa.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <fieldset class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" for="emp_add_genderMale">
                                <input type="radio" name="gender" checked value="M" id="emp_add_genderMale">Male
                            </label>
                            <label class="radio-inline" for="emp_add_genderFemale">
                                <input type="radio" name="gender" value="F" id="emp_add_genderFemale">Female
                            </label>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <label for="emp_add_depName" class="control-label col-sm-2">depName</label>
                        <div class="col-sm-4">
                            <select  class="form-control" name="dId" id="emp_add_depName">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_add_btn">Save</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal_update_emp">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form  class="form-horizontal">
                    <div class="form-group">
                        <label for="emp_update_empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="emp_update_empName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_update_email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="emp_update_email" name="email" placeholder="aaa@aaaa.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <fieldset class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" for="emp_update_genderMale">
                                <input type="radio" name="gender" checked value="M" id="emp_update_genderMale">Male
                            </label>
                            <label class="radio-inline" for="emp_update_genderFemale">
                                <input type="radio" name="gender" value="F" id="emp_update_genderFemale">Female
                            </label>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <label for="emp_update_depName" class="control-label col-sm-2">depName</label>
                        <div class="col-sm-4">
                            <select  class="form-control" name="dId" id="emp_update_depName">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script type="text/javascript">
    var totalPage,currentPageNum;

    $(function(){
        to_page(1);
    });

    function to_page(page){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"page="+page,
            type: "GET",
            success:function (result){
                // console.log(result);
                build_emps_tbl(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function build_emps_tbl(result){
        $("#emps_tbl tbody").empty();

        $.each(result.extend.pageInfo.list,function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var emailTd = $("<td></td>").append(item.email);
            var genderTd = $("<td></td>").append(item.gender == "M"? "male":"female");
            var depNameTd = $("<td></td>").append(item.dept.depName);

            var buttonTd = $("<td></td>");

            var editButton = $("<button></button>").addClass("btn btn-info edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("edit").attr("edit-id", item.empId);
            var deleteButton = $("<button></button>").addClass("btn btn-danger delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("delete").attr("delete-id", item.empId);

            buttonTd.append(editButton).append(" ").append(deleteButton);

            var empTr = $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(emailTd).append(genderTd).append(depNameTd).append(buttonTd).appendTo( $("#emps_tbl tbody"));

            // $("#emps_tbl tbody").append(empTr);
        })
    }

    function build_page_info(result){
        $("#page_info").empty();
        $("#page_info").append("current page : " + result.extend.pageInfo.pageNum + ", total pages : " + result.extend.pageInfo.pages + ", total records : " +  result.extend.pageInfo.total);

        totalPage =  result.extend.pageInfo.total;
        currentPageNum = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        $("#page_nav").empty();

        var pageUl = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("first page"));
        var previousLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("<<")));

        pageUl.append(firstPageLi).append(previousLi);

        if(result.extend.pageInfo.pageNum != 1){
            firstPageLi.click(function () {
                    to_page(1);
            });
            previousLi.click(function () {
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }else {
            firstPageLi.addClass("disabled");
            previousLi.addClass("disabled");
        }

        $.each(result.extend.pageInfo.navigatepageNums, function (index, page_Num) {
            var pageLi = $("<li></li>").append($("<a></a>").append(page_Num));
            if(page_Num == result.extend.pageInfo.pageNum){
                pageLi.addClass("active");
            }
            pageLi.click(function () {
                to_page(page_Num);
            });
            pageLi.appendTo(pageUl);
        });

        var nextLi = $("<li></li>").append($("<span></span>").append(">>"));
        var lastPageLi =  $("<li></li>").append($("<a></a>").append("last page"));

        pageUl.append(nextLi).append(lastPageLi);

        if(result.extend.pageInfo.pageNum != result.extend.pageInfo.pages){
            nextLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }else {
            nextLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }

        $("#page_nav").append(pageUl);

    }

    $("#btn_addNew").click(function (){

        form_reset($("#modal_addNew_emp form"));
        getDepts($("#modal_addNew_emp select"));
        $("#modal_addNew_emp").modal({
            backdrop: "static"
        });
    });

    function form_reset(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    function getDepts(ele){
        ele.empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success:function (result) {
                $.each(result.extend.departmentList, function (index, item){
                    $("<option></option>").val(item.depId).append(item.depName).appendTo(ele);
                });
            }
        });
    }

    $("#emp_add_btn").click(function (){
        // if(!validate_add_form){
        //     return false;
        // }

        if($("#emp_save_btn").attr("ajax-va") == "error"){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#modal_addNew_emp form").serialize(),
            success: function(result){
                if(result.code="100"){
                    $("#modal_addNew_emp").modal('hide');
                    to_page(totalPage);
                }else{
                    if(undefined != result.extend.fieldErrors.empName){
                        show_validate_msg($("#emp_add_empName"), "200", result.extend.fieldErrors.empName);
                    }
                    if(undefined != result.extend.fieldErrors.email){
                        show_validate_msg($("#emp_add_email"), "200", result.extend.fieldErrors.empName);
                    }
                }
            }
        });
    });


    function validate_add_form (){
        var empName = $("#emp_add_empName");
        var nameRegex = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(nameRegex.test(empName.val())){
            show_validate_msg(empName, "100", "");
        }else {
            show_validate_msg(empName, "200", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }

        var email = $("#emp_add_email");
        var emailRegex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(emailRegex.test(email.val())){
            show_validate_msg(email, "100", "");
        }else {
            show_validate_msg(email, "200", "邮箱格式不正确");
            return false;
        }
    }
    function show_validate_msg(ele, status, msg) {
        ele.parent().removeClass("has-success has-error");
        ele.find(".help-block").text("");
        if(status == "100"){
            ele.parent().addClass("has-success");
            ele.next("span").text(msg);
        }else {
            ele.parent().addClass("has-error");
            ele.next("span").text(msg);
        }

    }

    $("#emp_add_empName").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            type:"GET",
            data: "empName="+empName,
            success:function(result){
                if(result.code == "100"){
                    show_validate_msg($("#emp_add_empName"), result.code, result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","success");
                }else {
                    show_validate_msg($("#emp_add_empName"), result.code, result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }

            }
        });
    });

    $(document).on("click", ".edit_btn", function () {
        var empId = $(this).attr("edit-id");
        getDepts($("#modal_update_emp select"));
        $.ajax({
            url: "${APP_PATH}/emp/"+empId,
            type: "GET",
            success: function (result){
                $("#emp_update_empName").text(result.extend.emp.empName);
                $("#modal_update_emp input[name=email]").val(result.extend.emp.email);
                $("#modal_update_emp input[name=gender]").val([result.extend.emp.gender]);
                $("#modal_update_emp select").val([result.extend.emp.dId]);
                $("#emp_update_btn").attr("empId", result.extend.emp.empId);
                $("#modal_update_emp").modal({
                    backdrop: "static"
                });
            }
        });
    });

    $("#emp_update_btn").click(function () {
        var email = $("#emp_update_email");
        var emailRegex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(emailRegex.test(email.val())){
            show_validate_msg(email, "100", "");
        }else {
            show_validate_msg(email, "200", "邮箱格式不正确");
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/emp/"+$(this).attr("empId"),
            type: "PUT",
            data: $("#modal_update_emp form").serialize(),
            success: function (result){
                // alert(result.msg);
                $("#modal_update_emp").modal("hide");
                to_page(currentPageNum);
            }
        });
    })

    $(document).on("click", ".delete_btn", function () {
        var empId = $(this).attr("delete-id");
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("Do you want to delete the employee " + empName)){
            $.ajax({
                url: "${APP_PATH}/emp/"+empId,
                type: "DELETE",
                success: function (result){
                    alert(result.msg);
                    to_page(currentPageNum);
                }
            });
        }


    });

    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    $("#emp_del_all_btn").click(function () {
        var empNameStr = "";
        var delIdStr = "";
        $.each($(".check_item:checked"), function () {
            empNameStr += $(this).parents("tr").find("td:eq(2)").text() + ",";
            delIdStr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNameStr.substring(0, empNameStr.length -1);
        delIdStr.substring(0, delIdStr.length -1);
        if(confirm("Do you want to delete the employees " + empNameStr)){
            $.ajax({
                url: "${APP_PATH}/emp/"+delIdStr,
                type: "DELETE",
                success: function (result){
                    alert(result.msg);
                    to_page(currentPageNum);
                }
            });
        }
    });
</script>
</body>
</html>
