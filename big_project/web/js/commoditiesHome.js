function openwin(baseurl,id) {
    let url = baseurl+"/accessory/list.action?fruitId="+id;
    window.open(url,"附属品","height=400,width=700,scrollbars=yes");
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

function deleteCommodities(id) {
    $("#dFruitId").val(id);//向 form 中引入 id
    //引入分页信息至该 form 表单
    $("#dStartPage").val($("#startPage").val());
    $("#dCurrenPage").val($("#currenPage").val());
    $("#dPageSize").val($("#pageSize").val());
    $("#deleteForm").submit();//提交表单
}
function editCommodities(baseurl,id) {
    let message = "{'id':'" + id + "'}"
    $.ajax({
        type: 'post',
        url: baseurl+'/commodities/editCommodities.action',
        contentType: 'application/json;charset=utf-8',
        data: message,//／数据格式是 JSON 串
        success: function (data) {//／返回 JSON 结果
            $("#editName").val(data["name"]);
            $("#editPrice").val(data["price"]);
            $("#editLocality").val(data["locality"]);
            $("#FruitId").val(data["fruitId"]);
            $("#editStatus").val(data["status"]);
            //显示弹出框
            $(".mask").css("display", "block");
            //引入分页信息至form表单
            $("#eStartPage").val($("#startPage").val());
            $("#eCurrentPage").val($("#currentPage").val());
            $("#ePageSize").val($("#pageSize").val())
        }
    });
}

function showAddMask(flag) {
    if (flag === "true") {
        $(".addMask").css("display", "block");
    } else {
        $(".addMask").css("display", "none")
    }
}

function cancelEdit() {
    $(".mask").css("display", "none");
}