<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
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
<jsp:include page="../common/nav.jsp" />
		<form class="form-horizontal" action="${base}/arctype/save" method="post">
		<input type="hidden" name="id" value="${entity.id}" />
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">栏目名</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="typename" name="typename" value="${entity.typename}" placeholder="...">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">所属栏目</label>
				<div class="col-md-3">
					<h5><span id="reidname" ></span><button type="button" class="btn btn-default btn-xs" id="reidbtn">选择上级栏目</button></h5>
					<input type="hidden" id="reid" name="reid" value="<c:choose><c:when test="${entity.reid == null}">0</c:when><c:when test="${entity.reid != null}">${entity.reid}</c:when></c:choose>">
				</div>
				<label class="col-md-2 control-label" for="inputEmail">关键字</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="keywords" name="keywords" value="${entity.keywords}" placeholder="...">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">显示与隐藏</label>
				<div class="col-md-3">
					<select class="form-control" id="ishidden" name="ishidden">
						    <option value="0" <c:if test="#entity.ishidden == 0">selected</c:if>>显示</option>
							<option value="1" <c:if test="#entity.ishidden == 1">selected</c:if>>隐藏</option>
					</select>
				</div>
				<label class="col-md-2 control-label" for="inputEmail">打开方式</label>
				<div class="col-md-3">
					<select name="clickmethods" class="form-control">
							<option value="_self">当前窗口</option>
							<option value="_blank">新窗口</option>
							<option value="_media">_media</option>
							<option value="_parent">_parent</option>
							<option value="_top">_top</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">栏目属性</label>
				<div class="col-md-3">
					<select name="ispart" class="form-control">
						<option value="0" selected="">最终列表栏目</option>
						<option value="1">频道封面</option>
						<option value="2">外部连接</option>
					</select>
				</div>
				<label class="col-md-2 control-label" for="inputEmail">栏目地址</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="sitepath" name="sitepath" value="${entity.sitepath}" placeholder="...">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">列表模板</label>
				<div class="col-md-8"><div class="input-group">
					  <input type="text" class="form-control" name="templist" value="${entity.templist }">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button">查找</button>
				      </span>
				</div></div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">内容模板</label>
				<div class="col-md-8"><div class="input-group">
					  <input type="text" class="form-control" name="temparticle" value="${entity.temparticle }">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button">查找</button>
				      </span>
				</div></div>
			</div>
			
			<button type="submit" class="btn btn-default col-md-offset-2">提交</button>
		</form>
</div>

	<!-- javascript -->
	<script src="${base}/js/jquery.js"></script>
	<script src="${base}/js/bootstrap.js"></script>
	<script src="${base}/js/jquery.bootstrap.js"></script>
	<script src="${base}/js/jquery.btree.js"></script>
	<script type="text/javascript">
	
	$(function(){
		$(this).btree({url:'${base}/arctype/tree',btn:'reidbtn',onClick:function(node){
			$("#reid").val(node.id);
			$("#reidname").html(node.text+'&nbsp;&nbsp;&nbsp;');
		}});
	});
	</script>
</body>
</html>
