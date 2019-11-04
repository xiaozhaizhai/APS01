<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489737290647" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<processId.id IsHiddenField="true"></processId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1489737290647Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1489737290647Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1489737290647productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1489737290647Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 1>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物品名称</productId.productName>
				<#assign isRef = false >
				<#assign proBatch_defaultValue=''>
						 						<#assign proBatch_defaultValue=''>
				<#assign proBatch_defaultText=''>
				<proBatch
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit = checkFieldPermission('proBatch','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_proBatch')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (proBatch_defaultValue)?? &&(proBatch_defaultValue)?has_content>
							defaultValue='${(proBatch_defaultValue!)?string}'
						</#if>
						<#if (proBatch_defaultText)?? &&(proBatch_defaultText)?has_content>
							defaultText='${(proBatch_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</proBatch>
				<#assign isRef = false >
				<#assign processId_name_defaultValue=''>
												<#assign processId_name_defaultValue=''>
				<#if (processId_name_defaultValue!)?string=="currentUser">
					<#assign processId_name_defaultValue='${staffJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentPost">
					<#assign processId_name_defaultValue='${postJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentDepart">
					<#assign processId_name_defaultValue='${deptJson!}'>
				<#elseif (processId_name_defaultValue!)?string=="currentComp">
					<#assign processId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign processId_name_defaultText=''>
				<processId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1489737290647Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1489737290647Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processReference.action','dg1489737290647processId.name','${getText("RM.viewtitle.randon1488596828660")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1489737290647Widget,null,false,false,'','RM_7.5.0.0_formula_processReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('processId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcess_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (processId_name_defaultValue)?? &&(processId_name_defaultValue)?has_content>
							defaultValue='${(processId_name_defaultValue!)?string}'
						</#if>
						<#if (processId_name_defaultText)?? &&(processId_name_defaultText)?has_content>
							defaultText='${(processId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</processId.name>
				<#assign isRef = false >
				<#assign actOrder_defaultValue=''>
						 						<#assign actOrder_defaultValue=''>
				<#assign actOrder_defaultText=''>
				<actOrder
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit = checkFieldPermission('actOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_actOrder')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
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
					width="100">顺序</actOrder>
				<#assign isRef = false >
				<#assign exeSystem_defaultValue=''>
						 						<#assign exeSystem_defaultValue=''>
				<#assign exeSystem_defaultText=''>
				<exeSystem.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('system')>
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
					width="100">系统</exeSystem.id>
				<#assign isRef = false >
				<#assign isReplace_defaultValue=''>
						 						<#assign isReplace_defaultValue=''>
				<#assign isReplace_defaultText=''>
				<isReplace
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit = checkFieldPermission('isReplace','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isReplace')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isReplace_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
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
					width="100">替代料</isReplace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 1>
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
				<#assign standardNum_defaultValue=''>
						 						<#assign standardNum_defaultValue=''>
				<#assign standardNum_defaultText=''>
				<standardNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit = checkFieldPermission('standardNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_standardNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					width="100">标准用量</standardNum>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					width="100">计划用量</planNum>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					width="100">损耗率</lossRate>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="ProduceTaskActive_dg1489737290647Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
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
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.processId.id)!}</c>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit = checkFieldPermission('proBatch','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_proBatch')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_proBatch_permit != 0><#if (row.proBatch)?has_content>${(row.proBatch)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit = checkFieldPermission('processId.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaProcess_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_processId_RM_7_5_0_0_formula_FormulaProcess_name_permit != 0><#if (row.processId.name)?has_content>${(row.processId.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit = checkFieldPermission('actOrder','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_actOrder')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_actOrder_permit != 0><#if (row.actOrder)?has_content>${(row.actOrder)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit = checkFieldPermission('exeSystem','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_exeSystem')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_exeSystem_permit != 0><#if (row.exeSystem.id)?has_content>${(row.exeSystem.id)!}</#if></#if></c>
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
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_standardNum_permit != 0><#if (row.standardNum)?has_content>#{(row.standardNum)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit != 0><#if (row.lossRate)?has_content>#{(row.lossRate)!; m6M6}</#if></#if></c>
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