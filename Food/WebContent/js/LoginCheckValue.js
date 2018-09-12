/**
 * login 할때 아이디와 패스워드 입력 체크 
 */
        function loginCheckValue()
        {
            if(!document.inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                document.inputForm.id.focus();
                return false;
            }
            if(!document.inputForm.pwd.value)
            {
                alert("비밀번호를 입력하세요");    
                document.inputForm.pwd.focus();
                return false;
            }
        }
        
        
    
