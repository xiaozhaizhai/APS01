<link href="/static/meetingCalendar/css/gantt.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.datagrid-loading{zoom:1;}
}
</style>
<script src="/static/meetingCalendar/js/gantt.js"></script>
<input type="hidden" name="calendar_meetingRoom_meetingRoomInfo_reference_callBackFuncName" id="calendar_meetingRoom_meetingRoomInfo_reference_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="calendar_meetingRoom_meetingRoomInfo_referenceErrorbar" />
<@frameset id="ec_calendar_meetingRoom_meetingRoomInfo_reference_container" border=0>
	<@frame id="ec_calendar_meetingRoom_meetingRoomInfo_reference_container_main" offsetH=4 region="center" class="center_in">
	<#if businessCenterCode?? >
	<div>
	<div class="edit-menubar"><span class="title-bar">${getText('calendar.entityname.radion1349763102325')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_calendar_meetingRoom_meetingRoomInfo_reference_queryFormErrorBar" />
</div>	
	<div id="meetingRoom_info_recordcolt" class="etv-navset" style="width: 786px; ">
		<div>
			<div class="etv-scrollbar" id="scrollbar" style="width: 776px; ">
				<ul class="etv-nav nav-scroll" style="display: block; ">
				    <li onclick="createDateTable(this)" num="0"><span class="etv-nav-span"><em class="etv-nav-em" style="width: 70px; ">空闲</em></span><span class="etv-nav-span-r"></span></li>
				    <li onclick="createDateTable(this)" num="1"><span class="etv-nav-span"><em class="etv-nav-em" style="width: 70px; ">显示所有</em></span><span class="etv-nav-span-r"></span></li>
				    <li onclick="createDateTable(this)" num="2"><span class="etv-nav-span"><em class="etv-nav-em" style="width: 70px; ">使用情况</em></span><span class="etv-nav-span-r"></span></li>
				</ul>
		</div>
		<div class="etv-content" style="margin-left:-8px; height: 485px; width: 786px; ">
			<@datatable id="ec_calendar_meetingRoom_meetingRoomInfo_reference_query" height=420 modelCode="X6Basic_1.0_meetingroom_MeetingRoom" noPermissionKeys="name,roomSize,network,whiteBoard,audio,projector,camera" hidekeyPrefix="ec_calendar_meetingRoom_meetingRoomInfo_reference_query" orderMode="backstage" queryFunc="" formId="ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm" exportExcel=false dblclick="calendar.meetingRoom.meetingRoomInfo.reference.sendBackreference" style="margin-left:13px;margin-right:4px;" editable=false dtPage="allMeetingRoomPage" dataUrl="/X6Basic/meetingroom/meetingRoom/reference-free.action?startTime=${startTime?string('yyyy-MM-dd HH:mm:ss')}&endTime=${endTime?string('yyyy-MM-dd HH:mm:ss')}" transMethod="post" hidekey="['id','version']" >
				<#if flowBulkFlag?? && flowBulkFlag==true>
	    			<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    		</#if>
				<#assign name_displayDefaultType  = ''>
				<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1366792696971')}" textalign="left"  width=100  type="textfield"    />
				<#assign roomSize_displayDefaultType  = ''>
				<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${roomSize_displayDefaultType!}"  key="roomSize.value"  label="${getText('X6Basic.propertydisplayName.radion1366793347089')}" textalign="center"  width=100  type="systemcode"    />
				<#assign network_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${network_displayDefaultType!}"  key="network"  label="${getText('X6Basic.propertydisplayName.radion1366792858041')}" textalign="center"  width=100  type="boolean"    />
				<#assign whiteBoard_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${whiteBoard_displayDefaultType!}"  key="whiteBoard"  label="${getText('X6Basic.propertydisplayName.radion1366793054934')}" textalign="center"  width=100  type="boolean"    />
				<#assign audio_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${audio_displayDefaultType!}"  key="audio"  label="${getText('X6Basic.propertydisplayName.radion1366792961138')}" textalign="center"  width=100  type="boolean"    />
				<#assign projector_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${projector_displayDefaultType!}"  key="projector"  label="${getText('X6Basic.propertydisplayName.radion1366793011250')}" textalign="center"  width=100  type="boolean"    />
				<#assign camera_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${camera_displayDefaultType!}"  key="camera"  label="${getText('X6Basic.propertydisplayName.radion1366792991306')}" textalign="center"  width=100  type="boolean"    />
			</@datatable>
			<@datatable id="ec_calendar_meetingRoom_meetingRoomInfo_reference_all" height=420 modelCode="X6Basic_1.0_meetingroom_MeetingRoom" noPermissionKeys="name,roomSize,network,whiteBoard,audio,projector,camera" hidekeyPrefix="ec_calendar_meetingRoom_meetingRoomInfo_reference_all" orderMode="backstage" queryFunc="" formId="ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm" exportExcel=false dblclick="calendar.meetingRoom.meetingRoomInfo.reference.sendBackreference" style="margin-left:13px;margin-right:4px;" editable=false dtPage="freeMeetingRoomPage" dataUrl="/X6Basic/meetingroom/meetingRoom/reference-all.action" transMethod="post" hidekey="['id','version']" >
				<#if flowBulkFlag?? && flowBulkFlag==true>
	    			<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    		</#if>
				<#assign name_displayDefaultType  = ''>
				<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"  label="${getText('X6Basic.propertydisplayName.radion1366792696971')}" textalign="left"  width=100  type="textfield"    />
				<#assign roomSize_displayDefaultType  = ''>
				<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${roomSize_displayDefaultType!}"  key="roomSize.value"  label="${getText('X6Basic.propertydisplayName.radion1366793347089')}" textalign="center"  width=100  type="systemcode"    />
				<#assign network_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${network_displayDefaultType!}"  key="network"  label="${getText('X6Basic.propertydisplayName.radion1366792858041')}" textalign="center"  width=100  type="boolean"    />
				<#assign whiteBoard_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${whiteBoard_displayDefaultType!}"  key="whiteBoard"  label="${getText('X6Basic.propertydisplayName.radion1366793054934')}" textalign="center"  width=100  type="boolean"    />
				<#assign audio_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${audio_displayDefaultType!}"  key="audio"  label="${getText('X6Basic.propertydisplayName.radion1366792961138')}" textalign="center"  width=100  type="boolean"    />
				<#assign projector_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${projector_displayDefaultType!}"  key="projector"  label="${getText('X6Basic.propertydisplayName.radion1366793011250')}" textalign="center"  width=100  type="boolean"    />
				<#assign camera_displayDefaultType  = ''>
				<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${camera_displayDefaultType!}"  key="camera"  label="${getText('X6Basic.propertydisplayName.radion1366792991306')}" textalign="center"  width=100  type="boolean"    />
			</@datatable>
			<div id="ec_calendar_meetingRoom_meetingRoomInfo_reference_useStatus" valign="top" style="border-collapse: collapse; margin: 5px 0px 5px 13px;">	
				<div style="position:relative;height:465px;">
					<div id="gantthand" style="width:120px;position:absolute;top:41px; height: 410px;overflow: hidden; border:1px #3969a7 solid;overflow: hidden">
						<div id="gantthand-top" style="height:22px;line-height:22px;text-align:center;position:relative;background:#fff;z-index:2;border-bottom:1px solid #1E557E;background:url('/static/meetingCalendar/img/gantthand-top-bg.gif') repeat-x;">
						 会议室
						</div>
						<table id="ganttLeft1" style="border-collapse: collapse;" cellspacing="0" cellpadding="0" >
							<thead>
								<tr>
									<td width="120"/>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div id="ganttdiv1"  style="border: 1px solid #6593cf;width: 640px;height: 460px;position:absolute;top:5px; right:0; overflow-x: scroll; overflow-y:auto;">
					</div>
				</div>					
			</div>
		</div>
	</div>	
</@frame>
</@frameset>
<!-- CUSTOM HTML START -->
<!-- 定制的HTML代码区域 -->

<!-- CUSTOM HTML END -->
<script type="text/javascript">
			(function(){
		var anim_scroll;
		var start_y = null;
		YUE.on('ganttdiv1','scroll',function(){	
			if(start_y === null){
				start_y = YUD.get('ganttdiv').scrollTop;
			}
			// 判断是否是滚动Y轴
			if(start_y != YUD.get('ganttdiv1').scrollTop){
				YUD.get('gantthand1').scrollTop = YUD.get('ganttdiv1').scrollTop;
				YUD.get('gantthand-top1').style.top = YUD.get('gantthand1').scrollTop + 'px';
				YUD.get('gantt-top').style.display = 'none';	
				if(anim_scroll){
					clearTimeout(anim_scroll);
				}			
				anim_scroll = setTimeout(function(){
					YUD.get('gantt-top').style.top = YUD.get('ganttdiv1').scrollTop + 'px';
					YUD.get('gantt-top').style.display = '';	
					/*
					 * var attributes = { opacity : { from : 0, to : 1 } }; var
					 * anim = new YAHOO.util.Anim('gantt-top',attributes, 0.5);
					 * anim.animate();
					 */
					start_y = null;
				},200);		
			}else{
				// IE9 10滚动滑轮可能只会触发一次scroll事件
				YUD.get('gantthand1').scrollTop = YUD.get('ganttdiv1').scrollTop;
				YUD.get('gantthand-top1').style.top = YUD.get('gantthand1').scrollTop + 'px';
				YUD.get('gantt-top').style.top = YUD.get('ganttdiv1').scrollTop + 'px';
			}
		});
	})();

	CUI.ns("calendar.meetingRoom.meetingRoomInfo.reference");

	/**
	 * 查询
	 * @method calendar.meetingRoom.meetingRoomInfo.reference.query
	 */
	calendar.meetingRoom.meetingRoomInfo.reference.query = function(type,pageNo){
		if(!checkListValid("ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm")) {
				return false;
		}
		var dataPost="";
		var url = "/calendar/meetingRoom/meetingRoomInfo/reference-query.action";
		CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm')).each(function(index){
			if(CUI(this).attr('name')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name="'+fastCol+'"]').val();
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(fastCol.endsWith('_start')) {
						var dateType = CUI(this).attr('dateType');
						if(dateType && dateType == 'date') {
							fastColValue += " 00:00:00";
						}
					}
					if(fastCol.endsWith('_end')) {
						var dateType = CUI(this).attr('dateType');
						if(dateType && dateType == 'date') {
							fastColValue += " 23:59:59";
						}
					}
					var multable = CUI(this).attr('multable');
					if(multable && multable == "yes") {
						dataPost += "&" + fastCol + "=," + encodeURIComponent(fastColValue) + ",";
					} else {
						dataPost += "&" + fastCol + "=" + encodeURIComponent(fastColValue);
					}
				}
			}
		});
		var pageSize=CUI('input[name="ec_calendar_meetingRoom_meetingRoomInfo_reference_query_PageLink_PageCount"]').val();
		dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&searchCondition="+$('#calendar_meetingRoom_meetingRoomInfo_reference_condition').val();
	 	datatable_ec_calendar_meetingRoom_meetingRoomInfo_reference_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	calendar.meetingRoom.meetingRoomInfo.reference._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		calendar.meetingRoom.meetingRoomInfo.reference._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				calendar.meetingRoom.meetingRoomInfo.reference._prefix += '.';
			}
			calendar.meetingRoom.meetingRoomInfo.reference._prefix += arr[i];
		}
		calendar.meetingRoom.meetingRoomInfo.reference._suffix = arr[arr.length -1];
		if(calendar.meetingRoom.meetingRoomInfo.reference._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			refparam = 'condition=' + calendar.meetingRoom.meetingRoomInfo.reference._querycustomFunc(objName.replace(/\./g, '_')).replace(/\s+/g,'@@space_quote@@').replace(/\"/g,'@@double_quote@@').replace(/\'/g,'@@single_quote@@').replace(/%/g,'@@wcard_quote@@').replace(/=/g,'@@equal_quote@@');
		}
		calendar.meetingRoom.meetingRoomInfo.reference._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'calendar.meetingRoom.meetingRoomInfo.reference.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	calendar.meetingRoom.meetingRoomInfo.reference.getcallBackInfo = function(obj){
		CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name="'+calendar.meetingRoom.meetingRoomInfo.reference._prefix + '.' + calendar.meetingRoom.meetingRoomInfo.reference._suffix +'"]').val(obj[0][calendar.meetingRoom.meetingRoomInfo.reference._suffix]);
		CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name="'+calendar.meetingRoom.meetingRoomInfo.reference._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name^="'+calendar.meetingRoom.meetingRoomInfo.reference._prefix + '."]').unbind("change");
		CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name="'+calendar.meetingRoom.meetingRoomInfo.reference._prefix + '.' + calendar.meetingRoom.meetingRoomInfo.reference._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_calendar_meetingRoom_meetingRoomInfo_reference_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(calendar.meetingRoom.meetingRoomInfo.reference._dialog) {
			calendar.meetingRoom.meetingRoomInfo.reference._dialog.close();
		}
	};
	
	calendar.meetingRoom.meetingRoomInfo.reference._querycustomFunc = function(obj) {
		var str = eval("typeof(calendar.meetingRoom.meetingRoomInfo.reference.query_"+obj+")!='undefined'") ? eval('calendar.meetingRoom.meetingRoomInfo.reference.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_calendar_meetingRoom_meetingRoomInfo_reference_query.selectedRows.length == 0){
			CUI.Dialog.alert("${getText('calendar.meetingRoomInfo.checkselected')}");
			return false;
		}
		calendar.meetingRoom.meetingRoomInfo.reference.sendBackreference(null,datatable_ec_calendar_meetingRoom_meetingRoomInfo_reference_query.selectedRows[0]);
	};
	/**
	 * 双击事件
	 * @method calendar.meetingRoom.meetingRoomInfo.reference.sendBackreference
	 */
	calendar.meetingRoom.meetingRoomInfo.reference.sendBackreference = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_calendar_meetingRoom_meetingRoomInfo_reference_query.selectedRows;
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('calendar.meetingRoomInfo.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#calendar_meetingRoom_meetingRoomInfo_reference_callBackFuncName").val() != ""){
				eval(CUI("#calendar_meetingRoom_meetingRoomInfo_reference_callBackFuncName").val() + "(arrObj)");
			}else{
				getDepartmentInfo(arrObj);
			}
			calendar_meetingRoom_meetingRoomInfo_referenceErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			calendar_meetingRoom_meetingRoomInfo_referenceErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
	
	/**
	 * 显示增加对话框
	 * @method calendar.meetingRoom.meetingRoomInfo.reference.showDialog
	 * @param {String} url
	 * @private
	 */
	calendar.meetingRoom.meetingRoomInfo.reference.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = calendar.meetingRoom.meetingRoomInfo.reference.otherParams;
		if(otherParams && otherParams.referenceCopyBtn) {
			buttons.push(otherParams.referenceCopyBtn);
		}
		if(otherParams && otherParams.uploadBtn) {
			buttons.push(otherParams.uploadBtn);
		}
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		buttons.push({	
			name:"${getText('common.button.save')}",
			handler:function(){CUI('#'+formId).submit();}
		});
		buttons.push({
			name:"${getText('common.button.cancel')}",
			handler:function(){checkChange(this);}
		});
		calendar.meetingRoom.meetingRoomInfo.reference.Dlg =	new CUI.Dialog({
			title: "${getText('" + title + "')}",
			url :url,
			formId: formId,
			modal:true,
			width:width || 460,
			height: height || 330,
			type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		calendar.meetingRoom.meetingRoomInfo.reference.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'calendar_meetingRoom_meetingRoomInfo', element : $('#calendar_meetingRoom_meetingRoomInfo_reference_fileupload_button a:eq(1)')});
		}
		calendar.meetingRoom.meetingRoomInfo.reference.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method calendar.meetingRoom.meetingRoomInfo.reference.approvalDialog
	 * @param {String} url
	 * @private
	 */
	calendar.meetingRoom.meetingRoomInfo.reference.approvalDialog = function(url,formId,title,width,height) {
		calendar.meetingRoom.meetingRoomInfo.reference.AppDlg =	new CUI.Dialog({
			title: "${getText('" + title + "')}",
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){calendar.meetingRoom.meetingRoomInfo.approval();}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		calendar.meetingRoom.meetingRoomInfo.reference.AppDlg.show();
	};
	
calendar.meetingRoom.meetingRoomInfo.reference.showLinkView = function(url,propertyId,row,formId,title,width,height){
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		calendar.meetingRoom.meetingRoomInfo.reference.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};

$(function(){
		//将页面页签都变为未选择
		$("li",$("#scrollbar")).removeClass();
		$($("li[num=0]",$("#scrollbar"))[0]).removeClass().addClass("selected");
		//将下面div隐藏
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_query").hide();
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_all").hide();
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_useStatus").hide();
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_query").show();

		initGantt();
	});

		/* CUSTOM JS START */
	function createDateTable(obj){
		//将页面页签都变为未选择
		$("li",$("#scrollbar")).removeClass();
		$(obj).removeClass().addClass("selected");
		//将下面div隐藏
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_query").hide();
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_all").hide();
		$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_useStatus").hide();
		if(obj.getAttribute("num")==0){
			$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_query").show();
			ec_calendar_meetingRoom_meetingRoomInfo_reference_queryWidget._resetSize();
		}else if(obj.getAttribute("num")==1){
			$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_all").show();
			ec_calendar_meetingRoom_meetingRoomInfo_reference_allWidget._resetSize();
		}else{
			$("#ec_calendar_meetingRoom_meetingRoomInfo_reference_useStatus").show();
		}
		$('body').trigger('resize');
	}
		/* CUSTOM JS END */
	function addData(id,name,type,paramDate,detailId){
		var tBody=$("#ganttLeft1 tbody");
		var StrCell="";
		var Str="";
		var tr;
		if(type="meetingRoom"){
			//默认加到最后一列
			tBody.append("<tr class='handTr' trType='meetingRoom' roomName='"+name+"' roomId='"+id+"' onclick='isSelect(this)'></tr>");
			tr=$("tr[roomId='"+id+"']",$("#ganttLeft1"));
			StrCell="<td class='handTd' style='height:18px;'><div style='height:18px;text-align:center' class='dg-hd-td-label'>"+name+"</div></td>";
	 		tr.html(StrCell);
		}
	}
	// 添加会议室到甘特图
	function addMeetingRoomInGantt(strStartDate,strEndDate){
		var url="/X6Basic/meetingroom/meetingRoom/getAllMeetingRecordByTime.action?startTime="+strStartDate+" 00:00:00&endTime="+strEndDate+" 23:59:59";
		CUI.ajax({
			url: url,
			type: 'post',
			async: false,
			dataType : 'json',
			success: function(resultList) {
				var gantt = new Gantt();
				gantt.setGanttDiv($("#ganttdiv1"));
				gantt.setTimeS("${TimeS!}");
				gantt.setTimeE("${TimeE!}");
				gantt.setStartDate("${strStartTime!}");
				gantt.setEndDate("${strEndTime!}");
				for(var a in resultList){
					var arr=a.split("@@");
					var id=arr[0];
					var name=arr[1];
					gantt.addData(id,name,"meetingRoom",resultList[a],resultList[a].id);
					addData(id,name,"meetingRoom",resultList[a],resultList[a].id);
				}
			}
		});
	}
	function initGantt(){
		var gantt = new Gantt();
		var TimeS = '${TimeS!}';
		var TimeE = '${TimeE!}';
		var strStartDate = '${strStartTime!}';
		var strEndDate = '${strEndTime!}';
		gantt.setGanttDiv($("#ganttdiv1"));
		gantt.setTimeS(TimeS);
		gantt.setTimeE(TimeE);
		gantt.setStartDate(strStartDate);
		gantt.setEndDate(strEndDate);
		if(strStartDate!='' && strEndDate!=''){
			// 根据不同的时间设置计划显示开始时间和结束时间
			gantt.Init(strStartDate,strEndDate,0);
			addMeetingRoomInGantt(strStartDate,strEndDate);
		}
	}
	// 用于控制选择之后页面参数
	function isSelect(obj){
		$("#gantthand tr").removeAttr("style");
		$("#gantt tr").removeAttr("style");
		if($(obj).attr("trType") == "creatStaff"){
			selectId = $(obj).attr("creatStaffId");
			selectType = $(obj).attr("trType");
			$("tr[creatstaffid='"+ selectId +"']").css("background-color","#FFF5C2");
		}else if($(obj).attr("trType") == "staff"){
			selectId = $(obj).attr("staffId");
			selectType = $(obj).attr("trType");
			$("tr[staffid='"+ selectId +"']").css("background-color","#FFF5C2");
		}else if($(obj).attr("trType") == "meetingRoom"){
			selectId = $(obj).attr("roomid");
			selectType = $(obj).attr("trType");
			$("tr[roomid='"+ selectId +"']").css("background-color","#FFF5C2");
		}
	}
</script>
<@exportexcel action="/calendar/meetingRoom/meetingRoomInfo/reference-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" />
