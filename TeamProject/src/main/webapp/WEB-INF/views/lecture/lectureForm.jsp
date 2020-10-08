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
	      
	      <form action="lectureInput_Ok.do" name="f" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
	      <input type="hidden" name="userNum" value="${getUserNum}"/>
	      <div style="width: 900px; overflow: hidden; margin-left: 85px; display: grid;">
	        <div class="comment-form">
	          <h4>강의 등록</h4>
	          <p>
	        </div>
	        <hr style="margin: 40px 0 40px 0;">
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">이름</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="name" id="website" type="text" value="${getN}" style="display: inline;" readOnly>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">이메일</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="email" id="website" type="text" value="${mbId}" style="display: inline;" readOnly>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">분야</div>	          
	            <div style="float: left; width: 20%;">
	              <select id="mainCate" name="mainCate" onchange="categoryKindChange(this)">
                    <option selected>분야를 선택하세요.</option>
                    <c:forTokens var="dto" items="${major}" delims=",">
                      <option value="${dto}">${dto}</option>
                    </c:forTokens>
                  </select>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">세부 분야</div>	          
	            <div style="float: left; width: 20%;">
	              <select id="subCate" name="subCate">
	                <option>선택하세요.</option>
	              </select>
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">제목</div>	          
	            <div style="float: left; width: 20%;">
	              <input class="subjectBox" name="subject" id="website" type="text" style="display: inline;">
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
	              <input type="date" name="date1" id="date1">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time1_1">
	            </div>
	            <div>
	              <input type="time" name="time1_2">
	            </div>
	          </div>
	          <div id="dateBox2">
	            <div style="float: left; width: 131px;">&nbsp;</div>
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date2" id="date2">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time2_1">
	            </div>
	            <div>
	              <input type="time" name="time2_2">
	            </div>
	          </div>
	          <div id="dateBox3">
	            <div style="float: left; width: 131px;">&nbsp;</div>
	            <div style="float: left; width: 20%;">
	              <input type="date" name="date3" id="date3">
	            </div>
	            <div style="float: left; width: 15%;">
	              <input type="time" name="time3_1">
	            </div>
	            <div>
	              <input type="time" name="time3_2">
	            </div>
	          </div>
	        </div>
	        <div>
	          <input type="button" value="추가하기" id="btn1">
	        </div>
	        <div class="group">
	          <div>
	            <div class="grouplabel1" style="float: left; width: 10%;">가격</div>	          
	            <div style="float: left; width: 20%;">
	              <input type="number" name="price">
	            </div>
	          </div>
	        </div>
	        <div class="group">
	          <label class="grouplabel2" style="margin: 0 0 10px 0;">본인 정보, 소개(이력)</label>
	          <textarea class="subjectBox" name="tutors" id="content" type="text" placeholder="내용을 입력해 주세요.">${getTutor.tutorContent}</textarea>
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
	          <textarea class="subjectBox" name="content" id="content2" type="text" placeholder="내용을 입력해 주세요."></textarea>
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
				  <div style="display: inline-flex; margin-bottom: 20px;">
				    <div style="width: 100px;">썸네일 : </div>
				    <div><input type="file" name="filename"></div>
				  </div>
				  <div style="display: inline-flex;">
				    <div style="width: 100px;">이미지 : </div>
				    <div><input type="file" name="filename"></div>
				    <a href="#this" id="add" style="margin: auto; font-size: 13px; width: 100px;">이미지추가</a>
				  </div>
				</div>
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
			 var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구",
						  "동작구","마포구","서대문구","서초구","성동구","성북구",
						  "송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			 var busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구",
						  "중구","해운대구"];
			 var target = document.getElementById("location2");
	
			 if(e.value == "서울") var d = seoul;
			 else if(e.value == "부산") var d = busan;
	
			 target.options.length = 0;
	
			 for(x in d) {
				var opt = document.createElement("option");
				opt.value=d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			 }
			 }
			 function categoryKindChange(e) {
				var IT = ["자바","파이썬","알고리즘"];
				var design = ["포토샵","제품디자인","애니메이션"];
				var ability = ["엑셀","파워포인트","재무회계"];
				var beauty = ["메이크업","헤어","네일"];
				var language = ["영어회화","일본어","중국어"];
				var music = ["보컬","기타","피아노"];
				var lifeStyle = ["핸드메이드","요리/베이킹","가죽공예"];
				var other = ["취업/이직","PT","줌바댄스"];
				var target = document.getElementById("subCate");
	
				if(e.value == "IT") var d = IT;
				else if(e.value == "design") var d = design;
				else if(e.value == "ability") var d = ability;
				else if(e.value == "beauty") var d = beauty;
				else if(e.value == "language") var d = language;
				else if(e.value == "music") var d = music;
				else if(e.value == "lifeStyle") var d = lifeStyle;
				else if(e.value == "other") var d = other;
	
				target.options.length = 0;
	
				for(x in d) {
					var opt = document.createElement("option");
					opt.value=d[x];
					opt.innerHTML = d[x];
					target.appendChild(opt);
				}
			 }
			 $(document).ready(function(){
				 $('#dateBox2').hide();
				 $('#dateBox3').hide();
				 var a = 1
				 
				 $('#btn1').click(function(){
					 if(a==3){
						 alert("3개까지 등록가능합니다")
						 return false;
					 }
					 if($('#date'+a).val() == "") {
						 if(a==1){
						 alert("첫번째 일정을 입력해주세요")
						 return false;
						 }
						 if(a==2){
							alert("두번째 일정을 입력해주세요")
							return false;
						 }
					 }else if($('#date'+a).val() != "") {
						 $('#dateBox'+(a+1)).show();
						 a++
						 return false;
					 } 
				 });
				 
				   
				    $("a[name='delete']").on("click",function(e){
				        e.preventDefault();
				        fn_fileDelete($(this));
				    })
				    $("#add").on("click",function(e){
				        e.preventDefault();
				        fn_fileAdd();
				    })
				});
				function fn_fileDelete(obj){
				    obj.parent().remove();
				}
				function fn_fileAdd(){
				    var str = "<div><input type='file' name='filename'/><a href='#this' name='delete' class='btn'>삭제하기</a></div> ";
				    $("#fileDiv").append(str);
				     
				    $("a[name='delete']").on("click",function(e){
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

<%@ include file="/WEB-INF/views/main/bottom.jsp"%>