<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
	<title>Saptalabs | Experience By Experienced</title>
	<link rel="icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico" type="image/x-icon">
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min-1.9.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.10.3.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.js?v=2.1.5"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/grid.locale-en.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.jqGrid.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.dropdown.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.confirm.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.confirm.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/rupyaINR.min.js"></script>
	
	
	<!-- <script src="//cdn.jsdelivr.net/rupyainr/1.0.0/rupyaINR.min.js" type="text/javascript"></script> -->
	
  
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/appstyle.css"/> 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.fancybox.css?v=2.1.5"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery-ui-custom.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ui.jqgrid.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.dataTables.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.dataTables.min.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.dataTables_themeroller.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/tabcss.css"/>
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
	    
	    /* TAB jquery start */
	    $('.tab-links a').on('click', function(e)  {
	    	
	        var currentAttrValue = jQuery(this).attr('href');
	        
	        // Show/Hide Tabs
	        $('.tab-content ' + currentAttrValue).show().siblings().hide();
	        	
	        // Change/remove current tab to active
	        $(this).parent('li').addClass('active').siblings().removeClass('active');
	 
	       	e.preventDefault();
	    });
		/* TAB jquery end */
		
	});
	 
	function validateAccessPermission(){
		$("#alertMsgContent").html("Access denied, Only Admistrator can access ...");
		$.fancybox.open('#alertMsg');
	}
	
	function validateEmail(emailaddress){  
	   var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,20})?$/;  
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
	
	function validateNumericWithPrecision(key){
		var keycode = (key.which) ? key.which : key.keyCode;
		if (!(keycode==8) && !(keycode==37 || keycode==39) && (keycode < 48 || keycode > 57) && !(keycode == 46)){
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
	
	function numberofDaysinMonth(month,year) {
		   return new Date(year, month, 0).getDate();
	}
	
	function monthConversion(startDate){
		var newStartDate=null;
		var date_entered = startDate.split(" ");
		if(date_entered!=null && date_entered.length==2){
			var month_enter=date_entered[0];
			var year_enter=date_entered[1];
			var day = "01";
			var month = null;
			if("Jan"== month_enter){
				month = "01"
			}else if ("Feb"== month_enter){
				month = "02"
			}else if ("Mar"== month_enter){
				month = "03"
			}else if ("Apr"== month_enter){
				month = "04"
			}else if ("May"== month_enter){
				month = "05"		
			}else if ("Jun"== month_enter){
				month = "06"
			}else if ("Jul"== month_enter){
				month = "07"
			}else if ("Aug"== month_enter){
				month = "08"
			}else if ("Sep"== month_enter){
				month = "09"
			}else if ("Oct"== month_enter){
				month = "10"
			}else if ("Nov"== month_enter){
				month = "11"
			}else if("Dec"== month_enter){
			    month = "12"
			}
		}	  
		newStartDate = day+'/'+month+'/'+year_enter;
		return newStartDate;
	}
	function duplicateDateRemoval(dueDate){
		var newdueDate=[];
		var status = null;
		for(var i=0; i<dueDate.length; i++){
			status = undefined;
			var arraydueDate = dueDate[i].split("-");
			var dateFormat = arraydueDate[1]+'/'+arraydueDate[0]+'/'+arraydueDate[2];
			var formattedDueDate = new Date(dateFormat);
			var dueMonth = formattedDueDate.getMonth()+1;
			var fullYear = formattedDueDate.getFullYear();
			for(var j=0; j<newdueDate.length; j++){
				var newarraydueDate = newdueDate[j].split("-");
				var newdateFormat = newarraydueDate[1]+'/'+newarraydueDate[0]+'/'+newarraydueDate[2];
				var newformattedDueDate = new Date(newdateFormat);
				var newdueMonth = newformattedDueDate.getMonth()+1;
				var newfullYear = newformattedDueDate.getFullYear();
				if(dueMonth === newdueMonth){
					if(fullYear === newfullYear){
						status = true;
						break;
					}
				}
			} 
			if(!status){
				newdueDate.push(dueDate[i]);
			}
		}
		return newdueDate;
	}
	function stringToDateConversion(strDate){
		strDate = strDate.split("-");
		var newStrDate = strDate[1]+'/'+strDate[0]+'/'+strDate[2];
		var newDate = new Date(newStrDate);
		return newDate;
	}
	
	function findMonth(month){
		var convertedMonth = null;
		if(month === 0){
			convertedMonth = "Jan"
		}
		if(month === 1){
			convertedMonth = "Feb"
		}
		if(month === 2){
			convertedMonth = "Mar"
		}
		if(month === 3){
			convertedMonth = "Apr"
		}
		if(month === 4){
			convertedMonth = "May"
		}
		if(month === 5){
			convertedMonth = "Jun"
		}
		if(month === 6){
			convertedMonth = "Jul"
		}
		if(month === 7){
			convertedMonth = "Aug"
		}
		if(month === 8){
			convertedMonth = "Sep"
		}
		if(month === 9){
			convertedMonth = "Oct"
		}
		if(month === 10){
			convertedMonth = "Nov"
		}
		if(month === 11){
			convertedMonth = "Dec"
		}
		return convertedMonth;
	}
	function numberWithCommas(amount) {
		var amount=amount.toString();
		var afterPoint = '';
		if(amount.indexOf('.') > 0)
		   afterPoint = amount.substring(amount.indexOf('.'),amount.length);
		amount = Math.floor(amount);
		amount=amount.toString();
		var lastThree = amount.substring(amount.length-3);
		var otherNumbers = amount.substring(0,amount.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var result = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
		
	   /*  return amount.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ","); */
	   return result;
	}
</script>

