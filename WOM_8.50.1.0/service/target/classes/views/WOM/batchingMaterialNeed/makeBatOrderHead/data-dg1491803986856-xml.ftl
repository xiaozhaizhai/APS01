<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856", "DATAGRID", "makeBatOrderPart")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1491803986856" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<needID.id IsHiddenField="true"></needID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign needID_id_defaultValue=''>
												<#assign needID_id_defaultValue=''>
				<#if (needID_id_defaultValue!)?string=="currentUser">
					<#assign needID_id_defaultValue='${staffJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentPost">
					<#assign needID_id_defaultValue='${postJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentDepart">
					<#assign needID_id_defaultValue='${deptJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentComp">
					<#assign needID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_id_defaultText=''>
				<needID.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(MakeBatOrderPart_dg1491803986856Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(MakeBatOrderPart_dg1491803986856Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action','dg1491803986856needID.id','${getText("WOM.viewtitle.randon1491792578939")}',sPTGridID,nRow,sFieldName,MakeBatOrderPart_dg1491803986856Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</needID.id>
				<#assign isRef = false >
				<#assign needID_productId_productCode_defaultValue=''>
												<#assign needID_productId_productCode_defaultValue=''>
				<#if (needID_productId_productCode_defaultValue!)?string=="currentUser">
					<#assign needID_productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentPost">
					<#assign needID_productId_productCode_defaultValue='${postJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign needID_productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentComp">
					<#assign needID_productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_productId_productCode_defaultText=''>
				<needID.productId.productCode
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (needID_productId_productCode_defaultValue)?? &&(needID_productId_productCode_defaultValue)?has_content>
							defaultValue='${(needID_productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (needID_productId_productCode_defaultText)?? &&(needID_productId_productCode_defaultText)?has_content>
							defaultText='${(needID_productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品编码</needID.productId.productCode>
				<#assign isRef = false >
				<#assign needID_productId_productName_defaultValue=''>
												<#assign needID_productId_productName_defaultValue=''>
				<#if (needID_productId_productName_defaultValue!)?string=="currentUser">
					<#assign needID_productId_productName_defaultValue='${staffJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentPost">
					<#assign needID_productId_productName_defaultValue='${postJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentDepart">
					<#assign needID_productId_productName_defaultValue='${deptJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentComp">
					<#assign needID_productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_productId_productName_defaultText=''>
				<needID.productId.productName
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (needID_productId_productName_defaultValue)?? &&(needID_productId_productName_defaultValue)?has_content>
							defaultValue='${(needID_productId_productName_defaultValue!)?string}'
						</#if>
						<#if (needID_productId_productName_defaultText)?? &&(needID_productId_productName_defaultText)?has_content>
							defaultText='${(needID_productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</needID.productId.productName>
				<#assign isRef = false >
				<#assign num_defaultValue=''>
						 						<#assign num_defaultValue=''>
				<#assign num_defaultText=''>
				<num
						style="font-color:0303B3"
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (num_defaultValue)?? &&(num_defaultValue)?has_content>
							defaultValue='${(num_defaultValue!)?string}'
						</#if>
						<#if (num_defaultText)?? &&(num_defaultText)?has_content>
							defaultText='${(num_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">配料数量</num>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856", "DATAGRID", "makeBatOrderPart")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(MakeBatOrderPart_dg1491803986856Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(MakeBatOrderPart_dg1491803986856Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1491803986856${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',MakeBatOrderPart_dg1491803986856Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(MakeBatOrderPart_dg1491803986856Widget,'MakeBatOrderPart_dg1491803986856Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(MakeBatOrderPart_dg1491803986856Widget,'MakeBatOrderPart_dg1491803986856Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491803986856Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="MakeBatOrderPart_dg1491803986856Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.needID.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856", "DATAGRID", "makeBatOrderPart")>
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
