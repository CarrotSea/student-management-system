<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Student List</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/boostrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/boostrap/js/bootstrap.min.js"></script>

</head>
<body>
<div class="modal fade" id="studentUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Student Name</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" name="stuName" id="stuName_update_input" placeholder="student name">
                            <div></div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input" placeholder="email@gmail.com">
                            <div></div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Gender</label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender1_update_input" value="M" checked>
                                <label class="form-check-label" for="gender1_update_input">
                                    Male
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender2_update_input" value="F">
                                <label class="form-check-label" for="gender2_update_input">
                                    Female
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-select" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="student_update_btn">Update</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="studentAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Student Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stuName" id="stuName_add_input" placeholder="student name">
                            <div></div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_add_input" placeholder="email@gmail.com">
                            <div></div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Gender</label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender1_add_input" value="M" checked>
                                <label class="form-check-label" for="gender1_add_input">
                                    Male
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="gender2_add_input" value="F">
                                <label class="form-check-label" for="gender2_add_input">
                                    Female
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-3 col-form-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-select" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="student_save_btn">Save</button>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="studentDeleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row mb-3">
                        <label class="col-sm-4 col-form-label">Student Id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="stuId" id="student_delete_input" placeholder="student id">
                            <div></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="student_delete_btn">Delete</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>Student-Management-System</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 offset-md-8">
            <button class="btn btn-primary" id="student_add_modal_btn">Add</button>
            <button class="btn btn-danger" id="student_delete_modal_btn">Delete</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="students_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>studentName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>change</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">

    let totalRecord;

    $(function() {
        to_page(1);
    })

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/students",
            data:"pn=" + pn,
            type:"GET",
            success:function(result) {
                build_students_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    }

    function build_students_table(result) {
        $("#students_table tbody").empty();
        let students = result.extend.pageInfo.list;
        $.each(students, function(index, item) {
            let stuIdTd = $("<td></td>").append(item.stuId);
            let stuNameTd = $("<td></td>").append(item.stuName);
            let gender = item.gender == 'M' ? "Male" : "Female";
            let stuGenderTd = $("<td></td>").append(gender);
            let stuEmailTd = $("<td></td>").append(item.email);
            let deptNameTd = $("<td></td>").append(item.department.deptName);
            let editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit-btn")
                .append("Edit");
            editBtn.attr("edit-id", item.stuId);
            let deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete-btn")
                .append("Delete");
            deleteBtn.attr("delete-id", item.stuId);
            let btnTd = $("<td></td>").append(editBtn).append(deleteBtn);
            $("<tr></tr>").append(stuIdTd)
                .append(stuNameTd)
                .append(stuGenderTd)
                .append(stuEmailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#students_table tbody");
        })
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("Currently at page " + result.extend.pageInfo.pageNum + ", " +
                                    result.extend.pageInfo.pages + " pages in total " + ", " +
                                    result.extend.pageInfo.total + " records in total");
        totalRecord = result.extend.pageInfo.total;
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        let ul = $("<ul></ul>").addClass("pagination");

        let firstPageLi = $("<li></li>").append(
                            $("<a></a>").append("First").attr("href", "#").addClass("page-link")
                            ).addClass("page-item");

        let prePageLi = $("<li></li>").append(
                            $("<a></a>").append("&laquo;").attr("href", "#").addClass("page-link")
                            ).addClass("page-item");

        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }

        firstPageLi.click(function() {
            to_page(1);
        })

        prePageLi.click(function() {
            to_page(result.extend.pageInfo.pageNum - 1);
        })

        let nextPageLi = $("<li></li>").append(
                            $("<a></a>").append("&raquo;").attr("href", "#").addClass("page-link")
                            ).addClass("page-item");

        let lastPageLi = $("<li></li>").append(
                            $("<a></a>").append("Last").attr("href", "#").addClass("page-link")
                            ).addClass("page-item");

        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }

        nextPageLi.click(function() {
            to_page(result.extend.pageInfo.pageNum + 1);
        })

        lastPageLi.click(function() {
            to_page(result.extend.pageInfo.pages);
        })

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

            let numLi = $("<li></li>").append(
                $("<a></a>").append(item).attr("href", "#").addClass("page-link")
            ).addClass("page-item");
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function() {
                to_page(item)
            })
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        let navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area")
    }

    let studentAddModal = new bootstrap.Modal(document.getElementById("studentAddModal"), {});

    $("#student_add_modal_btn").click(function() {
        getDepartments("#studentAddModal select");
        clearValidation();
        $("#stuName_add_input").val("");
        $("#email_add_input").val("");
        studentAddModal.show();
    })

    function getDepartments(ele) {
        $(ele).empty()
        $.ajax({
            url:"${APP_PATH}/departments",
            type:"GET",
            success:function(result) {
                $.each(result.extend.departments, function() {
                    let optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        })
    }

    function validate_add_form() {
        clearValidation();
        let studentName = $("#stuName_add_input").val();
        let regName = /^[a-zA-Z0-9_-]{6,16}$/;
        if (!regName.test(studentName)) {
            $("#stuName_add_input").addClass("is-invalid");
            $("#stuName_add_input").next("div").text("Please enter a valid name.");
            return false;
        } else {
            $("#stuName_add_input").addClass("is-valid");
            $("#stuName_add_input").next("div").text("Looks good!");
        }


        let email = $("#email_add_input").val();
        let regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!regEmail.test(email)) {
            $("#email_add_input").addClass("is-invalid");
            $("#email_add_input").next("div").text("Please enter a valid email.");
            return false;
        } else {
            $("#email_add_input").addClass("is-valid");
            $("#email_add_input").next("div").text("Looks good!");
        }

        return true;
    }

    function clearValidation() {
        $("#stuName_add_input").removeClass("is-valid");
        $("#stuName_add_input").removeClass("is-invalid");
        $("#email_add_input").removeClass("is-valid");
        $("#email_add_input").removeClass("is-invalid");
        $("#stuName_add_input").next("div").text("");
        $("#email_add_input").next("div").text("");
    }

    $("#student_save_btn").click(function() {
        if (!validate_add_form()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/student",
            type: "POST",
            data: $("#studentAddModal form").serialize(),
            success:function(result) {
                studentAddModal.hide();
                to_page(totalRecord);
            }
        })
    });

    let studentUpdateModal = new bootstrap.Modal(document.getElementById("studentUpdateModal"), {});

    $(document).on("click", ".edit-btn", function() {
        getDepartments("#studentUpdateModal select");
        getStudent($(this).attr("edit-id"));
        $("#student_update_btn").attr("edit-id", $(this).attr("edit-id"));
        studentUpdateModal.show();
    });

    function getStudent(id) {
        $.ajax({
            url:"${APP_PATH}/student/" + id,
            type:"GET",
            success:function(result) {
                let student = result.extend.student;
                console.log(student);
                $("#stuName_update_input").val(student.stuName);
                $("#email_update_input").val(student.email);
                $("#studentUpdateModal input[name=gender]").val([student.gender])
                $("#studentUpdateModal select").val([student.dId])
            }
        });
    }

    $("#student_update_btn").click(function() {
        $("#email_update_input").removeClass("is-invalid");
        $("#email_update_input").removeClass("is-valid");
        $("#email_update_input").next("div").text("");
        let email = $("#email_update_input").val();
        let regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!regEmail.test(email)) {
            $("#email_update_input").addClass("is-invalid");
            $("#email_update_input").next("div").text("Please enter a valid email.");
            return false;
        } else {
            $("#email_update_input").addClass("is-valid");
            $("#email_update_input").next("div").text("Looks good!");
        }

        $.ajax({
            url:"${APP_PATH}/student/" + $(this).attr("edit-id"),
            type:"POST",
            data: $("#studentUpdateModal form").serialize() + "&_method=PUT",
            success:function(result) {
                alert(result.message);
            }
        })
    })

    /*
    $(document).on("click", ".edit-btn", function() {
        getDepartments("#studentUpdateModal select");
        getStudent($(this).attr("edit-id"));
        $("#student_update_btn").attr("edit-id", $(this).attr("edit-id"));
        studentUpdateModal.show();
    });*/

    $(document).on("click", ".delete-btn", function() {
        deleteStudent($(this).attr("delete-id"));

    })

    function deleteStudent(id) {
        $.ajax({
            url: "${APP_PATH}/student/" + id,
            type: "POST",
            data: "&_method=DELETE",
            success: function(result) {
                alert(result.message);
                to_page(1);
            }
        })
    }

    let studentDeleteModal = new bootstrap.Modal(document.getElementById("studentDeleteModal"), {});

    $("#student_delete_modal_btn").click(function() {
        studentDeleteModal.show();
    })

    $("#student_delete_btn").click(function() {
        $("#student_delete_input").removeClass("is-valid");
        $("#student_delete_input").removeClass("is-invalid");
        $("#student_delete_input").next("div").text("");
        let regId = /^(0|[1-9][0-9]*)$/;
        let id = $("#student_delete_input").val();
        if (!regId.test(id)) {
            $("#student_delete_input").addClass("is-invalid");
            $("#student_delete_input").next("div").text("Please enter a valid id.");
            return false;
        } else {
            $("#student_delete_input").addClass("is-valid");
            $("#student_delete_input").next("div").text("Looks good!");
        }
        $.ajax({
            url: "${APP_PATH}/student/" + id,
            type: "POST",
            data: "&_method=DELETE",
            success: function(result) {
                alert(result.message);
                studentDeleteModal.hide();
                to_page(1);
            }
        })
    })

</script>
</body>
</html>

