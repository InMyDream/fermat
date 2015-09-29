<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NoticeBoardList</title>

    <!-- Bootstrap Core CSS -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/bootstrap/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../resources/bootstrap/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Fermat</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Notice</a>
                    </li>
            </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->

                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> 공지사항</h3>
                            </div>
                            <div class="panel-body">
                            	<div class="form-group">
                            		<label>Search</label>
                            		<div class="col-lg-3">
                            			<select class="form-control">
                           					<option value="n"
                           	 				<c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
                            				<option value="t"
                            				<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>제목</option>
                           		 			<option value="c"
                           		 			<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>내용</option>
                            				<option value="w"
                            				<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>작성자</option>
                            				<option value="tc"
                         	   				<c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>제목/내용</option>
                            				<option value="cw"
                            				<c:out value="${cri.searchType eq 'cw'?'selected':'' }"/>>내용/작성자</option>
                            				<option value="tcw"
                            				<c:out value="${cri.searchType eq 'tcw'?'selected':'' }"/>>제목/내용/작성자</option>
                            			</select>
                            		</div>
                            		
                            		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
										<button id='searchBtn'>검색</button>
										<button id='newBtn'>글쓰기</button>                            		
                            	</div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 10px">BNO</th>
                                                <th>TITLE</th>
                                                <th>WRITER</th>
                                                <th>REGDATE</th>
                                                <th style="width: 40px">VIEWCNT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list }" var="noticeBoardVO">
                                            	<tr>
                                            		<td>${noticeBoardVO.bno }</td>
                                            		<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${noticeBoardVO.bno}'>${noticeBoardVO.title }</a></td>
                                            		<td>${noticeBoardVO.writer }</td>
                                            		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeBoardVO.regdate }" /></td>
                                            		<td>${noticeBoardVO.viewcnt }</td>
                                            	</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                        	<ul class="pagination">
                        		<c:if test="${pageMaker.prev }">
                        			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
                        		</c:if>
                        		
                        		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        			<li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
                        			<a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
                        			</li>
                        		</c:forEach>
                        		
                        		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
                        		</c:if>
                        	</ul>
                        </div>
                    </div>
                </div>
                
                <form id="jobForm">
                	<input type="hidden" name="page" value=${pageMaker.cri.page }>
                	<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum }>
                </form>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../resources/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/bootstrap/js/bootstrap.min.js"></script>

    
    <script>
    	$(document).ready(function(){
    		$('#searchBtn').on("click", function(event){
    			self.location="list"+'${pageMaker.makeQuery(1)}'+"&searchType="+$("select option:selected").val()+"&keyword="+$('#keywordInput').val();
    		});
    		
    		$('#newBtn').on("click", function(evt){
				self.location="register";
    		});
    		
    	});
    	
    </script>

</body>

</html>
