<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.UUID" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String return1="";
String return2="";
String return3="";
String name = "";
int maxSize = 1024 * 1024 * 10;
if (ServletFileUpload.isMultipartContent(request)){
    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
    //UTF-8 인코딩 설정  
    uploadHandler.setHeaderEncoding("UTF-8");
    List<FileItem> items = uploadHandler.parseRequest(request);
    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
    for (FileItem item : items) {
        if(item.getFieldName().equals("callback")) {
            return1 = item.getString("UTF-8");
        } else if(item.getFieldName().equals("callback_func")) {
            return2 = "?callback_func="+item.getString("UTF-8");
        } else if(item.getFieldName().equals("Filedata")) {
            //FILE 태그가 1개이상일 경우
            if(item.getSize() > 0) {
                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
                //파일 기본경로
                String defaultPath = request.getServletContext().getRealPath("/");
                System.out.println("defaultPath:" + defaultPath);
                //파일 기본경로 _ 상세경로
                String path = defaultPath + "\\se\\upload" + File.separator;
               //String path = "C:\\Users\\User\\Desktop\\JAVA\\workspace\\Food\\WebContent\\se\\upload" + File.separator;
                System.out.println("path:" + path);
                
                File file = new File(path);
                 
                //디렉토리 존재하지 않을경우 디렉토리 생성
                if(!file.exists()) {
                   file.mkdirs();
                }
                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                String realname = UUID.randomUUID().toString() + "." + ext;
                ///////////////// 서버에 파일쓰기 /////////////////
                InputStream is = item.getInputStream();
                OutputStream os=new FileOutputStream(path + realname);
                int numRead;
                byte b[] = new byte[(int)item.getSize()];
                while((numRead = is.read(b,0,b.length)) != -1){
                    os.write(b,0,numRead);
                }
                if(is != null)  is.close();
                os.flush();
                os.close();
                ///////////////// 서버에 파일쓰기 /////////////////
                return3 += "&bNewLine=true&sFileName="+realname+"&sFileURL=http://localhost:8181/Food/se/upload/"+realname;
            }else {
                return3 += "&errstr=error";
            }
        }
    }
}
System.out.println(return1+return2+return3);
response.sendRedirect(return1+return2+return3);
%>


</body>
</html>