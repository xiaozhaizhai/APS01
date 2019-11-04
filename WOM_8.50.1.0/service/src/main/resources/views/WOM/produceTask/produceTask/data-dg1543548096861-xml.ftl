<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1543548096861" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<taskActiExelog.id IsHiddenField="true"></taskActiExelog.id>
				<good.id IsHiddenField="true"></good.id>
				<wareID.id IsHiddenField="true"></wareID.id>
				<placeSet.id IsHiddenField="true"></placeSet.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign taskActiExelog_taskProcessID_name_defaultValue=''>
												<#assign taskActiExelog_taskProcessID_name_defaultValue=''>
				<#if (taskActiExelog_taskProcessID_name_defaultValue!)?string=="currentUser">
					<#assign taskActiExelog_taskProcessID_name_defaultValue='${staffJson!}'>
				<#elseif (taskActiExelog_taskProcessID_name_defaultValue!)?string=="currentPost">
					<#assign taskActiExelog_taskProcessID_name_defaultValue='${postJson!}'>
				<#elseif (taskActiExelog_taskProcessID_name_defaultValue!)?string=="currentDepart">
					<#assign taskActiExelog_taskProcessID_name_defaultValue='${deptJson!}'>
				<#elseif (taskActiExelog_taskProcessID_name_defaultValue!)?string=="currentComp">
					<#assign taskActiExelog_taskProcessID_name_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiExelog_taskProcessID_name_defaultText=''>
				<taskActiExelog.taskProcessID.name
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskActiExelog_taskProcessID_name_defaultValue)?? &&(taskActiExelog_taskProcessID_name_defaultValue)?has_content>
							defaultValue='${(taskActiExelog_taskProcessID_name_defaultValue!)?string}'
						</#if>
						<#if (taskActiExelog_taskProcessID_name_defaultText)?? &&(taskActiExelog_taskProcessID_name_defaultText)?has_content>
							defaultText='${(taskActiExelog_taskProcessID_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序名称</taskActiExelog.taskProcessID.name>
				<#assign isRef = false >
				<#assign taskActiExelog_activeName_defaultValue=''>
												<#assign taskActiExelog_activeName_defaultValue=''>
				<#if (taskActiExelog_activeName_defaultValue!)?string=="currentUser">
					<#assign taskActiExelog_activeName_defaultValue='${staffJson!}'>
				<#elseif (taskActiExelog_activeName_defaultValue!)?string=="currentPost">
					<#assign taskActiExelog_activeName_defaultValue='${postJson!}'>
				<#elseif (taskActiExelog_activeName_defaultValue!)?string=="currentDepart">
					<#assign taskActiExelog_activeName_defaultValue='${deptJson!}'>
				<#elseif (taskActiExelog_activeName_defaultValue!)?string=="currentComp">
					<#assign taskActiExelog_activeName_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiExelog_activeName_defaultText=''>
				<taskActiExelog.activeName
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (taskActiExelog_activeName_defaultValue)?? &&(taskActiExelog_activeName_defaultValue)?has_content>
							defaultValue='${(taskActiExelog_activeName_defaultValue!)?string}'
						</#if>
						<#if (taskActiExelog_activeName_defaultText)?? &&(taskActiExelog_activeName_defaultText)?has_content>
							defaultText='${(taskActiExelog_activeName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">活动名称</taskActiExelog.activeName>
				<#assign isRef = false >
				<#assign taskActiExelog_activeType_defaultValue=''>
												<#assign taskActiExelog_activeType_defaultValue=''>
				<#if (taskActiExelog_activeType_defaultValue!)?string=="currentUser">
					<#assign taskActiExelog_activeType_defaultValue='${staffJson!}'>
				<#elseif (taskActiExelog_activeType_defaultValue!)?string=="currentPost">
					<#assign taskActiExelog_activeType_defaultValue='${postJson!}'>
				<#elseif (taskActiExelog_activeType_defaultValue!)?string=="currentDepart">
					<#assign taskActiExelog_activeType_defaultValue='${deptJson!}'>
				<#elseif (taskActiExelog_activeType_defaultValue!)?string=="currentComp">
					<#assign taskActiExelog_activeType_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiExelog_activeType_defaultText=''>
				<taskActiExelog.activeType.id
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (taskActiExelog_activeType_defaultValue)?? &&(taskActiExelog_activeType_defaultValue)?has_content>
							defaultValue='${(taskActiExelog_activeType_defaultValue!)?string}'
						</#if>
						<#if (taskActiExelog_activeType_defaultText)?? &&(taskActiExelog_activeType_defaultText)?has_content>
							defaultText='${(taskActiExelog_activeType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</taskActiExelog.activeType.id>
				<#assign isRef = false >
				<#assign taskActiExelog_activeSource_defaultValue=''>
												<#assign taskActiExelog_activeSource_defaultValue=''>
				<#if (taskActiExelog_activeSource_defaultValue!)?string=="currentUser">
					<#assign taskActiExelog_activeSource_defaultValue='${staffJson!}'>
				<#elseif (taskActiExelog_activeSource_defaultValue!)?string=="currentPost">
					<#assign taskActiExelog_activeSource_defaultValue='${postJson!}'>
				<#elseif (taskActiExelog_activeSource_defaultValue!)?string=="currentDepart">
					<#assign taskActiExelog_activeSource_defaultValue='${deptJson!}'>
				<#elseif (taskActiExelog_activeSource_defaultValue!)?string=="currentComp">
					<#assign taskActiExelog_activeSource_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiExelog_activeSource_defaultText=''>
				<taskActiExelog.activeSource.id
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('womActiveSource')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (taskActiExelog_activeSource_defaultValue)?? &&(taskActiExelog_activeSource_defaultValue)?has_content>
							defaultValue='${(taskActiExelog_activeSource_defaultValue!)?string}'
						</#if>
						<#if (taskActiExelog_activeSource_defaultText)?? &&(taskActiExelog_activeSource_defaultText)?has_content>
							defaultText='${(taskActiExelog_activeSource_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动来源</taskActiExelog.activeSource.id>
				<#assign isRef = false >
				<#assign taskActiExelog_dataSource_defaultValue=''>
												<#assign taskActiExelog_dataSource_defaultValue=''>
				<#if (taskActiExelog_dataSource_defaultValue!)?string=="currentUser">
					<#assign taskActiExelog_dataSource_defaultValue='${staffJson!}'>
				<#elseif (taskActiExelog_dataSource_defaultValue!)?string=="currentPost">
					<#assign taskActiExelog_dataSource_defaultValue='${postJson!}'>
				<#elseif (taskActiExelog_dataSource_defaultValue!)?string=="currentDepart">
					<#assign taskActiExelog_dataSource_defaultValue='${deptJson!}'>
				<#elseif (taskActiExelog_dataSource_defaultValue!)?string=="currentComp">
					<#assign taskActiExelog_dataSource_defaultValue='${compJson!}'>
				</#if>
				<#assign taskActiExelog_dataSource_defaultText=''>
				<taskActiExelog.dataSource.id
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (taskActiExelog_dataSource_defaultValue)?? &&(taskActiExelog_dataSource_defaultValue)?has_content>
							defaultValue='${(taskActiExelog_dataSource_defaultValue!)?string}'
						</#if>
						<#if (taskActiExelog_dataSource_defaultText)?? &&(taskActiExelog_dataSource_defaultText)?has_content>
							defaultText='${(taskActiExelog_dataSource_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">数据来源</taskActiExelog.dataSource.id>
				<#assign isRef = false >
				<#assign good_productCode_defaultValue=''>
												<#assign good_productCode_defaultValue=''>
				<#if (good_productCode_defaultValue!)?string=="currentUser">
					<#assign good_productCode_defaultValue='${staffJson!}'>
				<#elseif (good_productCode_defaultValue!)?string=="currentPost">
					<#assign good_productCode_defaultValue='${postJson!}'>
				<#elseif (good_productCode_defaultValue!)?string=="currentDepart">
					<#assign good_productCode_defaultValue='${deptJson!}'>
				<#elseif (good_productCode_defaultValue!)?string=="currentComp">
					<#assign good_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign good_productCode_defaultText=''>
				<good.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1543548096861good.productCode','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,BatchChargeDetails_dg1543548096861Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (good_productCode_defaultValue)?? &&(good_productCode_defaultValue)?has_content>
							defaultValue='${(good_productCode_defaultValue!)?string}'
						</#if>
						<#if (good_productCode_defaultText)?? &&(good_productCode_defaultText)?has_content>
							defaultText='${(good_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</good.productCode>
				<#assign isRef = false >
				<#assign good_productName_defaultValue=''>
												<#assign good_productName_defaultValue=''>
				<#if (good_productName_defaultValue!)?string=="currentUser">
					<#assign good_productName_defaultValue='${staffJson!}'>
				<#elseif (good_productName_defaultValue!)?string=="currentPost">
					<#assign good_productName_defaultValue='${postJson!}'>
				<#elseif (good_productName_defaultValue!)?string=="currentDepart">
					<#assign good_productName_defaultValue='${deptJson!}'>
				<#elseif (good_productName_defaultValue!)?string=="currentComp">
					<#assign good_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign good_productName_defaultText=''>
				<good.productName
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (good_productName_defaultValue)?? &&(good_productName_defaultValue)?has_content>
							defaultValue='${(good_productName_defaultValue!)?string}'
						</#if>
						<#if (good_productName_defaultText)?? &&(good_productName_defaultText)?has_content>
							defaultText='${(good_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</good.productName>
				<#assign isRef = false >
				<#assign batch_defaultValue=''>
						 						<#assign batch_defaultValue=''>
				<#assign batch_defaultText=''>
				<batch
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (batch_defaultValue)?? &&(batch_defaultValue)?has_content>
							defaultValue='${(batch_defaultValue!)?string}'
						</#if>
						<#if (batch_defaultText)?? &&(batch_defaultText)?has_content>
							defaultText='${(batch_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批号</batch>
				<#assign isRef = false >
				<#assign actualUseNum_defaultValue=''>
						 						<#assign actualUseNum_defaultValue=''>
				<#assign actualUseNum_defaultText=''>
				<actualUseNum
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (actualUseNum_defaultValue)?? &&(actualUseNum_defaultValue)?has_content>
							defaultValue='${(actualUseNum_defaultValue!)?string}'
						</#if>
						<#if (actualUseNum_defaultText)?? &&(actualUseNum_defaultText)?has_content>
							defaultText='${(actualUseNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">用料量</actualUseNum>
				<#assign isRef = false >
				<#assign good_productBaseUnit_name_defaultValue=''>
												<#assign good_productBaseUnit_name_defaultValue=''>
				<#if (good_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign good_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign good_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign good_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign good_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign good_productBaseUnit_name_defaultText=''>
				<good.productBaseUnit.name
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (good_productBaseUnit_name_defaultValue)?? &&(good_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(good_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (good_productBaseUnit_name_defaultText)?? &&(good_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(good_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位名称</good.productBaseUnit.name>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1543548096861wareID.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,BatchChargeDetails_dg1543548096861Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign placeSet_placeSetCode_defaultValue=''>
												<#assign placeSet_placeSetCode_defaultValue=''>
				<#if (placeSet_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign placeSet_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (placeSet_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign placeSet_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (placeSet_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign placeSet_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (placeSet_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign placeSet_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign placeSet_placeSetCode_defaultText=''>
				<placeSet.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchChargeDetails_dg1543548096861Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/pubStoreRef.action','dg1543548096861placeSet.placeSetCode','${getText("MESBasic.viewtitle.randon1514434358343")}',sPTGridID,nRow,sFieldName,BatchChargeDetails_dg1543548096861Widget,null,false,false,'','MESBasic_1_storeSet_pubStoreRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (placeSet_placeSetCode_defaultValue)?? &&(placeSet_placeSetCode_defaultValue)?has_content>
							defaultValue='${(placeSet_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (placeSet_placeSetCode_defaultText)?? &&(placeSet_placeSetCode_defaultText)?has_content>
							defaultText='${(placeSet_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</placeSet.placeSetCode>
				<#assign isRef = false >
				<#assign placeSet_placeSetName_defaultValue=''>
												<#assign placeSet_placeSetName_defaultValue=''>
				<#if (placeSet_placeSetName_defaultValue!)?string=="currentUser">
					<#assign placeSet_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (placeSet_placeSetName_defaultValue!)?string=="currentPost">
					<#assign placeSet_placeSetName_defaultValue='${postJson!}'>
				<#elseif (placeSet_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign placeSet_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (placeSet_placeSetName_defaultValue!)?string=="currentComp">
					<#assign placeSet_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign placeSet_placeSetName_defaultText=''>
				<placeSet.placeSetName
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (placeSet_placeSetName_defaultValue)?? &&(placeSet_placeSetName_defaultValue)?has_content>
							defaultValue='${(placeSet_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (placeSet_placeSetName_defaultText)?? &&(placeSet_placeSetName_defaultText)?has_content>
							defaultText='${(placeSet_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位名称</placeSet.placeSetName>
				<#assign isRef = false >
				<#assign putinDate_defaultValue=''>
						 						<#assign putinDate_defaultValue=''>
				<#assign putinDate_defaultText=''>
					<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
							<#assign putinDate_defaultValue  = getDefaultDateTime(putinDate_defaultValue!)?datetime>
					</#if>
				<putinDate
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchChargeDetails_dg1543548096861Widget,'BatchChargeDetails_dg1543548096861Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchChargeDetails_dg1543548096861Widget,'BatchChargeDetails_dg1543548096861Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
							defaultValue='${(putinDate_defaultValue!)?string}'
						</#if>
						<#if (putinDate_defaultText)?? &&(putinDate_defaultText)?has_content>
							defaultText='${(putinDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">投料时间</putinDate>
				<#assign isRef = false >
				<#assign putinEndDate_defaultValue=''>
						 						<#assign putinEndDate_defaultValue=''>
				<#assign putinEndDate_defaultText=''>
					<#if (putinEndDate_defaultValue)?? &&(putinEndDate_defaultValue)?has_content>
							<#assign putinEndDate_defaultValue  = getDefaultDateTime(putinEndDate_defaultValue!)?datetime>
					</#if>
				<putinEndDate
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchChargeDetails_dg1543548096861Widget,'BatchChargeDetails_dg1543548096861Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(BatchChargeDetails_dg1543548096861Widget,'BatchChargeDetails_dg1543548096861Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (putinEndDate_defaultValue)?? &&(putinEndDate_defaultValue)?has_content>
							defaultValue='${(putinEndDate_defaultValue!)?string}'
						</#if>
						<#if (putinEndDate_defaultText)?? &&(putinEndDate_defaultText)?has_content>
							defaultText='${(putinEndDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">投料结束时间</putinEndDate>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="BatchChargeDetails_dg1543548096861Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					<c>${(row.taskActiExelog.id)!}</c>
					<c>${(row.good.id)!}</c>
					<c>${(row.wareID.id)!}</c>
					<c>${(row.placeSet.id)!}</c>
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
