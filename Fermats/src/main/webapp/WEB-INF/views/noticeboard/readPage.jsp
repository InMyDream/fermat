<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>READ NOTICE</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/bootstrap/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../../resources/bootstrap/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                                <h3 class="panel-title"><i class="fa fa-edit"></i> 공지사항</h3>
                            </div>
                            <form role="form" method="post">
                            	<input type='hidden' name='bno' value="${noticeBoardVO.bno }">
                            	<input type='hidden' name='page' value="${cri.page }">
                            	<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
                            </form>
                                <div class="form-group">
                                    <label for="disabledSelect">Title</label>
                                    <input class="form-control" id="disabledInput" type="text" value="${noticeBoardVO.title }" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="disabledSelect">Content</label>
                                    <textarea class="form-control" name="content" rows="3" readonly="readonly">${noticeBoardVO.content }</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="disabledSelect">Writer</label>
                                    <input class="form-control" id="disabledInput" type="text" value="${noticeBoardVO.writer }" disabled>
                                </div>
                                
                                
                                <button type="submit" class="btn btn-warning">Modify</button>
                                <button type="submit" class="btn btn-danger">REMOVE</button>
                                <button type="submit" class="btn btn-primary">LIST ALL</button>
                                

                                                      
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../../resources/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/bootstrap/js/bootstrap.min.js"></script>

   
    
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/noticeboard/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/noticeboard/removePage");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("method","get");
		formObj.attr("action","/noticeboard/listPage");
		formObj.submit();
	});
});
</script>
</body>

</html>
