function changeStatus() {
    document.getElementById("status").value = document.getElementById("indexStatus").value;
}

function init() {
    let countNumber = document.getElementById("countNumber").value;
    let sumPage = document.getElementById("sumPageNumber").value;
    let currentPage = document.getElementById("currentPage").value;
    document.getElementById("pageInfo").innerHTML = "一共<font color='blue'>" + countNumber + "</font>条数据," +
        "共<font color='blue'>" + sumPage + "</font>页," +
        "当前第<font color='blue'>" + currentPage + "</font>页";
}


function toPrePage() {
    let currentPageObject = document.getElementById("currentPage");
    let currentPage = parseInt(currentPageObject.value);
    if (currentPage === 1) {
        alert("数据到顶了！");
    } else {
        currentPageObject.value = currentPage - 1;
        let pageSize = parseInt(document.getElementById("pageSize").value);
        let startPageObject = document.getElementById("startPage")
        startPageObject.value = parseInt(startPageObject.value) - pageSize;
        document.getElementById("listForm").submit();
    }
}


function toNextPage() {
    let currentPageObject = document.getElementById("currentPage");
    let currentPage = parseInt(currentPageObject.value);
    let sumPage = parseInt(document.getElementById("sumPageNumber").value);
    if (currentPage >= sumPage) {
        alert("数据已到底！");
    } else {
        currentPageObject.value = currentPage + 1;
        let pageSize = parseInt(document.getElementById("pageSize").value);
        let startPageObject = document.getElementById("startPage")
        startPageObject.value = parseInt(startPageObject.value) + pageSize;
        document.getElementById("listForm").submit();
    }
}


function toLocationPage() {
    let pageNumber = document.getElementById("pageNumber").value;
    let currentPageObject = document.getElementById("currentPageObject");
    let currentPage = currentPageObject.value;
    if (pageNumber == null || pageNumber === "") {
        alert("请输入要跳转的页数！")
    } else {
        pageNumber = parseInt(pageNumber);
        let sumPage = parseInt(document.getElementById("sumPageNumber").value);
        if (pageNumber < 1) {
            alert("数据到顶了！");
        } else if (pageNumber > sumPage) {
            alert("数据已到底！");
        } else {
            currentPageObject.value = pageNumber;
            let pageSize = parseInt(document.getElementById("pageSize").value)
            let startPageObject = document.getElementById("startPage")
            if (pageNumber > currentPage) {
                startPageObject.value = parseInt(startPageObject.value) + pageSize;
            } else if (pageNumber < currentPage) {
                startPageObject.value = parseInt(startPageObject.value) - pageSize;
            }
            document.getElementById("listForm").submit();
        }
    }
}

function editRetailer(id) {
    let message = "{'id':'" + id + "'}"
    $.ajax({
        type: 'post',
        url: '/big_project/retailer/editRetailer.action',
        contentType: 'application/json;charset=utf-8',
        data: message,//／数据格式是 JSON 串
        success: function (data) {//／返回 JSON 结果
            $("#editName").val(data["name"]);
            $("#editTelephone").val(data["telephone"]);
            $("#editAddress").val(data["address"]);
            $("#retailerId").val(data["retailerId"]);
            $("#editStatus").val(data["status"]);
            $("#eStatus").val(data["status"]);
            //显示弹出框
            $(".mask").css("display", "block");
            //引入分页信息至form表单
            $("#eStartPage").val($("#startPage").val());
            $("#eCurrentPage").val($("#currentPage").val());
            $("#ePageSize").val($("#pageSize").val())
        }
    });
}

function deleteRetailer(id) {
    $("#dRetailerId").val(id);//向 form 中引入 id
    //引入分页信息至该 form 表单
    $("#dStartPage").val($("#startPage").val());
    $("#dCurrenPage").val($("#currenPage").val());
    $("#dPageSize").val($("#pageSize").val());
    $("#deleteForm").submit();//提交表单
}

function cancelEdit() {
    $(".mask").css("display", "none");
}

function changeEditStatus() {
    let status = document.getElementById("eStatus").value
    document.getElementById("editStatus").value = status;
}

function showAddMask(flag) {
    if (flag === "true") {
        $(".addMask").css("display", "block");
    } else {
        $(".addMask").css("display", "none")
    }
}

function checkAddRetailer() {
    if ($("#addName").val() == null || $("#addName").val() == "") {
        alert("用户名不能为空！")
        return false;
    }
    if ($("#addTelephone").val() == null || $("#addTelephone").val() == "") {
        alert("手机号不能为空！")
        return false;
    }
    // let myreg = /^(((13[0-9] {1})|(15[0-9] {1})|(18[0-9] {1}))+\d{8}$)/
    // if (!myreg.test($("#addTelephone").val())) {
    //     alert("请输入有效的手机号码 ！")
    //     return false;
    // }
    if ($("#addAddress").val() == null || $("#addAddress").val() == "") {
        alert("手机号不能为空！")
        return false;
    }
    return true;
}
