<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1543392450482" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<rejectProduct.id IsHiddenField="true"></rejectProduct.id>
				<rejectReasonId.id IsHiddenField="true"></rejectReasonId.id>
				<ware.id IsHiddenField="true"></ware.id>
				<store.id IsHiddenField="true"></store.id>
				<produceTaskId.id IsHiddenField="true"></produceTaskId.id>
				<batchingPartId.id IsHiddenField="true"></batchingPartId.id>
				<rejectExeStaff.id IsHiddenField="true"></rejectExeStaff.id>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
				<#assign rejectNum_defaultValue=''>
						 						<#assign rejectNum_defaultValue=''>
				<#assign rejectNum_defaultText=''>
				<rejectNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
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
						style="font-color:0303B3"
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign rejectReasonId_isChangeNeed_defaultValue=''>
												<#assign rejectReasonId_isChangeNeed_defaultValue=''>
				<#if (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentUser">
					<#assign rejectReasonId_isChangeNeed_defaultValue='${staffJson!}'>
				<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentPost">
					<#assign rejectReasonId_isChangeNeed_defaultValue='${postJson!}'>
				<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentDepart">
					<#assign rejectReasonId_isChangeNeed_defaultValue='${deptJson!}'>
				<#elseif (rejectReasonId_isChangeNeed_defaultValue!)?string=="currentComp">
					<#assign rejectReasonId_isChangeNeed_defaultValue='${compJson!}'>
				</#if>
				<#assign rejectReasonId_isChangeNeed_defaultText=''>
				<rejectReasonId.isChangeNeed
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (rejectReasonId_isChangeNeed_defaultValue)?? &&(rejectReasonId_isChangeNeed_defaultValue)?has_content>
							defaultValue='${(rejectReasonId_isChangeNeed_defaultValue!)?string}'
						</#if>
						<#if (rejectReasonId_isChangeNeed_defaultText)?? &&(rejectReasonId_isChangeNeed_defaultText)?has_content>
							defaultText='${(rejectReasonId_isChangeNeed_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="130">是否修改配料需求状态</rejectReasonId.isChangeNeed>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareCode_defaultValue)?? &&(ware_wareCode_defaultValue)?has_content>
							defaultValue='${(ware_wareCode_defaultValue!)?string}'
						</#if>
						<#if (ware_wareCode_defaultText)?? &&(ware_wareCode_defaultText)?has_content>
							defaultText='${(ware_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</ware.wareCode>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareName_defaultValue)?? &&(ware_wareName_defaultValue)?has_content>
							defaultValue='${(ware_wareName_defaultValue!)?string}'
						</#if>
						<#if (ware_wareName_defaultText)?? &&(ware_wareName_defaultText)?has_content>
							defaultText='${(ware_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</ware.wareName>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (store_placeSetCode_defaultValue)?? &&(store_placeSetCode_defaultValue)?has_content>
							defaultValue='${(store_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetCode_defaultText)?? &&(store_placeSetCode_defaultText)?has_content>
							defaultText='${(store_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</store.placeSetCode>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (store_placeSetName_defaultValue)?? &&(store_placeSetName_defaultValue)?has_content>
							defaultValue='${(store_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetName_defaultText)?? &&(store_placeSetName_defaultText)?has_content>
							defaultText='${(store_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位名称</store.placeSetName>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign batchingPartId_state_defaultValue=''>
												<#assign batchingPartId_state_defaultValue=''>
				<#if (batchingPartId_state_defaultValue!)?string=="currentUser">
					<#assign batchingPartId_state_defaultValue='${staffJson!}'>
				<#elseif (batchingPartId_state_defaultValue!)?string=="currentPost">
					<#assign batchingPartId_state_defaultValue='${postJson!}'>
				<#elseif (batchingPartId_state_defaultValue!)?string=="currentDepart">
					<#assign batchingPartId_state_defaultValue='${deptJson!}'>
				<#elseif (batchingPartId_state_defaultValue!)?string=="currentComp">
					<#assign batchingPartId_state_defaultValue='${compJson!}'>
				</#if>
				<#assign batchingPartId_state_defaultText=''>
				<batchingPartId.state.id
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (batchingPartId_state_defaultValue)?? &&(batchingPartId_state_defaultValue)?has_content>
							defaultValue='${(batchingPartId_state_defaultValue!)?string}'
						</#if>
						<#if (batchingPartId_state_defaultText)?? &&(batchingPartId_state_defaultText)?has_content>
							defaultText='${(batchingPartId_state_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">状态</batchingPartId.state.id>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</produceTaskId.id>
				<#assign isRef = false >
				<#assign rejectExeStaff_name_defaultValue='currentUser'>
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
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">员工姓名</rejectExeStaff.name>
				<#assign isRef = false >
				<#assign rejectTime_defaultValue=''>
						 						<#assign rejectTime_defaultValue=''>
				<#assign rejectTime_defaultText=''>
					<#if (rejectTime_defaultValue)?? &&(rejectTime_defaultValue)?has_content>
							<#assign rejectTime_defaultValue  = getDefaultDateTime(rejectTime_defaultValue!)?datetime>
					</#if>
				<rejectTime
					sort="false"  onPropertyChange="BatchingRejectParts_dg1543392450482Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchingRejectParts_dg1543392450482Widget,'BatchingRejectParts_dg1543392450482Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchingRejectParts_dg1543392450482Widget,'BatchingRejectParts_dg1543392450482Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">退料时间</rejectTime>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="BatchingRejectParts_dg1543392450482Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.rejectProduct.id)!}</c>
					<c>${(row.rejectReasonId.id)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.store.id)!}</c>
					<c>${(row.produceTaskId.id)!}</c>
					<c>${(row.batchingPartId.id)!}</c>
					<c>${(row.rejectExeStaff.id)!}</c>
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
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
