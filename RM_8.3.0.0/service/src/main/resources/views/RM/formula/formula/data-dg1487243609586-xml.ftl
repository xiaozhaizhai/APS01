<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaEditdg1487243609586", "DATAGRID", "formulaBom")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487243609586" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_property_permit = checkFieldPermission('property','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_property')>
						<#if RM_7_5_0_0_formula_FormulaBom_property_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_property_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('RMproperty')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (property_defaultValue)?? &&(property_defaultValue)?has_content>
							defaultValue='${(property_defaultValue!)?string}'
						</#if>
						<#if (property_defaultText)?? &&(property_defaultText)?has_content>
							defaultText='${(property_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">性质</property.id>
				<#assign isRef = false >
				<#assign productId_productCode_defaultValue=''>
												<#assign productId_productCode_defaultValue=''>
				<#if (productId_productCode_defaultValue!)?string=="currentUser">
					<#assign productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
					<#assign productId_productCode_defaultValue='${postJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
					<#assign productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productCode_defaultText=''>
				<productId.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaBom_dg1487243609586Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaBom_dg1487243609586Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1487243609586productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,FormulaBom_dg1487243609586Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productCode')>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料编码</productId.productCode>
				<#assign isRef = false >
				<#assign productId_productName_defaultValue=''>
												<#assign productId_productName_defaultValue=''>
				<#if (productId_productName_defaultValue!)?string=="currentUser">
					<#assign productId_productName_defaultValue='${staffJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentPost">
					<#assign productId_productName_defaultValue='${postJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
					<#assign productId_productName_defaultValue='${deptJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentComp">
					<#assign productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productName_defaultText=''>
				<productId.productName
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productName')>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign productId_productBaseUnit_name_defaultValue=''>
												<#assign productId_productBaseUnit_name_defaultValue=''>
				<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productBaseUnit_name_defaultText=''>
				<productId.productBaseUnit.name
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','RM_7.5.0.0_formula_FormulaBom','X6Basic_1.0_unitGroup_BaseUnit_name')>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit = checkFieldPermission('isMixQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_isMixQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMixQuality_defaultValue)?? &&(isMixQuality_defaultValue)?has_content>
							defaultValue='${(isMixQuality_defaultValue!)?string}'
						</#if>
						<#if (isMixQuality_defaultText)?? &&(isMixQuality_defaultText)?has_content>
							defaultText='${(isMixQuality_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign unitQuality_defaultValue=''>
						 						<#assign unitQuality_defaultValue=''>
				<#assign unitQuality_defaultText=''>
				<unitQuality
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (unitQuality_defaultValue)?? &&(unitQuality_defaultValue)?has_content>
							defaultValue='${(unitQuality_defaultValue!)?string}'
						</#if>
						<#if (unitQuality_defaultText)?? &&(unitQuality_defaultText)?has_content>
							defaultText='${(unitQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">单位数量</unitQuality>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaBom_dg1487243609586Widget.evalCustomFunction(nRow,sFieldName,'minQuaChange(nRow,sFieldName)');"
				    
						<#assign RM_7_5_0_0_formula_FormulaBom_minQuality_permit = checkFieldPermission('minQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_minQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (minQuality_defaultValue)?? &&(minQuality_defaultValue)?has_content>
							defaultValue='${(minQuality_defaultValue!)?string}'
						</#if>
						<#if (minQuality_defaultText)?? &&(minQuality_defaultText)?has_content>
							defaultText='${(minQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaBom_dg1487243609586Widget.evalCustomFunction(nRow,sFieldName,'maxQuaChange(nRow,sFieldName)');"
				    
						<#assign RM_7_5_0_0_formula_FormulaBom_maxQuality_permit = checkFieldPermission('maxQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_maxQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (maxQuality_defaultValue)?? &&(maxQuality_defaultValue)?has_content>
							defaultValue='${(maxQuality_defaultValue!)?string}'
						</#if>
						<#if (maxQuality_defaultText)?? &&(maxQuality_defaultText)?has_content>
							defaultText='${(maxQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间上限</maxQuality>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaEditdg1487243609586", "DATAGRID", "formulaBom")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(FormulaBom_dg1487243609586Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(FormulaBom_dg1487243609586Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1487243609586${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',FormulaBom_dg1487243609586Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(FormulaBom_dg1487243609586Widget,'FormulaBom_dg1487243609586Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(FormulaBom_dg1487243609586Widget,'FormulaBom_dg1487243609586Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="FormulaBom_dg1487243609586Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaBom_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_meno')>
						<#if RM_7_5_0_0_formula_FormulaBom_meno_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_meno_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="200">备注</meno>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaBom_dg1487243609586Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
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
					<#if !RM_7_5_0_0_formula_FormulaBom_property_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_property_permit = checkFieldPermission('property','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_property')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_property_permit != 0><#if (row.property.id)?has_content>${(row.property.id)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','RM_7.5.0.0_formula_FormulaBom','X6Basic_1.0_unitGroup_BaseUnit_name')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit != 0><#if (row.productId.productBaseUnit.name)?has_content>${(row.productId.productBaseUnit.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit = checkFieldPermission('isMixQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_isMixQuality')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit != 0><#if (row.isMixQuality)?has_content>${(row.isMixQuality?string)!}<#else>false</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_unitQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit != 0><#if (row.unitQuality)?has_content>#{(row.unitQuality)!; m2M2}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_minQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_minQuality_permit = checkFieldPermission('minQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_minQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m2M2}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_maxQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_maxQuality_permit = checkFieldPermission('maxQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_maxQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m2M2}</#if></#if></c>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaEditdg1487243609586", "DATAGRID", "formulaBom")>
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
					<#if !RM_7_5_0_0_formula_FormulaBom_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_meno')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_meno_permit != 0><#if (row.meno)?has_content>${(row.meno)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>