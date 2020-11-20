<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>员工的CRUD操作</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button id="btnSaveUI" class="btn btn-info" data-toggle="modal">新增</button>
            <button class="btn btn-danger" id="batchDel">批量删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" id="ckAll" onclick="$('input[name=ids]').prop('checked',this.checked);">
                    </th>
                    <th>员工的姓名</th>
                    <th>员工的部门</th>
                    <th>员工的邮箱</th>
                    <th>员工的性别</th>
                    <th>员工的生日</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="myData">

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="pageSpan"></div>
        <div class="col-md-6" id="myPageDetail">

        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增员工信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="empSaveForm">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName" placeholder="输入姓名">
                                <span id="helpBlockName" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="empEmail" class="form-control" id="empEmail"
                                       placeholder="输入邮箱">
                                <span id="helpBlockEmail" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工生日</label>
                            <div class="col-sm-10">
                                <input type="text" name="empBirthday" class="form-control" id="empBirthday"
                                       placeholder="输入生日">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" id="empSex" value="M"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" id="empSex" value="N"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="deptId" id="selectDept"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="btnSave">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myEditModal" tabindex="-1" role="dialog" aria-labelledby="myModaEditlLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModaEditlLabel">修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="empEditFrom">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empEditName"></p>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="empEmail" class="form-control" id="empEditEmail"
                                       placeholder="输入邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工生日</label>
                            <div class="col-sm-10">
                                <input type="text" name="empBirthday" class="form-control" id="empEditBirthday"
                                       placeholder="输入生日">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">员工性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" id="inlineRadio1" value="N"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="empSex" id="inlineRadio2" value="M"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="deptId" id="empEditDept"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="btnEdit">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var rowPage;
    var pageNum;
    $(function () {
        gotoPage(1);
    });

    //跳转页码
    function gotoPage(pg) {
        if ($("#ckAll").prop("checked")) {
            $("#ckAll").prop("checked", false);
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/emp/list",
            data: "pg=" + pg,
            dataType: "json",
            success: function (data) {
                // 1.获取表格数据
                addEmpData(data);
                // 2.获取页面详情
                pageSpan(data);
                // 3.获取页码信息
                addPageDetail(data);
            }
        });
    };

    //添加部门信息
    function addDeptsData(ele) {
        var _selectDept = $(ele);
        _selectDept.empty();
        //发送ajax请求，动态添加部门数据
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/dept/list",
            dataType: "json",
            async: false,
            success: function (data) {
                var _deptData = data.info.departmentList;
                $.each(_deptData, function (index, item) {
                    $("<option></option>").attr("value", item.deptId)
                        .append(item.deptName).appendTo(_selectDept);
                })
            }
        });
    }

    function addPageDetail(data) {
        var _PageDetail = $("#myPageDetail");
        _PageDetail.empty();
        var _nav = $("<nav></nav>").attr("aria-label", "Page navigation");
        var _ul = $("<ul></ul>").addClass("pagination");
        var _isFirstPage = $("<li></li>");
        if (data.info.pageInfo.isFirstPage) {
            _isFirstPage.addClass("disabled").append($("<a></a>").attr("href", "javascript:void(0);").append("首页"));
        } else {
            _isFirstPage.append($("<a></a>").attr("href", "javascript:gotoPage(" + data.info.pageInfo.pageNum + ")").append("首页"));
        }
        var _hasPreviousPage = $("<li></li>");
        if (data.info.pageInfo.hasPreviousPage) {
            var pPage = data.info.pageInfo.pageNum - 1;
            _hasPreviousPage.append($("<a></a>").attr("href", "javascript:gotoPage(" + pPage + ");")
                .attr("aria-label", "Previous").append($("<span></span>").attr("aria-hidden", "true").append("&laquo;")));
        } else {
            _hasPreviousPage.addClass("disabled").append($("<a></a>").attr("href", "javascript:void(0)")
                .attr("aria-label", "Previous").append($("<span></span>").attr("aria-hidden", "true").append("&laquo;")));
        }
        _ul.append(_isFirstPage).append(_hasPreviousPage);
        $.each(data.info.pageInfo.navigatepageNums, function (index, item) {
            var _li = $("<li></li>");
            if (item == data.info.pageInfo.pageNum) {
                _li.addClass("active").append($("<a></a>").attr("href", "javascript:void(0);")
                    .append(item).append($("<span></span>").addClass("sr-only").append("(current)")));
            } else {
                _li.append($("<a></a>").attr("href", "javascript:gotoPage(" + item + ");").append(item));
            }
            _ul.append(_li);
        });
        var _hasNextPage = $("<li></li>");
        if (data.info.pageInfo.hasNextPage) {
            var nPage = data.info.pageInfo.pageNum + 1;
            _hasNextPage.append($("<a></a>").attr("href", "javascript:gotoPage(" + nPage + ")")
                .attr("aria-label", "Next").append($("<span></span>").attr("aria-hidden", "true").append("&raquo;")));
        } else {
            _hasNextPage.addClass("disabled").append($("<a></a>").attr("href", "javascript:void(0)")
                .attr("aria-label", "Next").append($("<span></span>").attr("aria-hidden", "true").append("&raquo;")));
        }

        var _isLastPage = $("<li></li>");
        if (data.info.pageInfo.isLastPage) {
            _isLastPage.addClass("disabled").append($("<a></a>").attr("href", "javascript:void(0)").append("末页"));
        } else {
            _isLastPage.append($("<a></a>").attr("href", "javascript:gotoPage(" + data.info.pageInfo.pages + ")").append("末页"));
        }
        _ul.append(_hasNextPage).append(_isLastPage);
        _nav.append(_ul).appendTo(_PageDetail);
    };

    function pageSpan(data) {
        var _pageNum = data.info.pageInfo.pageNum;
        var _pages = data.info.pageInfo.pages;
        var _pageSize = data.info.pageInfo.pageSize;
        var _total = data.info.pageInfo.total;
        var _div = $("#pageSpan");
        _div.empty();
        _div.append("当前" + _pageNum + "页/总" + _pages + "页，每页显示" + _pageSize
            + "条数据，总共" + _total + "条数据");
        rowPage = _total;
        pageNum = _pageNum;
    };

    function addEmpData(data) {
        var _list = data.info.pageInfo.list;
        var _tbody = $("#myData");
        _tbody.empty();
        $.each(_list,
            function (index, item) {
                var _tr = $("<tr></tr>");

                var _empId = $("<th></th>").attr("scope", "row").append($("<input>")
                    .attr("type", "checkbox").attr("name", "ids").attr("value", item.empId));
                var _empName = $("<td></td>").append(item.empName);
                var _deptName = $("<td></td>").append(
                    item.department.deptName);
                var _empEmail = $("<td></td>").append(item.empEmail);
                var _empSex = $("<td></td>").append(
                    item.empSex == "M" ? "女" : "男");
                var _empBirthday = $("<td></td>").append(
                    item.empBirthday);
                var _btnTd = $("<td></td>");
                var _btnEdit = $("<button></button>").addClass(
                    "btn btn-sm btn-primary btn-edit").attr("aria-label",
                    "Left Align").attr("empId", item.empId).append(
                    $("<span></span>").addClass(
                        "glyphicon glyphicon-pencil").attr(
                        "aria-hidden", "true")).append("修改");
                var _btnDelete = $("<button></button>").addClass(
                    "btn btn-sm btn-danger btn-del").attr("aria-label",
                    "Left Align").attr("empId", item.empId).append(
                    $("<span></span>").addClass(
                        "glyphicon glyphicon-trash").attr(
                        "aria-hidden", "true")).append("删除");
                _btnTd.append(_btnEdit).append(" ").append(_btnDelete);
                _tr.append(_empId).append(_empName).append(_deptName)
                    .append(_empEmail).append(_empSex).append(
                    _empBirthday).append(_btnTd);
                _tbody.append(_tr);
            });
    };

    //校验
    function common_validate(el, state, msg) {
        if ("success" == state) {
            $(el).parent().removeClass("has-error").addClass("has-success");
            $(el).next().text("");
        } else {
            $(el).parent().removeClass("has-success").addClass("has-error");
            $(el).next().text(msg);
        }
    };

    function validateFormFunction() {
        //校验姓名
        var _empName = $("#empName").val();

        var _empNameReg = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6}$)/;
        if (_empNameReg.test(_empName)) {
            common_validate("#empName", "success", "");
        } else {
            common_validate("#empName", "error", "请输入3-16位的字符串或者2-6的中文");
            return false;
        }

        //校验邮箱
        var _empEmail = $("#empEmail").val();

        var _empEmailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (_empEmailReg.test(_empEmail)) {
            common_validate("#empEmail", "success", "");
        } else {
            common_validate("#empEmail", "error", "请输入合法的邮箱格式");
            return false;
        }
        return true;
    };

    $("#empName").change(function () {
        var _empName = $(this).val();
        $.ajax({
            url: '${pageContext.request.contextPath}/emp/edit/checkUserName',
            type: 'GET',
            dataType: 'json',
            data: "empName=" + _empName,
            success: function (data) {
                if (data.code == 500) {
                    $("#btnSave").attr("is-validate", "error");
                    common_validate("#empName", "error", date.info.msg);

                    return;
                }
                if (data.info.flag) {
                    $("#btnSave").attr("is-validate", "error");
                    common_validate("#empName", "error", "当前用户已经存在");
                } else {
                    $("#btnSave").attr("is-validate", "success");
                    common_validate("#empName", "success", "当前用户可以使用");
                }
            }
        });
    });

    //点击新增按钮
    $("#btnSave").click(function () {
        //校验表单
        var flag = validateFormFunction();
        if (!flag) {
            return;
        }
        var _validate = $(this).attr("is-validate");
        if ("error" == _validate) {
            return;
        }
        $.ajax({
            url: '${pageContext.request.contextPath}/emp/edit',
            type: 'post',
            dataType: 'json',
            data: $("#empSaveForm").serialize(),
            success: function (data) {
                if (data.code == 200) {
                    $('#myModal').modal("hide");
                    gotoPage(rowPage);
                }
            }
        });

    });

    function cleraAllContent() {
        $("#empSaveForm").get(0).reset();
        $("#empSaveForm").find("*").removeClass("has-error has-success");
        $("#empSaveForm .help-block").text("");
    }

    //点击新增按钮
    $("#btnSaveUI").click(function () {
        cleraAllContent();
        //弹出对话框，拿到部门信息
        addDeptsData("#selectDept");
        $('#myModal').modal({
            "backdrop": "static"
        });
    });

    //给每个修改按钮绑定一个点击事件
    $(document).on("click", ".btn-edit", function (index, item) {
        var empId = $(this).attr("empid");
        addDeptsData("#empEditDept");
        addEmpByEmpId(empId);
        $("#btnEdit").attr("edit-id", empId)
        $("#myEditModal").modal({
            "backdrop": "static"
        });
    });

    function addEmpByEmpId(empId) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/emp/edit/" + empId,
            dataType: "json",
            async: false,
            success: function (data) {
                var _emp = data.info.employee;
                console.log(_emp);
                $("#empEditName").text(_emp.empName);
                $("#empEditEmail").val(_emp.empEmail);
                $("#empEditBirthday").val(_emp.empBirthday);
                $("#empEditFrom input[name = 'empSex']").val([_emp.empSex]);
                $("#empEditDept").val([_emp.deptId]);
            }
        });
    };

    $("#btnEdit").click(function () {
        var edit_id = $(this).attr("edit-id");
        // 发送ajax请求，进行页面修改的操作
        $.ajax({
            type: "PUT",
            url: "${pageContext.request.contextPath}/emp/edit/" + edit_id,
            data: $("#empEditFrom").serialize(),
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    // 关闭修改窗口
                    $("#myEditModal").modal("hide");
                    // 跳转到当前的页面
                    gotoPage(pageNum);
                }
            }
        });
    });

    //给每个删除按钮绑定一个点击事件
    $(document).on("click", ".btn-del", function (index, item) {
        var empId = $(this).attr("empid");
        var empName = $(this).parents("tr").find("td:eq(0)").text();
        var flag = window.confirm("你确定删除" + empName + "吗?");
        if (flag) {
            delEmpByEmpId(empId);
        } else {
            gotoPage(pageNum);
        }

    });

    function delEmpByEmpId(empId) {
        $.ajax({
            type: "DELETE",
            url: "${pageContext.request.contextPath}/emp/edit/" + empId,
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    gotoPage(pageNum);
                }
            }
        });
    };

    //给每一个复选框绑定一个点击事件
    $(document).on("click", "input[name='ids']", function () {
        var _len = $("input[name='ids").length;
        var _cks = $("input[name='ids']:checked").length;
        if (_len == _cks) {
            $("#ckAll").prop("checked", true);
        } else {
            $("#ckAll").prop("checked", false);
        }
    });

    $("#batchDel").click(function () {
        var _cks = $("input[name='ids']:checked");
        var _len = _cks.length;
        if (_len > 0) {
            var _emps = [];
            var _empIds = [];
            $.each(_cks, function (index, item) {
                _emps.push($(this).parent("th").next("td").text());
                _empIds.push($(this).val());
            });
            if (window.confirm("你确定要删除[" + _emps.join("  ") + "]吗?")) {
                var _emp = _empIds.join(",");
                $.ajax({
                    type: "DELETE",
                    url: "${pageContext.request.contextPath}/emp/edit/" + _emp,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == 200) {

                            gotoPage(pageNum);
                        }
                    }
                });
            }
        } else {
            alert("你至少选中一项数据进行删除")
        }

    });
</script>
</body>
</html>