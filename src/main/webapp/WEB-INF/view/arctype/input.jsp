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
				<label class="col-md-2 control-label" for="inputEmail">所属栏目</label>
				<div class="col-md-3">
					<h5><span id="reidname" ></span>
					<div class="btn-group btn-group-xs">
					  <button type="button" class="btn btn-default" id="reidbtn">上级栏目</button>
					  <button type="button" class="btn btn-default" id="reidtopbtn">顶级栏目</button>
					</div>
					</h5>
					<input type="hidden" id="reid" name="reid" value="<c:choose><c:when test="${entity.reid == null}">0</c:when><c:when test="${entity.reid != null}">${entity.reid}</c:when></c:choose>">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">显示与隐藏</label>
				<div class="col-md-3">
					<select class="form-control" id="ishidden" name="ishidden">
						    <option value="0" <c:if test="${entity.ishidden == 0 }">selected</c:if>>显示</option>
							<option value="1" <c:if test="${entity.ishidden == 1 }">selected</c:if>>隐藏</option>
					</select>
				</div>
				<label class="col-md-2 control-label" for="inputEmail">打开方式</label>
				<div class="col-md-3">
					<select name="clickmethods" class="form-control">
							<option value="_self" <c:if test="${entity.clickmethods == '_self' }">selected</c:if>>当前窗口</option>
							<option value="_blank" <c:if test="${entity.clickmethods == '_blank' }">selected</c:if>>新窗口</option>
							<option value="_media" <c:if test="${entity.clickmethods == '_media' }">selected</c:if>>_media</option>
							<option value="_parent" <c:if test="${entity.clickmethods == '_parent' }">selected</c:if>>_parent</option>
							<option value="_top" <c:if test="${entity.clickmethods == '_top' }">selected</c:if>>_top</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">栏目属性</label>
				<div class="col-md-3">
					<select name="ispart" class="form-control">
						<option value="0" <c:if test="${entity.ispart == 0 }">selected</c:if>>最终列表栏目</option>
						<option value="1" <c:if test="${entity.ispart == 1 }">selected</c:if>>频道封面</option>
						<option value="2" <c:if test="${entity.ispart == 2 }">selected</c:if>>外部连接</option>
					</select>
				</div>
				<label class="col-md-2 control-label" for="inputEmail">栏目地址</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="sitepath" name="sitepath" value="${entity.sitepath}" placeholder="...">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">关键字</label>
				<div class="col-md-8">
					<input type="text" class="form-control" id="keywords" name="keywords" value="${entity.keywords}" placeholder="...">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-2 control-label" for="inputEmail">列表模板</label>
				<div class="col-md-8"><div class="input-group">
					  <input type="text" class="form-control" name="templist" id="templist" value="${entity.templist }">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button" id="templistbtn">查找</button>
				      </span>
				</div></div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">内容模板</label>
				<div class="col-md-8"><div class="input-group">
					  <input type="text" class="form-control" name="temparticle" id="temparticle" value="${entity.temparticle }">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button" id="temparticlebtn">查找</button>
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
	<script src="${base}/js/jquery.bfile.js"></script>
	<script type="text/javascript">
	
	$(function(){
		$(this).btree({url:'${base}/arctype/tree',btn:'reidbtn',onClick:function(node){
			$("#reid").val(node.id);
			$("#reidname").html(node.text+'&nbsp;&nbsp;&nbsp;');
		}});
		$(this).bfile({url:'${base}/explorer/viewlist',btn:'templistbtn',input:'templist'});
		$(this).bfile({url:'${base}/explorer/viewlist',btn:'temparticlebtn',input:'temparticle'});
		
		var reid = $('#reid').val();
		if(reid > 0){
			$.getJSON('${base}/arctype/json/'+reid,function(json){
				 $("#reidname").html(json.typename+'&nbsp;&nbsp;&nbsp;');
			});
		}
		if(reid == 0) $("#reidname").html('顶级栏目&nbsp;&nbsp;&nbsp;');
		
		$("#reidtopbtn").click(function(){
			$("#reid").val(0);
			$("#reidname").html('顶级栏目&nbsp;&nbsp;&nbsp;');
		});
	});
	</script>
</body>
</html>
