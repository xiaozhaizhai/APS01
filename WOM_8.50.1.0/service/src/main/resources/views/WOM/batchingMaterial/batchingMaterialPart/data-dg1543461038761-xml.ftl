<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingRejectParts", "WOM_7.5.0.0_batchingMaterial_rejectReciveEditdg1543461038761", "DATAGRID", "batchingRejectParts")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1543461038761" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<rejectProduct.id IsHiddenField="true"></rejectProduct.id>
				<ware.id IsHiddenField="true"></ware.id>
				<store.id IsHiddenField="true"></store.id>
				<rejectReasonId.id IsHiddenField="true"></rejectReasonId.id>
				<rejectExeStaff.id IsHiddenField="true"></rejectExeStaff.id>
				<produceTaskId.id IsHiddenField="true"></produceTaskId.id>
				<batchingId.id IsHiddenField="true"></batchingId.id>
				<batchingPartId.id IsHiddenField="true"></batchingPartId.id>
				<rejectReceiveStaff.id IsHiddenField="true"></rejectReceiveStaff.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">生产批号</batchNum>
				<#assign isRef = false >
				<#assign rejectProduct_productCode_defaultValue=''>
												<#assign rejectProduct_productCode_defaultValue=''>
				<#if (rejectProduct_productCode_defaultValue!)?string=="currentUser">
					<#assign rejectProduct_productCode_defaultValue='${staffJson!}'>
				<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentPost">
					<#assign rejectProduct_productCode_defaultValue='${postJson!}'>
				<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentDepart">
					<#assign rejectProduct_productCode_defaultValue='${deptJson!}'>
				<#elseif (rejectProduct_productCode_defaultValue!)?string=="currentComp">
					<#assign rejectProduct_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectProduct_productCode_defaultText=''>
				<rejectProduct.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1543461038761rejectProduct.productCode','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (rejectProduct_productCode_defaultValue)?? &&(rejectProduct_productCode_defaultValue)?has_content>
							defaultValue='${(rejectProduct_productCode_defaultValue!)?string}'
						</#if>
						<#if (rejectProduct_productCode_defaultText)?? &&(rejectProduct_productCode_defaultText)?has_content>
							defaultText='${(rejectProduct_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</rejectProduct.productCode>
				<#assign isRef = false >
				<#assign rejectProduct_productName_defaultValue=''>
												<#assign rejectProduct_productName_defaultValue=''>
				<#if (rejectProduct_productName_defaultValue!)?string=="currentUser">
					<#assign rejectProduct_productName_defaultValue='${staffJson!}'>
				<#elseif (rejectProduct_productName_defaultValue!)?string=="currentPost">
					<#assign rejectProduct_productName_defaultValue='${postJson!}'>
				<#elseif (rejectProduct_productName_defaultValue!)?string=="currentDepart">
					<#assign rejectProduct_productName_defaultValue='${deptJson!}'>
				<#elseif (rejectProduct_productName_defaultValue!)?string=="currentComp">
					<#assign rejectProduct_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectProduct_productName_defaultText=''>
				<rejectProduct.productName
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (rejectProduct_productName_defaultValue)?? &&(rejectProduct_productName_defaultValue)?has_content>
							defaultValue='${(rejectProduct_productName_defaultValue!)?string}'
						</#if>
						<#if (rejectProduct_productName_defaultText)?? &&(rejectProduct_productName_defaultText)?has_content>
							defaultText='${(rejectProduct_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</rejectProduct.productName>
				<#assign isRef = false >
				<#assign productBatchNum_defaultValue=''>
						 						<#assign productBatchNum_defaultValue=''>
				<#assign productBatchNum_defaultText=''>
				<productBatchNum
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (productBatchNum_defaultValue)?? &&(productBatchNum_defaultValue)?has_content>
							defaultValue='${(productBatchNum_defaultValue!)?string}'
						</#if>
						<#if (productBatchNum_defaultText)?? &&(productBatchNum_defaultText)?has_content>
							defaultText='${(productBatchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</productBatchNum>
				<#assign isRef = false >
				<#assign ware_wareName_defaultValue=''>
												<#assign ware_wareName_defaultValue=''>
				<#if (ware_wareName_defaultValue!)?string=="currentUser">
					<#assign ware_wareName_defaultValue='${staffJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
					<#assign ware_wareName_defaultValue='${postJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
					<#assign ware_wareName_defaultValue='${deptJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
					<#assign ware_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareName_defaultText=''>
				<ware.wareName
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1543461038761ware.wareName','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (ware_wareName_defaultValue)?? &&(ware_wareName_defaultValue)?has_content>
							defaultValue='${(ware_wareName_defaultValue!)?string}'
						</#if>
						<#if (ware_wareName_defaultText)?? &&(ware_wareName_defaultText)?has_content>
							defaultText='${(ware_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库名称</ware.wareName>
				<#assign isRef = false >
				<#assign ware_wareCode_defaultValue=''>
												<#assign ware_wareCode_defaultValue=''>
				<#if (ware_wareCode_defaultValue!)?string=="currentUser">
					<#assign ware_wareCode_defaultValue='${staffJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
					<#assign ware_wareCode_defaultValue='${postJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
					<#assign ware_wareCode_defaultValue='${deptJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
					<#assign ware_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareCode_defaultText=''>
				<ware.wareCode
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareCode_defaultValue)?? &&(ware_wareCode_defaultValue)?has_content>
							defaultValue='${(ware_wareCode_defaultValue!)?string}'
						</#if>
						<#if (ware_wareCode_defaultText)?? &&(ware_wareCode_defaultText)?has_content>
							defaultText='${(ware_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库编码</ware.wareCode>
				<#assign isRef = false >
				<#assign ware_wareState_defaultValue=''>
												<#assign ware_wareState_defaultValue=''>
				<#if (ware_wareState_defaultValue!)?string=="currentUser">
					<#assign ware_wareState_defaultValue='${staffJson!}'>
				<#elseif (ware_wareState_defaultValue!)?string=="currentPost">
					<#assign ware_wareState_defaultValue='${postJson!}'>
				<#elseif (ware_wareState_defaultValue!)?string=="currentDepart">
					<#assign ware_wareState_defaultValue='${deptJson!}'>
				<#elseif (ware_wareState_defaultValue!)?string=="currentComp">
					<#assign ware_wareState_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareState_defaultText=''>
				<ware.wareState.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1543461038761ware.wareState','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('wareState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (ware_wareState_defaultValue)?? &&(ware_wareState_defaultValue)?has_content>
							defaultValue='${(ware_wareState_defaultValue!)?string}'
						</#if>
						<#if (ware_wareState_defaultText)?? &&(ware_wareState_defaultText)?has_content>
							defaultText='${(ware_wareState_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库状态</ware.wareState.id>
				<#assign isRef = false >
				<#assign ware_id_defaultValue=''>
												<#assign ware_id_defaultValue=''>
				<#if (ware_id_defaultValue!)?string=="currentUser">
					<#assign ware_id_defaultValue='${staffJson!}'>
				<#elseif (ware_id_defaultValue!)?string=="currentPost">
					<#assign ware_id_defaultValue='${postJson!}'>
				<#elseif (ware_id_defaultValue!)?string=="currentDepart">
					<#assign ware_id_defaultValue='${deptJson!}'>
				<#elseif (ware_id_defaultValue!)?string=="currentComp">
					<#assign ware_id_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_id_defaultText=''>
				<ware.id
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</ware.id>
				<#assign isRef = false >
				<#assign store_placeSetName_defaultValue=''>
												<#assign store_placeSetName_defaultValue=''>
				<#if (store_placeSetName_defaultValue!)?string=="currentUser">
					<#assign store_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentPost">
					<#assign store_placeSetName_defaultValue='${postJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentComp">
					<#assign store_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetName_defaultText=''>
				<store.placeSetName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/pubStoreRef.action','dg1543461038761store.placeSetName','${getText("MESBasic.viewtitle.randon1514434358343")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','MESBasic_1_storeSet_pubStoreRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (store_placeSetName_defaultValue)?? &&(store_placeSetName_defaultValue)?has_content>
							defaultValue='${(store_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetName_defaultText)?? &&(store_placeSetName_defaultText)?has_content>
							defaultText='${(store_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位名称</store.placeSetName>
				<#assign isRef = false >
				<#assign store_placeSetCode_defaultValue=''>
												<#assign store_placeSetCode_defaultValue=''>
				<#if (store_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign store_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign store_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign store_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetCode_defaultText=''>
				<store.placeSetCode
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (store_placeSetCode_defaultValue)?? &&(store_placeSetCode_defaultValue)?has_content>
							defaultValue='${(store_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetCode_defaultText)?? &&(store_placeSetCode_defaultText)?has_content>
							defaultText='${(store_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位编码</store.placeSetCode>
				<#assign isRef = false >
				<#assign store_id_defaultValue=''>
												<#assign store_id_defaultValue=''>
				<#if (store_id_defaultValue!)?string=="currentUser">
					<#assign store_id_defaultValue='${staffJson!}'>
				<#elseif (store_id_defaultValue!)?string=="currentPost">
					<#assign store_id_defaultValue='${postJson!}'>
				<#elseif (store_id_defaultValue!)?string=="currentDepart">
					<#assign store_id_defaultValue='${deptJson!}'>
				<#elseif (store_id_defaultValue!)?string=="currentComp">
					<#assign store_id_defaultValue='${compJson!}'>
				</#if>
				<#assign store_id_defaultText=''>
				<store.id
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</store.id>
				<#assign isRef = false >
				<#assign rejectNum_defaultValue=''>
						 						<#assign rejectNum_defaultValue=''>
				<#assign rejectNum_defaultText=''>
				<rejectNum
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (rejectNum_defaultValue)?? &&(rejectNum_defaultValue)?has_content>
							defaultValue='${(rejectNum_defaultValue!)?string}'
						</#if>
						<#if (rejectNum_defaultText)?? &&(rejectNum_defaultText)?has_content>
							defaultText='${(rejectNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">退料数量</rejectNum>
				<#assign isRef = false >
				<#assign rejectReasonId_rejectReson_defaultValue=''>
												<#assign rejectReasonId_rejectReson_defaultValue=''>
				<#if (rejectReasonId_rejectReson_defaultValue!)?string=="currentUser">
					<#assign rejectReasonId_rejectReson_defaultValue='${staffJson!}'>
				<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentPost">
					<#assign rejectReasonId_rejectReson_defaultValue='${postJson!}'>
				<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentDepart">
					<#assign rejectReasonId_rejectReson_defaultValue='${deptJson!}'>
				<#elseif (rejectReasonId_rejectReson_defaultValue!)?string=="currentComp">
					<#assign rejectReasonId_rejectReson_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectReasonId_rejectReson_defaultText=''>
				<rejectReasonId.rejectReson
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/materialReject/rejectReason/rejectReasonRef.action','dg1543461038761rejectReasonId.rejectReson','${getText("WOM.viewtitle.randon1543219942185")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','WOM_7.5.0.0_materialReject_rejectReasonRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (rejectReasonId_rejectReson_defaultValue)?? &&(rejectReasonId_rejectReson_defaultValue)?has_content>
							defaultValue='${(rejectReasonId_rejectReson_defaultValue!)?string}'
						</#if>
						<#if (rejectReasonId_rejectReson_defaultText)?? &&(rejectReasonId_rejectReson_defaultText)?has_content>
							defaultText='${(rejectReasonId_rejectReson_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">退料原因</rejectReasonId.rejectReson>
				<#assign isRef = false >
				<#assign rejectExeStaff_name_defaultValue=''>
												<#assign rejectExeStaff_name_defaultValue=''>
				<#if (rejectExeStaff_name_defaultValue!)?string=="currentUser">
					<#assign rejectExeStaff_name_defaultValue='${staffJson!}'>
				<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentPost">
					<#assign rejectExeStaff_name_defaultValue='${postJson!}'>
				<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentDepart">
					<#assign rejectExeStaff_name_defaultValue='${deptJson!}'>
				<#elseif (rejectExeStaff_name_defaultValue!)?string=="currentComp">
					<#assign rejectExeStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectExeStaff_name_defaultText=''>
				<rejectExeStaff.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1543461038761rejectExeStaff.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (rejectExeStaff_name_defaultValue)?? &&(rejectExeStaff_name_defaultValue)?has_content>
							defaultValue='${(rejectExeStaff_name_defaultValue!)?string}'
						</#if>
						<#if (rejectExeStaff_name_defaultText)?? &&(rejectExeStaff_name_defaultText)?has_content>
							defaultText='${(rejectExeStaff_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">退料操作人</rejectExeStaff.name>
				<#assign isRef = false >
				<#assign rejectTime_defaultValue=''>
						 						<#assign rejectTime_defaultValue=''>
				<#assign rejectTime_defaultText=''>
					<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
							<#assign rejectTime_defaultValue  = getDefaultDateTime(rejectTime_defaultValue!)?datetime>
					</#if>
				<rejectTime
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
							defaultValue='${(rejectTime_defaultValue!)?string}'
						</#if>
						<#if (rejectTime_defaultText)?? &&(rejectTime_defaultText)?has_content>
							defaultText='${(rejectTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="160">退料时间</rejectTime>
				<#assign isRef = false >
				<#assign produceTaskId_tableNo_defaultValue=''>
												<#assign produceTaskId_tableNo_defaultValue=''>
				<#if (produceTaskId_tableNo_defaultValue!)?string=="currentUser">
					<#assign produceTaskId_tableNo_defaultValue='${staffJson!}'>
				<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentPost">
					<#assign produceTaskId_tableNo_defaultValue='${postJson!}'>
				<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentDepart">
					<#assign produceTaskId_tableNo_defaultValue='${deptJson!}'>
				<#elseif (produceTaskId_tableNo_defaultValue!)?string=="currentComp">
					<#assign produceTaskId_tableNo_defaultValue='${compJson!}'>
				</#if>
				<#assign produceTaskId_tableNo_defaultText=''>
				<produceTaskId.tableNo
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/produceTask/produceTask/maketaskRef.action','dg1543461038761produceTaskId.tableNo','${getText("WOM.viewtitle.randon1490145723075")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','WOM_7.5.0.0_produceTask_maketaskRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (produceTaskId_tableNo_defaultValue)?? &&(produceTaskId_tableNo_defaultValue)?has_content>
							defaultValue='${(produceTaskId_tableNo_defaultValue!)?string}'
						</#if>
						<#if (produceTaskId_tableNo_defaultText)?? &&(produceTaskId_tableNo_defaultText)?has_content>
							defaultText='${(produceTaskId_tableNo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="210">生产指令单</produceTaskId.tableNo>
				<#assign isRef = false >
				<#assign produceTaskId_factoryId_name_defaultValue=''>
												<#assign produceTaskId_factoryId_name_defaultValue=''>
				<#if (produceTaskId_factoryId_name_defaultValue!)?string=="currentUser">
					<#assign produceTaskId_factoryId_name_defaultValue='${staffJson!}'>
				<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentPost">
					<#assign produceTaskId_factoryId_name_defaultValue='${postJson!}'>
				<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentDepart">
					<#assign produceTaskId_factoryId_name_defaultValue='${deptJson!}'>
				<#elseif (produceTaskId_factoryId_name_defaultValue!)?string=="currentComp">
					<#assign produceTaskId_factoryId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign produceTaskId_factoryId_name_defaultText=''>
				<produceTaskId.factoryId.name
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (produceTaskId_factoryId_name_defaultValue)?? &&(produceTaskId_factoryId_name_defaultValue)?has_content>
							defaultValue='${(produceTaskId_factoryId_name_defaultValue!)?string}'
						</#if>
						<#if (produceTaskId_factoryId_name_defaultText)?? &&(produceTaskId_factoryId_name_defaultText)?has_content>
							defaultText='${(produceTaskId_factoryId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">生产线</produceTaskId.factoryId.name>
				<#assign isRef = false >
				<#assign produceTaskId_productId_productName_defaultValue=''>
												<#assign produceTaskId_productId_productName_defaultValue=''>
				<#if (produceTaskId_productId_productName_defaultValue!)?string=="currentUser">
					<#assign produceTaskId_productId_productName_defaultValue='${staffJson!}'>
				<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentPost">
					<#assign produceTaskId_productId_productName_defaultValue='${postJson!}'>
				<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentDepart">
					<#assign produceTaskId_productId_productName_defaultValue='${deptJson!}'>
				<#elseif (produceTaskId_productId_productName_defaultValue!)?string=="currentComp">
					<#assign produceTaskId_productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign produceTaskId_productId_productName_defaultText=''>
				<produceTaskId.productId.productName
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (produceTaskId_productId_productName_defaultValue)?? &&(produceTaskId_productId_productName_defaultValue)?has_content>
							defaultValue='${(produceTaskId_productId_productName_defaultValue!)?string}'
						</#if>
						<#if (produceTaskId_productId_productName_defaultText)?? &&(produceTaskId_productId_productName_defaultText)?has_content>
							defaultText='${(produceTaskId_productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">产品</produceTaskId.productId.productName>
				<#assign isRef = false >
				<#assign batchingId_id_defaultValue=''>
												<#assign batchingId_id_defaultValue=''>
				<#if (batchingId_id_defaultValue!)?string=="currentUser">
					<#assign batchingId_id_defaultValue='${staffJson!}'>
				<#elseif (batchingId_id_defaultValue!)?string=="currentPost">
					<#assign batchingId_id_defaultValue='${postJson!}'>
				<#elseif (batchingId_id_defaultValue!)?string=="currentDepart">
					<#assign batchingId_id_defaultValue='${deptJson!}'>
				<#elseif (batchingId_id_defaultValue!)?string=="currentComp">
					<#assign batchingId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign batchingId_id_defaultText=''>
				<batchingId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterial/batchingMaterial/batMaterialRef.action','dg1543461038761batchingId.id','${getText("WOM.viewtitle.randon1491984336543")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterial_batMaterialRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</batchingId.id>
				<#assign isRef = false >
				<#assign batchingPartId_id_defaultValue=''>
												<#assign batchingPartId_id_defaultValue=''>
				<#if (batchingPartId_id_defaultValue!)?string=="currentUser">
					<#assign batchingPartId_id_defaultValue='${staffJson!}'>
				<#elseif (batchingPartId_id_defaultValue!)?string=="currentPost">
					<#assign batchingPartId_id_defaultValue='${postJson!}'>
				<#elseif (batchingPartId_id_defaultValue!)?string=="currentDepart">
					<#assign batchingPartId_id_defaultValue='${deptJson!}'>
				<#elseif (batchingPartId_id_defaultValue!)?string=="currentComp">
					<#assign batchingPartId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign batchingPartId_id_defaultText=''>
				<batchingPartId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterial/batchingMaterialPart/batPartForProcRef.action','dg1543461038761batchingPartId.id','${getText("WOM.viewtitle.randon1541064596345")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterial_batPartForProcRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</batchingPartId.id>
				<#assign isRef = false >
				<#assign produceTaskId_id_defaultValue=''>
												<#assign produceTaskId_id_defaultValue=''>
				<#if (produceTaskId_id_defaultValue!)?string=="currentUser">
					<#assign produceTaskId_id_defaultValue='${staffJson!}'>
				<#elseif (produceTaskId_id_defaultValue!)?string=="currentPost">
					<#assign produceTaskId_id_defaultValue='${postJson!}'>
				<#elseif (produceTaskId_id_defaultValue!)?string=="currentDepart">
					<#assign produceTaskId_id_defaultValue='${deptJson!}'>
				<#elseif (produceTaskId_id_defaultValue!)?string=="currentComp">
					<#assign produceTaskId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign produceTaskId_id_defaultText=''>
				<produceTaskId.id
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</produceTaskId.id>
				<#assign isRef = false >
				<#assign rejectReceiveStaff_name_defaultValue='currentUser'>
										<#if (rejectReceiveStaff_name_defaultValue!)?string=="currentUser">
					<#assign rejectReceiveStaff_name_defaultValue='${staffJson!}'>
				<#elseif (rejectReceiveStaff_name_defaultValue!)?string=="currentPost">
					<#assign rejectReceiveStaff_name_defaultValue='${postJson!}'>
				<#elseif (rejectReceiveStaff_name_defaultValue!)?string=="currentDepart">
					<#assign rejectReceiveStaff_name_defaultValue='${deptJson!}'>
				<#elseif (rejectReceiveStaff_name_defaultValue!)?string=="currentComp">
					<#assign rejectReceiveStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectReceiveStaff_name_defaultText=''>
				<rejectReceiveStaff.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1543461038761rejectReceiveStaff.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,BatchingRejectParts_dg1543461038761Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (rejectReceiveStaff_name_defaultValue)?? &&(rejectReceiveStaff_name_defaultValue)?has_content>
							defaultValue='${(rejectReceiveStaff_name_defaultValue!)?string}'
						</#if>
						<#if (rejectReceiveStaff_name_defaultText)?? &&(rejectReceiveStaff_name_defaultText)?has_content>
							defaultText='${(rejectReceiveStaff_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">员工姓名</rejectReceiveStaff.name>
				<#assign isRef = false >
				<#assign receiveDate_defaultValue='currentTime'>
						 				<#assign receiveDate_defaultText=''>
					<#if (receiveDate_defaultValue)?? &&(receiveDate_defaultValue)?has_content>
							<#assign receiveDate_defaultValue  = getDefaultDateTime(receiveDate_defaultValue!)?datetime>
					</#if>
				<receiveDate
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (receiveDate_defaultValue)?? &&(receiveDate_defaultValue)?has_content>
							defaultValue='${(receiveDate_defaultValue!)?string}'
						</#if>
						<#if (receiveDate_defaultText)?? &&(receiveDate_defaultText)?has_content>
							defaultText='${(receiveDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">接收时间</receiveDate>
				<#assign isRef = false >
				<#assign tableInfoId_defaultValue=''>
						 						<#assign tableInfoId_defaultValue=''>
				<#assign tableInfoId_defaultText=''>
				<tableInfoId
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">TABLE_INFO_ID</tableInfoId>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingRejectParts", "WOM_7.5.0.0_batchingMaterial_rejectReciveEditdg1543461038761", "DATAGRID", "batchingRejectParts")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(BatchingRejectParts_dg1543461038761Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1543461038761${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',BatchingRejectParts_dg1543461038761Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="BatchingRejectParts_dg1543461038761Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(BatchingRejectParts_dg1543461038761Widget,'BatchingRejectParts_dg1543461038761Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
		<row  onClick="BatchingRejectParts_dg1543461038761Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.rejectProduct.id)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.store.id)!}</c>
					<c>${(row.rejectReasonId.id)!}</c>
					<c>${(row.rejectExeStaff.id)!}</c>
					<c>${(row.produceTaskId.id)!}</c>
					<c>${(row.batchingId.id)!}</c>
					<c>${(row.batchingPartId.id)!}</c>
					<c>${(row.rejectReceiveStaff.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingRejectParts", "WOM_7.5.0.0_batchingMaterial_rejectReciveEditdg1543461038761", "DATAGRID", "batchingRejectParts")>
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
