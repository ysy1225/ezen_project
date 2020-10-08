<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- {"uploaded":"true", "fileName" : "${file_path}", "url": "${url}", "message":"저장성공"} --%>

<script type='text/javascript'> 
    window.parent.CKEDITOR.tools.callFunction('${dto.CKEditorFuncNum}','${dto.attach_path}','파일전송완료');
</script>