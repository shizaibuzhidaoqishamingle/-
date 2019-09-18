function $(elementId){
  return document.getElementById(elementId).value;
}
function divId(elementId){
  return document.getElementById(elementId);
}

/*账号验证*/    
  function checkUser(){
    var user=$("user");
    var userId=divId("user_prompt");
      userId.innerHTML="";    
    var reg=/^\d{8}$/;    
      if(reg.test(user)==false){
        userId.innerHTML="账号不正确";
      return false;
      }
        return true;
  }
/*密码验证*/    
  function checkPwd(){
    var pwd=$("pwd");
    var pwdId=divId("pwd_prompt");
      pwdId.innerHTML="";    
    var reg=/^[a-zA-Z0-9]{4,10}$/;    
      if(reg.test(pwd)==false){
        pwdId.innerHTML="密码不能含有非法字符，长度在4-10之间";
      return false;
      }
        return true;
  }
  
  function checkRepwd(){
    var repwd=$("repwd");
    var pwd=$("pwd");
    var repwdId=divId("repwd_prompt");
      repwdId.innerHTML="";
        if(pwd!=repwd){
          repwdId.innerHTML="两次输入的密码不一致";
        return false;
        }
    return true;
  }