<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formulaBOM_FormulaBomMaterial", "RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344", "DATAGRID", "formulaBomMaterial")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1555500191344" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<material.id IsHiddenField="true"></material.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign material_productCode_defaultValue=''>
												<#assign material_productCode_defaultValue=''>
				<#if (material_productCode_defaultValue!)?string=="currentUser">
					<#assign material_productCode_defaultValue='${staffJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentPost">
					<#assign material_productCode_defaultValue='${postJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentDepart">
					<#assign material_productCode_defaultValue='${deptJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentComp">
					<#assign material_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign material_productCode_defaultText=''>
				<material.productCode
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaBomMaterial_dg1555500191344Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaBomMaterial_dg1555500191344Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1555500191344material.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,FormulaBomMaterial_dg1555500191344Widget,null,false,false,'','MESBasic_1_product_refProductLayout')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (material_productCode_defaultValue)?? &&(material_productCode_defaultValue)?has_content>
							defaultValue='${(material_productCode_defaultValue!)?string}'
						</#if>
						<#if (material_productCode_defaultText)?? &&(material_productCode_defaultText)?has_content>
							defaultText='${(material_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">原料编码</material.productCode>
				<#assign isRef = false >
				<#assign material_productName_defaultValue=''>
												<#assign material_productName_defaultValue=''>
				<#if (material_productName_defaultValue!)?string=="currentUser">
					<#assign material_productName_defaultValue='${staffJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentPost">
					<#assign material_productName_defaultValue='${postJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentDepart">
					<#assign material_productName_defaultValue='${deptJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentComp">
					<#assign material_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign material_productName_defaultText=''>
				<material.productName
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_productName_defaultValue)?? &&(material_productName_defaultValue)?has_content>
							defaultValue='${(material_productName_defaultValue!)?string}'
						</#if>
						<#if (material_productName_defaultText)?? &&(material_productName_defaultText)?has_content>
							defaultText='${(material_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">原料名称</material.productName>
				<#assign isRef = false >
				<#assign isMaxNum_defaultValue=''>
						 						<#assign isMaxNum_defaultValue=''>
				<#assign isMaxNum_defaultText=''>
				<isMaxNum
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMaxNum_defaultValue)?? &&(isMaxNum_defaultValue)?has_content>
							defaultValue='${(isMaxNum_defaultValue!)?string}'
						</#if>
						<#if (isMaxNum_defaultText)?? &&(isMaxNum_defaultText)?has_content>
							defaultText='${(isMaxNum_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">固定数量</isMaxNum>
				<#assign isRef = false >
				<#assign preNum_defaultValue=''>
						 						<#assign preNum_defaultValue=''>
				<#assign preNum_defaultText=''>
				<preNum
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (preNum_defaultValue)?? &&(preNum_defaultValue)?has_content>
							defaultValue='${(preNum_defaultValue!)?string}'
						</#if>
						<#if (preNum_defaultText)?? &&(preNum_defaultText)?has_content>
							defaultText='${(preNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">单重</preNum>
				<#assign isRef = false >
				<#assign minNum_defaultValue=''>
						 						<#assign minNum_defaultValue=''>
				<#assign minNum_defaultText=''>
				<minNum
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (minNum_defaultValue)?? &&(minNum_defaultValue)?has_content>
							defaultValue='${(minNum_defaultValue!)?string}'
						</#if>
						<#if (minNum_defaultText)?? &&(minNum_defaultText)?has_content>
							defaultText='${(minNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间下限</minNum>
				<#assign isRef = false >
				<#assign maxNum_defaultValue=''>
						 						<#assign maxNum_defaultValue=''>
				<#assign maxNum_defaultText=''>
				<maxNum
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (maxNum_defaultValue)?? &&(maxNum_defaultValue)?has_content>
							defaultValue='${(maxNum_defaultValue!)?string}'
						</#if>
						<#if (maxNum_defaultText)?? &&(maxNum_defaultText)?has_content>
							defaultText='${(maxNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间上限</maxNum>
				<#assign isRef = false >
				<#assign demo_defaultValue=''>
						 						<#assign demo_defaultValue=''>
				<#assign demo_defaultText=''>
				<demo
					sort="false"  onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (demo_defaultValue)?? &&(demo_defaultValue)?has_content>
							defaultValue='${(demo_defaultValue!)?string}'
						</#if>
						<#if (demo_defaultText)?? &&(demo_defaultText)?has_content>
							defaultText='${(demo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">备注</demo>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formulaBOM_FormulaBomMaterial", "RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344", "DATAGRID", "formulaBomMaterial")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(FormulaBomMaterial_dg1555500191344Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(FormulaBomMaterial_dg1555500191344Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1555500191344${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',FormulaBomMaterial_dg1555500191344Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="FormulaBomMaterial_dg1555500191344Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(FormulaBomMaterial_dg1555500191344Widget,'FormulaBomMaterial_dg1555500191344Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(FormulaBomMaterial_dg1555500191344Widget,'FormulaBomMaterial_dg1555500191344Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
		<row  onClick="FormulaBomMaterial_dg1555500191344Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.material.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formulaBOM_FormulaBomMaterial", "RM_7.5.0.0_formulaBOM_formulaBomEditdg1555500191344", "DATAGRID", "formulaBomMaterial")>
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
