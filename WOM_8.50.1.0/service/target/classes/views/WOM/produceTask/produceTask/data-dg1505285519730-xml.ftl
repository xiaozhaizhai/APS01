<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_recycleTaskEditdg1505285519730", "DATAGRID", "produceTaskActive")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1505285519730" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<orderProcessId.id IsHiddenField="true"></orderProcessId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<productId.id IsHiddenField="true"></productId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign orderProcessId_name_defaultValue=''>
												<#assign orderProcessId_name_defaultValue=''>
				<#if (orderProcessId_name_defaultValue!)?string=="currentUser">
					<#assign orderProcessId_name_defaultValue='${staffJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentPost">
					<#assign orderProcessId_name_defaultValue='${postJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentDepart">
					<#assign orderProcessId_name_defaultValue='${deptJson!}'>
				<#elseif (orderProcessId_name_defaultValue!)?string=="currentComp">
					<#assign orderProcessId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign orderProcessId_name_defaultText=''>
				<orderProcessId.name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('orderProcessId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (orderProcessId_name_defaultValue)?? &&(orderProcessId_name_defaultValue)?has_content>
							defaultValue='${(orderProcessId_name_defaultValue!)?string}'
						</#if>
						<#if (orderProcessId_name_defaultText)?? &&(orderProcessId_name_defaultText)?has_content>
							defaultText='${(orderProcessId_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">工序名称</orderProcessId.name>
				<#assign isRef = false >
				<#assign activeId_occurTurn_defaultValue=''>
												<#assign activeId_occurTurn_defaultValue=''>
				<#if (activeId_occurTurn_defaultValue!)?string=="currentUser">
					<#assign activeId_occurTurn_defaultValue='${staffJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentPost">
					<#assign activeId_occurTurn_defaultValue='${postJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentDepart">
					<#assign activeId_occurTurn_defaultValue='${deptJson!}'>
				<#elseif (activeId_occurTurn_defaultValue!)?string=="currentComp">
					<#assign activeId_occurTurn_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_occurTurn_defaultText=''>
				<activeId.occurTurn.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('activeId.occurTurn','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
						
						
						
						
						<#if (activeId_occurTurn_defaultValue)?? &&(activeId_occurTurn_defaultValue)?has_content>
							defaultValue='${(activeId_occurTurn_defaultValue!)?string}'
						</#if>
						<#if (activeId_occurTurn_defaultText)?? &&(activeId_occurTurn_defaultText)?has_content>
							defaultText='${(activeId_occurTurn_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">发生于</activeId.occurTurn.id>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">活动名称</name>
				<#assign isRef = false >
				<#assign activeType_defaultValue=''>
						 						<#assign activeType_defaultValue=''>
				<#assign activeType_defaultText=''>
				<activeType.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit = checkFieldPermission('activeType','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
					width="80">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign activeId_fromContainer_defaultValue=''>
												<#assign activeId_fromContainer_defaultValue=''>
				<#if (activeId_fromContainer_defaultValue!)?string=="currentUser">
					<#assign activeId_fromContainer_defaultValue='${staffJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentPost">
					<#assign activeId_fromContainer_defaultValue='${postJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentDepart">
					<#assign activeId_fromContainer_defaultValue='${deptJson!}'>
				<#elseif (activeId_fromContainer_defaultValue!)?string=="currentComp">
					<#assign activeId_fromContainer_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_fromContainer_defaultText=''>
				<activeId.fromContainer.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit = checkFieldPermission('activeId.fromContainer','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_fromContainer')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
						
						
						
						
						<#if (activeId_fromContainer_defaultValue)?? &&(activeId_fromContainer_defaultValue)?has_content>
							defaultValue='${(activeId_fromContainer_defaultValue!)?string}'
						</#if>
						<#if (activeId_fromContainer_defaultText)?? &&(activeId_fromContainer_defaultText)?has_content>
							defaultText='${(activeId_fromContainer_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">来自容器</activeId.fromContainer.id>
				<#assign isRef = false >
				<#assign activeId_container_defaultValue=''>
												<#assign activeId_container_defaultValue=''>
				<#if (activeId_container_defaultValue!)?string=="currentUser">
					<#assign activeId_container_defaultValue='${staffJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentPost">
					<#assign activeId_container_defaultValue='${postJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentDepart">
					<#assign activeId_container_defaultValue='${deptJson!}'>
				<#elseif (activeId_container_defaultValue!)?string=="currentComp">
					<#assign activeId_container_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_container_defaultText=''>
				<activeId.container
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit = checkFieldPermission('activeId.container','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_container')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_container_defaultValue)?? &&(activeId_container_defaultValue)?has_content>
							defaultValue='${(activeId_container_defaultValue!)?string}'
						</#if>
						<#if (activeId_container_defaultText)?? &&(activeId_container_defaultText)?has_content>
							defaultText='${(activeId_container_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">容器</activeId.container>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505285519730Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505285519730Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1505285519730productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505285519730Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">物料编码</productId.productCode>
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
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 1>
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
					width="80">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign isReplace_defaultValue=''>
						 						<#assign isReplace_defaultValue=''>
				<#assign isReplace_defaultText=''>
				<isReplace
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit = checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
					width="60">替代料</isReplace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
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
					width="80">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign standardNum_defaultValue=''>
						 						<#assign standardNum_defaultValue=''>
				<#assign standardNum_defaultText=''>
				<standardNum
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit = checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (standardNum_defaultValue)?? &&(standardNum_defaultValue)?has_content>
							defaultValue='${(standardNum_defaultValue!)?string}'
						</#if>
						<#if (standardNum_defaultText)?? &&(standardNum_defaultText)?has_content>
							defaultText='${(standardNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">理论用量</standardNum>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 1>
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
					width="80">理论下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 1>
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
					width="80">理论上限</maxQuality>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 1>
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
					width="80">计划用量</planNum>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
					width="80">损耗率(%)</lossRate>
				<#assign isRef = false >
				<#assign activeId_longTime_defaultValue=''>
												<#assign activeId_longTime_defaultValue=''>
				<#if (activeId_longTime_defaultValue!)?string=="currentUser">
					<#assign activeId_longTime_defaultValue='${staffJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentPost">
					<#assign activeId_longTime_defaultValue='${postJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentDepart">
					<#assign activeId_longTime_defaultValue='${deptJson!}'>
				<#elseif (activeId_longTime_defaultValue!)?string=="currentComp">
					<#assign activeId_longTime_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_longTime_defaultText=''>
				<activeId.longTime
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('activeId.longTime','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (activeId_longTime_defaultValue)?? &&(activeId_longTime_defaultValue)?has_content>
							defaultValue='${(activeId_longTime_defaultValue!)?string}'
						</#if>
						<#if (activeId_longTime_defaultText)?? &&(activeId_longTime_defaultText)?has_content>
							defaultText='${(activeId_longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">标准时长(分)</activeId.longTime>
				<#assign isRef = false >
				<#assign activeId_auto_defaultValue=''>
												<#assign activeId_auto_defaultValue=''>
				<#if (activeId_auto_defaultValue!)?string=="currentUser">
					<#assign activeId_auto_defaultValue='${staffJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentPost">
					<#assign activeId_auto_defaultValue='${postJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentDepart">
					<#assign activeId_auto_defaultValue='${deptJson!}'>
				<#elseif (activeId_auto_defaultValue!)?string=="currentComp">
					<#assign activeId_auto_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_auto_defaultText=''>
				<activeId.auto
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('activeId.auto','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (activeId_auto_defaultValue)?? &&(activeId_auto_defaultValue)?has_content>
							defaultValue='${(activeId_auto_defaultValue!)?string}'
						</#if>
						<#if (activeId_auto_defaultText)?? &&(activeId_auto_defaultText)?has_content>
							defaultText='${(activeId_auto_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">控制系统执行</activeId.auto>
				<#assign isRef = false >
				<#assign actOrder_defaultValue=''>
						 						<#assign actOrder_defaultValue=''>
				<#assign actOrder_defaultText=''>
				<actOrder
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit = checkFieldPermission('actOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_actOrder')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
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
					width="80">投料顺序</actOrder>
				<#assign isRef = false >
				<#assign offerOrder_defaultValue=''>
						 						<#assign offerOrder_defaultValue=''>
				<#assign offerOrder_defaultText=''>
				<offerOrder
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit = checkFieldPermission('offerOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_offerOrder')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (offerOrder_defaultValue)?? &&(offerOrder_defaultValue)?has_content>
							defaultValue='${(offerOrder_defaultValue!)?string}'
						</#if>
						<#if (offerOrder_defaultText)?? &&(offerOrder_defaultText)?has_content>
							defaultText='${(offerOrder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="80">配料顺序</offerOrder>
				<#assign isRef = false >
				<#assign activeId_batchSite_defaultValue=''>
												<#assign activeId_batchSite_defaultValue=''>
				<#if (activeId_batchSite_defaultValue!)?string=="currentUser">
					<#assign activeId_batchSite_defaultValue='${staffJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentPost">
					<#assign activeId_batchSite_defaultValue='${postJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentDepart">
					<#assign activeId_batchSite_defaultValue='${deptJson!}'>
				<#elseif (activeId_batchSite_defaultValue!)?string=="currentComp">
					<#assign activeId_batchSite_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_batchSite_defaultText=''>
				<activeId.batchSite.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit = checkFieldPermission('activeId.batchSite','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_batchSite')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
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
						
						
						
						
						<#if (activeId_batchSite_defaultValue)?? &&(activeId_batchSite_defaultValue)?has_content>
							defaultValue='${(activeId_batchSite_defaultValue!)?string}'
						</#if>
						<#if (activeId_batchSite_defaultText)?? &&(activeId_batchSite_defaultText)?has_content>
							defaultText='${(activeId_batchSite_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">配料方式</activeId.batchSite.id>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue=''>
						 						<#assign exeSystem_defaultValue=''>
				<#assign exeSystem_defaultText=''>
				<exeSystem.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
					width="80">执行系统</exeSystem.id>
				<#assign isRef = false >
				<#assign mobileTerminal_defaultValue=''>
						 						<#assign mobileTerminal_defaultValue=''>
				<#assign mobileTerminal_defaultText=''>
				<mobileTerminal
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit = checkFieldPermission('mobileTerminal','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_mobileTerminal')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
				<#assign activeId_qualityStandard_name_defaultValue=''>
												<#assign activeId_qualityStandard_name_defaultValue=''>
				<#if (activeId_qualityStandard_name_defaultValue!)?string=="currentUser">
					<#assign activeId_qualityStandard_name_defaultValue='${staffJson!}'>
				<#elseif (activeId_qualityStandard_name_defaultValue!)?string=="currentPost">
					<#assign activeId_qualityStandard_name_defaultValue='${postJson!}'>
				<#elseif (activeId_qualityStandard_name_defaultValue!)?string=="currentDepart">
					<#assign activeId_qualityStandard_name_defaultValue='${deptJson!}'>
				<#elseif (activeId_qualityStandard_name_defaultValue!)?string=="currentComp">
					<#assign activeId_qualityStandard_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_qualityStandard_name_defaultText=''>
				<activeId.qualityStandard.name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit = checkFieldPermission('activeId.qualityStandard.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_qualityStandard_Stand_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_qualityStandard_name_defaultValue)?? &&(activeId_qualityStandard_name_defaultValue)?has_content>
							defaultValue='${(activeId_qualityStandard_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_qualityStandard_name_defaultText)?? &&(activeId_qualityStandard_name_defaultText)?has_content>
							defaultText='${(activeId_qualityStandard_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">质量标准</activeId.qualityStandard.name>
				<#assign isRef = false >
				<#assign activeId_testProduct_name_defaultValue=''>
												<#assign activeId_testProduct_name_defaultValue=''>
				<#if (activeId_testProduct_name_defaultValue!)?string=="currentUser">
					<#assign activeId_testProduct_name_defaultValue='${staffJson!}'>
				<#elseif (activeId_testProduct_name_defaultValue!)?string=="currentPost">
					<#assign activeId_testProduct_name_defaultValue='${postJson!}'>
				<#elseif (activeId_testProduct_name_defaultValue!)?string=="currentDepart">
					<#assign activeId_testProduct_name_defaultValue='${deptJson!}'>
				<#elseif (activeId_testProduct_name_defaultValue!)?string=="currentComp">
					<#assign activeId_testProduct_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_testProduct_name_defaultText=''>
				<activeId.testProduct.name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit = checkFieldPermission('activeId.testProduct.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_sampleProj_SampleProj_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_testProduct_name_defaultValue)?? &&(activeId_testProduct_name_defaultValue)?has_content>
							defaultValue='${(activeId_testProduct_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_testProduct_name_defaultText)?? &&(activeId_testProduct_name_defaultText)?has_content>
							defaultText='${(activeId_testProduct_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">样品模板</activeId.testProduct.name>
				<#assign isRef = false >
				<#assign activeId_pickSite_name_defaultValue=''>
												<#assign activeId_pickSite_name_defaultValue=''>
				<#if (activeId_pickSite_name_defaultValue!)?string=="currentUser">
					<#assign activeId_pickSite_name_defaultValue='${staffJson!}'>
				<#elseif (activeId_pickSite_name_defaultValue!)?string=="currentPost">
					<#assign activeId_pickSite_name_defaultValue='${postJson!}'>
				<#elseif (activeId_pickSite_name_defaultValue!)?string=="currentDepart">
					<#assign activeId_pickSite_name_defaultValue='${deptJson!}'>
				<#elseif (activeId_pickSite_name_defaultValue!)?string=="currentComp">
					<#assign activeId_pickSite_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_pickSite_name_defaultText=''>
				<activeId.pickSite.name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit = checkFieldPermission('activeId.pickSite.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_pickSite_PickSite_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (activeId_pickSite_name_defaultValue)?? &&(activeId_pickSite_name_defaultValue)?has_content>
							defaultValue='${(activeId_pickSite_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_pickSite_name_defaultText)?? &&(activeId_pickSite_name_defaultText)?has_content>
							defaultText='${(activeId_pickSite_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">采样点</activeId.pickSite.name>
				<#assign isRef = false >
				<#assign activeId_finalInspection_defaultValue=''>
												<#assign activeId_finalInspection_defaultValue=''>
				<#if (activeId_finalInspection_defaultValue!)?string=="currentUser">
					<#assign activeId_finalInspection_defaultValue='${staffJson!}'>
				<#elseif (activeId_finalInspection_defaultValue!)?string=="currentPost">
					<#assign activeId_finalInspection_defaultValue='${postJson!}'>
				<#elseif (activeId_finalInspection_defaultValue!)?string=="currentDepart">
					<#assign activeId_finalInspection_defaultValue='${deptJson!}'>
				<#elseif (activeId_finalInspection_defaultValue!)?string=="currentComp">
					<#assign activeId_finalInspection_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_finalInspection_defaultText=''>
				<activeId.finalInspection
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit = checkFieldPermission('activeId.finalInspection','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_finalInspection')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (activeId_finalInspection_defaultValue)?? &&(activeId_finalInspection_defaultValue)?has_content>
							defaultValue='${(activeId_finalInspection_defaultValue!)?string}'
						</#if>
						<#if (activeId_finalInspection_defaultText)?? &&(activeId_finalInspection_defaultText)?has_content>
							defaultText='${(activeId_finalInspection_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">完工检验</activeId.finalInspection>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_recycleTaskEditdg1505285519730", "DATAGRID", "produceTaskActive")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505285519730Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505285519730Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1505285519730${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProduceTaskActive_dg1505285519730Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(ProduceTaskActive_dg1505285519730Widget,'ProduceTaskActive_dg1505285519730Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProduceTaskActive_dg1505285519730Widget,'ProduceTaskActive_dg1505285519730Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505285519730Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceTaskActive_dg1505285519730Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.orderProcessId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit = checkFieldPermission('orderProcessId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskProcess_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_orderProcessId_WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_permit != 0><#if (row.orderProcessId.name)?has_content>${(row.orderProcessId.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit = checkFieldPermission('activeId.occurTurn','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_occurTurn')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_permit != 0><#if (row.activeId.occurTurn.id)?has_content>${(row.activeId.occurTurn.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit = checkFieldPermission('name','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit = checkFieldPermission('activeType','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeType_permit != 0><#if (row.activeType.id)?has_content>${(row.activeType.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit = checkFieldPermission('activeId.fromContainer','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_fromContainer')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_fromContainer_permit != 0><#if (row.activeId.fromContainer.id)?has_content>${(row.activeId.fromContainer.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit = checkFieldPermission('activeId.container','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_container')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_container_permit != 0><#if (row.activeId.container)?has_content>${(row.activeId.container)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit = checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit != 0><#if (row.isReplace)?has_content>${(row.isReplace?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit != 0><#if (row.isMixQuality)?has_content>${(row.isMixQuality?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit = checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit != 0><#if (row.standardNum)?has_content>#{(row.standardNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit != 0><#if (row.lossRate)?has_content>#{(row.lossRate)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit = checkFieldPermission('activeId.longTime','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_longTime')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_longTime_permit != 0><#if (row.activeId.longTime)?has_content>#{(row.activeId.longTime)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit = checkFieldPermission('activeId.auto','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_auto')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_auto_permit != 0><#if (row.activeId.auto)?has_content>${(row.activeId.auto?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit = checkFieldPermission('actOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_actOrder')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit != 0><#if (row.actOrder)?has_content>${(row.actOrder)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit = checkFieldPermission('offerOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_offerOrder')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_offerOrder_permit != 0><#if (row.offerOrder)?has_content>${(row.offerOrder)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit = checkFieldPermission('activeId.batchSite','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_batchSite')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_batchSite_permit != 0><#if (row.activeId.batchSite.id)?has_content>${(row.activeId.batchSite.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit != 0><#if (row.exeSystem.id)?has_content>${(row.exeSystem.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit = checkFieldPermission('mobileTerminal','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_mobileTerminal')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_mobileTerminal_permit != 0><#if (row.mobileTerminal)?has_content>${(row.mobileTerminal?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit = checkFieldPermission('activeId.qualityStandard.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_qualityStandard_Stand_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_qualityStandard_RM_7_5_0_0_qualityStandard_Stand_name_permit != 0><#if (row.activeId.qualityStandard.name)?has_content>${(row.activeId.qualityStandard.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit = checkFieldPermission('activeId.testProduct.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_sampleProj_SampleProj_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_testProduct_RM_7_5_0_0_sampleProj_SampleProj_name_permit != 0><#if (row.activeId.testProduct.name)?has_content>${(row.activeId.testProduct.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit = checkFieldPermission('activeId.pickSite.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_pickSite_PickSite_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_pickSite_RM_7_5_0_0_pickSite_PickSite_name_permit != 0><#if (row.activeId.pickSite.name)?has_content>${(row.activeId.pickSite.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit = checkFieldPermission('activeId.finalInspection','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcessActive_finalInspection')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_activeId_RM_7_5_0_0_formula_FormulaProcessActive_finalInspection_permit != 0><#if (row.activeId.finalInspection)?has_content>${(row.activeId.finalInspection?string)!}<#else>false</#if></#if></c>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_recycleTaskEditdg1505285519730", "DATAGRID", "produceTaskActive")>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>