<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<c:set var="appname" value="arctype"/>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZPro 基础架构 -冰迪网络(出品)</title>
<link href="${base}/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	<c:import  url="../common/nav.jsp" />
		<table class="table table-hover">
		<thead>
			<tr>
				<td>编号</td>
				<td>栏目名</td>
				<td>
				<span class="glyphicon glyphicon-cog"></span>&nbsp;操作&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${base}/${appname}/add" ><i class="icon-plus"></i>添加</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="glyphicon glyphicon-th"></span><a id="reidbtn" href="javascript:void(0);">结构图</a></td>
			</tr>
		</thead>
			<c:forEach items="${page.list}" var="xx">
			<tr>
				<td>${xx.id}</td>
				<td>${xx.typename}</td>
				<td>&nbsp;<a href="${base}/${appname}/edit/${xx.id}" class="btn">修改</a><button type="button" class="btn btn-link delbtn" data="${xx.id}">删除</button></td>
			</tr>
			</c:forEach>
		</table>
		
		<form name="formsearch" class="navbar-form navbar-left" role="search" method="post">
		  <input type="hidden" name="index" value="${page.index}"  id="formindex"/>
		  <input type="hidden" name="order" value="desc" />
		  <input type="hidden" name="orderBy" value="id"/>
		  <div class="form-group">
		    <input type="text" class="form-control" name="typename_LIKES" value="${page.p.typename_LIKES}" placeholder="栏目名">
		  </div>
		  <button type="submit" class="btn btn-default">搜索</button>
		
		<tags:pagination page="${page}"/>
		</form>
	</div>

	<!-- javascript -->
	<script src="${base}/js/jquery.js"></script>
	<script src="${base}/js/jquery.balert.js"></script>
	<script src="${base}/js/bootstrap.js"></script>
	<script src="${base}/js/jquery.bootstrap.js"></script>
	<script src="${base}/js/jquery.btree.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".${appname}nav").addClass("active");
			$(".delbtn").balert({url:"${base}/${appname}/delete/",title:'您确定需要删除该信息？'});
			$(this).btree({url:'${base}/arctype/tree',btn:'reidbtn',onClick:function(node){
		        window.location.href="${base}/arctype/edit/"+node.id;
			}});
		});
	</script>
</body>
</html>
