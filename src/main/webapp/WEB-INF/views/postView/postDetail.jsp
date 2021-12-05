<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
*{margin:0;padding:0}
header{top:0}
#wrap{width:1400px;margin:0 auto;margin-top:200px}
input{outline:none;}
textarea{outline:none;resize:none;padding:5px;}
.active{display:none;}
#rtb{margin:0 auto; width:100%; border:none;}
#rtb tbody td{padding:5px;}
#jtb{margin:0 auto;width:100%; border:none;}
#con{margin:0 auto; width:100%;}
input{border:none; padding:5px;}
textarea{width:100%;border:none}
#title{font-size:2rem;}
#writer{font-size:1.2rem;}
#tr2 td{font-weight:bold;}
#rtb tbody tr td:first-child{text-align:center;}
#rtb tbodt tr td{font-size:1.7rem;}
.de{height:100px;width:100%;border:none;}
#ft{margin-bottom:200px;}
.qwe,.wer{border:none;padding:6px;}
a{text-style:none; color:black;}
a:visited { color: black; }
.modifyR{width:100%;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="wrap">
		<form method="get" name="form">
			<input type="hidden" name="postNo" value="${post.postNo }">
			<table id="con">
				<tr>
					<td width="80" height="80" style="font-weight:bold; border-bottom:1px solid rgba(221,221,221);">제목</td>
					<td style="border-bottom:1px solid rgba(221,221,221);"><input type="text" size="50" id="title" name="postTitle" value="${post.postTitle }" readonly></td>
				</tr>
				<tr style="border-bottom:1px solid rgba(221,221,221);">
					<td height="30" style="font-weight:bold;">작성자</td>
					<td><input type="text" size="50" id="writer"name="postWriter" value="${post.postWriter }" readonly></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" name="postContents" readonly>${post.postContents }</textarea></td>
				</tr>
				<c:if test="${userId eq post.postWriter || type eq '관리자'}">
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" onclick="javascript: form.action='postModify.do'">
							<input type="submit" id="del" value="삭제" onclick="javascript: form.action='deletePost.do'">
						</td>
					</tr>
				</c:if>
			</table>
			<table border="1" id="jtb">
				<tr>
					<td colspan="3" style="font-weight:bold;">댓글등록</td>
				</tr>
				<tr>
					<td>
						<textarea rows="3" cols="55" id="rContents" placeholder="내용을 입력해 주세요."></textarea>
					</td>
					<c:if test="${userId ne null}">
						<td><button class="de" id="rSubmit">등록하기</button></td>
					</c:if>
					<c:if test="${userId eq null}">
						<td><button class="de" id="fail">등록하기</button></td>
					</c:if>
				</tr>
			</table>
	
			<!--  댓글 목록 -->
			<table align="center" width="800" border="1" id="rtb">
				<thead>
					<tr>
						<!-- 댓글 갯수 -->
						<td colspan="5"><b id="rCount"></b></td>
					</tr>
					<tr id="tr2">
						<td width="80" style="text-align:center">작성자</td>
						<td style="padding:5px;">내용</td>
						<td width="80" style="text-align:center">등록일</td>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</form>
		<div id="ft" style="margin-top : 10px;">
			<a href="postList.do"><button type="button" class="wer">목록으로</button></a>
			<c:if test="${userId ne null}">
				<button type="button" class="qwe">게시물 신고</button>
			</c:if>
			<c:if test="${type eq '관리자' }">
				<a href="reportView.do"><button type="button" style ="border:none;padding:6px;">신고관리 페이지</button></a>
			</c:if>
		</div>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		$("#del").on("click",function(){
			if(confirm("정말 삭제 하시겠습니까?")){
				alert("삭제 되었습니다.");
				return true;
			}else{
				return false;
			};
		});
		
		$("#fail").on("click",function(){
			alert("로그인을 해주세요!");
			return false;
		});
		
		getReplyList();
		 $("#rSubmit").on("click", function(){
	         var postNo = '${post.postNo}';
	         var replyContents = $("#rContents").val();
	         if(replyContents =="" || replyContents == null){
	        	 alert("내용을 입력해 주세요");
	        	 return false;
	         }
	         $.ajax({
	            url : "addReply.do",
	            type : "post",
	            data : {
	               "postNo" : postNo,
	               "replyContents" : replyContents,
	               },
	            success : function(data) {
	               if(data == "success"){
	                  getReplyList();
	                  $("#rContents").val("");
	               }else{
	                  alert("댓글 등록 실패")
	               }
	            },
	            error : function(){
	               alert("내용이 너무 길어요")
	            },
	         });
	      });
		function getReplyList(){
			var postNo = ${post.postNo};
			var userId = '${userId}';
			var type = '${type}';
			$.ajax({
				type:'GET',
				url:'replyList.do',
				data:{"postNo" : postNo},
				dataType:"json",
				success : function(data){
					var $tableBody = $("#rtb tbody");
					$tableBody.html("");
					 var $tr;
		             var $rWriter;
		             var $rContents;
		             var $rCreateDate;
		             var $btnArea;
		             var $btnAreaT;
		             $("#rCount").text("댓글 ("+data.length+")");
		             if(data.length > 0){
		            	 for(var i in data){
		            		 $tr = $("<tr id='modifyTr'>");
		                     $rWriter = $("<td width='80' style='font-weight:bold'>").text(data[i].replyWriter);
		                     $rContent = $("<td>").text(data[i].replyContents);
		                     $rCreateDate = $("<td width='100'>").text(data[i].replyDate);
		                     $btnArea = $("<td width='80' class='modi'>")
		                     .append("<a href ='#' onclick='modifyReply(this,"+postNo+","+data[i].replyNo+",\""+data[i].replyContents+"\");'>수정/<a> ")
		                     .append("<a href ='#' onclick='removeReply("+postNo+","+data[i].replyNo+")'>삭제<a>");
		                     $btnAreaT = $("<c:if test='${userId ne null}'><td width='80' class='modi'>").append("<a href='#' onclick= 'replyReport("+postNo+","+data[i].replyNo+")'>신고<a></c:if>");
		                     $tr.append($rWriter);
		                     $tr.append($rContent);
		                     $tr.append($rCreateDate);
		                     if(data[i].replyWriter == userId || type == '관리자'){
		                     	$tr.append($btnArea);
		                     }else if(data[i].replyWriter != userId){
		                    	 $tr.append($btnAreaT);
		                     };
		                     $tableBody.append($tr);
		            		}
		             }else{
		            	 $tr = $("<tr id='modifyTr'><td colspan='4'>등록된 댓글이 없습니다.</td>");
		            	 $tableBody.append($tr);
		             }
		        },
	             error:function(){
            	 	alert("통신 실패");
	             }
			});
		}
		
		 function modifyReply(obj, postNo, replyNo, replyContents){
			 	$(".modi").addClass("active");
		        $trModify = $("<tr>");
		        $trModify.append("<td style='text-align:center;'>ㄴ</td>")
		        $trModify.append("<td colspan='3'><input type='text' id='modifyReply' class='modifyR' value='"+replyContents+"'></td>");
		        $trModify.append("<td><button onclick='modifyReplyCommit("+postNo+","+replyNo+")'>수정완료</button></td>");
		        $(obj).parent().parent().after($trModify);
	      }
		 
		  function modifyReplyCommit(postNo, replyNo){
		     var modifiedContent = $("#modifyReply").val();
		     $.ajax({
		        url : "modifyReply.do",
		        type : "post",
		        data : {
		           "postNo" : postNo,
		           "replyNo" : replyNo,
		           "replyContents" : modifiedContent,
		        },
		        success : function(data){
		           if(data == "success"){
			              getReplyList();
		           }else{
		              alert("댓글 수정 실패");
		           }
		        },
		        error : function(){
		           alert("내용이 너무 길어요");
		        }
		     });
		  };
		  function removeReply(postNo, replyNo){
	        $.ajax({
	           url : "deleteReply.do",
	           type : "get",
	           data : {"postNo" : postNo, "replyNo" : replyNo},
	           success : function(data) {
	        	   alert("삭제되었습니다.");
                   getReplyList();
	           }
	        })
	     }
		  
		 $('.qwe').on("click",function(){
			 var postNo = ${post.postNo};
			 $.ajax({
				 url : "postReport.do",
				 type : "get",
				 data : {"postNo" : postNo},
				 success : function(data){
					 if(data == 'success'){
						alert("신고 되었습니다. 관리자 확인 후 처리 됩니다.");
					 }else if(data == "fail"){
					 	alert("이미 신고된 게시물 입니다.");
					 }
				 }
			 })
		 });
		 function replyReport(postNo, replyNo){
		        $.ajax({
		           url : "postReply.do",
		           type : "get",
		           data : {"postNo" : postNo, "replyNo" : replyNo},
		           success : function(data) {
		        	   if(data == 'success'){
		        	  	 alert("신고 되었습니다. 관리자 확인 후 처리 됩니다.");
		        	   }else if(data == 'fail'){
		        		   alert('이미 신고된 댓글 입니다.');
		        	   }
		           }
		        })
		     }
		 
		 
		 
		
	</script>
</body>
</html>