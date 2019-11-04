<link href="/static/meetingCalendar/css/gantt.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.datagrid-loading{zoom:1;}
}
</style>
<script src="/static/meetingCalendar/js/gantt.js"></script>

<@frameset id="ec_X6Basic_meetingroom_usedRecord_list_container" border=0>
	<@frame id="ec_X6Basic_meetingroom_usedRecord_list_container_main" offsetH=4 region="center" class="center_in">
		<div>
			<@errorbar id="ec_X6Basic_meetingroom_usedRecord_list_queryFormErrorBar" />
			<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_meetingroom_list" formId="ec_X6Basic_meetingroom_usedRecord_list_queryForm" dataTableId="ec_X6Basic_meetingroom_meetingRoom_list_query" dgList="[{'dgname':'${getText('是否启用')}','dgcode':'X6Basic_1.0_meetingroom_list_used','dgtype':false,'dgvalue':[{'code':'X6Basic_1.0_meetingroom_list_used_isUsed','dcvalue':'${getText('X6Basic.dataClassificdisplayName.radion1368607328203')}'},{'code':'X6Basic_1.0_meetingroom_list_used_isNotUsed','dcvalue':'${getText('X6Basic.dataClassificdisplayName.radion1368607365802')}'}]}]" /> 
			<div class="cui-fast-split"></div>
			<div style="margin:6px 0px 5px 0px;float:left;width:80%">
				<div>
					<div style="float:left;margin-left:15px;margin-top:3px"> ${getText('会议室名称')}</div>
					<div style="float:left;margin-left:5px;width:20%">
						<@multiselect conditionfunc="X6Basic.meetingroom.usedRecord.list._querycustomFunc('meetingRoom')"  id="meetingRoom" name="meetingRoom" displayFieldName="name" url="/X6Basic/meetingroom/meetingRoom/refer.action" type="other" title="" ids="" names="" isCrossCompany=false funcparam="multiSelect=true"/>
					</div>
					<div style="float:left;margin-left:15px;margin-top:3px"> ${getText('会议时间')}</div>
			  	 	<div style="float:left;margin-left:5px;width:20%">
						<@datepicker cssClass="cui-noborder-input" value="" deValue="" disabled=true name="startTime" id="startTime" type="date" />
					</div>
					<div style="float:left;margin-left:15px;margin-top:3px"> ${getText('common.date.split')}</div>
			  	 	<div style="float:left;margin-left:5px;width:20%">
						<@datepicker cssClass="cui-noborder-input" value="" deValue="" disabled=true name="endTime" id="endTime"  type="date" />
			  		</div>
			  	</div>
			  	<div style="float:left;margin-left:15px">
			       	<@querybutton formId="ec_X6Basic_meetingroom_usedRecord_list_queryForm" type="search" onclick="X6Basic.meetingroom.usedRecord.list.query()" /> 
			 		<@querybutton formId="ec_X6Basic_meetingroom_usedRecord_list_queryForm" type="clear"  /> 
				</div>
			</div>
		</div>	
		<#assign datatable_firstLoad = true>
		<div id="ec_X6Basic_meetingRoom_usedRecord_usedRecord_div" class="etv-content" style="margin-top: 6px; clear: both;">
			<div id="ec_X6Basic_meetingRoom_usedRecord_usedRecord" valign="top" style="border-collapse: collapse; margin: 5px 0px 5px 13px;">	
				<div style="position:relative;">
					<div id="gantthand" style="width:120px;position:absolute;top:41px; overflow: hidden; border:1px #3969a7 solid;overflow: hidden">
						<div id="gantthand-top" style="height:22px;line-height:22px;text-align:center;position:relative;background:#fff;z-index:2;border-bottom:1px solid #1E557E;background:url('/static/meetingCalendar/img/gantthand-top-bg.gif') repeat-x;">
						 会议室
						</div>
						<table id="ganttLeft" style="border-collapse: collapse;" cellspacing="0" cellpadding="0" >
							<thead>
								<tr>
									<td width="120"/>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div id="ganttdiv"  style="border: 1px solid #6593cf;position:absolute;top:5px; right:15px; overflow-x: scroll; overflow-y:auto;">
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
		YUE.on('ganttdiv','scroll',function(){	
			if(start_y === null){
				start_y = YUD.get('ganttdiv').scrollTop;
			}
			// 判断是否是滚动Y轴
			if(start_y != YUD.get('ganttdiv').scrollTop){
				YUD.get('gantthand').scrollTop = YUD.get('ganttdiv').scrollTop;
				YUD.get('gantthand-top').style.top = YUD.get('gantthand').scrollTop + 'px';
				YUD.get('gantt-top').style.display = 'none';	
				if(anim_scroll){
					clearTimeout(anim_scroll);
				}			
				anim_scroll = setTimeout(function(){
					YUD.get('gantt-top').style.top = YUD.get('ganttdiv').scrollTop + 'px';
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
				YUD.get('gantthand').scrollTop = YUD.get('ganttdiv').scrollTop;
				YUD.get('gantthand-top').style.top = YUD.get('gantthand').scrollTop + 'px';
				YUD.get('gantt-top').style.top = YUD.get('ganttdiv').scrollTop + 'px';
			}
		});
	})();
	
	CUI.ns("X6Basic.meetingroom.usedRecord.list");
	
	X6Basic.meetingroom.usedRecord.list._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.meetingroom.usedRecord.list._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.meetingroom.usedRecord.list._prefix += '.';
			}
			X6Basic.meetingroom.usedRecord.list._prefix += arr[i];
		}
		X6Basic.meetingroom.usedRecord.list._suffix = arr[arr.length -1];
		if(X6Basic.meetingroom.usedRecord.list._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.meetingroom.usedRecord.list._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.meetingroom.usedRecord.list._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.meetingroom.usedRecord.list.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	X6Basic.meetingroom.usedRecord.list.getcallBackInfo = function(obj){
		console.log(X6Basic.meetingroom.usedRecord.list._prefix)
		console.log(X6Basic.meetingroom.meetingRoom.list._suffix)
		CUI('#ec_X6Basic_meetingroom_usedRecord_list_queryForm *[name="'+X6Basic.meetingroom.usedRecord.list._prefix + '.' + X6Basic.meetingroom.meetingRoom.list._suffix +'"]').val(obj[0][X6Basic.meetingroom.meetingRoom.list._suffix]);
		CUI('#ec_X6Basic_meetingroom_usedRecord_list_queryForm *[name="'+X6Basic.meetingroom.usedRecord.list._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_meetingroom_usedRecord_list_queryForm *[name^="'+X6Basic.meetingroom.usedRecord.list._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_meetingroom_usedRecord_list_queryForm *[name="'+X6Basic.meetingroom.usedRecord.list._prefix + '.' + X6Basic.meetingroom.meetingRoom.list._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_meetingroom_usedRecord_list_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.meetingroom.usedRecord.list._dialog) {
			X6Basic.meetingroom.usedRecord.list._dialog.close();
		}
	};
	
	X6Basic.meetingroom.usedRecord.list._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.meetingroom.usedRecord.list.query_"+obj+")!='undefined'") ? eval('X6Basic.meetingroom.usedRecord.list.query_'+obj+'()') : null;
		return str;
	
	};

	/**
	 * 查询
	 * @method X6Basic.meetingroom.usedRecord.list.query
	 */
	X6Basic.meetingroom.usedRecord.list.query = function(){
		$("#ganttLeft tbody").html("");
		$("#ganttdiv").html("");
		initGantt();
	};
	
	/**
	 * 通过连接显示页面
	 * @method X6Basic.meetingroom.usedRecord.list.showLinkView
	 */
	X6Basic.meetingroom.usedRecord.list.showLinkView = function(url,propertyId,row,formId,title,width,height){
		if(url.indexOf('?') > 0) {
			url += '&';
		} else {
			url += '?';
		}
		url += 'id=' + eval('row.' + propertyId);
		if(formId) {
			X6Basic.meetingroom.usedRecord.list.showDialog(url,formId,title,width,height);
		}else {
			openFullScreen(url);
		}
	};
	
	/**
	 * 显示对话框
	 * @method X6Basic.meetingroom.usedRecord.list.showDialog
	 */
	X6Basic.meetingroom.usedRecord.list.showDialog = function(url,formId,title,width,height){
	
	};

X6Basic.meetingroom.usedRecord.list.TimeS;
X6Basic.meetingroom.usedRecord.list.TimeE;


function checkListValid(formId){return true;};

	$(function(){
		initSize();
		initGantt();
		X6Basic.meetingroom.usedRecord.list.TimeS = 8;
		X6Basic.meetingroom.usedRecord.list.TimeE = 20;
		$(window).bind("resize",function(){initSize();});
	});

		/* CUSTOM JS START */
	
	function initSize(){
		var containerWidth = $('#centerFrame').width();
		var containerHeight = $('#centerFrame').height();
		console.log(containerWidth,containerHeight)
		$('#ec_X6Basic_meetingRoom_meetingRoomInfo_usedRecord_div').width(containerWidth);
		$('#ec_X6Basic_meetingRoom_meetingRoomInfo_usedRecord').width(containerWidth-13);
		$('#gantthand').height(containerHeight-100);
		$('#ganttdiv').height(containerHeight-50);
		$('#ganttdiv').width(containerWidth-160);
	}
		
		/* CUSTOM JS END */
	function addData(id,name,type,paramDate,detailId){
		var tBody=$("#ganttLeft tbody");
		var StrCell="";
		var Str="";
		var tr;
		if(type="meetingRoom"){
			//默认加到最后一列
			tBody.append("<tr class='handTr' trType='meetingRoom' roomName='"+name+"' roomId='"+id+"' onclick='isSelect(this)'></tr>");
			tr=$("tr[roomId='"+id+"']",$("#ganttLeft"));
			StrCell="<td class='handTd' style='height:18px;'><div style='height:18px;text-align:center' class='dg-hd-td-label'>"+name+"</div></td>";
	 		tr.html(StrCell);
		}
	}
	
	// 添加会议室到甘特图
	function addMeetingRoomInGantt(strStartDate,strEndDate,IDs){
		var url = "";
		if(IDs !=null && IDs!=""){
			url="/X6Basic/meetingroom/meetingRoom/getMeetingRecordByTime.action?meetingRoomIDs="+IDs+"&startTime="+strStartDate+" 00:00:00&endTime="+strEndDate+" 23:59:59";
		}else{
			url="/X6Basic/meetingroom/meetingRoom/getAllMeetingRecordByTime.action?startTime="+strStartDate+" 00:00:00&endTime="+strEndDate+" 23:59:59";
		}
		console.log(url)
		CUI.ajax({
			url: url,
			type: 'post',
			async: false,
			dataType : 'json',
			success: function(resultList) {
				console.log(resultList)
				var gantt = new Gantt();
				gantt.setGanttDiv($("#ganttdiv"));
				gantt.setTimeS(X6Basic.meetingroom.usedRecord.list.TimeS);
				gantt.setTimeE(X6Basic.meetingroom.usedRecord.list.TimeE);
				gantt.setStartDate(strStartDate);
				gantt.setEndDate(strEndDate);
				gantt.setCrossDays(formatStringToDateTime(strStartDate),formatStringToDateTime(strEndDate));
				for(var a in resultList){
					var arr=a.split("@@");
					var id=arr[0];
					var name=arr[1];
					console.log(id,name,"meetingRoom",resultList[a])
					gantt.addData(id,name,"meetingRoom",resultList[a],resultList[a].id);
					addData(id,name,"meetingRoom",resultList[a],resultList[a].id);
				}
			}
		});
	}
	function initGantt(){
		var gantt = new Gantt();
		var IDs = $("#meetingRoomMultiIDs").val();
		var strStartDate = $("#startTime").val();
		if(strStartDate == ""){
			strStartDate = formatDateTimeToString(new Date(),"date")
		}
		var strEndDate = $("#endTime").val();
		if(strEndDate == ""){
			strEndDate = formatDateTimeToString(new Date(formatStringToDateTime(strStartDate)).setDate(new Date().getDate()+15),"date");
		}//默认查从今天开始的一个星期之内的数据
		gantt.setGanttDiv($("#ganttdiv"));
		gantt.setTimeS(X6Basic.meetingroom.usedRecord.list.TimeS);
		gantt.setTimeE(X6Basic.meetingroom.usedRecord.list.TimeE);
		gantt.setStartDate(strStartDate);
		gantt.setEndDate(strEndDate);
		gantt.setCrossDays(formatStringToDateTime(strStartDate),formatStringToDateTime(strEndDate));
		if(strStartDate!='' && strEndDate!=''){
			// 根据不同的时间设置计划显示开始时间和结束时间
			gantt.Init(strStartDate,strEndDate,0);
			addMeetingRoomInGantt(strStartDate,strEndDate,IDs);
		}
	}
	// 用于控制选择之后页面参数
	function isSelect(obj){
		$("#gantthand tr").removeAttr("style");
		$("#gantt tr").removeAttr("style");
		selectId = $(obj).attr("roomid");
		selectType = $(obj).attr("trType");
		$("tr[roomid='"+ selectId +"']").css("background-color","#FFF5C2");
	
	}
	// 格式化日期格式 yyyy-mm-dd hh:mm:ss
	function formatDateTimeToString(date,type){
			var d = new Date(date);
			var y= d.getFullYear();
			var m=d.getMonth()+1;
			var day=d.getDate();
			var h=d.getHours();
			var min=d.getMinutes();
			var s=d.getMinutes();
			if(m<10){m="0"+m;}
			if(day<10){day="0"+day;}
			if(h<10){h="0"+h;}
			if(min<10){min="0"+min;}
			if(s<10){s="0"+s;}
			var ss = "";
			if(type=="date"){
				ss=y+"-"+m+"-"+day;
			}else{
				ss=y+"-"+m+"-"+day+" "+h+":"+min+":"+s;
			}
			return ss;
		}
	// 格式化日期格式 "yyyy-mm-dd hh:mm:ss"转换为date
	function formatStringToDateTime(str){
		var ss = null;
		if(str==""){
			ss = new Date();
		}else{
			var dateList = str.split(" ");
			if(dateList.length < 2){
				var d1 = dateList[0].split("-");
				ss = new Date(d1[0],d1[1]-1,d1[2]);
			}else{
				var d1 = dateList[0].split("-");
				var d2 = dateList[1].split(":");
				ss = new Date(d1[0],d1[1]-1,d1[2],d2[0],d2[1],d2[2]);
			}
		}
		return ss;
	}
</script>