<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_MaterialBatchNums", "WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669", "DATAGRID", "materialBatchNums")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1490347341669" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<batchNum.id IsHiddenField="true"></batchNum.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign batchNum_batchText_defaultValue=''>
												<#assign batchNum_batchText_defaultValue=''>
				<#if (batchNum_batchText_defaultValue!)?string=="currentUser">
					<#assign batchNum_batchText_defaultValue='${staffJson!}'>
				<#elseif (batchNum_batchText_defaultValue!)?string=="currentPost">
					<#assign batchNum_batchText_defaultValue='${postJson!}'>
				<#elseif (batchNum_batchText_defaultValue!)?string=="currentDepart">
					<#assign batchNum_batchText_defaultValue='${deptJson!}'>
				<#elseif (batchNum_batchText_defaultValue!)?string=="currentComp">
					<#assign batchNum_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNum_batchText_defaultText=''>
				<batchNum.batchText
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(MaterialBatchNums_dg1490347341669Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(MaterialBatchNums_dg1490347341669Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumRef.action','dg1490347341669batchNum.batchText','${getText("WOM.viewtitle.randon1490065762725")}',sPTGridID,nRow,sFieldName,MaterialBatchNums_dg1490347341669Widget,null,false,false,'','WOM_7.5.0.0_standingcropRef_batchNumRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit = checkFieldPermission('batchNum.batchText','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (batchNum_batchText_defaultValue)?? &&(batchNum_batchText_defaultValue)?has_content>
							defaultValue='${(batchNum_batchText_defaultValue!)?string}'
						</#if>
						<#if (batchNum_batchText_defaultText)?? &&(batchNum_batchText_defaultText)?has_content>
							defaultText='${(batchNum_batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">批号</batchNum.batchText>
				<#assign isRef = false >
				<#assign batchNum_good_productCode_defaultValue=''>
												<#assign batchNum_good_productCode_defaultValue=''>
				<#if (batchNum_good_productCode_defaultValue!)?string=="currentUser">
					<#assign batchNum_good_productCode_defaultValue='${staffJson!}'>
				<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentPost">
					<#assign batchNum_good_productCode_defaultValue='${postJson!}'>
				<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentDepart">
					<#assign batchNum_good_productCode_defaultValue='${deptJson!}'>
				<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentComp">
					<#assign batchNum_good_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNum_good_productCode_defaultText=''>
				<batchNum.good.productCode
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('batchNum.good.productCode','WOM_7.5.0.0_produceTask_MaterialBatchNums','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (batchNum_good_productCode_defaultValue)?? &&(batchNum_good_productCode_defaultValue)?has_content>
							defaultValue='${(batchNum_good_productCode_defaultValue!)?string}'
						</#if>
						<#if (batchNum_good_productCode_defaultText)?? &&(batchNum_good_productCode_defaultText)?has_content>
							defaultText='${(batchNum_good_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品编码</batchNum.good.productCode>
				<#assign isRef = false >
				<#assign batchNum_good_productName_defaultValue=''>
												<#assign batchNum_good_productName_defaultValue=''>
				<#if (batchNum_good_productName_defaultValue!)?string=="currentUser">
					<#assign batchNum_good_productName_defaultValue='${staffJson!}'>
				<#elseif (batchNum_good_productName_defaultValue!)?string=="currentPost">
					<#assign batchNum_good_productName_defaultValue='${postJson!}'>
				<#elseif (batchNum_good_productName_defaultValue!)?string=="currentDepart">
					<#assign batchNum_good_productName_defaultValue='${deptJson!}'>
				<#elseif (batchNum_good_productName_defaultValue!)?string=="currentComp">
					<#assign batchNum_good_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNum_good_productName_defaultText=''>
				<batchNum.good.productName
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit = checkFieldPermission('batchNum.good.productName','WOM_7.5.0.0_produceTask_MaterialBatchNums','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (batchNum_good_productName_defaultValue)?? &&(batchNum_good_productName_defaultValue)?has_content>
							defaultValue='${(batchNum_good_productName_defaultValue!)?string}'
						</#if>
						<#if (batchNum_good_productName_defaultText)?? &&(batchNum_good_productName_defaultText)?has_content>
							defaultText='${(batchNum_good_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</batchNum.good.productName>
				<#assign isRef = false >
				<#assign batchNum_onhand_defaultValue=''>
												<#assign batchNum_onhand_defaultValue=''>
				<#if (batchNum_onhand_defaultValue!)?string=="currentUser">
					<#assign batchNum_onhand_defaultValue='${staffJson!}'>
				<#elseif (batchNum_onhand_defaultValue!)?string=="currentPost">
					<#assign batchNum_onhand_defaultValue='${postJson!}'>
				<#elseif (batchNum_onhand_defaultValue!)?string=="currentDepart">
					<#assign batchNum_onhand_defaultValue='${deptJson!}'>
				<#elseif (batchNum_onhand_defaultValue!)?string=="currentComp">
					<#assign batchNum_onhand_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNum_onhand_defaultText=''>
				<batchNum.onhand
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit = checkFieldPermission('batchNum.onhand','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_onhand')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (batchNum_onhand_defaultValue)?? &&(batchNum_onhand_defaultValue)?has_content>
							defaultValue='${(batchNum_onhand_defaultValue!)?string}'
						</#if>
						<#if (batchNum_onhand_defaultText)?? &&(batchNum_onhand_defaultText)?has_content>
							defaultText='${(batchNum_onhand_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">现存量</batchNum.onhand>
				<#assign isRef = false >
				<#assign batchNum_availiQuantity_defaultValue=''>
												<#assign batchNum_availiQuantity_defaultValue=''>
				<#if (batchNum_availiQuantity_defaultValue!)?string=="currentUser">
					<#assign batchNum_availiQuantity_defaultValue='${staffJson!}'>
				<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentPost">
					<#assign batchNum_availiQuantity_defaultValue='${postJson!}'>
				<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentDepart">
					<#assign batchNum_availiQuantity_defaultValue='${deptJson!}'>
				<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentComp">
					<#assign batchNum_availiQuantity_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNum_availiQuantity_defaultText=''>
				<batchNum.availiQuantity
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit = checkFieldPermission('batchNum.availiQuantity','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_availiQuantity')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (batchNum_availiQuantity_defaultValue)?? &&(batchNum_availiQuantity_defaultValue)?has_content>
							defaultValue='${(batchNum_availiQuantity_defaultValue!)?string}'
						</#if>
						<#if (batchNum_availiQuantity_defaultText)?? &&(batchNum_availiQuantity_defaultText)?has_content>
							defaultText='${(batchNum_availiQuantity_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">可用量</batchNum.availiQuantity>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 				<#assign planNum_defaultText=''>
				<planNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_produceTask_MaterialBatchNums_planNum')>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (planNum_defaultValue)?? &&(planNum_defaultValue)?has_content>
							defaultValue='${(planNum_defaultValue!)?string}'
						</#if>
						<#if (planNum_defaultText)?? &&(planNum_defaultText)?has_content>
							defaultText='${(planNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">数量</planNum>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_MaterialBatchNums", "WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669", "DATAGRID", "materialBatchNums")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmReadOnly = false>
					<#if !cpvmReadOnly && cpvm.propertyLayRec?index_of('.') gt -1>
						<#assign cpvmReadOnly = true>
					</#if>
					<${cpvm.propertyLayRec}<#if cpvm.property.type == 'OBJECT'>MainDisplay</#if> <#if !(cpvm.nullable!true)>style="font-color:0303B3"</#if>
					<#if cpvm.property.type == 'OBJECT'>
						<#assign viewCode = ''>
						<#assign viewUrl = ''>
						<#assign viewTitle = ''>
						<#assign mainDisplayName = ''>
						<#assign pkName = ''>
						<#assign mainDisplayName = ''>
						<#list cpvm.property.associatedProperty.model.properties as p>
							<#if !pkName?has_content && p.isPk?? && p.isPk>
								<#assign pkName = p.name>
							</#if>
							<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
								<#assign mainDisplayName = p.name>
							</#if>
						</#list>
						<#if cpvm.refView??>
							<#assign viewUrl = (cpvm.refView.url)!''>
							<#assign viewTitle = (cpvm.refView.title)!''>
							<#assign viewCode = (cpvm.refView.code)!''>
							onFocus="CUI.toggleClearBtn_DG_IE(MaterialBatchNums_dg1490347341669Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(MaterialBatchNums_dg1490347341669Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1490347341669${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',MaterialBatchNums_dg1490347341669Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="MaterialBatchNums_dg1490347341669Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
						<#if cpvmReadOnly || cpvm.property.type == 'OBJECT'>
						readOnly="true"
						</#if>
						<#if cpvmReadOnly>
						hideButtonsOnReadOnly="true"
						</#if>
					<#if cpvm.property.type == 'SYSTEMCODE'>
						<#assign optionMap = getSystemCodeList('${(cpvm.property.fillcontentMap.fillContent)!}')>
						<#assign itemList = '' >
						<#assign valueList = '' >
						<#if optionMap??>
							<#list optionMap?keys as mapKey>
								<#assign itemList = itemList + ',' + optionMap[mapKey] >
								<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode?string('true','false')=='true'>
								<#assign arr=(mapKey?split("/"))>
								<#assign valueList = valueList + ',' + arr[1] >
								<#else>
								<#assign valueList = valueList + ',' + mapKey >
								</#if>
							</#list>
						</#if>
						control="ComboBox" items="${itemList!}" values="${valueList!}"
					<#elseif cpvm.property.type == 'DATETIME'>
						onBlur="document.body.click()" buttonImg="Calendar"
						onClick="initCalender(MaterialBatchNums_dg1490347341669Widget,'MaterialBatchNums_dg1490347341669Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(MaterialBatchNums_dg1490347341669Widget,'MaterialBatchNums_dg1490347341669Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						control="Text"
					<#elseif cpvm.property.type == 'DECIMAL'>
						<#if cpvm.property.decimalNum?? && cpvm.property.decimalNum gt -1> 
							decLength="${cpvm.property.decimalNum}"
						</#if>
						 dataType="float"
					<#elseif cpvm.property.type == 'INTEGER'>
						dataType="float" decLength="0"
					<#else>
						<#if !cpvmReadOnly>
						control="Text"
						</#if>
					</#if>
					<#if cpvm.property.type == 'INTEGER' || cpvm.property.type == 'DECIMAL'>
						align="right"
					<#else>
						align="center"
					</#if>
					<#if cpvm.property.type == 'DECIMAL' || cpvm.property.type == 'INTEGER'>
						control="NumericEdit"
						<#if cpvm.format?? && cpvm.format == 'THOUSAND'>
							format="#,##0.00" 
						<#elseif cpvm.format?? && cpvm.format == 'TEN_THOUSAND'>
						</#if>
					</#if>
					showFormat="${cpvm.format}"
					<#if cpvm.property.type == 'DATETIME'>
						<#if cpvm.format == 'YMD_H'>
							type="dateTimeHour"
						<#elseif cpvm.format == 'YMD_HM'>
							type="dateTimeMin" 
						<#elseif cpvm.format == 'YMD_HMS'>
							type="datetime" 
						<#else>
							type="date" 
						</#if>
					<#elseif cpvm.property.type == 'DECIMAL' || cpvm.property.type == 'INTEGER'>
						type="${cpvm.property.type}"
					<#else>
						type="${cpvm.fieldType}"
					</#if>
					<#if cpvm.property.type == 'DATETIME'>
						width="130"
					<#elseif cpvm.fieldType == 'TEXTAREA'>
						width="200"
					<#else>
						width="100"
					</#if>
					>${getText('${cpvm.displayName}')}</${cpvm.propertyLayRec}<#if cpvm.property.type == 'OBJECT'>MainDisplay</#if>>
				</#list>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="MaterialBatchNums_dg1490347341669Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.batchNum.id)!}</c>
			<#if cpObjHideKey?? && cpObjHideKey?has_content>
				<#list cpObjHideKey?split(',') as key>
					<#assign cpvmHideVal = ''>
					<#assign keyArr = key?split('.')>
					<#if row[keyArr[0]]??>
						<#assign cpvmHideVal = row[keyArr[0]]>
						<#if keyArr?size gt 1>
							<#list 1..(keyArr?size - 1) as i>
								<#if cpvmHideVal?? && cpvmHideVal[keyArr[i]]??>
									<#assign cpvmHideVal = cpvmHideVal[keyArr[i]]>
								<#else>
									<#assign cpvmHideVal = ''>
									<#break>
								</#if>
							</#list>
						</#if>
					</#if>
					<c>${cpvmHideVal!}</c>
				</#list>
			</#if>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit = checkFieldPermission('batchNum.batchText','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit != 0><#if (row.batchNum.batchText)?has_content>${(row.batchNum.batchText)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('batchNum.good.productCode','WOM_7.5.0.0_produceTask_MaterialBatchNums','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productCode_permit != 0><#if (row.batchNum.good.productCode)?has_content>${(row.batchNum.good.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit = checkFieldPermission('batchNum.good.productName','WOM_7.5.0.0_produceTask_MaterialBatchNums','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_good_MESBasic_1_product_Product_productName_permit != 0><#if (row.batchNum.good.productName)?has_content>${(row.batchNum.good.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit = checkFieldPermission('batchNum.onhand','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_onhand')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_onhand_permit != 0><#if (row.batchNum.onhand)?has_content>#{(row.batchNum.onhand)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit = checkFieldPermission('batchNum.availiQuantity','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_standingcropRef_StandingcropRef_availiQuantity')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_batchNum_WOM_7_5_0_0_standingcropRef_StandingcropRef_availiQuantity_permit != 0><#if (row.batchNum.availiQuantity)?has_content>#{(row.batchNum.availiQuantity)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_MaterialBatchNums','WOM_7.5.0.0_produceTask_MaterialBatchNums_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_MaterialBatchNums_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m2M2}</#if></#if></c>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_MaterialBatchNums", "WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669", "DATAGRID", "materialBatchNums")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmKey = cpvm.propertyLayRec>
					<#if cpvm.property.type == 'OBJECT'>
						<#assign cpvmKey = cpvm.propertyLayRec + 'MainDisplay'>
					</#if>
					<#assign cpvmResult = ''>
					<#assign cpvmKeyArr = cpvmKey?split('.')>
					<#if row[cpvmKeyArr[0]]??>
						<#assign cpvmResult = row[cpvmKeyArr[0]]>
						<#if cpvmKeyArr?size gt 1>
							<#list 1..(cpvmKeyArr?size - 1) as i>
								<#if cpvmResult?? && cpvmResult[cpvmKeyArr[i]]??>
									<#assign cpvmResult = cpvmResult[cpvmKeyArr[i]]>
								<#else>
									<#assign cpvmResult = ''>
									<#break>
								</#if>
							</#list>
						</#if>
					</#if>
					<#assign cpvmDecimalNum = cpvm.property.decimalNum!-1>
					<#if cpvm.property.type == 'DECIMAL'>
						<#if cpvmDecimalNum?? && cpvmDecimalNum gt -1>
							<#assign cpvmPrecision = '#'>
							<#if cpvmDecimalNum gt 0>
								<#assign cpvmPrecision = cpvmPrecision + '.'>
								<#list 1..cpvmDecimalNum as i>
									<#assign cpvmPrecision = cpvmPrecision + '0'>
								</#list>
							</#if>
							<#if cpvmResult?? && cpvmResult?has_content>
								<c>${cpvmResult?string("${cpvmPrecision}")}</c>
							<#else>
								<c></c>
							</#if>
						<#else>
							<c>${cpvmResult!}</c>
						</#if>
					<#elseif cpvm.property.type == 'DATETIME'>
						<#if cpvmResult?? && cpvmResult?has_content>
							<c>${cpvmResult?datetime?string('yyyy-MM-dd HH:mm:ss')}</c>
						<#else>
							<c></c>
						</#if>
					<#else>
						<c>${cpvmResult!}</c>
					</#if>
				</#list>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
