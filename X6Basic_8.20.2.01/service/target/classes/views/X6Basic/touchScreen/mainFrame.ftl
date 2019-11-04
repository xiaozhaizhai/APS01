
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>杭州环境车辆管理系统</title>
	<link href="/bap/struts/touchScreen/css/style.css" rel="stylesheet" />
	<@maincss />
	<@mainjs />
	
	<script type="text/javascript">
					function WorkBenchLogout(){
							if(confirm("确认退出吗？")){
								window.location.href = "/publicX6Basic/touchScreen/logout.action";
							}
						}
						function showListView(type){
								var url="";
								if(type=="baoxiu"){
										url="/vehicle/maintenanceRepair/maintenanceRepair/list.action?__pc__=dmVoaWNsZV8xLjBfbWFpbnRlbmFuY2VSZXBhaXJfbGlzdF9zZWxmfA__&workFlowMenuCode=vehicle_1.0_maintenanceRepair_list&__res_html=true";
								}else if(type=="weixiu"){
										url="/vehicle/repairRecord/repairRecord/list.action?__pc__=dmVoaWNsZV8xLjBfcmVwYWlyUmVjb3JkX2xpc3Rfc2VsZnw_&workFlowMenuCode=vehicle_1.0_repairRecord_list&__res_html=true";	
								}else if(type=="jiancha"){
										url="/vehicle/repairRecord/repairRecord/list.action?__pc__=dmVoaWNsZV8xLjBfcmVwYWlyUmVjb3JkX2xpc3Rfc2VsZnw_&workFlowMenuCode=vehicle_1.0_repairRecord_list&__res_html=true";	
								}
								$("#mainFrame").attr("src",url);
						}
						
						$(function(){
								$(document.getElementById('mainFrame').contentWindow.document.body).attr("background","/bap/struts/touchScreen/img/pic_start.png")
						});
						
		</script>
	</head>

	<frameset rows="*" cols="210,*" frameborder="no" border="0" name="topfram" framespacing="0" >
		
		<frame name="leftFrame" noresize="true" scrolling="no" src="/X6Basic/touchScreen/menu.action"/>
				
		<frameset rows="77,*" cols="*" frameborder="no" border="0" name="allframe" framespacing="0" >
			<frame name="topFrame" noresize="true" scrolling="no" src="/bap/struts/mobile/topframe.html"/>
			<frame name="mainFrame" id="mainFrame" noresize="true" src=""/>
		</frameset>	
	</frameset>
</html>