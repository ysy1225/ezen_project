<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/main/top.jsp"%>

  <!-- 회원관리 테이블 CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/member/images/icons/favicon.ico?after" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/admin/member/main2.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/util.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/search.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/member/notice.css?after" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500&display=swap" rel="stylesheet">
  
  <body onload="validDate()">
  <main id="main">
  
    <div class="limiter">
      <div class="container-table100">      
	    <div class="wrap-table100">
	      

		<form action=lectureUpdate_Ok.do method="post" enctype="multipart/form-data">
		<input type="hidden" name="lectureNum" value="${dto.lectureNum}">
		<input type="hidden" name="userNum" value="${dto.userNum}">
		<input type="hidden" name="name" value="${dto.name}">
		<input type="hidden" name="email" value="${dto.email}">
		<input type="hidden" name="mainCate" value="${dto.mainCate}">
		<input type="hidden" name="subCate" value="${dto.subCate}">
		<input type="hidden" name="pFile" value="${dto.filename}"> <!-- 기존파일 -->
		<input type="hidden" name="pFileSize" value="${dto.filesize}">
		<div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>강의 등록</h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">제목</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="subject" id="website" type="text" value="${dto.subject}" style="display: inline;">
	            </div>
	          </div>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">도/특별시</div>	          
	            <div style="float: left; width: 20%;">
	              <select id="location1" name="location1" onchange="addressKindChange(this)">
	                <option selected>주소를 선택하세요.</option>
		            <option value="서울">서울특별시</option>
		            <option value="부산">부산특별시</option>
	              </select>
	            </div>
	          </div>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">주소 소분류</div>	          
	            <div style="float: left; width: 20%;">
	              <select id="location2" name="location2" >
	                <option>선택하세요.</option>
	              </select>
	            </div>
	          </div>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">상세 주소</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="location3" type="text" style="display: inline;">
	            </div>
	          </div>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">수업일정</div>	          
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date1" value="${dto.date1}">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time1_1" value="${dto.time1_1}">
	            </div>
	            <div>
	              <input type="time" name="time1_2" value="${dto.time1_2}">
	            </div>
	          </div>
	          <div>
	            <div style="float: left; width: 131px;">&nbsp;</div>
	            <c:if test="${dto.date2 ne null}">
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date2" value="${dto.date2}">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time2_1" value="${dto.time2_1}">
	            </div>
	            <div>
	              <input type="time" name="time2_2" value="${dto.time2_2}">
	            </div>
	            </c:if>
	            <c:if test="${dto.date2 eq null}">
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date2">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time2_1">
	            </div>
	            <div>
	              <input type="time" name="time2_2">
	            </div>
	            </c:if>
	          </div>
	          <div>
	            <div style="float: left; width: 131px;">&nbsp;</div>
	            <c:if test="${dto.date3 ne null}">
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date3" value="${dto.date3}">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time3_1" value="${dto.time3_1}">
	            </div>
	            <div>
	              <input type="time" name="time3_2" value="${dto.time3_2}">
	            </div>
	            </c:if>
	            <c:if test="${dto.date3 eq null}">
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date3">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time3_1">
	            </div>
	            <div>
	              <input type="time" name="time3_2">
	            </div>
	            </c:if>
	          </div>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">가격</div>	          
	            <div style="float: left; width: 20%;">
	              <input type="number" name="price" value="${dto.price}">
	            </div>
	          </div>
	        </div>
			<div class="group">
	          <label class="grouplabel2" style="margin: 0 0 10px 0;">본인 정보, 소개(이력)</label>
	          <textarea class="subjectBox" name="tutors" id="content" type="text" placeholder="내용을 입력해 주세요.">${dto.tutors}</textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400
	            });
	            function checkForm() {
		            if(CKEDITOR.instances.content.getData() == '' || CKEDITOR.instances.content.getData() == 0) {
	            		alert("자기소개를 입력해 주세요.");
	            		$("#content").focus();
	            		return false;
	            	}
	            }
	          </script>
	        </div>
			<div class="group">
	          <label class="grouplabel2" style="margin: 0 0 10px 0;">수업내용</label>
	          <textarea class="subjectBox" name="content" id="content2" type="text" placeholder="내용을 입력해 주세요.">${dto.content}</textarea>
	          <script type="text/javascript">
	            CKEDITOR.replace('content2', {
	            	filebrowserUploadUrl: 'imageUpload.do',
	            	height: 400
	            });
	          </script>
	        </div>
			<div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">사진</div>
							<div id="fileDiv" style="float: left; width: 20%;">
								<!--  <input multiple="multiple" type="file" name="filename"> -->
								<p>
									메인 사진 : <input type="file" name="filename">
								</p>
								<p>
									<input type="file" name="filename">
								</p>
							</div>
							<a href="#this" id="add" class="btn">파일 추가하기</a>
						</div>
	        </div>
			<hr style="margin: 0 0 40px 0;">
			<div class="subjectListButton">
	          <input class="noticeButton" type="submit" id="btnWriter" value="등록">
	        </div>
	      </div>
		  </form>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script>
				function addressKindChange(e) {
					var seoul = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
							"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
							"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구",
							"용산구", "은평구", "종로구", "중구", "중랑구" ];
					var busan = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
							"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
							"중구", "해운대구" ];
					var target = document.getElementById("location2");

					if (e.value == "서울")
						var d = seoul;
					else if (e.value == "부산")
						var d = busan;

					target.options.length = 0;

					for (x in d) {
						var opt = document.createElement("option");
						opt.value = d[x];
						opt.innerHTML = d[x];
						target.appendChild(opt);
					}
				}

				$(document).ready(function() {

					$("a[name='delete']").on("click", function(e) {
						e.preventDefault();
						fn_fileDelete($(this));
					})
					$("#add").on("click", function(e) {
						e.preventDefault();
						fn_fileAdd();
					})
				});
				function fn_fileDelete(obj) {
					obj.parent().remove();
				}
				function fn_fileAdd() {
					var str = "<p><input type='file' name='filename'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
					$("#fileDiv").append(str);

					$("a[name='delete']").on("click", function(e) {
						e.preventDefault();
						fn_fileDelete($(this));
					})
				}
				function validDate(){
		              var today = new Date().toISOString().split('T')[0];
		              document.getElementsByName("date1")[0].setAttribute('min', today);
		              document.getElementsByName("date2")[0].setAttribute('min', today);
		              document.getElementsByName("date3")[0].setAttribute('min', today);
		       		}
			</script>
			
			</div>
      </div>
    </div>
  
  </main>
  </body>
			
<%@ include file="/WEB-INF/views/main/bottom.jsp" %>