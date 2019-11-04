<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessPoint", "RM_7.5.0.0_suitedLine_testEditdg1490266476594", "DATAGRID", "processPoint")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1490266476594" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<unitId.id IsHiddenField="true"></unitId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<precessStandards.id IsHiddenField="true"></precessStandards.id>
				<itemId.id IsHiddenField="true"></itemId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign unitId_name_defaultValue=''>
												<#assign unitId_name_defaultValue=''>
				<#if (unitId_name_defaultValue!)?string=="currentUser">
					<#assign unitId_name_defaultValue='${staffJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentPost">
					<#assign unitId_name_defaultValue='${postJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentDepart">
					<#assign unitId_name_defaultValue='${deptJson!}'>
				<#elseif (unitId_name_defaultValue!)?string=="currentComp">
					<#assign unitId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign unitId_name_defaultText=''>
				<unitId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factroyRef1.action','dg1490266476594unitId.name','${getText("MESBasic.viewtitle.radion1419491307826")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1490266476594Widget,null,false,false,'','MESBasic_1_factoryModel_factroyRef1')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (unitId_name_defaultValue)?? &&(unitId_name_defaultValue)?has_content>
							defaultValue='${(unitId_name_defaultValue!)?string}'
						</#if>
						<#if (unitId_name_defaultText)?? &&(unitId_name_defaultText)?has_content>
							defaultText='${(unitId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作单元</unitId.name>
				<#assign isRef = false >
				<#assign activeId_name_defaultValue=''>
												<#assign activeId_name_defaultValue=''>
				<#if (activeId_name_defaultValue!)?string=="currentUser">
					<#assign activeId_name_defaultValue='${staffJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentPost">
					<#assign activeId_name_defaultValue='${postJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentDepart">
					<#assign activeId_name_defaultValue='${deptJson!}'>
				<#elseif (activeId_name_defaultValue!)?string=="currentComp">
					<#assign activeId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_name_defaultText=''>
				<activeId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeRef.action','dg1490266476594activeId.name','${getText("RM.viewtitle.randon1489564694469")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1490266476594Widget,null,false,false,'','RM_7.5.0.0_formula_activeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeId_name_defaultValue)?? &&(activeId_name_defaultValue)?has_content>
							defaultValue='${(activeId_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_name_defaultText)?? &&(activeId_name_defaultText)?has_content>
							defaultText='${(activeId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序活动</activeId.name>
				<#assign isRef = false >
				<#assign precessStandards_quota_defaultValue=''>
												<#assign precessStandards_quota_defaultValue=''>
				<#if (precessStandards_quota_defaultValue!)?string=="currentUser">
					<#assign precessStandards_quota_defaultValue='${staffJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentPost">
					<#assign precessStandards_quota_defaultValue='${postJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentDepart">
					<#assign precessStandards_quota_defaultValue='${deptJson!}'>
				<#elseif (precessStandards_quota_defaultValue!)?string=="currentComp">
					<#assign precessStandards_quota_defaultValue='${compJson!}'>
				</#if>
				<#assign precessStandards_quota_defaultText=''>
				<precessStandards.quota
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/precessStandards/precessStandardsRef.action','dg1490266476594precessStandards.quota','${getText("RM.viewtitle.randon1489564893234")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1490266476594Widget,null,false,false,'','RM_7.5.0.0_formula_precessStandardsRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (precessStandards_quota_defaultValue)?? &&(precessStandards_quota_defaultValue)?has_content>
							defaultValue='${(precessStandards_quota_defaultValue!)?string}'
						</#if>
						<#if (precessStandards_quota_defaultText)?? &&(precessStandards_quota_defaultText)?has_content>
							defaultText='${(precessStandards_quota_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">指标</precessStandards.quota>
				<#assign isRef = false >
				<#assign itemId_code_defaultValue=''>
												<#assign itemId_code_defaultValue=''>
				<#if (itemId_code_defaultValue!)?string=="currentUser">
					<#assign itemId_code_defaultValue='${staffJson!}'>
				<#elseif (itemId_code_defaultValue!)?string=="currentPost">
					<#assign itemId_code_defaultValue='${postJson!}'>
				<#elseif (itemId_code_defaultValue!)?string=="currentDepart">
					<#assign itemId_code_defaultValue='${deptJson!}'>
				<#elseif (itemId_code_defaultValue!)?string=="currentComp">
					<#assign itemId_code_defaultValue='${compJson!}'>
				</#if>
				<#assign itemId_code_defaultText=''>
				<itemId.code
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/itemSelfList.action','dg1490266476594itemId.code','${getText("MESBasic.viewtitle.radion1421223012419")}',sPTGridID,nRow,sFieldName,ProcessPoint_dg1490266476594Widget,null,false,false,'','MESBasic_1_itemManage_itemSelfList')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (itemId_code_defaultValue)?? &&(itemId_code_defaultValue)?has_content>
							defaultValue='${(itemId_code_defaultValue!)?string}'
						</#if>
						<#if (itemId_code_defaultText)?? &&(itemId_code_defaultText)?has_content>
							defaultText='${(itemId_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点编码</itemId.code>
				<#assign isRef = false >
				<#assign itemId_itemName_defaultValue=''>
												<#assign itemId_itemName_defaultValue=''>
				<#if (itemId_itemName_defaultValue!)?string=="currentUser">
					<#assign itemId_itemName_defaultValue='${staffJson!}'>
				<#elseif (itemId_itemName_defaultValue!)?string=="currentPost">
					<#assign itemId_itemName_defaultValue='${postJson!}'>
				<#elseif (itemId_itemName_defaultValue!)?string=="currentDepart">
					<#assign itemId_itemName_defaultValue='${deptJson!}'>
				<#elseif (itemId_itemName_defaultValue!)?string=="currentComp">
					<#assign itemId_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign itemId_itemName_defaultText=''>
				<itemId.itemName
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (itemId_itemName_defaultValue)?? &&(itemId_itemName_defaultValue)?has_content>
							defaultValue='${(itemId_itemName_defaultValue!)?string}'
						</#if>
						<#if (itemId_itemName_defaultText)?? &&(itemId_itemName_defaultText)?has_content>
							defaultText='${(itemId_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">测点名称</itemId.itemName>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessPoint", "RM_7.5.0.0_suitedLine_testEditdg1490266476594", "DATAGRID", "processPoint")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProcessPoint_dg1490266476594Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1490266476594${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProcessPoint_dg1490266476594Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(ProcessPoint_dg1490266476594Widget,'ProcessPoint_dg1490266476594Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProcessPoint_dg1490266476594Widget,'ProcessPoint_dg1490266476594Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
				<#assign isRef = false >
				<#assign pmemo_defaultValue=''>
						 						<#assign pmemo_defaultValue=''>
				<#assign pmemo_defaultText=''>
				<pmemo
					sort="false"  onPropertyChange="ProcessPoint_dg1490266476594Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (pmemo_defaultValue)?? &&(pmemo_defaultValue)?has_content>
							defaultValue='${(pmemo_defaultValue!)?string}'
						</#if>
						<#if (pmemo_defaultText)?? &&(pmemo_defaultText)?has_content>
							defaultText='${(pmemo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="150">备注</pmemo>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProcessPoint_dg1490266476594Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.unitId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
					<c>${(row.precessStandards.id)!}</c>
					<c>${(row.itemId.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessPoint", "RM_7.5.0.0_suitedLine_testEditdg1490266476594", "DATAGRID", "processPoint")>
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
