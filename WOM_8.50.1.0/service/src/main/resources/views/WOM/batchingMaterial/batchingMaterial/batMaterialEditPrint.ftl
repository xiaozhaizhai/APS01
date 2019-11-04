	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
<#assign viewType = "readonly">
<#assign newObj = false >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${getText('WOM.viewtitle.randon1491791055890')}</title>
        <link rel="stylesheet" type="text/css" href="/bap/struts/css/main_base.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/css/home.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/tabview/assets/tabview1.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/datepicker/assets/main.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/editor/themes/default/default.css">
		<link rel="stylesheet" type="text/css" href="/bap/struts/css/defaultSkin.css">
        <@editjstop /><@editjs /><@printjs />
        <link rel="stylesheet" type="text/css" href="/bap/struts/css/printStyleSheet.css" media="print" />
		<style>
		body{_width:100%;height:100%;overflow:auto;}
		.pd-top{padding-top:10px}
		.edit-panes-s{width:98%;margin-left:10px;}
		.dg_table{
			border: 1px solid #000;
			border-bottom: none;
			border-left: none;
		}
		.dg_tr{
			height:20px;
		}
		.dg_tr th{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.dg_tr td{
			border-left: 1px solid #000;
			border-bottom: 1px solid #000;
		}
		.fileAttachmentDiv{
			border:1px solid #000;
			margin-left:10px;
			width:95%;
		}
		.dealInfoContain{
			width:96%;
		}
		.dropdown h4{
			background: none;
			border: 1px solid #DCDCDC;
		}
		</style>
    </head>
	<body>
		<input type="hidden" name="mainContent" value="false" />
		<input type="hidden" name="attachmentInfo" value="false" />
		<input type="hidden" name="dealInfo" value="false" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_main_div">
			<div class="edit-head">
				<div class="edit-title fix">								
					<span class="edit-title-view"></span>
					<span class="tableNo"><#if batchingMaterial.tableNo??> &nbsp;&nbsp;${batchingMaterial.tableNo}</#if></span>
					<span class="staff">${getHtmlText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
						<#if !editNew>
						<input type="hidden" name="batchingMaterial.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(batchingMaterial.createStaffId)!'\'\'')}" />
						</#if> <#if !editNew>
							<input type="hidden" name="batchingMaterial.createTime" value="${(batchingMaterial.createTime?datetime)!}" />
						</#if>
						
						${editNew?string(datetime(),(batchingMaterial.createTime?datetime)!)} 
					</span>
					<span class="position">
						<input id="positionLayRec" type="hidden" name="batchingMaterial.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(batchingMaterial.positionLayRec)!}</#if>" />
							<#if editNew>
								<#if creatorInfo.positions?size == 1>
								${(creatorInfo.positions[0].name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="batchingMaterial.createPositionId" value="${creatorInfo.positions[0].id}" />
								<input type="hidden" name="batchingMaterial.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
							
								<#else>
								<select id="creatorPosition" name="batchingMaterial.createPositionId" onchange="WOM.batchingMaterial.batchingMaterial.batMaterialEdit.setDepartment()">
									<#list creatorInfo.positions as p>
										<option value="${p.id}" layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
									</#list>
								</select>${getHtmlText('ec.common.right.bracket')}
								</#if>
							<#else>
								${(creatorInfo.position.name)!}${getHtmlText('ec.common.right.bracket')}
								<input type="hidden" name="batchingMaterial.createPositionId" value="${(batchingMaterial.createPositionId)!}" />
							</#if>
					</span>
				</div>
			</div>
			<div class="edit-main">
				<div class="edit-content">
					<div class="edit-panes edit-panes-w clearfix">
						<#if mainContent?? && (mainContent!false)?string=='true'>
							<div class="cui-elements pd-top">
									<div style="width:98%;text-align:left;">
										<h1>${getText('ec.view.commoninfo')}</h1>
										<hr />
									</div>
								<div class="edit-panes-s">
									
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
							 
					<td   class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('ec.common.tableNo')}" >${getText('ec.common.tableNo')}</label>
				</td>
				
							 
					<td   class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							<div class="fix-input-readonly">
								<input name="batchingMaterial.tableNo" id="batchingMaterial_tableNo"  style=";"  value="${(batchingMaterial.tableNo?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							
					<td   class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.common.tableNo11111111')}" >${getText('WOM.common.tableNo11111111')}</label>
				</td>
				
							
					<td   class="edit-table-content"  width="20%" align="left" style="text-align: left;;" >
							
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterial.taskID.tableNo)!}" name="batchingMaterial.taskID.tableNo" id="batchingMaterial_taskID_tableNo" /></div>
							
				</td>
				
							 
					<td   class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('ec.common.createTime')}" >${getText('ec.common.createTime')}</label>
				</td>
				
							 
					<td   class="edit-table-content" celltype="DATETIME" width="20%" align="left" style="text-align: left;;" >

							<#if (batchingMaterial.createTime)??>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterial.createTime" value="${batchingMaterial.createTime?string('yyyy-MM-dd HH:mm:ss')}"   id="batchingMaterial.createTime" view=true cssStyle=""  />
							<#else>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterial.createTime" value=""  id="batchingMaterial.createTime" cssStyle="" view=true />
							</#if>
							
				</td>
				</tr><tr>
							
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.staff.dimissionStaff_xls.staffName334')}" >${getText('WOM.staff.dimissionStaff_xls.staffName334')}</label>
				</td>
				
							
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterial.orderStaff.name)!}" name="batchingMaterial.orderStaff.name" id="batchingMaterial_orderStaff_name" /></div>
							
				</td>
				
							
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833222')}" >${getText('WOM.propertydisplayName.radion1415772644833222')}</label>
				</td>
				
							
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterial.productId.productCode)!}" name="batchingMaterial.productId.productCode" id="batchingMaterial_productId_productCode" /></div>
							
				</td>
				
							
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772740737334')}" >${getText('WOM.propertydisplayName.radion1415772740737334')}</label>
				</td>
				
							
					<td   class="edit-table-content"   style="text-align: left;;" >
							<div class="fix-input-readonly">
								<input name="batchingMaterial.productId.productName" id="batchingMaterial_productId_productName"  style=";"  value="${(batchingMaterial.productId.productName?html)!}" type="text" class="cui-noborder-input " readonly="readonly"/>
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr>
							 
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon14917899223367')}" >${getText('WOM.propertydisplayName.randon14917899223367')}</label>
				</td>
				
							 
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							<div class="fix-input-readonly">
									<input name="batchingMaterial.needNum" id="batchingMaterial_needNum"  style=";"  value="<#if (batchingMaterial.needNum)?has_content>#{(batchingMaterial.needNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly=readonly/>
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1419232393782555')}" >${getText('WOM.propertydisplayName.radion1419232393782555')}</label>
				</td>
				
							
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input" readonly="readonly" value="${(batchingMaterial.needPartId.factoryId.name)!}" name="batchingMaterial.needPartId.factoryId.name" id="batchingMaterial_needPartId_factoryId_name" /></div>
							
				</td>
				
							
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1489991460442')}" >${getText('MESBasic.propertydisplayName.randon1489991460442')}</label>
				</td>
				
							
					<td   class="edit-table-content"   style="text-align: left;;" >
							
								<@systemcode onchange=""  viewType="readonly"  formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="batchingMaterial.needPartId.factoryId.area.id" code="MesArea" value="${(batchingMaterial.needPartId.factoryId.area.id)!}" />
							
				</td>
				</tr><tr>
							 
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491789966310')}" >${getText('WOM.propertydisplayName.randon1491789966310')}</label>
				</td>
				
							 
					<td   class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >

							<#if (batchingMaterial.arriveTime)??>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterial.arriveTime" value="${batchingMaterial.arriveTime?string('yyyy-MM-dd HH:mm:ss')}"   id="batchingMaterial.arriveTime" view=true cssStyle=""  />
							<#else>
								<@datepicker  cssClass="cui-noborder-input" name="batchingMaterial.arriveTime" value=""  id="batchingMaterial.arriveTime" cssStyle="" view=true />
							</#if>
							
				</td>
				
							 
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491789944047')}" >${getText('WOM.propertydisplayName.randon1491789944047')}</label>
				</td>
				
							 
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							<div class="fix-input-readonly">
									<input name="batchingMaterial.doneNum" id="batchingMaterial_doneNum"  style=";"  value="<#if (batchingMaterial.doneNum)?has_content>#{(batchingMaterial.doneNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly=readonly/>
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 
					<td   class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790319028')}" >${getText('WOM.propertydisplayName.randon1491790319028')}</label>
				</td>
				
							 
					<td   class="edit-table-content"   align="left" style="text-align: left;;" >
							
								<@systemcode onchange=""  viewType="readonly"  formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" view=true cssStyle="" name="batchingMaterial.state.id" code="womBatOrderState" value="${(batchingMaterial.state.id)!}" />
							
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
	<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td style="width:13%;"></td><td style="width:20%;"></td>
			<td style="width:13%;"></td><td style="width:20%;"></td>
			<td style="width:13%;"></td><td style="width:20%;"></td>
		</tr>
		<tr>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterial", "WOM_7.5.0.0_batchingMaterial_batMaterialEdit", 'EDIT')>
				<#-- 排布自定义字段 -->
				<#assign totalspan = 0>
				<#list customPropList as c>
				<#assign cspan = (c.colspan!1)>
				<#if cspan gt 3>
					<#assign cspan = 3>
				</#if>
				<#if cspan gt 1>
					<#assign colspanVal = cspan * 2 - 1>
				</#if> 
				<#assign cp_index = c_index + totalspan>
				<#if (cp_index + 1) % 3 == 0>
					<#assign restcol = 1>
				<#else>
					<#assign restcol = 3 - (cp_index + 1) % 3 + 1>
				</#if>
				<#if (cp_index gt 0 && ((cp_index + 1) % 3 == 1 || 3 == 1)) || cspan gt restcol>
					<#if cspan gt restcol>
						<#assign totalspan = totalspan + restcol>
					</#if>
				</tr><tr>
				</#if>
				<#assign totalspan = totalspan + cspan - 1>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-symbol" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> style="text-align:right;">
					<label value="${getText('${c.displayName}')}">${getText('${c.displayName}')}</label>
				</td>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-content" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> <#if cspan gt 1>colspan="${colspanVal}"</#if> style="text-align:left;">
					<#assign columnType = c.property.type>
					<#assign columnName = c.property.name>
					<#assign decimalNum = (c.property.decimalNum!-1)>
					<#assign elementName = 'batchingMaterial' + "." + columnName>
					<#assign elementId = 'batchingMaterial' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input-readonly">
					<#if columnType == 'DECIMAL'>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" readonly="readonly" />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" readonly="true" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" readonly="true" />
					</#if>
					</div>
					<script type="text/javascript">
						$(function(){
							<#if columnType == 'DECIMAL'>
							var tmpVal = parseFloat($("#${elementName?replace('.', '_')}_hide").val());
							if (!isNaN(tmpVal)) {
								var percision = parseInt("${decimalNum}");
								var countVal = (percision > -1 ? tmpVal.toFixed(percision) : tmpVal);
								$("#${elementName?replace('.', '_')}_hide").val(countVal);
								$("#${elementName?replace('.', '_')}_hide").attr("originalvalue", countVal);
								<#if c.format == 'THOUSAND' || c.format == 'TEN_THOUSAND'>
								countVal = formatMoney(<#if c.format == 'THOUSAND'>3<#elseif c.format = 'TEN_THOUSAND'>4</#if>, countVal);
								<#elseif c.format == 'PERCENT'>
								if (percision > -1) {
									var tmpPercision = percision - 2 >= 0 ? percision - 2 : 0;
									countVal = (countVal * 100).toFixed(tmpPercision) + "%";
								} else {
									countVal = (countVal * 100) + "%";
								}
								</#if>
								$("#${elementName?replace('.', '_')}").val(countVal);
								$("#${elementName?replace('.', '_')}").attr('originalvalue', countVal);
							}
							</#if>
						});
					</script>
					<#elseif fieldType == 'TEXTAREA'>
						<div class="fix-input-readonly fix-ie7-textarea">
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;" readonly="true" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
						</div>
						<script type="text/javascript">
							$(function(){
								CUI["${elementName?replace('.', '_')}completeFlag"] = "first";
								autoTextarea("${elementName?replace('[^a-zA-Z0-9_]', '_', 'r')}");
								//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
								if (YAHOO.env.ua.ie == 0) {
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 200);
								}else{
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 1000);
								}
							});
						</script>
					<#elseif fieldType == 'DATETIME'>
						<#assign dateType = ''>
						<#if c.format == 'YMD_H'>
							<#assign dateType = 'dateTimeHour'>
						<#elseif c.format == 'YMD_HM'>
							<#assign dateType = 'dateTimeMin'>
						<#elseif c.format == 'YMD'>
							<#assign dateType = 'date'>
						<#elseif c.format == 'YM'>
							<#assign dateType = 'yearMonth'>
						<#elseif c.format == 'Y'>
							<#assign dateType = 'year'>
						<#else>
							<#assign dateType = 'dateTime'>
						</#if>
						<#assign dateVal = ''>
						<#if batchingMaterial[columnName]??>
							<#assign dateVal = (batchingMaterial[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" view=true />
					<#elseif fieldType == 'SELECTCOMP'>
						<#if columnType == 'SYSTEMCODE'>
							<#assign isS2 = false>
							<#if c.property.seniorSystemCode?? && c.property.seniorSystemCode>
								<#assign isS2 = true>
							</#if>
							<#assign isMultable = false>
							<#if c.property.multable?? && c.property.multable>
								<#assign isMultable = true>
							</#if>
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchingMaterial[columnName]!}" seniorSystemCode=isS2 />
						<#else>
							<#assign displayColumnName = columnName + "MainDisplay">
							<#assign viewUrl = (c.refView.url)!''>
							<#assign viewTitle = (c.refView.title)!''>
							<#assign typeVal = ''>
							<#if viewUrl?? && viewUrl?index_of('/foundation/') gte 0 && viewUrl?index_of('/common/') gte 0 >
								<#assign viewSplitArr = viewUrl?split('/')>
								<#assign typeVal = viewSplitArr[2]>
							</#if>
							<#assign pkName = ''>
							<#assign mainDisplayName = ''>
							<#list c.property.associatedProperty.model.properties as p>
								<#if !pkName?has_content && p.isPk?? && p.isPk>
									<#assign pkName = p.name>
								</#if>
								<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
									<#assign mainDisplayName = p.name>
								</#if>
							</#list>
							<#if typeVal?? && typeVal?has_content>
								<#assign mneType = typeVal?cap_first>
							<#else>
								<#assign mneType = 'other'>
							</#if>
							<input type="hidden" iscustom="true" name="${elementName}" value="${batchingMaterial[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${batchingMaterial[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType view=true value="${batchingMaterial[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchingMaterial_batchingMaterial_batMaterialEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
							<script type="text/javascript">
								function callback_obj_cp_${elementName?replace('.', '_')}() {
									if ( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() ) {
										$('input:hidden[name="${elementName}"]').val( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() );
									}
								}
								function callback_obj_cp_${elementName?replace('.', '_')}_delete() {
									$('input:hidden[name="${elementName}.${pkName!'id'}"]').val('');
									$('input:hidden[name="${elementName}"]').val('');
									if ( $('#cp_info').length > 0 ) {
											var dg_cp_info = $('#cp_info').val();
											var infoArr = dg_cp_info.split(',');
											for (var n in infoArr) {
												var info = infoArr[n].split('||');
												var name = info[1];
												CUI('input[name="'+ name +'"]').val('');
											}
									}
								}
							</script>
						</#if>
					</#if>
				</td>
				</#list>
					<#if cpvmInfo?? && cpvmInfo?length gt 0>
						<#assign cpvmInfo = cpvmInfo?substring(1)>
						<input type="hidden" id="cp_info" value="${cpvmInfo!}" />
					</#if>
		</tr>
	</table>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr>
				
							 
					<td   class="edit-table-symbol"  width="13%" align="right" style="text-align: right;;" >
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491790056696')}" >${getText('WOM.propertydisplayName.randon1491790056696')}</label>
				</td>
				
							 
					<td   class="edit-table-content"  width="66%" colspan="5" align="left" style="text-align: left;;" >

							<div class="fix-input-readonly fix-ie7-textarea"><textarea id="batchingMaterial_remark"  name="batchingMaterial.remark" class="cui-noborder-textarea cui-textarea-wh" readonly="readonly" style=";" >${(batchingMaterial.remark)!}</textarea></div>
							
							<script type="text/javascript">
								$(function(){
									CUI["batchingMaterial_remarkcompleteFlag"] = "first";
									autoTextarea("batchingMaterial_remark");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("batchingMaterial_remark")},200);
									}else{
										setTimeout(function(){autoTextarea("batchingMaterial_remark")},500);
									}
								})
							</script>
				</td>
		</tr>
	</table>
	<div style="height:20px;width:100%"></div>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterial/data-dg1491792702452.action?batchingMaterial.id=${refId!-1}&rt=json">
			<#else>
				<#assign dUrl="/WOM/batchingMaterial/batchingMaterial/data-dg1491792702452.action?batchingMaterial.id=${(batchingMaterial.id)!-1}&rt=json">
			</#if>
			<#assign postData="&dg1491792702452Page.pageSize=65536&datagridCode=WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452" >
			<#assign propTypes = "">
			<#assign showTypes = "">
			<#assign showFormats = "">
			<#assign colkeys = "">
			<table id="BatchingMaterialPart_dg1491792702452" class="dg_table" width="100%" align="center" cellspacing="0" cellpadding="0" >
				<thead>
					<tr class="dg_tr">
					<th>${getText('ec.flowActive.mun')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'productId.productCode' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'productId.productCode' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.radion1415772644833222')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'productId.productName' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'productId.productName' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.radion1415772740737334')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'productId.id' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'productId.id' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'LONG'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'LONG'>
												</#if>
											<th>${getText('MESBasic.propertydisplayName.randon1449796384550')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'batchNumObj.batchText' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'batchNumObj.batchText' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790594009')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'batchNum' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'batchNum' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790594009')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'doneNum' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'doneNum' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'DECIMAL'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'DECIMAL'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790683313')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'wareID.wareCode' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'wareID.wareCode' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1484031239867')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'wareID.wareName' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'wareID.wareName' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1484031316283')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'wareID.cargoStatue' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'wareID.cargoStatue' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'SYSTEMCODE'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'SYSTEMCODE'>
												</#if>
											<th>${getText('MESBasic.propertydisplayName.randon1484031944240')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'wareID.id' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'wareID.id' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'LONG'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'LONG'>
												</#if>
											<th>${getText('ec.common.ID')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'storeID.placeSetCode' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'storeID.placeSetCode' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1489731651448')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'storeID.placeSetName' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'storeID.placeSetName' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1489731677164')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'exeStaff.name' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'exeStaff.name' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790473893')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'exeDate' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'exeDate' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'DATETIME'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'DATETIME'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'YMD_HMS'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'YMD_HMS'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'DATETIME'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'DATETIME'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790496670')}</th>
										<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452", "DATAGRID", "batchingMaterialPart")>
											<#list customPropViewMappings as cpvms>
											<#assign columnName = cpvms.propertyLayRec>
											<#assign columnType = cpvms.property.type>
											<#assign columnFormat = cpvms.property.format>
											<#assign columnFieldType = cpvms.property.fieldType>
											<#if colkeys?? && colkeys=="">
												<#if columnFieldType?? && columnFieldType == 'SELECTCOMP'>
													<#assign colkeys = colkeys + columnName + 'MainDisplay'>
												<#else>
													<#assign colkeys = colkeys + columnName>
												</#if>
											<#else>
												<#assign colkeys = colkeys + ",">
												<#if columnFieldType?? && columnFieldType == 'SELECTCOMP'>
													<#assign colkeys = colkeys + columnName + 'MainDisplay'>
												<#else>
													<#assign colkeys = colkeys + columnName>
												</#if>
											</#if>
											<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + columnFieldType>
											<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + columnFieldType>
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + columnType>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + columnType>
											</#if>
											<#if showFormats?? && showFormats=="">
												<#assign showFormats = showFormats + columnFormat>
											<#else>
												<#assign showFormats = showFormats + ",">
												<#assign showFormats = showFormats + columnFormat>
											</#if>
											</#list>
											<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialEditdg1491792702452", "DATAGRID", "batchingMaterialPart")>
											<#list customPropViewMappings as cpvm>
												<th>${getText('${cpvm.property.displayName}')}</th>
											</#list>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'printCount' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'printCount' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'INTEGER'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'INTEGER'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1505884945744')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'state' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'state' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'SYSTEMCODE'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'SYSTEMCODE'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790699395')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'remark' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'remark' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1491790724898')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'actOrder' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'actOrder' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'INTEGER'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'INTEGER'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1496991574267')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'lableCode' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'lableCode' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1496886333189')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'taskBatch' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'taskBatch' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'TEXTFIELD'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'TEXT'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'TEXT'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('WOM.propertydisplayName.randon1497426812197')}</th>
											<#if colkeys?? && colkeys=="">
												<#assign colkeys = colkeys + 'factoryId.name' >
											<#else>
												<#assign colkeys = colkeys + ",">
												<#assign colkeys = colkeys + 'factoryId.name' >
											</#if>
											<#if showTypes?? && showTypes=="">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											<#else>
												<#assign showTypes = showTypes + ",">
												<#assign showTypes = showTypes + 'SELECTCOMP'>
											</#if>
													<#if showFormats?? && showFormats=="">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													<#else>
														<#assign showFormats = showFormats + ",">
														<#assign showFormats = showFormats + 'SELECTCOMP'>
													</#if>
												<#if propTypes?? && propTypes=="">
													<#assign propTypes = propTypes + 'TEXT'>
												<#else>
													<#assign propTypes = propTypes + ",">
													<#assign propTypes = propTypes + 'TEXT'>
												</#if>
											<th>${getText('MESBasic.propertydisplayName.radion1419232393782')}</th>
					</tr>
				</thead>
			</table>
			<script type="text/javascript">
				$(function(){
					ec.print.loadDataGrid("BatchingMaterialPart_dg1491792702452","${dUrl}${postData!}","${colkeys!}","${propTypes!}","${showTypes!}","${showFormats!}","left,left,center,center,left,right,left,left,center,center,left,left,left,center,right,center,left,right,center,center,center","false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false","0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0");
				});
			</script>
								</div>									
							</div>
						</#if>
						<#if attachmentInfo?? && (attachmentInfo!false)?string=='true'>
						<div style="width:96%;height:20px"></div>
						<div class="clearfix">
						<div class="cui-elements pd-top">
						<div style="width:96%;height:20px"></div>
						<div style="width:98%;text-align:left;">
							<h1>${getHtmlText('ec.print.attachment.info')}</h1>
							<hr />
						</div>
						<div id="fileAttachmentDiv" class="fileAttachmentDiv"></div>
						</div>
						</div>
						</#if>
						<#if dealInfo?? && (dealInfo!false)?string=='true'>
						<div style="width:96%;height:20px"></div>
						<div id="dealInfoContain" class="dealInfoContain"></div>
						</#if>
					</div>
				</div>
			</div>
		</div>	
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterial_batMaterialEdit,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_main_div .edit-workflow {display:none;}
</style>
<!-- CUSTOM CODE END -->
		<script type="text/javascript">
		$(function(){
			<#if attachmentInfo?? && (attachmentInfo!false)?string=='true'>
				CUI("#fileAttachmentDiv").load("/ec/print/fileupload-print.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=${(view.entity.code)!}", function(){
					<#if !(dealInfo?? && (dealInfo!false)?string=='true')>
						setTimeout(function(){
					    	window.print();
					    },500);
					<#else>
						CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterial/dealInfo-list.action&enableSimpleDealInfo=false", function(){
							setTimeout(function(){
						    	window.print();
						    },500);
						});
					</#if>
				});
			<#elseif dealInfo?? && (dealInfo!false)?string=='true'>
				CUI("#dealInfoContain").load("/ec/workflow/dealInfo-print.action?dealInfoGroup=${(dealInfoGroup)!'byTime'}&dlTableInfoId=${tableInfoId!}&preName=mainFrame&dealDataUrl=/WOM/batchingMaterial/batchingMaterial/dealInfo-list.action&enableSimpleDealInfo=false", function(){
					setTimeout(function(){
				    	window.print();
				    },500);
				});
			<#else>
				setTimeout(function(){
			    	window.print();
			    },500);
			</#if>
		});
		</script>
	</body>
</html>