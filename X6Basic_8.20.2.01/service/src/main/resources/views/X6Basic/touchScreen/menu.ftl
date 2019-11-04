
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title></title>
	<link href="/bap/struts/touchScreen/css/style.css" rel="stylesheet" />
	<script src="/bap/struts/touchScreen/js/jquery.js"></script>
	</head>

	<body>
		 <#assign mrFlag=checkUserPermisition('vehicle_1.0_maintenanceRepair_list_self')>
		 <#assign rpFlag=checkUserPermisition('vehicle_1.0_repairRecord_list_self')>
			   
		<div class="menu-container">
			<ul class="menu-list" id="menu-list">
			<#if mrFlag??&&mrFlag>
				<li onclick="top.showListView('baoxiu')"><span class="menu-list-icon icon-baoxiu"></span><span class="menu-list-text">报修</span></li>
			</#if>
			<#if rpFlag??&&rpFlag>
				<li  onclick="top.showListView('weixiu')" ><span class="menu-list-icon icon-baoxiu" ></span><span class="menu-list-text">维修</span></li>
			</#if>
			<#if rpFlag??&&rpFlag>	
			<li  onclick="top.showListView('jiancha')"><span class="menu-list-icon icon-jiancha" ></span><span class="menu-list-text">检查</span></li>
			</#if>	
				<li  onclick="top.WorkBenchLogout()"><span class="menu-list-icon icon-tuichu" ></span><span class="menu-list-text">退出</span></li>
			</ul>
			
			<div id="user-info" class="user-info">
				<div class="user-info-box">
					<span class="user-info-name">${(Session.staff.name)!}</span><span id="showTime"> </span>
				</div>
			</div>
		</div>
		
		
		<script type="text/javascript">
			$( '#menu-list li' ).hover(function(){
				//$(this).addClass('hover');
			},function(){
				//$(this).removeClass('hover');
			}).click(function(){
				$( '#menu-list li' ).removeClass('current');
				$(this).addClass('current');
			})
			
			function showDate(){
					 var obj,date,mins,secs,month;
					 obj = new Date();
					 mins = obj.getMinutes();
					 if (mins<=9){
					  	mins = "0" + mins;
					 }
					 secs=obj.getSeconds();
					 if (secs<=9){
					  	secs = "0" + secs;
					 }
					 month=obj.getMonth()+1;
					 if(month<=9){
					 	month= "0" + month;
					 }
					// date = obj.getFullYear() + "-";
					 date = month + "-";
					 date += obj.getDate() + " ";
					 date += obj.getHours() + ":";
					 date += mins + ":";
					 date += secs + "";
					 $("#showTime").html(date);
			}
			$(function(){
				window.setInterval("showDate()",500);
			});
		</script>
	</body>
	

</html>