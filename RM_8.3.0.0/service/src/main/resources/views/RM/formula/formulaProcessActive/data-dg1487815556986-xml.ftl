<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487815556986" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<product.id IsHiddenField="true"></product.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_name_permit = checkFieldPermission('name','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_name')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">活动名称</name>
				<#assign isRef = false >
				<#assign exeOrder_defaultValue=''>
						 						<#assign exeOrder_defaultValue=''>
				<#assign exeOrder_defaultText=''>
				<exeOrder
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit = checkFieldPermission('exeOrder','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_exeOrder')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (exeOrder_defaultValue)?? &&(exeOrder_defaultValue)?has_content>
							defaultValue='${(exeOrder_defaultValue!)?string}'
						</#if>
						<#if (exeOrder_defaultText)?? &&(exeOrder_defaultText)?has_content>
							defaultText='${(exeOrder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">顺序</exeOrder>
				<#assign isRef = false >
				<#assign product_productCode_defaultValue=''>
												<#assign product_productCode_defaultValue=''>
				<#if (product_productCode_defaultValue!)?string=="currentUser">
					<#assign product_productCode_defaultValue='${staffJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentPost">
					<#assign product_productCode_defaultValue='${postJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
					<#assign product_productCode_defaultValue='${deptJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentComp">
					<#assign product_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productCode_defaultText=''>
				<product.productCode
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaMixtureActive_dg1487815556986Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaMixtureActive_dg1487815556986Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRef.action','dg1487815556986product.productCode','${getText("MESBasic.viewtitle.radion1415773613713")}',sPTGridID,nRow,sFieldName,FormulaMixtureActive_dg1487815556986Widget,null,false,false,'','MESBasic_1_product_productRef')"
								onKeyUp="RM.formula.formulaProcessActive.fomulaActiveEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':FormulaMixtureActive_dg1487815556986Widget,
										'sGridName':'FormulaMixtureActive_dg1487815556986Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/product/product/productRef.action',
										'displayfieldname':'productCode',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFunc(\'dg1487815556986product.productCode\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','RM_7.5.0.0_formula_FormulaMixtureActive','MESBasic_1_product_Product_productCode')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit == 0>
						readOnly="true" hideEditOnReadOnly="true" 
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit == 1>
						readOnly="true" hideEditOnReadOnly="true" 
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</product.productCode>
				<#assign isRef = false >
				<#assign isPlace_defaultValue=''>
						 						<#assign isPlace_defaultValue=''>
				<#assign isPlace_defaultText=''>
				<isPlace
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    onClick="changeQuantity();"
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit = checkFieldPermission('isPlace','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_isPlace')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isPlace_defaultValue)?? &&(isPlace_defaultValue)?has_content>
							defaultValue='${(isPlace_defaultValue!)?string}'
						</#if>
						<#if (isPlace_defaultText)?? &&(isPlace_defaultText)?has_content>
							defaultText='${(isPlace_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">替代料</isPlace>
				<#assign isRef = false >
				<#assign standardQuantity_defaultValue='0.00'>
						 				<#assign standardQuantity_defaultText=''>
				<standardQuantity
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit = checkFieldPermission('standardQuantity','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_standardQuantity')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (standardQuantity_defaultValue)?? &&(standardQuantity_defaultValue)?has_content>
							defaultValue='${(standardQuantity_defaultValue!)?string}'
						</#if>
						<#if (standardQuantity_defaultText)?? &&(standardQuantity_defaultText)?has_content>
							defaultText='${(standardQuantity_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">单位数量</standardQuantity>
				<#assign isRef = false >
				<#assign auto_defaultValue=''>
						 						<#assign auto_defaultValue=''>
				<#assign auto_defaultText=''>
				<auto
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit = checkFieldPermission('auto','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_auto')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (auto_defaultValue)?? &&(auto_defaultValue)?has_content>
							defaultValue='${(auto_defaultValue!)?string}'
						</#if>
						<#if (auto_defaultText)?? &&(auto_defaultText)?has_content>
							defaultText='${(auto_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECT" 
						type="CHECKBOX" 
					width="100">自动</auto>
				<#assign isRef = false >
				<#assign batchSite_defaultValue=''>
						 						<#assign batchSite_defaultValue=''>
				<#assign batchSite_defaultText=''>
				<batchSite.id
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);FormulaMixtureActive_dg1487815556986Widget.evalCustomFunction(nRow,sFieldName,'ptSave()');"
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit = checkFieldPermission('batchSite','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_batchSite')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('batchSite')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (batchSite_defaultValue)?? &&(batchSite_defaultValue)?has_content>
							defaultValue='${(batchSite_defaultValue!)?string}'
						</#if>
						<#if (batchSite_defaultText)?? &&(batchSite_defaultText)?has_content>
							defaultText='${(batchSite_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配于</batchSite.id>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit = checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_longTime')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (longTime_defaultValue)?? &&(longTime_defaultValue)?has_content>
							defaultValue='${(longTime_defaultValue!)?string}'
						</#if>
						<#if (longTime_defaultText)?? &&(longTime_defaultText)?has_content>
							defaultText='${(longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准时长</longTime>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="FormulaMixtureActive_dg1487815556986Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_meno')>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">备注</meno>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaMixtureActive_dg1487815556986Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.product.id)!}</c>
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
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_name_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_name_permit = checkFieldPermission('name','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_name')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit = checkFieldPermission('exeOrder','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_exeOrder')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_exeOrder_permit != 0><#if (row.exeOrder)?has_content>${(row.exeOrder)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','RM_7.5.0.0_formula_FormulaMixtureActive','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_product_MESBasic_1_product_Product_productCode_permit != 0><#if (row.product.productCode)?has_content>${(row.product.productCode)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit = checkFieldPermission('isPlace','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_isPlace')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_isPlace_permit != 0><#if (row.isPlace)?has_content>${(row.isPlace?string)!}<#else>false</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit = checkFieldPermission('standardQuantity','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_standardQuantity')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_standardQuantity_permit != 0><#if (row.standardQuantity)?has_content>#{(row.standardQuantity)!; m2M2}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit = checkFieldPermission('auto','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_auto')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_auto_permit != 0><#if (row.auto)?has_content>${(row.auto?string)!}<#else>false</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit = checkFieldPermission('batchSite','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_batchSite')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_batchSite_permit != 0><#if (row.batchSite.id)?has_content>${(row.batchSite.id)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit = checkFieldPermission('longTime','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_longTime')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_longTime_permit != 0><#if (row.longTime)?has_content>#{(row.longTime)!; m6M6}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaMixtureActive','RM_7.5.0.0_formula_FormulaMixtureActive_meno')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaMixtureActive_meno_permit != 0><#if (row.meno)?has_content>${(row.meno)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>