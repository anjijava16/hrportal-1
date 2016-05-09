<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
	<title>Sapta HR</title>
	<link rel="icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico" type="image/x-icon">
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.js?v=2.1.5"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/grid.locale-en.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.jqGrid.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.dropdown.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.confirm.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.confirm.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/appstyle.css"/> 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.css?v=2.1.5"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery-ui-custom.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ui.jqgrid.css"/>
	
</head>

<div>
	<input type="hidden" id="response_content"/>
	<div id="visitorsListJSON" class="hidden">${visitorsListJSON}</div>
	<div id="customersListJSON" class="hidden">${customersListJSON}</div>
	<input type="hidden" id="contextpath" value="${pageContext.request.contextPath}"/>
	
	<div id="alertMsg" class="hidden">
		<h1><b class="saptaColor">Notification</b></h1>
		<div id="alertMsgContent"></div>
	</div>
	
	<div id="loadingDiv" style="text-align: center;"><img src="<%=request.getContextPath() %>/resources/images/loading.gif" alt="Loading" style="text-align: center;"/></div> 
	
	<div id="errorMsg" class="hidden">
		<h1><b class="saptaColor">Error</b> Notification</h1>
		<div id="errorMsgContent"></div>
	</div>
</div>
<script>
	 $(document).ready(function(){
		$('#loadingDiv').hide()  // hide it initially
		 $(document).ajaxStart(function() {
	        $('#loadingDiv').show();
	    })
	     $(document).ajaxStop(function() {
	    	$('#loadingDiv').hide();
	    });
		
		var browserClose = true;
		$('a').on('click', function() { browserClose = false; });
	    $('form').on('submit', function() { browserClose = false; });

	    $(window).bind("beforeunload", function() {
		    if (browserClose) {
		    	window.location.href = $("#contextpath").val()+"/logout";
			}
	    });
	    
	    $('#menu_employee').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	    $('#menu_project').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	    $('#menu_customer').click(function() {
			$("body").css("cursor", "progress");
		});
	    $('#menu_assignment').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	    $('#menu_expense').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	    $('#menu_projectmanagement').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	    $('#menu_miscellaneous').click(function() {
			$("body").css("cursor", "progress");
		});
	    
	});
	 
	function validateAccessPermission(){
		$("#alertMsgContent").html("Access denied, Only Admistrator can access ...");
		$.fancybox.open('#alertMsg');
	}
	
	function validateEmail(emailaddress){  
	   var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;  
	   return emailReg.test(emailaddress)  
	}
	
	function validateNumeric(key){
		var keycode = (key.which) ? key.which : key.keyCode;
		if (!(keycode==8) && !(keycode==37 || keycode==39) && (keycode < 48 || keycode > 57)){
			return false;
		}
		else{
			return true;
		}
	}

	function ValidateAlpha(key){
		var keycode = (key.which) ? key.which : key.keyCode;
		if (!(keycode==8) && !(keycode==37 || keycode==39) && !(keycode==32) && (keycode < 96 || keycode > 122) && (keycode < 65 || keycode > 90)){
			return false;
		}
		else{
			return true;
		}
	}
</script>

