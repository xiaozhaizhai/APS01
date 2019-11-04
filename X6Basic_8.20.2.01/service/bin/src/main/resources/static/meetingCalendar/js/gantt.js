
/*
*DES:会议室甘特图,用jQuery重写事件
*DATE:2012-11-1
*USE:var gantt = new Gantt();
*			画表头
*			String 开始日期
*			String 结束日期
*			int 左侧列表列数
*			gantt.Init("开始日期","结束日期",左侧表头列数);
*			
*			画表体填充所有
*			gantt.addWbsData("开始日期","结束日期",数据组);
*
*			
*			填充单行（此方法用于每一次加入人员或是加入会议室的回调方法中）
*			gantt.addData(id,name,type,paramDate,detailId);	
*			type:creatStaff\staff\meetingRoom
*			id:创建人\参与人\会议室 id
*			name:创建人\参与人\会议室 name
*			paramDate:id 日程活动id
*			paramDate:startTime 日程开始时间日期
*			paramDate:endTime 日程结束时间日期
*			paramDate:title 日程主题
*			detailId:当前活动id
*					
*			给每一行画图
*			gantt.DrawGantt(数据组,当前活动id);
*			
*			用于锁定表头和左侧列
*			gantt.fixTable("TableID",FixColumnNumber,width,height)
*			TableID:String/要锁定的Table的ID
*			FixColumnNumber:Number/要锁定列的个数
*			width:Number/显示的宽度
*			height:Number/显示的高度
*AUTHOR:tangmy
*/
function Gantt(){
	this.GanttDiv;
	this.startDate;
	this.endDate;
	this.isFixTableHeader = true;// 是否固定表头，true:是，false:否
	this.parentLineColor = "#3588D6"; // 非叶子任务颜色
	this.childLineColor = "#0000ff"; // 叶子任务颜色
	this.percentCompleteRateColor = "#ff00ff";
	this.paramDate; // 日期数组
	this.addIndex; // 日期数组长度
	this.percentCompleteRate;
	this.URLS;
	this.WbsDataArray;// 日程数组
	this.leftHeadNameArray;// 左侧表头名称组
	this.Gantt;
	this.pidArray = new Array();
	this.TimeS;
	this.TimeE;
	this.crossDays = 7;//天数
}
Gantt.prototype.setGanttDiv =function(GanttDiv){
	this.GanttDiv = GanttDiv;
}
Gantt.prototype.getGanttDiv =function(){
	return this.GanttDiv;
}
Gantt.prototype.setTimeS =function(TimeS){
	this.TimeS = parseInt(TimeS,10);
}
Gantt.prototype.getTimeS =function(){
	return this.TimeS;
}
Gantt.prototype.setTimeE =function(TimeE){
	this.TimeE = parseInt(TimeE,10);
}
Gantt.prototype.getTimeE =function(){
	return this.TimeE;
}

Gantt.prototype.setStartDate =function(DateStr){
	var TimeS=this.TimeS;
	TimeS=parseInt(TimeS,10);
	var arrydata=DateStr.split("-");
	this.startDate = new Date(arrydata[0],arrydata[1]-1,arrydata[2],TimeS,00,00);
}
Gantt.prototype.getStartDate =function(){
	return this.startDate;
}

Gantt.prototype.setCrossDays = function (sTime,eTime){
	var crossDays = 0;
	if(eTime >= sTime){
		eTime.setHours(12,0,0);
		sTime.setHours(12,0,0);
		crossDays = parseInt((eTime - sTime)  /  1000  /  60  /  60  /24) + 1;
	}
	this.crossDays = crossDays;
}
Gantt.prototype.getCrossDays = function (sTime,eTime){
	return this.crossDays;
}


Gantt.prototype.setEndDate =function(DateStr){
	var TimeE=this.TimeE;
	TimeE=parseInt(TimeE,10);
	var arrydata=DateStr.split("-");
	this.endDate = new Date(arrydata[0],arrydata[1]-1,arrydata[2],TimeE,00,00);
}
Gantt.prototype.getEndDate =function(){
	return this.endDate;
}

Gantt.prototype.getWbsDataArray =function(){
	return this.WbsDataArray;
}


Gantt.prototype.setIsFixTableHeader =function(bool){
	this.isFixTableHeader = bool;
}
Gantt.prototype.getIsFixTableHeader =function(){
	return this.isFixTableHeader;
}
Gantt.prototype.setURLS =function(URLS){
	this.URLS = URLS;
}
Gantt.prototype.getURLS =function(){
	return this.URLS;
}
Gantt.prototype.setPercentCompleteRate =function(percentCompleteRate){
	this.percentCompleteRate = percentCompleteRate;
}
Gantt.prototype.getPercentCompleteRate =function(){
	return this.percentCompleteRate;
}
Gantt.prototype.setParentLineColor =function(parentLineColor){
	this.parentLineColor = parentLineColor;
}
Gantt.prototype.getParentLineColor =function(){
	return this.parentLineColor;
}
Gantt.prototype.setChildLineColor =function(childLineColor){
	this.childLineColor = childLineColor;
}
Gantt.prototype.getChildLineColor =function(){
	return this.childLineColor;
}
Gantt.prototype.setPercentCompleteRateColor =function(percentCompleteRateColor){
	this.percentCompleteRateColor = percentCompleteRateColor;
}
Gantt.prototype.getPercentCompleteRateColor =function(){
	return this.percentCompleteRateColor;
}
// 日期数组
Gantt.prototype.setparamDate =function(paramDate){
	this.paramDate = paramDate;
}
Gantt.prototype.getparamDate =function(){
	return this.paramDate;
}
// 日期数组长度setaddIndex
Gantt.prototype.setaddIndex =function(addIndex){
	this.addIndex = addIndex;
}
Gantt.prototype.getaddIndex =function(){
	return this.addIndex;
}

// 生成表头新方法,tableLeftColumnNum左边表个说明。sDateStr，eDateStr表头开始结束时间
Gantt.prototype.Init =function(sDateStr,eDateStr,tableLeftColumnNum){
	if(tableLeftColumnNum==null || tableLeftColumnNum==0){
		tableLeftColumnNum=0;
	}
	// 获取设置显示的开始时间和结束时间
	var TimeLength=this.TimeE-this.TimeS;
	this.setStartDate(sDateStr);
	this.setEndDate(eDateStr);
	this.setCrossDays(this.startDate,this.endDate);
	var tableRightColumnNum=TimeLength*this.crossDays;// +1表加上开始一天
	var tableTotalColumnNum=tableRightColumnNum+tableLeftColumnNum;
	this.GanttDiv.html("<div id='gantt-top' style='position:absolute;top:0;z-index:3;background:#fff;'><table id='gantt-head' cellspacing='0' cellpadding='0' style='border-collapse: collapse;' width='"+ (60*tableTotalColumnNum+30) +"'></table></div><table id='gantt' cellspacing='0' cellpadding='0' width='"+(60*tableTotalColumnNum+30)+"' style='border-collapse: collapse;'><thead class='ganttThead' style='visibility:hidden;' ></thead><tbody class='ganttTbody' ></tbody></table>");
	this.Gantt = $("#gantt",this.GanttDiv);
	this.tHead=$("#gantt thead",this.GanttDiv);
	this.tBody=$("#gantt tbody",this.GanttDiv);
	// 打印头日期信息
	this.tHead.append("<tr name='head'></tr>");
	var trHand=$("tr[name='head']");
	var Str="";
	// tableLeftColumnNum
	if(tableLeftColumnNum>0){
		for(var i=0;i<tableLeftColumnNum;i++){
			if(i==0){
				Str=Str+"<td align='center' width='60'></td>";
			}else{
				Str=Str+"<td align='center' width='100'></td>";
			}
		}
	}
	// console.log(tableRightColumnNum);
	for(var i=0;i<this.crossDays;i++){
		for(var j=0;j<TimeLength;j++){
			Str += "<td align='center' style='width:60px;'></td>";
		}
		if(i<this.crossDays-1){
			Str += "<td align='center' style='width:5px;'></td>";// 分隔
		}	
	}
	/*
	 * for(var i=0;i<tableRightColumnNum;i++){ Str=Str+"<td align='center' width='60'></td>"; }
	 */
	trHand.html(Str);
	
	// //console.log("开始生成时间段");
	this.tHead.append("<tr name='headWeek' class='handTr'></tr>");
	var trWeek=$("tr[name='headWeek']",this.GanttDiv);
	var StrWeek ="";
	if(tableLeftColumnNum>0){
		StrWeek = "<td align='center' colSpan='"+tableLeftColumnNum+"'></td>"
	} 
	var _TempDate = new Date(sDateStr.replace(/-/g,"/"));
	for(var i=0;i < this.crossDays;i++){
		var Dday=_TempDate.toLocaleDateString()+' 星期'+'日一二三四五六'.split('')[_TempDate.getDay()];
		Dday=String(Dday);
		StrWeek =StrWeek + "<td align='center' style='font-weight:bold;' colSpan='"+TimeLength+"' >"+Dday+"</td>";		
		_TempDate = new Date(_TempDate.getTime());
		_TempDate.setTime(_TempDate.getTime() + 3600*1000*24);	
		if(i<this.crossDays-1){
			StrWeek += "<td></td>";// 分隔
		}
	}
	trWeek.html(StrWeek);
	// //console.log("开始生成日期段");
	this.tHead.append("<tr name='headDateTime' class='handTr' />");
	var trDateTime=$("tr[name='headDateTime']",this.GanttDiv);
	var StrDataTime = "";
	if(tableLeftColumnNum>0){
		StrDataTime = "<td align='center' colSpan='"+tableLeftColumnNum+"' class='handTd'>与会者名单</td>";
	}
	for(var i=0;i<this.crossDays;i++){
		for(var j=0;j<(tableRightColumnNum - 1)/this.crossDays;j++){
			StrDataTime = StrDataTime + "<td align = 'left'>"+ String((this.TimeS)+j)+":00</td>"
		}
		if(i<this.crossDays-1){
			StrDataTime += "<td></td>"
		}	
	}
	trDateTime.html(StrDataTime);
	
	// 生成表头分隔行
	this.tHead.append("<tr name='headSpliteRow' class='handTr' />");
	var headSpliteRow=$("tr[name='headSpliteRow']",this.GanttDiv);
	var spliteRowHtml = "";
	if(tableLeftColumnNum>0){
		
	}
	for(var i=0;i<this.crossDays;i++){
		for(var j=0;j<(tableRightColumnNum - 1)/this.crossDays;j++){
			spliteRowHtml += "<td class='headSpliteTd'>&nbsp;</td>"
		}
		if(i<this.crossDays-1){
			spliteRowHtml += "<td></td>"
		}	
	}
	headSpliteRow.html(spliteRowHtml);
	//
	var ganttHhead = $('#gantt-head',this.GanttDiv);
	var tHeadClone = this.tHead.clone();
	ganttHhead.append(tHeadClone);
	tHeadClone.css('visibility','visible');
	
}
// 这里先默认左边表头是两列
Gantt.prototype.addData =function(id,name,type,paramDate,detailId,tableLeftColumnNum){
	console.log(paramDate)
	if(tableLeftColumnNum==null || tableLeftColumnNum==0){
		tableLeftColumnNum=0;
	}
	var TimeLength=this.TimeE-this.TimeS;
	var tableRightColumnNum=TimeLength*this.crossDays;// 开始一天
	this.tBody=$("#gantt tbody",this.GanttDiv);
	var StrCell="";
	var Str="";
	var tr;
	if(type=="creatStaff"){
		// 如果不是初始化，那么要先移除原来的甘特图中创建人信息
		if($("tr[trType='creatStaff']",this.tBody).length>0){
			$("tr[trType='creatStaff']",this.tBody).remove();
			var StrCell="<tr class='handTr' trType='creatStaff' creatStaffName='"+name+"' creatStaffId='"+id+"' onclick='isSelect(this)'>" ;
			// 如果有左侧表头
			if(tableLeftColumnNum>0){
				StrCell =StrCell+ "<td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>创建人</div></td><td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>"+name+"</div></td>";
			}
			for(var i=0;i<7;i++){
				for(var j=0;j<TimeLength;j++){
					if(i==0 && j==0){
						StrCell += "<td class='backDiv'>"+this.DrawLine(paramDate,detailId)+"</td>";
					}else{
						StrCell += "<td class='backDiv'>&nbsp;</td>";
					}
				}
				if(i<this.crossDays-1){
					StrCell += "<td></td>"; // 分隔
				}	
			}
			this.tBody.html(StrCell + this.tBody.html());
		}else{
			this.tBody.append("<tr class='handTr'  trType='creatStaff' creatStaffName='"+name+"' creatStaffId='"+id+"' onclick='isSelect(this)'></tr>");
			tr=$("tr[creatStaffId='"+id+"']",this.tBody);
			// 如果有左侧表头
			if(tableLeftColumnNum>0){
				StrCell="<td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>创建人</div></td><td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>"+name+"</div></td>"	
			}
			/*
			 * StrCell=StrCell + "<td class='backDiv' colSpan='"+tableRightColumnNum+"' >"
			 * StrCell=StrCell + this.DrawLine(paramDate,detailId)+"</td>";
			 */
			for(var i=0;i<this.crossDays;i++){
				for(var j=0;j<TimeLength;j++){
					if(i==0 && j==0){
						StrCell += "<td class='backDiv'>"+this.DrawLine(paramDate,detailId)+"</td>";
					}else{
						StrCell += "<td class='backDiv'>&nbsp;</td>";
					}
				}
				if(i<this.crossDays-1){
					StrCell += "<td></td>"; // 分隔
				}	
			}
			tr.html(StrCell);
		}
	}else if(type=="staff"){
		// 如果一个都没有，那么加到creatStaff下面,如果有则加到最后列
		if($("tr[trType='staff']",this.tBody).length==0){
			$("tr[trType='creatStaff']",this.tBody).after("<tr  class='handTr'  trType='staff' staffName='"+name+"' staffid='"+id+"' onclick='isSelect(this)'></tr>");
			tr=$("tr[staffid='"+id+"']",this.tBody);
			// 如果有左侧表头
			if(tableLeftColumnNum>0){
				StrCell="<td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>参与人</div></td><td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>"+name+"</div></td>"	
			}
			for(var i=0;i<this.crossDays;i++){
				for(var j=0;j<TimeLength;j++){
					if(i==0 && j==0){
						StrCell += "<td class='backDiv'>"+this.DrawLine(paramDate,detailId)+"</td>";
					}else{
						StrCell += "<td class='backDiv'>&nbsp;</td>";
					}
				}
				if(i<this.crossDays-1){
					StrCell += "<td></td>"; // 分隔
				}	
			}
			tr.html(StrCell);
		}else{
			$("tr[trType='staff']:last",this.tBody).after("<tr  class='handTr'  trType='staff' staffName='"+name+"' staffid='"+id+"' onclick='isSelect(this)'></tr>");
			tr=$("tr[staffid='"+id+"']",this.tBody);
			// 如果有左侧表头
			if(tableLeftColumnNum>0){
				StrCell="<td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>参与人</div></td><td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>"+name+"</div></td>"	
			}
			for(var i=0;i<this.crossDays;i++){
				for(var j=0;j<TimeLength;j++){
					if(i==0 && j==0){
						StrCell += "<td class='backDiv'>"+this.DrawLine(paramDate,detailId)+"</td>";
					}else{
						StrCell += "<td class='backDiv'>&nbsp;</td>";
					}
				}
				if(i<this.crossDays-1){
					StrCell += "<td></td>"; // 分隔
				}	
			}
			tr.html(StrCell);
		}	
	}else if(type="meetingRoom"){
		// 默认加到最后一列
		this.tBody.append("<tr class='handTr' trType='meetingRoom' roomName='"+name+"' roomId='"+id+"' onclick='isSelect(this)'></tr>");
		tr=$("tr[roomId='"+id+"']",this.tBody);
		// 如果有左侧表头
		if(tableLeftColumnNum>0){
			StrCell="<td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>会议室</div></td><td class='handTd'><div style='height:18px;' class='dg-hd-td-label'>"+name+"</div></td>"	
		}
		for(var i=0;i<this.crossDays;i++){
			for(var j=0;j<TimeLength;j++){
				if(i==0 && j==0){
					StrCell += "<td class='backDiv'>"+this.DrawLine(paramDate,detailId)+"</td>";
				}else{
					StrCell += "<td class='backDiv'>&nbsp;</td>";
				}
			}
			if(i<this.crossDays-1){
				StrCell += "<td></td>"; // 分隔
			}	
		}
 		tr.html(StrCell);
	}
	console.log(StrCell)
}

// 得到左边空多少距离（旧方法，先留着）
Gantt.prototype.getLineMargin_left = function(Detail){
	var TimeLength=this.TimeE-this.TimeS;
	var StartTime=new Date(Detail.startTime);
	var strStartdate = this.startDate;
	var wbsLeftDay=0;
	if(strStartdate>StartTime){
		StartTime=strStartdate;
		wbsLeftDay=0;
	}else if(Detail.isAllDay=="true"){
		// 如果是全天事件，那么就直接计算天数
		var tempstart=new Date(strStartdate);
		tempstart.setHours(0, 0, 0);
		var tempend=new Date(StartTime);
		tempend.setHours(0, 0, 0);
		wbsLeftDay=TimeLength*(tempend-tempstart)/86400000;
		if(wbsLeftDay<0){
			wbsLeftDay=0;
		}
	}else{
		// 先计算天数，如果是跨天事件，先计算天数，然后再看开始时间是几点
		// 如果超过起时间，就是开始小时-设置开始小时，如果没有则为设置开始小时
		var tempstart=new Date(strStartdate);
		tempstart.setHours(0, 0, 0);
		var tempend=new Date(StartTime);
		tempend.setHours(0, 0, 0);
		var temNum=(tempend-tempstart)/3600/1000/24;
		wbsLeftDay= temNum*TimeLength;
		if(new Date(strStartdate).getHours() < new Date(StartTime).getHours()){
			var tempH = new Date(strStartdate).getHours();
			var tempM = new Date(strStartdate).getMinutes();
			tempend.setHours(tempH, tempM);
			tempstart = new Date(StartTime);
			wbsLeftDay = wbsLeftDay + (tempstart - tempend)/3600/1000;
		}else{
			
		}
	}
	//再算有多少个空格
	var spaceTD=parseInt(wbsLeftDay/TimeLength);
	var margin_left=wbsLeftDay*60+spaceTD*5;
	return margin_left;
}

// //得到计划完成情况甘特图宽度
Gantt.prototype.getLineWidth = function(Detail){
	var StartTime=new Date(Detail.startTime);
	var EndTime=new Date(Detail.endTime);
	var TimeLength=this.TimeE-this.TimeS;
	var strStartdate=this.startDate;
	// 如果开始时间在设置的时间之间，那么从设置时间开始
	var ts=StartTime.getHours();
	var es=EndTime.getHours();
	if(ts<this.TimeS){
		StartTime.setHours(this.TimeS,0,0);
	}else if(ts>this.TimeE){
		StartTime.setHours(this.TimeS,0,0);
		StartTime=StartTime+3600*1000*24;
	}
	if(es>(this.TimeE-1)){
		EndTime.setHours((this.TimeE-1),59,59);
	}else if(es<this.TimeS){
		EndTime.setHours((this.TimeE-1),59,59);
		EndTime=EndTime-3600*1000*24;
	}
	if(strStartdate>StartTime){
		StartTime=strStartdate;
	}
	var strEnddate=this.endDate;
	
	if(strEnddate<EndTime){
		EndTime=strEnddate;
	}
	var wbsTotalDay;
	var widthNum = 0;
	// 天数对比
	if(Detail.isAllDay=="true"){
		// 如果是全天事件，那么就直接计算天数
		var tempstart=new Date(StartTime);
		tempstart.setHours(0, 0, 0);
		var tempend=new Date(EndTime);
		tempend.setHours(0, 0, 0);
		var temNum=(tempend-tempstart)/3600/1000/24;//间隔天数
		wbsTotalDay=TimeLength*(temNum+1);
		widthNum = wbsTotalDay*60+temNum*5-1;
	}else{
		// 先计算天数，如果是跨天事件，计算公式为：有效小时=总小时数-天数×每天隐藏小时
		var tempstart=new Date(StartTime);
		tempstart.setHours(0, 0, 0);
		var tempend=new Date(EndTime);
		tempend.setHours(0, 0, 0);
		var temNum=(tempend-tempstart)/3600/1000/24;//间隔天数
		wbsTotalDay=(EndTime-StartTime)/3600/1000-temNum*(24-TimeLength);
		widthNum = wbsTotalDay*60+temNum*5-1;
	}
	return widthNum;
}
// 画这行的日程记录
Gantt.prototype.DrawLine =function(paramDate,detailId){
	console.log(paramDate,detailId);
	var TimeLength=this.TimeE-this.TimeS;
	var tableRightColumnNum=TimeLength*this.crossDays;
	var lineHTML = "";
	lineHTML +="<span  style='position:relative;left: 0px;top:-4px;zIndex:1;'>";
	if(paramDate.length>0){
		for(var i=0;i< paramDate.length;i++){
			// 如果是和当前活动ID一样，那么就不要画，则别的地方显示
			if(paramDate[i].id != detailId){
				console.log(lineHTML)
				// 完成计划的数组
				lineHTML += "<span ";
				lineHTML += "style='";
				lineHTML +="position:absolute;";
				if(paramDate[i].showType != undefined){
					//displayType,1:忙，2:空，3:外出
					if(String(paramDate[i].showType.id)=='showType/showType_03'){
						lineHTML += "background-color:#740075;";
					}else if(String(paramDate[i].showType.id)=='showType/showType_02'){
						lineHTML += "background-color:#FFFFFF;";
					}else{
						lineHTML += "background-color:#3588D6;";
					}
				}else{
					lineHTML += "background-color:#3588D6;";
				}
				console.log(lineHTML)
				lineHTML += "width: " + this.getLineWidth(paramDate[i]) + "px;height:19px;";
				lineHTML += "margin-left: " + this.getLineMargin_left(paramDate[i]) + "px;";
				lineHTML += "font-size:4px;top:-6px";
				lineHTML += "' ";
				lineHTML += "spanType='Detail' detailId='"+ paramDate[i].id +"' ";
				lineHTML += "startTime='"+ paramDate[i].startTime +"' ";
				lineHTML += "endTime='"+ paramDate[i].endTime +"' ";
				console.log(lineHTML)
				if(paramDate[i].title!=''){
					if(paramDate[i].Staff_Name){
						if(paramDate[i].Staff_Name!=''){
							lineHTML += "title='开始时间:"+this.formatDateTime(paramDate[i].startTime) +"&#13;&#10;"+"结束时间:"+this.formatDateTime(paramDate[i].endTime)+"&#13;&#10;主题:"+String(paramDate[i].title)+"&#13;&#10;创建人:"+String(paramDate[i].Staff_Name)+"' ";		
							lineHTML += "></span>";
						}else{
							lineHTML += "title='开始时间:"+this.formatDateTime(paramDate[i].startTime) +"&#13;&#10;"+"结束时间:"+this.formatDateTime(paramDate[i].endTime)+"&#13;&#10;主题:"+String(paramDate[i].title)+"' ";		
							lineHTML += "></span>";
						}
					}else{
						lineHTML += "title='开始时间:"+this.formatDateTime(paramDate[i].startTime) +"&#13;&#10;"+"结束时间:"+this.formatDateTime(paramDate[i].endTime)+"&#13;&#10;主题:"+String(paramDate[i].title)+"' ";		
						lineHTML += "></span>";
					}
				}else{
					lineHTML += "title='开始时间:"+this.formatDateTime(paramDate[i].startTime) +"&#13;&#10;"+"结束时间:"+this.formatDateTime(paramDate[i].endTime)+"' ";		
					lineHTML += "></span>";
				}
			}
		}
	}
	console.log(lineHTML);
	lineHTML += "</span>";
	return lineHTML;
}
// //获取空的时间段
// Gantt.prototype.DrawSearchEmpty =function(){
// }
// Gantt.prototype.ChangeParentAttribute = function(){
// for(var i=0 ;i < this.pidArray.length;i++)
// {
// if(this.pidArray[i] == "0") continue;
//		
// var objSpan = document.getElementById("span_" + this.pidArray[i]);
// var ojbTR = document.getElementById("" + this.pidArray[i]);
//		
// objSpan.style.backgroundColor = this.getParentLineColor();
// objSpan.style.height = "8px";
// objSpan.style.fontSize = "7px";
// ojbTR.cells[0].innerHTML = "<img src='/Proj/gantt/minus.png' style='cursor:
// hand;' onclick = 'CloseChildWbs(\"" + this.pidArray[i] +
// "\",this.parentNode);'></img>";
// ojbTR.cells[0].style.display = '';
//		
// }
// }
// Gantt.prototype.DrawGantt =function(DIV){
// if(this.isFixTableHeader)
// {
// DIV.className = "DIVfixheader";
// }
// //this.Gantt.appendChild(this.tHead);
// //this.Gantt.appendChild(this.tBody);
//	
// DIV.appendChild(this.Gantt);
//	
// this.ChangeParentAttribute();
// }
//
// CloseChildWbs = function (pid,obj)
// {
// var childIdArray = document.getElementsByTagName("tr");
// if(obj == null || obj == undefined || obj == "")
// {
// //childobj.innerHTML = "<b style='cursor: hand;' onclick = 'OpenChildWbs(\""
// + pid + "\",this.parentNode);'>+</b>";
// }
// else
// {
// obj.innerHTML = "<img src='/Proj/gantt/plus.png' style='cursor: hand;'
// onclick = 'OpenChildWbs(\"" + pid + "\",this.parentNode);'></img>";
// }
//	
// for(var i=0 ;i <childIdArray.length;i++)
// {
// if(childIdArray[i].pid != null && childIdArray[i].pid != undefined &&
// childIdArray[i].pid == pid)
// {
// childIdArray[i].style.display = "none";
// //递归
// if(childIdArray[i].cells[0].innerHTML == "")
// {
// CloseChildWbs(childIdArray[i].id,'');
// }
// else
// {
// CloseChildWbs(childIdArray[i].id,childIdArray[i].cells[0]);
// }
// }
// }
// }
// OpenChildWbs = function (pid,obj)
// {
// var childIdArray = document.getElementsByTagName("tr");
// for(var i=0 ;i <childIdArray.length;i++)
// {
//		
// if(childIdArray[i].pid != null && childIdArray[i].pid != undefined &&
// childIdArray[i].pid == pid)
// {
// childIdArray[i].style.display = "";
// }
// }
// obj.innerHTML = "<img src='/Proj/gantt/minus.png' style='cursor: hand;'
// onclick = 'CloseChildWbs(\"" + pid + "\",this.parentNode);'></img>";
// }
Gantt.prototype.formatDateTime=function(date){
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
	var ss=y+"-"+m+"-"+day+" "+h+":"+min+":"+s;
	return ss;
}




//现在没有作用
Gantt.prototype.fixTable=function(TableID, FixColumnNumber, width, height) {
	if ($("#" + TableID + "_tableLayout").length != 0) {
		$("#" + TableID + "_tableLayout").before($("#" + TableID));
		$("#" + TableID + "_tableLayout").empty();
	} else {
		$("#" + TableID)
				.after(
						"<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>");
	}
	$(
			'<div id="' + TableID + '_tableFix"></div>'
					+ '<div id="' + TableID + '_tableHead"></div>'
					+ '<div id="' + TableID + '_tableColumn"></div>'
					+ '<div id="' + TableID + '_tableData"></div>')
			.appendTo("#" + TableID + "_tableLayout");
	var oldtable = $("#" + TableID);
	var tableFixClone = oldtable.clone(true);
	tableFixClone.attr("id", TableID + "_tableFixClone");
	$("#" + TableID + "_tableFix").append(tableFixClone);
	var tableHeadClone = oldtable.clone(true);
	tableHeadClone.attr("id", TableID + "_tableHeadClone");
	$("#" + TableID + "_tableHead").append(tableHeadClone);
	var tableColumnClone = oldtable.clone(true);
	tableColumnClone.attr("id", TableID + "_tableColumnClone");
	$("#" + TableID + "_tableColumn").append(tableColumnClone);
	$("#" + TableID + "_tableData").append(oldtable);
	$("#" + TableID + "_tableLayout table").each(function() {
		$(this).css("margin", "0");
	});
	var HeadHeight = $("#" + TableID + "_tableHead thead").height();
	HeadHeight += 2;
	$("#" + TableID + "_tableHead").css("height", HeadHeight);
	$("#" + TableID + "_tableFix").css("height", HeadHeight);
	var ColumnsWidth = 0;
	var ColumnsNumber = 0;
	$("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")")
			.each(function() {
				ColumnsWidth += $(this).outerWidth(true);
				ColumnsNumber++;
			});
	ColumnsWidth += 2;
	if ($.browser.msie) {
		switch ($.browser.version) {
		case "7.0":
			if (ColumnsNumber >= 3)
				ColumnsWidth--;
			break;
		case "8.0":
			if (ColumnsNumber >= 2)
				ColumnsWidth--;
			break;
		}
	}
	$("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
	$("#" + TableID + "_tableFix").css("width", ColumnsWidth);
	$("#" + TableID + "_tableData").scroll(
			function() {
				$("#" + TableID + "_tableHead").scrollLeft(
						$("#" + TableID + "_tableData").scrollLeft());
				$("#" + TableID + "_tableColumn").scrollTop(
						$("#" + TableID + "_tableData").scrollTop());
			});
	$("#" + TableID + "_tableFix").css({
		"overflow" : "hidden",
		"position" : "relative",
		"z-index" : "50",
		"background-color" : "Silver"
	});
	$("#" + TableID + "_tableHead").css({
		"overflow" : "hidden",
		"width" : width - 17,
		"position" : "relative",
		"z-index" : "45",
		"background-color" : "Silver"
	});
	$("#" + TableID + "_tableColumn").css({
		"overflow" : "hidden",
		"height" : height - 17,
		"position" : "relative",
		"z-index" : "40",
		"background-color" : "Silver"
	});
	$("#" + TableID + "_tableData").css({
		"overflow" : "scroll",
		"width" : width,
		"height" : height,
		"position" : "relative",
		"z-index" : "35"
	});
	if ($("#" + TableID + "_tableHead").width() > $(
			"#" + TableID + "_tableFix table").width()) {
		$("#" + TableID + "_tableHead").css("width",
				$("#" + TableID + "_tableFix table").width());
		$("#" + TableID + "_tableData").css("width",
				$("#" + TableID + "_tableFix table").width() + 17);
	}
	if ($("#" + TableID + "_tableColumn").height() > $(
			"#" + TableID + "_tableColumn table").height()) {
		$("#" + TableID + "_tableColumn").css("height",
				$("#" + TableID + "_tableColumn table").height());
		$("#" + TableID + "_tableData").css("height",
				$("#" + TableID + "_tableColumn table").height() + 17);
	}
	$("#" + TableID + "_tableFix").offset(
			$("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableHead").offset(
			$("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableColumn").offset(
			$("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableData").offset(
			$("#" + TableID + "_tableLayout").offset());
}
