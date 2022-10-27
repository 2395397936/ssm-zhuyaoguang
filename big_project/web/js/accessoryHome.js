function showAddAccessory(flag) {
    if (flag === "ture") {
        $(".addAccessoryMask").css("display", "block");
    } else {
        $(".addAccessoryMask").css("display", "none");
    }
}

function checkAll(obj) {
    var isCheck = obj.checked;
    var checkList = document.getElementsByName("arrays");//获取所有check选项
    for (var i = 0; i < checkList.length; i++) {
        checkList[i].checked = isCheck;
    }
}

function add(){
    $.ajax({
        type: 'post',
        url: 'add.action',
        data: {
            "name": document.getElementById("addAccessoryName").value,
            "price": document.getElementById("addAccessoryPrice").value,
            "fruitId": document.getElementById("aFruitId").value
        },//数据为id数组
        traditional: true,
        success: function (data) {//成功后刷新页面
            location.reload();
        }
    });
}

function deleteAccessory() {
    let myArray = new Array();
    let len = 0;
    let fruitId = document.getElementById("aFruitId").value;
    let arrays = document.getElementsByClassName("arrays");//获取所有check选项
    for (let i = 0; i < arrays.length; i++) {
        if (arrays[i].checked) {
            myArray[len++] = arrays[i].value;
        }
    }
    $.ajax({
        type: 'post',
        url: 'deleteList.action',
        data: {"arrays": myArray, "fruitId": fruitId},//数据为id数组
        traditional: true,
        success: function (data) {//成功后刷新页面
            alert("删除成功")
            location.reload();
        }
    });
}
