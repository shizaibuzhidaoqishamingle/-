//验证学号
function Stu() {
            
            var stu = document.getElementById("txtstu").value;
            var stuReg = /^\d{8}$/;
            if (!stuReg.test(stu)) {
                span_stu.innerHTML = "请输入8位数字!";
                return false;
            }
            else {
                span_stu.innerHTML = "";
                return true;
            }
        }
 //验证姓名        
 function Name() {
           
            var name = document.getElementById("txtname").value; //获取你所填写的信息
            var nameReg = /^[\u4e00-\u9fa5]{2,6}$/;  //定义约束,要求输入2到6个中文
            if (!nameReg.test(name)) {   //判断
                var t = span_name.innerHTML = "请输入2~6个汉字!"; //输入不合法，则显示提示信息
                return false;
            }
            else {
                span_name.innerHTML = ""; //验证通过后提示
                return true;
            }
}
//验证班级
function Cla() {
            
            var stu = document.getElementById("txtclass").value;
            var stuReg = /^\d{6}$/;
            if (!stuReg.test(stu)) {
                span_class.innerHTML = "请输入6位数字!";
                return false;
            }
            else {
                span_class.innerHTML = "";
                return true;
            }
        }
//验证手机号
function checkPhone(){ 
    var phone = document.getElementById('txtphone').value;
    if(!(/^1[3456789]\d{9}$/.test(phone))){ 
         span_phone.innerHTML="请输入11位数字！"
        return false; 
    } 
    else {
        span_phone.innerHTML = "";
        return true;
            }
}