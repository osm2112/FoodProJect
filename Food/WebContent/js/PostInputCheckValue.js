/**
 * post form에서 각 태그 입력 체크
 */

	function InputCheckValue()
        {
            if(!document.form.title.value)
            {
                alert("제목을 입력하세요.");   
                document.form.title.focus();
                return false;
            }
            if(!document.form.subtitle.value)
            {
                alert("포스트 설명을 간략히 입력하세요");    
                document.form.subtitle.focus();
                return false;
            }
            
            if(!document.form.mainImg.value)
            {
            	alert("메인 사진을 올려주세요.");    
                document.form.mainImg.focus();
                return false;
            }
            
        }
        