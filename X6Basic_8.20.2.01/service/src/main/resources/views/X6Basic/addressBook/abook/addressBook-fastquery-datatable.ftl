<#if (Parameters.openType)?default('dialog') != 'dialog'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${getText('foundation.staff.selectStaff')}</title>
<@maincss/>
<@mainjs/>
</head>
<body id="iframe_addressbook">
</#if>
<style type="text/css">
#book{padding-left:8px;width:600px;}
#book a{width:19px;height:19px; line-height:19px; text-align:center;display:block;float:left;padding:0 0;background:url("/struts/css/edit_20120605.gif") no-repeat -161px -932px;color:#000;margin: 2px 2px 0 0; }
#book a:hover {color:#FFF;font-weight:bolder;border:0;margin: 2px 2px 0 0;background-position:-242px -932px;}
#book #book-all{width:36px; height:19px;background-position:-333px -932px;}
#book a#book-all:hover{background-position:-439px -932px;}

.ewc-dialog-el{height:100%;}
.addressBook-tb{width:95%;margin: 10px 0 0 12px;}
.addressBook-tb td{padding-right:3px;}
#queryStaffForm td {
    padding-bottom: 0px;
    text-align:left;
}
.opinions-on{
	text-decoration:none!important;
	margin-left:20px;
}
.opinions-off{
	text-decoration:none!important;
	margin-left:20px;
}
 </style>
<@errorbar id="addressStaffListErrorBar" />
<@loadpanel paddingLeft="70" />
<@s.hidden id="callBackFuncName" name="callBackFuncName" />
<@frameset  id="staffManage" border=0>
	<#if addressbookNeedDeptTreeFlag?? && addressbookNeedDeptTreeFlag>
	<@frame id="left_in" region="west" width=200 resize=true style="overflow-y:auto;overflow-x:hidden;">
		<@tree id="addressBookDepartmentTree" params="code,name,companyFlag" dataUrl="/foundation/addressBook/group/listChildren.action" rootName="${getText('foundation.addressBook.rootName')}"
			 callback="{onClick:function(event,treeId,node){CUI.resetForm('queryStaffForm');foundation.staff.showDepartmentStaffList(node);CUI.setCookie('nodeCookie_' + treeId,node.layRec,'d1');}}" />
		
	</@frame>
	</#if>
	<@frame id="staffManageMain_mail" region="center" offsetH=4 >
		<form id="queryStaffForm" onsubmit="return false;">
			<@s.hidden id="departmentId" />
			<@s.hidden id="cid" />
			<@s.hidden name="sheetName" id="sheetName" value="${getText('foundation.staff.baseinfo')}"/>
			<@s.hidden name="fileName" id="fileName" value="${getText('foundation.staff.staffinfo')}.xls"/>
			<@s.hidden name="actionMode" id="actionMode"/>
			<@s.hidden name="letterCondition" id="letterCondition"/>
			<@s.hidden name="addressBookContent" id="addressBookContent"/>
			<@s.hidden name="pictureShowName" id="pictureShowName" value="${getText('foundation.addressBook.picture')}"/>
			<table class="addressBook-tb" cellpadding="0" cellspacing="0" border="0" style="width:90%">
			<tr style='border-width : 0px '><td style='height:0px;border-width:0px;width:3%'></td><td style='height:0px;border-width:0px;width:18%'></td><td style='height:0px;border-width:0px;width:17%'></td><td style='height:0px;border-width:0px;width:18%'></td><td style='height:0px;border-width:0px;width:18%'></td><td style='height:0px;border-width:0px;width:19%'></td></tr>
				<tr style="height:25px;">
						<td>
						</td>
						<td>
						<@mneclient name="addressBookSearch" mneTip="${getText('foundation.staff.addressBook.addressBookSearch')}" id="addressBookSearch" url="/foundation/addressBook/mneClient.action" classStyle="cui-noborder-input" value="" type="other"  multiple=false mnewidth=237 searchClick="foundation.staff.fastQueryFormList()" />
						</td>
						<td   align="left"  colspan="2"     style="" >
						<div style="padding-left:20px;">
							<!--button type="submit" class="cui-simplebtn" onMouseOver="changeBtnClass(this);" onMouseOut="changeBtnClass(this);" onMouseOver="changeBtnClass(this);" onMouseOut="changeBtnClass(this);" onclick="foundation.staff.queryFormList(1)">${getText('common.button.query')}</button-->
							<div onclick="foundation.staff.fastQueryFormList()" onmouseup="setBtnChecked(1,'queryStaffForm')" class="edit-btn-query btn-act">
								<a class="cui-btn-l">&nbsp;</a>
								<a class="cui-btn-c">${getHtmlText('foundation.common.query')}</a>
								<a class="cui-btn-r-adv">&nbsp;</a>
							</div>
							<div onclick="foundation.staff.queryFormAdv(this)" onmouseup="setBtnChecked(2,'queryStaffForm')" class="edit-btn-adv btn-act">
								<a title="${getText('common.button.advancedquery')}" class="cui-btn-adv">&nbsp;</a>
							</div>
							<div style="margin-left:7px" onclick="foundation.staff.clearForm()" class="edit-btn btn-act" onmouseup="setBtnChecked(this,'queryStaffForm')">
								<a class="cui-btn-l">&nbsp;</a>
								<a class="cui-btn-c">${getHtmlText('common.button.clear')}</a>
								<a class="cui-btn-r">&nbsp;</a>
							</div>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
			</table>
		</form>
		<#assign styles = "margin-left:8px;margin-right:5px;">
		<#assign mailClick  = 'foundation.staff.sendMail(ocell);'>
		<#if (Parameters._from_)?? && Parameters._from_ == 'mail'>
			<#assign styles = styles + "margin-bottom:20px;">
		</#if>
		<@datatable renderOverEvent="_showPicture" dtPage="records" formId="queryStaffForm" firstLoad=false dataUrl="/foundation/addressBook/list-data.action?" id="staffList" style=styles transMethod="post" dblclick="foundation.staff.sendAddressStaffInfo"  hidekey="['PICTURE','STAFFID']" pageInitMethod="foundation.staff.initFastToolBar" moreButtonResizeFlag=false>
			<#if (Parameters.multiSelect)?default('false') == 'true'>
				<@datacolumn key="checkbox" type="checkbox" checkall="true" textalign="center" label="" width=25 />
			</#if>
			<@datacolumn label="${getHtmlText('foundation.addressBook.staffName')}" key="NAME" width=120></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.staff.email')}" key="EMAIL" width=180 click="function(ocell){${mailClick}}"></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.addressBook.departmentName')}" key="DEPARTMENTNAME" width=180></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.workinfo.fjhm')}"  key="FJHM" width=140></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.workinfo.zxhm')}"  key="ZXHM" width=140></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.staff.mobile')}"  key="MOBILE" width=110></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.staff.virtualMobile')}"  key="ZKXNH"  width=80></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.addressBook.positionName')}"  key="PNAME"  width=120></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.staff.FJH')}"  key="FJH"  width=80></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.staff.TXLBZ')}"  key="TXLBZ"  width=80></@datacolumn>
			<@datacolumn label="${getHtmlText('foundation.addressBook.picture')}" defaultTitle="${getText('foundation.addressBook.look')}"  key="PICTURE" click="function(){}" width=100></@datacolumn>
		</@datatable>
</@frame>
</@frameset>
<#if (Parameters.openType)?default('dialog') != 'dialog'>
</body>
</html>
</#if>
<script type="text/javascript">
changeBtnStyle();//按钮交互效果
//照片点击显示函数
 function _showPicture(){
	var as = $("td[key='PICTURE'] a");
	$.each(as,function(index) {
		if($(this).parent().parent().attr('truevalue') != '' && $(this).parent().parent().attr('truevalue') !=undefined){
			var url="/foundation/workbench/download.action?type=com.supcon.orchid.foundation.entities.Staff.image&linkId="+ $('input[name="STAFFID"]',$(this).parent().parent().parent()).val();
			//console.log($(this).parent().parent().parent().children('td:first').children('div:first').attr('title'));
			var _clickshow1 = new CUI.Clickshow({
				dTargetElement: $(this).parent(),	//必选项，目标元素ID 或者DOM节点引用
				layBodyContent: '<img src="'+url+'" style="width:100px;height:125px;" >',	//必选项，弹出层主体部分内容 string类型的html内容或者DOM节点引用		
				width:100,	//必选项，弹出层宽度
				height:151,	//必选项，弹出层高度
				zIndex:400,	//必选项，弹出层z坐标
				titleText:$(this).parent().parent().parent().children('td:first').children('div:first').attr('title')					
			});
			_clickshow1.beforeShow.subscribe(function(){YUD.setStyle(YUD.getElementsByClassName("clickshow-layer"),"display","none")});
		}
	});
}

(function(){
//注册命名空间
CUI.ns("foundation.staff");

$(function(){
	$("#queryStaffForm input[type='text']").bind("keydown",function(evt){
		if(evt.keyCode == 13){
			//按下回车
			setTimeout(function(){foundation.staff.queryFormList(1);}, 200);
			
		}
	});
});
//$(document).ready(function(){$(document).click(function(){foundation.staff.hidePicture()}));
//当前选中编辑员工，用于编辑时的上下翻页
foundation.staff.currentEditStaffId = "";
//获取指定员工StaffId,如果返回null，则表示已经到达第一条或者最后一条
var flag=false;

foundation.staff.fastQueryFormList=function(){
	foundation.staff.cancelSelectedNode();
	foundation.staff.queryFormList(1);
}

foundation.staff.cancelSelectedNode=function(){
		CUI("#cid").val("");
		CUI("#departmentId").val("");
}

foundation.staff.getSpecifiedStaffId = function(action){
	var returnValue = "";
	var rows = staffListWidget.getAllRows();
	
	for(var i=0; i<rows.length; i++){
		switch(action){
			case "first":
					returnValue = rows[0].STAFFID;
					break;
			case "previous":
					if(rows[i].STAFFID == foundation.staff.currentEditStaffId){
						if(rows[i-1] != undefined){
							returnValue = rows[i-1].STAFFID;
						}else{
							returnValue = -1;
						}
					}
					break;
			case "next":
					if(rows[i].STAFFID == foundation.staff.currentEditStaffId){
						if(rows[i+1] != undefined){
							returnValue = rows[i+1].STAFFID;
						}else{
							returnValue = -2;
						}
					}
					break;
			case "last":
					returnValue = rows[rows.length-1].STAFFID;
					break;
		}
		
		if(returnValue!= "") break;
	}
	
	if(returnValue > 0){ 
		foundation.staff.currentEditStaffId = returnValue;
	}

	return returnValue;
}
$('body').click(function(){
	var overlayDiv = $('body>div[id="overlay-container"]');
	if(overlayDiv.length > 0){
		overlayDiv.hide();
		$('body>iframe[id="overlay-containeroverlayFrame"]').hide();
	}	
});
foundation.staff.showMode = function(mode) {
	foundation.staff.cancelSelectedNode();
	CUI("a[id!='+mode+']","#book").attr("class","opinions-off");
	CUI("#book-" + mode).attr("class","opinions-on");
	$("input[name='letterCondition']").val($("a[class='opinions-on']",'#book').attr('value'));
	foundation.staff.queryFormList(2);
}

function getEvent() {  
    if(document.all)  return window.event;    
    func=getEvent.caller;        
    while(func!=null){  
        var arg0=func.arguments[0]; 
        if(arg0) 
        { 
          if((arg0.constructor==Event || arg0.constructor ==MouseEvent) || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)) 
          {  
          return arg0; 
          } 
        } 
        func=func.caller; 
    } 
    return null; 
}


function settingCallBack(){
	var str="";
	CUI(':checkbox[checked="true"]').each(function(index){
		var table=CUI(this).attr("tableName");
		var col=CUI(this).attr("colName");
		if(table!=undefined&&col!=undefined){
			str+=','+table+"_"+col;
		}
		
	});
	str=str.substr(1);

	str1="fieldSave="+str;
	
	CUI.ajax({
		url:'/foundation/staff/exportOut/exportField_save.action',
		type: 'post',
		async: false,
		data: str1,
		success: function(response) {
		}
	});
	
	   
	var exportForm=CUI('#exportForm');
	CUI('<input type="hidden" name="selectField" value="'+str+'">').appendTo(exportForm);
	exportSettingDialog.close();
}


//人员查询
foundation.staff.queryFormList = function(obj){
	
	var url = "/foundation/addressBook/list-data.action?";
	var dataPost = "";
	if($("input[name='addressBookSearch']").val() != "${getText('foundation.staff.addressBook.addressBookSearch')}") {
		$("input[name='addressBookContent']").val(encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val())));
		dataPost = "&addressBookContent=" +encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val()));
		dataPost+="&cid="+CUI("#cid").val();
		dataPost+="&departmentId="+CUI("#departmentId").val();
	}
	if(obj == 1) {
		$("input[name='letterCondition']").val('');
	}
	if(obj == 2) {
		var letterCondition = $("a[class='opinions-on']",'#book').attr('value');
		dataPost += (dataPost==""?"":"&") + "letterCondition=" +encodeURIComponent(CUI.trim(letterCondition));
	}
	if(obj == 3){
		$("input[name='letterCondition']").val('');
		dataPost = $('#foundation_staff_adv_form').serialize();
		//解决高级查询分页的问题----将高级查询的控件动态添加到分页的Form中
		var advForm=CUI("#foundation_staff_adv_form");
		var staffName=(CUI("input[name='staff.name']",advForm)!=null)?CUI("input[name='staff.name']",advForm).val():"";
		var staffEmail=(CUI("input[name='staff.email']",advForm)!=null)?CUI("input[name='staff.email']",advForm).val():"";
		var staffMobile=(CUI("input[name='staff.mobile']",advForm)!=null)?CUI("input[name='staff.mobile']",advForm).val():"";
		
		var staffVirtualMobile=(CUI("input[name='staff.virtualMobile']",advForm)!=null)?CUI("input[name='staff.virtualMobile']",advForm).val():"";
		var staffSex=(CUI("input[name='staffSex']",advForm)!=null)?CUI("select[name='staffSex']",advForm).val():"";
		var companyName=(CUI("input[name='companyName']",advForm)!=null)?CUI("input[name='companyName']",advForm).val():"";
		var departmentName=(CUI("input[name='departmentName']",advForm)!=null)?CUI("input[name='departmentName']",advForm).val():"";
		var positionName=(CUI("input[name='positionName']",advForm)!=null)?CUI("input[name='positionName']",advForm).val():"";
		var workinfoFjhm=(CUI("input[name='workinfoFjhm']",advForm)!=null)?CUI("input[name='workinfoFjhm']",advForm).val():"";
		var staffZWMC=(CUI("input[name='staffZWMC']",advForm)!=null)?CUI("input[name='staffZWMC']",advForm).val():"";
		var staffFJH=(CUI("input[name='staffFJH']",advForm)!=null)?CUI("input[name='staffFJH']",advForm).val():"";
		if(CUI("#advQuery_staffName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffName",CUI("#queryStaffForm")).val(staffName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.name' value='"+staffName+"' id='advQuery_staffName'/>");
		}
		if(CUI("#advQuery_staffEmail",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffEmail",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffEmail",CUI("#queryStaffForm")).val(staffEmail);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.email' value='"+staffEmail+"' id='advQuery_staffEmail'/>");
		}
		if(CUI("#advQuery_staffMobile",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffMobile",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffMobile",CUI("#queryStaffForm")).val(staffMobile);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.mobile' value='"+staffMobile+"' id='advQuery_staffMobile'/>");
		}
		if(CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffVirtualMobile",CUI("#queryStaffForm")).val(staffVirtualMobile);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staff.virtualMobile' value='"+staffVirtualMobile+"' id='advQuery_staffVirtualMobile'/>");
		}
		if(CUI("#advQuery_staffSex",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffSex",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffSex",CUI("#queryStaffForm")).val(staffSex);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffSex' value='"+staffSex+"' id='advQuery_staffSex'/>");
		}
		if(CUI("#advQuery_companyName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_companyName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_companyName",CUI("#queryStaffForm")).val(companyName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='companyName' value='"+companyName+"' id='advQuery_companyName'/>");
		}
		if(CUI("#advQuery_departmentName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_departmentName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_departmentName",CUI("#queryStaffForm")).val(departmentName);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='departmentName' value='"+departmentName+"' id='advQuery_departmentName'/>");
		}
		if(CUI("#advQuery_positionName",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_positionName",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_positionName",CUI("#queryStaffForm")).val(positionName);
		} else {
			CUI("#queryStaffForm").append("<input type='hidden' name='positionName' value='"+positionName+"' id='advQuery_positionName'/>");
		}
		if(CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_workinfoFjhm",CUI("#queryStaffForm")).val(workinfoFjhm);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='workinfoFjhm' value='"+workinfoFjhm+"' id='advQuery_workinfoFjhm'/>");
		}
		if(CUI("#advQuery_staffZWMC",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffZWMC",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffZWMC",CUI("#queryStaffForm")).val(staffZWMC);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffZWMC' value='"+staffZWMC+"' id='advQuery_staffZWMC'/>");
		}
		if(CUI("#advQuery_staffFJH",CUI("#queryStaffForm"))!=undefined&&CUI("#advQuery_staffFJH",CUI("#queryStaffForm")).length>0){
			CUI("#advQuery_staffFJH",CUI("#queryStaffForm")).val(staffFJH);
		}
		else{
			CUI("#queryStaffForm").append("<input type='hidden' name='staffFJH' value='"+staffFJH+"' id='advQuery_staffFJH'/>");
		}
		$('body').data('addressbook_query_condition', {'staff.name':$("input[name='staff.name']").val(),'staff.email':$("input[name='staff.email']").val()
		,'staff.mobile':$("input[name='staff.mobile']").val(),'staff.virtualMobile':$("input[name='staff.virtualMobile']").val()
		,'staffSex':$("select[name='staffSex']").val(),'companyName':$("input[name='companyName']").val(),'departmentName':$("input[name='departmentName']").val(),'positionName':$("input[name='positionName']").val()
		,'workinfoFjhm':$("input[name='workinfoFjhm']").val(),'staffZWMC':$("input[name='staffZWMC']").val(),'staffFJH':$("input[name='staffFJH']").val()
		});
	}
	
	if(obj != 3){
		if($('body').data('addressbook_query_condition')){	 
			$('body').data('addressbook_query_condition',null);
		}
		$("input[id^='advQuery_']").val("");
	}
	datatable_staffList.setRequestDataUrl(url,dataPost);	
	
	if(obj == 3){
		foundation.staff.dialog.close();
	}
}
//人员高级查询
foundation.staff.queryFormAdv = function(obj){	
	foundation.staff.cancelSelectedNode();
	var url = "/foundation/addressBook/list-adv.action";
	if($('body').data('addressbook_query_condition')){
		url = url + "?staff.name=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.name']);
		url = url + "&staff.email=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.email']); 
		url = url + "&staff.mobile=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.mobile']); 
		url = url + "&staff.virtualMobile=" + encodeURIComponent($('body').data('addressbook_query_condition')['staff.virtualMobile']); 
		url = url + "&staffSex=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffSex']); 
		url = url + "&companyName=" + encodeURIComponent($('body').data('addressbook_query_condition')['companyName']); 
		url = url + "&departmentName=" + encodeURIComponent($('body').data('addressbook_query_condition')['departmentName']);
		url = url + "&positionName=" + encodeURIComponent($('body').data('addressbook_query_condition')['positionName']); 
		url = url + "&workinfoFjhm=" + encodeURIComponent($('body').data('addressbook_query_condition')['workinfoFjhm']); 
		url = url + "&staffZWMC=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffZWMC']); 
		url = url + "&staffFJH=" + encodeURIComponent($('body').data('addressbook_query_condition')['staffFJH']); 	
	}else{
		url = url + "?staff.name=";
		url = url + "&staff.email="; 
		url = url + "&staff.mobile="; 
		url = url + "&staff.virtualMobile="; 
	}
	showAdvDialog(url);
};

/**
 * 显示高级查询对话框
 * @method showAdvDialog
 * @param {String} url
 * @private
 */
var showAdvDialog = function(url) {
	foundation.staff.dialog = new CUI.Dialog({
		title: "${getText('foundation.staff.advancedquery')}",
		formId: "foundation_staff_adv_form",
		url:url,
		modal:true,
		type:3,
		dragable:true,
		buttons:[{	name:"${getText('common.button.query')}",
					handler:function(){foundation.staff.queryFormList(3);}
				},
				{	name:"${getText('common.button.cancel')}",
					handler:function(){this.close()}
				}]
	});
	foundation.staff.dialog.show();
};


//选择部门
foundation.staff.selectPDepartment = function(){
		foundation.staff.dialog = new CUI.Dialog({
					title: "${getText('foundation.department.manage')}",
					url: "/foundation/department/common/departmentListFrame.action?callBackFuncName=foundation.staff.getDepartmentInfo&crossCompanyFlag=true&openType=dialog",
					modal:true,
					type:4,
					buttons:[{	name:"${getText('common.button.choose')}",
								handler:function(){foundation.department.sendBackDepartmentInfo();}
							},
							{	name:"${getText('common.button.close')}",
								handler:function(){this.close()}
							}]
				});
				foundation.staff.dialog.show();
	};
	
	//获取所属部门信息
	foundation.staff.getDepartmentInfo = function(oDepartments){
		CUI("#departmentName").val(oDepartments[0].name);
		foundation.staff.dialog.close();
	};
	
	foundation.staff.clearTips = function(obj) {
		if($(obj).val() == "${getText("foundation.staff.addressBook.addressBookSearch")}") {
			$(obj).val('');
			$("input[name='addressBookContent']").val('');
			//$(obj).removeClass('search-ft-color');
		}
	}
	
	foundation.staff.restoreTips = function(obj) {
		if($(obj).val() == '') {
			$(obj).val("${getText("foundation.staff.addressBook.addressBookSearch")}");
			//$(obj).addClass('search-ft-color');
			$("input[name='addressBookContent']").val('');
		} else {
			$("input[name='addressBookContent']").val(encodeURIComponent(CUI.trim(CUI("input[name='addressBookSearch']",CUI("#queryStaffForm")).val())));
		}
	}
	
	foundation.staff.clearForm = function() {
		$("input[name='addressBookSearch']").val('');
		$("input[name='addressBookContent']").val('');
		$("input[name='letterCondition']").val('');
		CUI.restoreMneTips($("input[name='addressBookSearch']"), 'addressBookSearch_mneTipLabel', 'queryStaffForm');
	}
	
	foundation.staff.initFastToolBar = function() {
		var fastToolDiv = $("<div id='book'></div>");
		var character = new Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
		var strAll = $("<a id=\"book-all\" class=\"opinions-on\"  hidefocus=\"true\" value=\"all\" href='javascript:foundation.staff.showMode(\"all\")'>${getText('foundation.inter.all')}</a>");
		fastToolDiv.append(strAll);
		for(var i = 0; i < character.length; i++){
			var str = $("<a id=\"book-" + character[i] + "\" class=\"opinions-off\" hidefocus=\"true\" value=\"" + character[i] + "\" href='javascript:foundation.staff.showMode(\"" + character[i] + "\")'>" + character[i].toUpperCase() + "</a>");
			fastToolDiv.append(str);
		}
		fastToolDiv.appendTo($('.paginatorbar-operatebar','#staffList'));
		$('.paginatorbar','#staffList').css('text-align','left');
		$('.datagrid-loading','#staffList').css('left','614px');
	}
	var displayFlag;
	foundation.staff.hidePicture = function(){
		var objDiv = CUI('div[id^="personalPicture"]');
		if(displayFlag==false){
			for(var i=0;i<objDiv.length;i++){	
				objDiv[i].style.display="none";			
			}
		}
	}
	
	foundation.staff.showPicture = function(obj){
		var evt = getEvent();
		var path=obj.PICTURE;
		var url="/foundation/staff/image.action?path="+path;
		//隐藏已经存在的picture的div
		var objDiv = CUI('div[id^="personalPicture"]');
		for(var i=0;i<objDiv.length;i++){
			if(objDiv[i].id!="personalPicture"+path){	
				objDiv[i].style.display="none";		
			}	
		}
		if(document.getElementById("personalPicture"+path)==null){
		
			var objDiv = CUI('<div style="border:1px solid black;width:120px;height:130px;"></div>');
			var image=CUI('<img src="'+url+'" style="width:120px;height:130px;" >');
			objDiv.css('position','absolute');
			objDiv.css('top',evt.clientY);
			objDiv.css('left',evt.clientX);
			objDiv.css('z-index', 99999999);
			objDiv.attr('id',"personalPicture"+path);
			CUI(document.body).append(objDiv);
			objDiv.append(image);
			
			displayFlag=true;
			document.getElementById("personalPicture"+path).style.display = "block";
		}else{
				if(document.getElementById("personalPicture"+path).style.display=="none"){
					document.getElementById("personalPicture"+path).style.display="block";
					document.getElementById("personalPicture"+path).style.top = evt.clientY;
					document.getElementById("personalPicture"+path).style.left= evt.clientX;
					displayFlag=true;
				}else{
					document.getElementById("personalPicture"+path).style.display="none";
					displayFlag=false;
				}
		}
	}
	foundation.staff.showDepartmentStaffList=function(node){
		if(node.companyFlag){
			CUI("#cid").val(node.id);
			CUI("#departmentId").val("");
		}else{
			CUI("#cid").val("");
			CUI("#departmentId").val(node.id);
		}
		foundation.staff.queryFormList(1);
	}
	foundation.staff.sendAddressStaffInfo=function(event,oRow){
	 <#if refernce?default('false') == "true">
		var arrObj = new Array();
	
		var oRows = new Array();
		if(event == undefined){
			oRows = staffListWidget.selectedRows;
		}else{
			oRows.push(oRow);
		}
	
		if(oRows.length == 0){
			//addressStaffListErrorBarWidget.showMessage("${getText('foundation.staff.checkselected')}","f");
			return false;
		}
	
		for(var i=0; i<oRows.length; i++){
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#callBackFuncName").val() != ""){
				<#if (Parameters.openType)?default('page') != 'dialog'>
					if(typeof (opener)=='undefined' || opener == null) {
						eval("parent.dialogArguments." + CUI("#callBackFuncName").val() + "(arrObj)");
					} else {
						eval("opener." + CUI("#callBackFuncName").val() + "(arrObj)");
					}
				<#else>
					<#if (Parameters.srcFrame)??>
					var ifr_window = window.frames["${Parameters.srcFrame}"];
					eval("ifr_window." + CUI("#callBackFuncName").val() + "(arrObj)");
					<#else>
					eval(CUI("#callBackFuncName").val() + "(arrObj)");
					</#if>
				</#if>
			}else{
				getAddressBook(arrObj);
			}
			<#if (Parameters.openType)?default('page') != 'dialog'>
			<#if (Parameters.multiSelect)?default('false') != 'true'>
				setTimeout(function(){
					try {
						if(CUI("#closePage").val() != "false") {
							top.opener.focus();
							CUI.closeWindow();
						}
					}catch(e){}
				},1000);
			</#if>
			</#if>
			//addressStaffListErrorBarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			//addressStaffListErrorBarWidget.showMessage("${getText('foundation.add.failure')}","f");
			//alert("注意：父窗口回调出错！");
		}
	</#if>
	}
	foundation.staff.returnAddressStaffInfo=function(event,oRow){
	
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = staffListWidget.selectedRows;
		}else{
			oRows.push(oRow);
		}
	
		if(oRows.length == 0){
			//addressStaffListErrorBarWidget.showMessage("${getText('foundation.staff.checkselected')}","f");
			return false;
		} else {
			//addressStaffListErrorBarWidget.showMessage("${getText('foundation.add.success')}","s");
		}
	
		for(var i=0; i<oRows.length; i++){
			arrObj.push(oRows[i]);
		}
		return arrObj;
	}
	foundation.staff.sendMail = function(ocell){
		var email = ocell.EMAIL;
		var menuCode='inner_mail_menu';
		var parentCode='mail_menus';
		var url='/extmail/cgi/compose.cgi?atag=1&to=' + email;
		var item = {};
	    item.url = url;
	    item.target = 'IFRAME';
	    top.loadPage(item);
	}
})();
function getAllSelectedRows(){
	return foundation.staff.returnAddressStaffInfo();
}
</script>
