<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialArrEditdg1505982545094", "DATAGRID", "batchingMaterialPart")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"  MultiSelect="checkbox"  dgName="dg1505982545094" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<headId.id IsHiddenField="true"></headId.id>
				<factoryId.id IsHiddenField="true"></factoryId.id>
				<productId.id IsHiddenField="true"></productId.id>
				<batchNumObj.id IsHiddenField="true"></batchNumObj.id>
				<wareID.id IsHiddenField="true"></wareID.id>
				<storeID.id IsHiddenField="true"></storeID.id>
				<exeStaff.id IsHiddenField="true"></exeStaff.id>
				<taskID.id IsHiddenField="true"></taskID.id>
				<needPartId.id IsHiddenField="true"></needPartId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign headId_tableNo_defaultValue=''>
												<#assign headId_tableNo_defaultValue=''>
				<#if (headId_tableNo_defaultValue!)?string=="currentUser">
					<#assign headId_tableNo_defaultValue='${staffJson!}'>
				<#elseif (headId_tableNo_defaultValue!)?string=="currentPost">
					<#assign headId_tableNo_defaultValue='${postJson!}'>
				<#elseif (headId_tableNo_defaultValue!)?string=="currentDepart">
					<#assign headId_tableNo_defaultValue='${deptJson!}'>
				<#elseif (headId_tableNo_defaultValue!)?string=="currentComp">
					<#assign headId_tableNo_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_tableNo_defaultText=''>
				<headId.tableNo
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef.action','dg1505982545094headId.tableNo','${getText("WOM.viewtitle.randon1492136203126")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterial_batMaterialShowRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (headId_tableNo_defaultValue)?? &&(headId_tableNo_defaultValue)?has_content>
							defaultValue='${(headId_tableNo_defaultValue!)?string}'
						</#if>
						<#if (headId_tableNo_defaultText)?? &&(headId_tableNo_defaultText)?has_content>
							defaultText='${(headId_tableNo_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="200">配料指令单</headId.tableNo>
				<#assign isRef = false >
				<#assign taskBatch_defaultValue=''>
						 						<#assign taskBatch_defaultValue=''>
				<#assign taskBatch_defaultText=''>
				<taskBatch
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产批号</taskBatch>
				<#assign isRef = false >
				<#assign headId_id_defaultValue=''>
												<#assign headId_id_defaultValue=''>
				<#if (headId_id_defaultValue!)?string=="currentUser">
					<#assign headId_id_defaultValue='${staffJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentPost">
					<#assign headId_id_defaultValue='${postJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentDepart">
					<#assign headId_id_defaultValue='${deptJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentComp">
					<#assign headId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_id_defaultText=''>
				<headId.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</headId.id>
				<#assign isRef = false >
				<#assign factoryId_name_defaultValue=''>
												<#assign factoryId_name_defaultValue=''>
				<#if (factoryId_name_defaultValue!)?string=="currentUser">
					<#assign factoryId_name_defaultValue='${staffJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentPost">
					<#assign factoryId_name_defaultValue='${postJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentDepart">
					<#assign factoryId_name_defaultValue='${deptJson!}'>
				<#elseif (factoryId_name_defaultValue!)?string=="currentComp">
					<#assign factoryId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryId_name_defaultText=''>
				<factoryId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factoryProductRef.action','dg1505982545094factoryId.name','${getText("MESBasic.viewtitle.randon1490322427886")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','MESBasic_1_factoryModel_factoryProductRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (factoryId_name_defaultValue)?? &&(factoryId_name_defaultValue)?has_content>
							defaultValue='${(factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (factoryId_name_defaultText)?? &&(factoryId_name_defaultText)?has_content>
							defaultText='${(factoryId_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工作单元</factoryId.name>
				<#assign isRef = false >
				<#assign factoryId_area_defaultValue=''>
												<#assign factoryId_area_defaultValue=''>
				<#if (factoryId_area_defaultValue!)?string=="currentUser">
					<#assign factoryId_area_defaultValue='${staffJson!}'>
				<#elseif (factoryId_area_defaultValue!)?string=="currentPost">
					<#assign factoryId_area_defaultValue='${postJson!}'>
				<#elseif (factoryId_area_defaultValue!)?string=="currentDepart">
					<#assign factoryId_area_defaultValue='${deptJson!}'>
				<#elseif (factoryId_area_defaultValue!)?string=="currentComp">
					<#assign factoryId_area_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryId_area_defaultText=''>
				<factoryId.area.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('MesArea')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (factoryId_area_defaultValue)?? &&(factoryId_area_defaultValue)?has_content>
							defaultValue='${(factoryId_area_defaultValue!)?string}'
						</#if>
						<#if (factoryId_area_defaultText)?? &&(factoryId_area_defaultText)?has_content>
							defaultText='${(factoryId_area_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">位置</factoryId.area.id>
				<#assign isRef = false >
				<#assign factoryId_id_defaultValue=''>
												<#assign factoryId_id_defaultValue=''>
				<#if (factoryId_id_defaultValue!)?string=="currentUser">
					<#assign factoryId_id_defaultValue='${staffJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentPost">
					<#assign factoryId_id_defaultValue='${postJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentDepart">
					<#assign factoryId_id_defaultValue='${deptJson!}'>
				<#elseif (factoryId_id_defaultValue!)?string=="currentComp">
					<#assign factoryId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign factoryId_id_defaultText=''>
				<factoryId.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</factoryId.id>
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
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1505982545094productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
				<#assign headId_needNum_defaultValue=''>
												<#assign headId_needNum_defaultValue=''>
				<#if (headId_needNum_defaultValue!)?string=="currentUser">
					<#assign headId_needNum_defaultValue='${staffJson!}'>
				<#elseif (headId_needNum_defaultValue!)?string=="currentPost">
					<#assign headId_needNum_defaultValue='${postJson!}'>
				<#elseif (headId_needNum_defaultValue!)?string=="currentDepart">
					<#assign headId_needNum_defaultValue='${deptJson!}'>
				<#elseif (headId_needNum_defaultValue!)?string=="currentComp">
					<#assign headId_needNum_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_needNum_defaultText=''>
				<headId.needNum
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (headId_needNum_defaultValue)?? &&(headId_needNum_defaultValue)?has_content>
							defaultValue='${(headId_needNum_defaultValue!)?string}'
						</#if>
						<#if (headId_needNum_defaultText)?? &&(headId_needNum_defaultText)?has_content>
							defaultText='${(headId_needNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">需配数量</headId.needNum>
				<#assign isRef = false >
				<#assign productId_id_defaultValue=''>
												<#assign productId_id_defaultValue=''>
				<#if (productId_id_defaultValue!)?string=="currentUser">
					<#assign productId_id_defaultValue='${staffJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentPost">
					<#assign productId_id_defaultValue='${postJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentDepart">
					<#assign productId_id_defaultValue='${deptJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentComp">
					<#assign productId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_id_defaultText=''>
				<productId.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
				<#assign isRef = false >
				<#assign batchNumObj_batchText_defaultValue=''>
												<#assign batchNumObj_batchText_defaultValue=''>
				<#if (batchNumObj_batchText_defaultValue!)?string=="currentUser">
					<#assign batchNumObj_batchText_defaultValue='${staffJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentPost">
					<#assign batchNumObj_batchText_defaultValue='${postJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentDepart">
					<#assign batchNumObj_batchText_defaultValue='${deptJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentComp">
					<#assign batchNumObj_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNumObj_batchText_defaultText=''>
				<batchNumObj.batchText
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumOneBatRef.action','dg1505982545094batchNumObj.batchText','${getText("WOM.viewtitle.randon1502607384728")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,'batchObjCallback(obj)',false,false,'','WOM_7.5.0.0_standingcropRef_batchNumOneBatRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchNumObj_batchText_defaultValue)?? &&(batchNumObj_batchText_defaultValue)?has_content>
							defaultValue='${(batchNumObj_batchText_defaultValue!)?string}'
						</#if>
						<#if (batchNumObj_batchText_defaultText)?? &&(batchNumObj_batchText_defaultText)?has_content>
							defaultText='${(batchNumObj_batchText_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料批号</batchNumObj.batchText>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</batchNum>
				<#assign isRef = false >
				<#assign doneNum_defaultValue=''>
						 						<#assign doneNum_defaultValue=''>
				<#assign doneNum_defaultText=''>
				<doneNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (doneNum_defaultValue)?? &&(doneNum_defaultValue)?has_content>
							defaultValue='${(doneNum_defaultValue!)?string}'
						</#if>
						<#if (doneNum_defaultText)?? &&(doneNum_defaultText)?has_content>
							defaultText='${(doneNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">配料数量</doneNum>
				<#assign isRef = false >
				<#assign wareID_wareCode_defaultValue=''>
												<#assign wareID_wareCode_defaultValue=''>
				<#if (wareID_wareCode_defaultValue!)?string=="currentUser">
					<#assign wareID_wareCode_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentPost">
					<#assign wareID_wareCode_defaultValue='${postJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareCode_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentComp">
					<#assign wareID_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareCode_defaultText=''>
				<wareID.wareCode
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1505982545094wareID.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (wareID_wareCode_defaultValue)?? &&(wareID_wareCode_defaultValue)?has_content>
							defaultValue='${(wareID_wareCode_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareCode_defaultText)?? &&(wareID_wareCode_defaultText)?has_content>
							defaultText='${(wareID_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</wareID.wareCode>
				<#assign isRef = false >
				<#assign wareID_wareName_defaultValue=''>
												<#assign wareID_wareName_defaultValue=''>
				<#if (wareID_wareName_defaultValue!)?string=="currentUser">
					<#assign wareID_wareName_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentPost">
					<#assign wareID_wareName_defaultValue='${postJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareName_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentComp">
					<#assign wareID_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareName_defaultText=''>
				<wareID.wareName
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (wareID_wareName_defaultValue)?? &&(wareID_wareName_defaultValue)?has_content>
							defaultValue='${(wareID_wareName_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareName_defaultText)?? &&(wareID_wareName_defaultText)?has_content>
							defaultText='${(wareID_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</wareID.wareName>
				<#assign isRef = false >
				<#assign wareID_cargoStatue_defaultValue=''>
												<#assign wareID_cargoStatue_defaultValue=''>
				<#if (wareID_cargoStatue_defaultValue!)?string=="currentUser">
					<#assign wareID_cargoStatue_defaultValue='${staffJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentPost">
					<#assign wareID_cargoStatue_defaultValue='${postJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentDepart">
					<#assign wareID_cargoStatue_defaultValue='${deptJson!}'>
				<#elseif (wareID_cargoStatue_defaultValue!)?string=="currentComp">
					<#assign wareID_cargoStatue_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_cargoStatue_defaultText=''>
				<wareID.cargoStatue.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('storageState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">货位状态</wareID.cargoStatue.id>
				<#assign isRef = false >
				<#assign wareID_id_defaultValue=''>
												<#assign wareID_id_defaultValue=''>
				<#if (wareID_id_defaultValue!)?string=="currentUser">
					<#assign wareID_id_defaultValue='${staffJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentPost">
					<#assign wareID_id_defaultValue='${postJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentDepart">
					<#assign wareID_id_defaultValue='${deptJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentComp">
					<#assign wareID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_id_defaultText=''>
				<wareID.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</wareID.id>
				<#assign isRef = false >
				<#assign storeID_placeSetCode_defaultValue=''>
												<#assign storeID_placeSetCode_defaultValue=''>
				<#if (storeID_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetCode_defaultText=''>
				<storeID.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1505982545094storeID.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (storeID_placeSetCode_defaultValue)?? &&(storeID_placeSetCode_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetCode_defaultText)?? &&(storeID_placeSetCode_defaultText)?has_content>
							defaultText='${(storeID_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</storeID.placeSetCode>
				<#assign isRef = false >
				<#assign storeID_placeSetName_defaultValue=''>
												<#assign storeID_placeSetName_defaultValue=''>
				<#if (storeID_placeSetName_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetName_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetName_defaultText=''>
				<storeID.placeSetName
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (storeID_placeSetName_defaultValue)?? &&(storeID_placeSetName_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetName_defaultText)?? &&(storeID_placeSetName_defaultText)?has_content>
							defaultText='${(storeID_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位名称</storeID.placeSetName>
				<#assign isRef = false >
				<#assign storeID_id_defaultValue=''>
												<#assign storeID_id_defaultValue=''>
				<#if (storeID_id_defaultValue!)?string=="currentUser">
					<#assign storeID_id_defaultValue='${staffJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentPost">
					<#assign storeID_id_defaultValue='${postJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentDepart">
					<#assign storeID_id_defaultValue='${deptJson!}'>
				<#elseif (storeID_id_defaultValue!)?string=="currentComp">
					<#assign storeID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_id_defaultText=''>
				<storeID.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</storeID.id>
				<#assign isRef = false >
				<#assign exeStaff_name_defaultValue='currentUser'>
										<#if (exeStaff_name_defaultValue!)?string=="currentUser">
					<#assign exeStaff_name_defaultValue='${staffJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentPost">
					<#assign exeStaff_name_defaultValue='${postJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentDepart">
					<#assign exeStaff_name_defaultValue='${deptJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentComp">
					<#assign exeStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign exeStaff_name_defaultText=''>
				<exeStaff.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1505982545094exeStaff.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">配料操作人</exeStaff.name>
				<#assign isRef = false >
				<#assign exeDate_defaultValue='currentTime'>
						 				<#assign exeDate_defaultText=''>
					<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
							<#assign exeDate_defaultValue  = getDefaultDateTime(exeDate_defaultValue!)?datetime>
					</#if>
				<exeDate
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchingMaterialPart_dg1505982545094Widget,'BatchingMaterialPart_dg1505982545094Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchingMaterialPart_dg1505982545094Widget,'BatchingMaterialPart_dg1505982545094Widget',nRow,sFieldName,'datetime')" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">配料时间</exeDate>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialArrEditdg1505982545094", "DATAGRID", "batchingMaterialPart")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1505982545094${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',BatchingMaterialPart_dg1505982545094Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(BatchingMaterialPart_dg1505982545094Widget,'BatchingMaterialPart_dg1505982545094Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(BatchingMaterialPart_dg1505982545094Widget,'BatchingMaterialPart_dg1505982545094Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
				<#assign printCount_defaultValue='0'>
						 				<#assign printCount_defaultText=''>
				<printCount
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						 dataType="float" decLength="0"
						<#if (printCount_defaultValue)?? &&(printCount_defaultValue)?has_content>
							defaultValue='${(printCount_defaultValue!)?string}'
						</#if>
						<#if (printCount_defaultText)?? &&(printCount_defaultText)?has_content>
							defaultText='${(printCount_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">打印次数</printCount>
				<#assign isRef = false >
				<#assign state_defaultValue='womBatPartState/01'>
						 				<#assign state_defaultText=''>
				<state.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womBatPartState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (state_defaultValue)?? &&(state_defaultValue)?has_content>
							defaultValue='${(state_defaultValue!)?string}'
						</#if>
						<#if (state_defaultText)?? &&(state_defaultText)?has_content>
							defaultText='${(state_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">状态</state.id>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="150">备注</remark>
				<#assign isRef = false >
				<#assign actOrder_defaultValue=''>
						 						<#assign actOrder_defaultValue=''>
				<#assign actOrder_defaultText=''>
				<actOrder
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">投料顺序</actOrder>
				<#assign isRef = false >
				<#assign lableCode_defaultValue=''>
						 						<#assign lableCode_defaultValue=''>
				<#assign lableCode_defaultText=''>
				<lableCode
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">标签编号</lableCode>
				<#assign isRef = false >
				<#assign taskID_id_defaultValue=''>
												<#assign taskID_id_defaultValue=''>
				<#if (taskID_id_defaultValue!)?string=="currentUser">
					<#assign taskID_id_defaultValue='${staffJson!}'>
				<#elseif (taskID_id_defaultValue!)?string=="currentPost">
					<#assign taskID_id_defaultValue='${postJson!}'>
				<#elseif (taskID_id_defaultValue!)?string=="currentDepart">
					<#assign taskID_id_defaultValue='${deptJson!}'>
				<#elseif (taskID_id_defaultValue!)?string=="currentComp">
					<#assign taskID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign taskID_id_defaultText=''>
				<taskID.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTask/taskRef.action','dg1505982545094taskID.id','${getText("WOM.viewtitle.randon1489737198145")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','WOM_7.5.0.0_produceTask_taskRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</taskID.id>
				<#assign isRef = false >
				<#assign tableInfoId_defaultValue=''>
						 						<#assign tableInfoId_defaultValue=''>
				<#assign tableInfoId_defaultText=''>
				<tableInfoId
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">TABLE_INFO_ID</tableInfoId>
				<#assign isRef = false >
				<#assign offerSystem_defaultValue='RMsystem/system2'>
						 				<#assign offerSystem_defaultText=''>
				<offerSystem.id
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配料系统</offerSystem.id>
				<#assign isRef = false >
				<#assign needPartId_id_defaultValue=''>
												<#assign needPartId_id_defaultValue=''>
				<#if (needPartId_id_defaultValue!)?string=="currentUser">
					<#assign needPartId_id_defaultValue='${staffJson!}'>
				<#elseif (needPartId_id_defaultValue!)?string=="currentPost">
					<#assign needPartId_id_defaultValue='${postJson!}'>
				<#elseif (needPartId_id_defaultValue!)?string=="currentDepart">
					<#assign needPartId_id_defaultValue='${deptJson!}'>
				<#elseif (needPartId_id_defaultValue!)?string=="currentComp">
					<#assign needPartId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign needPartId_id_defaultText=''>
				<needPartId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1505982545094Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action','dg1505982545094needPartId.id','${getText("WOM.viewtitle.randon1491792578939")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1505982545094Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialPart_dg1505982545094Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</needPartId.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="BatchingMaterialPart_dg1505982545094Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.headId.id)!}</c>
					<c>${(row.factoryId.id)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.batchNumObj.id)!}</c>
					<c>${(row.wareID.id)!}</c>
					<c>${(row.storeID.id)!}</c>
					<c>${(row.exeStaff.id)!}</c>
					<c>${(row.taskID.id)!}</c>
					<c>${(row.needPartId.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batMaterialArrEditdg1505982545094", "DATAGRID", "batchingMaterialPart")>
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
