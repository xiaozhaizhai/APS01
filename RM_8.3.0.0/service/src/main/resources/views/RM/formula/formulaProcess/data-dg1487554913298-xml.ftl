<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveEditdg1487554913298", "DATAGRID", "formulaProcessActive")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487554913298" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<product.id IsHiddenField="true"></product.id>
				<testProduct.id IsHiddenField="true"></testProduct.id>
				<qualityStandard.id IsHiddenField="true"></qualityStandard.id>
				<pickSite.id IsHiddenField="true"></pickSite.id>
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
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">活动名称</name>
				<#assign isRef = false >
				<#assign batchPhaseName_defaultValue=''>
						 						<#assign batchPhaseName_defaultValue=''>
				<#assign batchPhaseName_defaultText=''>
				<batchPhaseName
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (batchPhaseName_defaultValue)?? &&(batchPhaseName_defaultValue)?has_content>
							defaultValue='${(batchPhaseName_defaultValue!)?string}'
						</#if>
						<#if (batchPhaseName_defaultText)?? &&(batchPhaseName_defaultText)?has_content>
							defaultText='${(batchPhaseName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批控活动名称</batchPhaseName>
				<#assign isRef = false >
				<#assign occurTurn_defaultValue=''>
						 						<#assign occurTurn_defaultValue=''>
				<#assign occurTurn_defaultText=''>
				<occurTurn.id
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('occurTurn')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (occurTurn_defaultValue)?? &&(occurTurn_defaultValue)?has_content>
							defaultValue='${(occurTurn_defaultValue!)?string}'
						</#if>
						<#if (occurTurn_defaultText)?? &&(occurTurn_defaultText)?has_content>
							defaultText='${(occurTurn_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">发生于</occurTurn.id>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('activeType')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeType_defaultValue)?? &&(activeType_defaultValue)?has_content>
							defaultValue='${(activeType_defaultValue!)?string}'
						</#if>
						<#if (activeType_defaultText)?? &&(activeType_defaultText)?has_content>
							defaultText='${(activeType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="50">类型</activeType.id>
				<#assign isRef = false >
				<#assign fromContainer_defaultValue=''>
						 						<#assign fromContainer_defaultValue=''>
				<#assign fromContainer_defaultText=''>
				<fromContainer.id
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('fromContainer')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (fromContainer_defaultValue)?? &&(fromContainer_defaultValue)?has_content>
							defaultValue='${(fromContainer_defaultValue!)?string}'
						</#if>
						<#if (fromContainer_defaultText)?? &&(fromContainer_defaultText)?has_content>
							defaultText='${(fromContainer_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">来自容器</fromContainer.id>
				<#assign isRef = false >
				<#assign container_defaultValue=''>
						 						<#assign container_defaultValue=''>
				<#assign container_defaultText=''>
				<container
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (container_defaultValue)?? &&(container_defaultValue)?has_content>
							defaultValue='${(container_defaultValue!)?string}'
						</#if>
						<#if (container_defaultText)?? &&(container_defaultText)?has_content>
							defaultText='${(container_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">容器</container>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1487554913298product.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1487554913298Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="70">物品编码</product.productCode>
				<#assign isRef = false >
				<#assign product_productName_defaultValue=''>
												<#assign product_productName_defaultValue=''>
				<#if (product_productName_defaultValue!)?string=="currentUser">
					<#assign product_productName_defaultValue='${staffJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentPost">
					<#assign product_productName_defaultValue='${postJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentDepart">
					<#assign product_productName_defaultValue='${deptJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentComp">
					<#assign product_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productName_defaultText=''>
				<product.productName
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (product_productName_defaultValue)?? &&(product_productName_defaultValue)?has_content>
							defaultValue='${(product_productName_defaultValue!)?string}'
						</#if>
						<#if (product_productName_defaultText)?? &&(product_productName_defaultText)?has_content>
							defaultText='${(product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">物品名称</product.productName>
				<#assign isRef = false >
				<#assign isAgile_defaultValue=''>
						 						<#assign isAgile_defaultValue=''>
				<#assign isAgile_defaultText=''>
				<isAgile
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isAgile_defaultValue)?? &&(isAgile_defaultValue)?has_content>
							defaultValue='${(isAgile_defaultValue!)?string}'
						</#if>
						<#if (isAgile_defaultText)?? &&(isAgile_defaultText)?has_content>
							defaultText='${(isAgile_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="50">灵活投料</isAgile>
				<#assign isRef = false >
				<#assign isReplace_defaultValue=''>
						 						<#assign isReplace_defaultValue=''>
				<#assign isReplace_defaultText=''>
				<isReplace
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isReplace_defaultValue)?? &&(isReplace_defaultValue)?has_content>
							defaultValue='${(isReplace_defaultValue!)?string}'
						</#if>
						<#if (isReplace_defaultText)?? &&(isReplace_defaultText)?has_content>
							defaultText='${(isReplace_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="50">替代料</isReplace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					width="60">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign standardQuantity_defaultValue=''>
						 						<#assign standardQuantity_defaultValue=''>
				<#assign standardQuantity_defaultText=''>
				<standardQuantity
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
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
					width="60">单位数量</standardQuantity>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					width="60">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					width="60">区间上限</maxQuality>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (lossRate_defaultValue)?? &&(lossRate_defaultValue)?has_content>
							defaultValue='${(lossRate_defaultValue!)?string}'
						</#if>
						<#if (lossRate_defaultText)?? &&(lossRate_defaultText)?has_content>
							defaultText='${(lossRate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="60">损耗率(%)</lossRate>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
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
					width="80">标准时长(分)</longTime>
				<#assign isRef = false >
				<#assign auto_defaultValue=''>
						 						<#assign auto_defaultValue=''>
				<#assign auto_defaultText=''>
				<auto
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (auto_defaultValue)?? &&(auto_defaultValue)?has_content>
							defaultValue='${(auto_defaultValue!)?string}'
						</#if>
						<#if (auto_defaultText)?? &&(auto_defaultText)?has_content>
							defaultText='${(auto_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">控制系统执行</auto>
				<#assign isRef = false >
				<#assign actOrder_defaultValue=''>
						 						<#assign actOrder_defaultValue=''>
				<#assign actOrder_defaultText=''>
				<actOrder
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						 dataType="float" decLength="0"
						<#if (actOrder_defaultValue)?? &&(actOrder_defaultValue)?has_content>
							defaultValue='${(actOrder_defaultValue!)?string}'
						</#if>
						<#if (actOrder_defaultText)?? &&(actOrder_defaultText)?has_content>
							defaultText='${(actOrder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="60">投料顺序</actOrder>
				<#assign isRef = false >
				<#assign ingredientsOrder_defaultValue=''>
						 						<#assign ingredientsOrder_defaultValue=''>
				<#assign ingredientsOrder_defaultText=''>
				<ingredientsOrder
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						 dataType="float" decLength="0"
						<#if (ingredientsOrder_defaultValue)?? &&(ingredientsOrder_defaultValue)?has_content>
							defaultValue='${(ingredientsOrder_defaultValue!)?string}'
						</#if>
						<#if (ingredientsOrder_defaultText)?? &&(ingredientsOrder_defaultText)?has_content>
							defaultText='${(ingredientsOrder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="60">配料顺序</ingredientsOrder>
				<#assign isRef = false >
				<#assign execSort_defaultValue=''>
						 						<#assign execSort_defaultValue=''>
				<#assign execSort_defaultText=''>
				<execSort
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (execSort_defaultValue)?? &&(execSort_defaultValue)?has_content>
							defaultValue='${(execSort_defaultValue!)?string}'
						</#if>
						<#if (execSort_defaultText)?? &&(execSort_defaultText)?has_content>
							defaultText='${(execSort_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">执行顺序</execSort>
				<#assign isRef = false >
				<#assign batchSite_defaultValue=''>
						 						<#assign batchSite_defaultValue=''>
				<#assign batchSite_defaultText=''>
				<batchSite.id
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
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
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="70">配料方式</batchSite.id>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue=''>
						 						<#assign exeSystem_defaultValue=''>
				<#assign exeSystem_defaultText=''>
				<exeSystem.id
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('RMsystem')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (exeSystem_defaultValue)?? &&(exeSystem_defaultValue)?has_content>
							defaultValue='${(exeSystem_defaultValue!)?string}'
						</#if>
						<#if (exeSystem_defaultText)?? &&(exeSystem_defaultText)?has_content>
							defaultText='${(exeSystem_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">系统</exeSystem.id>
				<#assign isRef = false >
				<#assign mobileTerminal_defaultValue=''>
						 						<#assign mobileTerminal_defaultValue=''>
				<#assign mobileTerminal_defaultText=''>
				<mobileTerminal
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (mobileTerminal_defaultValue)?? &&(mobileTerminal_defaultValue)?has_content>
							defaultValue='${(mobileTerminal_defaultValue!)?string}'
						</#if>
						<#if (mobileTerminal_defaultText)?? &&(mobileTerminal_defaultText)?has_content>
							defaultText='${(mobileTerminal_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">移动端执行</mobileTerminal>
				<#assign isRef = false >
				<#assign testProduct_code_defaultValue=''>
												<#assign testProduct_code_defaultValue=''>
				<#if (testProduct_code_defaultValue!)?string=="currentUser">
					<#assign testProduct_code_defaultValue='${staffJson!}'>
				<#elseif (testProduct_code_defaultValue!)?string=="currentPost">
					<#assign testProduct_code_defaultValue='${postJson!}'>
				<#elseif (testProduct_code_defaultValue!)?string=="currentDepart">
					<#assign testProduct_code_defaultValue='${deptJson!}'>
				<#elseif (testProduct_code_defaultValue!)?string=="currentComp">
					<#assign testProduct_code_defaultValue='${compJson!}'>
				</#if>
				<#assign testProduct_code_defaultText=''>
				<testProduct.code
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/testProj/testProj/testProjSIRef.action','dg1487554913298testProduct.code','${getText("RM.viewtitle.randon1487596519107")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1487554913298Widget,null,false,false,'','RM_7.5.0.0_testProj_testProjSIRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (testProduct_code_defaultValue)?? &&(testProduct_code_defaultValue)?has_content>
							defaultValue='${(testProduct_code_defaultValue!)?string}'
						</#if>
						<#if (testProduct_code_defaultText)?? &&(testProduct_code_defaultText)?has_content>
							defaultText='${(testProduct_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">样品模板</testProduct.code>
				<#assign isRef = false >
				<#assign qualityStandard_code_defaultValue=''>
												<#assign qualityStandard_code_defaultValue=''>
				<#if (qualityStandard_code_defaultValue!)?string=="currentUser">
					<#assign qualityStandard_code_defaultValue='${staffJson!}'>
				<#elseif (qualityStandard_code_defaultValue!)?string=="currentPost">
					<#assign qualityStandard_code_defaultValue='${postJson!}'>
				<#elseif (qualityStandard_code_defaultValue!)?string=="currentDepart">
					<#assign qualityStandard_code_defaultValue='${deptJson!}'>
				<#elseif (qualityStandard_code_defaultValue!)?string=="currentComp">
					<#assign qualityStandard_code_defaultValue='${compJson!}'>
				</#if>
				<#assign qualityStandard_code_defaultText=''>
				<qualityStandard.code
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/qualityStandard/stand/standRef.action','dg1487554913298qualityStandard.code','${getText("RM.viewtitle.randon1487596068024")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1487554913298Widget,null,false,false,'','RM_7.5.0.0_qualityStandard_standRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (qualityStandard_code_defaultValue)?? &&(qualityStandard_code_defaultValue)?has_content>
							defaultValue='${(qualityStandard_code_defaultValue!)?string}'
						</#if>
						<#if (qualityStandard_code_defaultText)?? &&(qualityStandard_code_defaultText)?has_content>
							defaultText='${(qualityStandard_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">质量标准</qualityStandard.code>
				<#assign isRef = false >
				<#assign pickSite_name_defaultValue=''>
												<#assign pickSite_name_defaultValue=''>
				<#if (pickSite_name_defaultValue!)?string=="currentUser">
					<#assign pickSite_name_defaultValue='${staffJson!}'>
				<#elseif (pickSite_name_defaultValue!)?string=="currentPost">
					<#assign pickSite_name_defaultValue='${postJson!}'>
				<#elseif (pickSite_name_defaultValue!)?string=="currentDepart">
					<#assign pickSite_name_defaultValue='${deptJson!}'>
				<#elseif (pickSite_name_defaultValue!)?string=="currentComp">
					<#assign pickSite_name_defaultValue='${compJson!}'>
				</#if>
				<#assign pickSite_name_defaultText=''>
				<pickSite.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/pickSite/pickSite/pickSiteRefLayOut.action','dg1487554913298pickSite.name','${getText("RM.viewtitle.randon1503470970689")}',sPTGridID,nRow,sFieldName,FormulaProcessActive_dg1487554913298Widget,null,false,false,'','RM_7.5.0.0_pickSite_pickSiteRefLayOut')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (pickSite_name_defaultValue)?? &&(pickSite_name_defaultValue)?has_content>
							defaultValue='${(pickSite_name_defaultValue!)?string}'
						</#if>
						<#if (pickSite_name_defaultText)?? &&(pickSite_name_defaultText)?has_content>
							defaultText='${(pickSite_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">采样点</pickSite.name>
				<#assign isRef = false >
				<#assign isWatchActive_defaultValue=''>
						 						<#assign isWatchActive_defaultValue=''>
				<#assign isWatchActive_defaultText=''>
				<isWatchActive
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isWatchActive_defaultValue)?? &&(isWatchActive_defaultValue)?has_content>
							defaultValue='${(isWatchActive_defaultValue!)?string}'
						</#if>
						<#if (isWatchActive_defaultText)?? &&(isWatchActive_defaultText)?has_content>
							defaultText='${(isWatchActive_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">工艺监测</isWatchActive>
				<#assign isRef = false >
				<#assign isAnaly_defaultValue=''>
						 						<#assign isAnaly_defaultValue=''>
				<#assign isAnaly_defaultText=''>
				<isAnaly
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isAnaly_defaultValue)?? &&(isAnaly_defaultValue)?has_content>
							defaultValue='${(isAnaly_defaultValue!)?string}'
						</#if>
						<#if (isAnaly_defaultText)?? &&(isAnaly_defaultText)?has_content>
							defaultText='${(isAnaly_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">统计标识</isAnaly>
				<#assign isRef = false >
				<#assign finalInspection_defaultValue=''>
						 						<#assign finalInspection_defaultValue=''>
				<#assign finalInspection_defaultText=''>
				<finalInspection
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (finalInspection_defaultValue)?? &&(finalInspection_defaultValue)?has_content>
							defaultValue='${(finalInspection_defaultValue!)?string}'
						</#if>
						<#if (finalInspection_defaultText)?? &&(finalInspection_defaultText)?has_content>
							defaultText='${(finalInspection_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">完工检验</finalInspection>
				<#assign isRef = false >
				<#assign activeHiddenId_defaultValue=''>
						 						<#assign activeHiddenId_defaultValue=''>
				<#assign activeHiddenId_defaultText=''>
				<activeHiddenId
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">活动隐藏Id</activeHiddenId>
				<#assign isRef = false >
				<#assign channelOrManual_defaultValue=''>
						 						<#assign channelOrManual_defaultValue=''>
				<#assign channelOrManual_defaultText=''>
				<channelOrManual
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">管道手工</channelOrManual>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveEditdg1487554913298", "DATAGRID", "formulaProcessActive")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(FormulaProcessActive_dg1487554913298Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1487554913298${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',FormulaProcessActive_dg1487554913298Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(FormulaProcessActive_dg1487554913298Widget,'FormulaProcessActive_dg1487554913298Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(FormulaProcessActive_dg1487554913298Widget,'FormulaProcessActive_dg1487554913298Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</meno>
				<#assign isRef = false >
				<#assign batchPhaseID_defaultValue=''>
						 						<#assign batchPhaseID_defaultValue=''>
				<#assign batchPhaseID_defaultText=''>
				<batchPhaseID
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批控PhaseID</batchPhaseID>
				<#assign isRef = false >
				<#assign copy_defaultValue='false'>
						 				<#assign copy_defaultText=''>
				<copy
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">是否复制</copy>
				<#assign isRef = false >
				<#assign subActiveNum_defaultValue=''>
						 						<#assign subActiveNum_defaultValue=''>
				<#assign subActiveNum_defaultText=''>
				<subActiveNum
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">子活动数量</subActiveNum>
				<#assign isRef = false >
				<#assign mainActive_defaultValue=''>
						 						<#assign mainActive_defaultValue=''>
				<#assign mainActive_defaultText=''>
				<mainActive
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">主要活动</mainActive>
				<#assign isRef = false >
				<#assign hiddenSort_defaultValue=''>
						 						<#assign hiddenSort_defaultValue=''>
				<#assign hiddenSort_defaultText=''>
				<hiddenSort
					sort="false"  onPropertyChange="FormulaProcessActive_dg1487554913298Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">隐藏顺序</hiddenSort>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaProcessActive_dg1487554913298Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.product.id)!}</c>
					<c>${(row.testProduct.id)!}</c>
					<c>${(row.qualityStandard.id)!}</c>
					<c>${(row.pickSite.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_processActiveEditdg1487554913298", "DATAGRID", "formulaProcessActive")>
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
