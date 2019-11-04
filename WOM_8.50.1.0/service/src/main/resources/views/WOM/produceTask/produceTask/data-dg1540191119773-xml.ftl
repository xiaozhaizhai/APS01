<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119773", "DATAGRID", "produceTaskActive")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1540191119773" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<orderProcessId.id IsHiddenField="true"></orderProcessId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<productId.id IsHiddenField="true"></productId.id>
				<activeBatchState.id IsHiddenField="true"></activeBatchState.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign oprate_defaultValue=''>
						 						<#assign oprate_defaultValue=''>
				<#assign oprate_defaultText=''>
				<oprate
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (oprate_defaultValue)?? &&(oprate_defaultValue)?has_content>
							defaultValue='${(oprate_defaultValue!)?string}'
						</#if>
						<#if (oprate_defaultText)?? &&(oprate_defaultText)?has_content>
							defaultText='${(oprate_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="40">操作</oprate>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign activeState_defaultValue='processState/state01'>
						 						<#assign activeState_defaultValue='processState/state01'>
				<#assign activeState_defaultText=''>
				<activeState.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('processState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (activeState_defaultValue)?? &&(activeState_defaultValue)?has_content>
							defaultValue='${(activeState_defaultValue!)?string}'
						</#if>
						<#if (activeState_defaultText)?? &&(activeState_defaultText)?has_content>
							defaultText='${(activeState_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">活动状态</activeState.id>
				<#assign isRef = false >
				<#assign execSort_defaultValue=''>
						 						<#assign execSort_defaultValue=''>
				<#assign execSort_defaultText=''>
				<execSort
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">执行顺序</execSort>
				<#assign isRef = false >
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">活动开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">活动结束时间</endTime>
				<#assign isRef = false >
				<#assign isBackMix_defaultValue=''>
						 						<#assign isBackMix_defaultValue=''>
				<#assign isBackMix_defaultText=''>
				<isBackMix
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isBackMix_defaultValue)?? &&(isBackMix_defaultValue)?has_content>
							defaultValue='${(isBackMix_defaultValue!)?string}'
						</#if>
						<#if (isBackMix_defaultText)?? &&(isBackMix_defaultText)?has_content>
							defaultText='${(isBackMix_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">回掺</isBackMix>
				<#assign isRef = false >
				<#assign activeSource_defaultValue=''>
						 						<#assign activeSource_defaultValue=''>
				<#assign activeSource_defaultText=''>
				<activeSource.id
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (activeSource_defaultValue)?? &&(activeSource_defaultValue)?has_content>
							defaultValue='${(activeSource_defaultValue!)?string}'
						</#if>
						<#if (activeSource_defaultText)?? &&(activeSource_defaultText)?has_content>
							defaultText='${(activeSource_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">活动来源</activeSource.id>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (activeId_fromContainer_defaultValue)?? &&(activeId_fromContainer_defaultValue)?has_content>
							defaultValue='${(activeId_fromContainer_defaultValue!)?string}'
						</#if>
						<#if (activeId_fromContainer_defaultText)?? &&(activeId_fromContainer_defaultText)?has_content>
							defaultText='${(activeId_fromContainer_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">来自容器</activeId.fromContainer.id>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1540191119773productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1540191119773Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign isReplace_defaultValue=''>
						 						<#assign isReplace_defaultValue=''>
				<#assign isReplace_defaultText=''>
				<isReplace
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="60">替代料</isReplace>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="60">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign standardNum_defaultValue=''>
						 						<#assign standardNum_defaultValue=''>
				<#assign standardNum_defaultText=''>
				<standardNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">理论数量</standardNum>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">单位名称</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						 IsHiddenField="true"					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">区间上限</maxQuality>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
				<#assign actualNum_defaultValue=''>
						 						<#assign actualNum_defaultValue=''>
				<#assign actualNum_defaultText=''>
				<actualNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (actualNum_defaultValue)?? &&(actualNum_defaultValue)?has_content>
							defaultValue='${(actualNum_defaultValue!)?string}'
						</#if>
						<#if (actualNum_defaultText)?? &&(actualNum_defaultText)?has_content>
							defaultText='${(actualNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">实际投料量</actualNum>
				<#assign isRef = false >
				<#assign outputNum_defaultValue=''>
						 						<#assign outputNum_defaultValue=''>
				<#assign outputNum_defaultText=''>
				<outputNum
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (outputNum_defaultValue)?? &&(outputNum_defaultValue)?has_content>
							defaultValue='${(outputNum_defaultValue!)?string}'
						</#if>
						<#if (outputNum_defaultText)?? &&(outputNum_defaultText)?has_content>
							defaultText='${(outputNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">产出量</outputNum>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">执行系统</exeSystem.id>
				<#assign isRef = false >
				<#assign mobileTerminal_defaultValue=''>
						 						<#assign mobileTerminal_defaultValue=''>
				<#assign mobileTerminal_defaultText=''>
				<mobileTerminal
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign inspectResult_defaultValue=''>
						 						<#assign inspectResult_defaultValue=''>
				<#assign inspectResult_defaultText=''>
				<inspectResult
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (inspectResult_defaultValue)?? &&(inspectResult_defaultValue)?has_content>
							defaultValue='${(inspectResult_defaultValue!)?string}'
						</#if>
						<#if (inspectResult_defaultText)?? &&(inspectResult_defaultText)?has_content>
							defaultText='${(inspectResult_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">检验结论</inspectResult>
				<#assign isRef = false >
				<#assign activeBatchState_name_defaultValue=''>
												<#assign activeBatchState_name_defaultValue=''>
				<#if (activeBatchState_name_defaultValue!)?string=="currentUser">
					<#assign activeBatchState_name_defaultValue='${staffJson!}'>
				<#elseif (activeBatchState_name_defaultValue!)?string=="currentPost">
					<#assign activeBatchState_name_defaultValue='${postJson!}'>
				<#elseif (activeBatchState_name_defaultValue!)?string=="currentDepart">
					<#assign activeBatchState_name_defaultValue='${deptJson!}'>
				<#elseif (activeBatchState_name_defaultValue!)?string=="currentComp">
					<#assign activeBatchState_name_defaultValue='${compJson!}'>
				</#if>
				<#assign activeBatchState_name_defaultText=''>
				<activeBatchState.name
						showFormatFunc="deal_adjust" 
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/publicSet/activeAndBatchState/actBatState/activeBatchStateRef.action','dg1540191119773activeBatchState.name','${getText("publicSet.viewtitle.randon1509430526337")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1540191119773Widget,null,false,false,'','publicSet_1.0_activeAndBatchState_activeBatchStateRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeBatchState_name_defaultValue)?? &&(activeBatchState_name_defaultValue)?has_content>
							defaultValue='${(activeBatchState_name_defaultValue!)?string}'
						</#if>
						<#if (activeBatchState_name_defaultText)?? &&(activeBatchState_name_defaultText)?has_content>
							defaultText='${(activeBatchState_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="60">活动状态</activeBatchState.name>
				<#assign isRef = false >
				<#assign rejectsDeal_defaultValue=''>
						 						<#assign rejectsDeal_defaultValue=''>
				<#assign rejectsDeal_defaultText=''>
				<rejectsDeal
						showFormatFunc="deal_checkInfo" 
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (rejectsDeal_defaultValue)?? &&(rejectsDeal_defaultValue)?has_content>
							defaultValue='${(rejectsDeal_defaultValue!)?string}'
						</#if>
						<#if (rejectsDeal_defaultText)?? &&(rejectsDeal_defaultText)?has_content>
							defaultText='${(rejectsDeal_defaultText!)?string}'
						</#if>
						
					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="80">不良品处理单</rejectsDeal>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeId_pickSite_name_defaultValue)?? &&(activeId_pickSite_name_defaultValue)?has_content>
							defaultValue='${(activeId_pickSite_name_defaultValue!)?string}'
						</#if>
						<#if (activeId_pickSite_name_defaultText)?? &&(activeId_pickSite_name_defaultText)?has_content>
							defaultText='${(activeId_pickSite_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">采样点</activeId.pickSite.name>
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
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
					width="60">完工检验</activeId.finalInspection>
				<#assign isRef = false >
				<#assign activeId_isAnaly_defaultValue=''>
												<#assign activeId_isAnaly_defaultValue=''>
				<#if (activeId_isAnaly_defaultValue!)?string=="currentUser">
					<#assign activeId_isAnaly_defaultValue='${staffJson!}'>
				<#elseif (activeId_isAnaly_defaultValue!)?string=="currentPost">
					<#assign activeId_isAnaly_defaultValue='${postJson!}'>
				<#elseif (activeId_isAnaly_defaultValue!)?string=="currentDepart">
					<#assign activeId_isAnaly_defaultValue='${deptJson!}'>
				<#elseif (activeId_isAnaly_defaultValue!)?string=="currentComp">
					<#assign activeId_isAnaly_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_isAnaly_defaultText=''>
				<activeId.isAnaly
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (activeId_isAnaly_defaultValue)?? &&(activeId_isAnaly_defaultValue)?has_content>
							defaultValue='${(activeId_isAnaly_defaultValue!)?string}'
						</#if>
						<#if (activeId_isAnaly_defaultText)?? &&(activeId_isAnaly_defaultText)?has_content>
							defaultText='${(activeId_isAnaly_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">统计标识</activeId.isAnaly>
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119773", "DATAGRID", "produceTaskActive")>
				<#list customPropViewMappings as cpvm>
					<#assign cpvmReadOnly = true>
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
							onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1540191119773Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1540191119773${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',ProduceTaskActive_dg1540191119773Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="true"
						onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(ProduceTaskActive_dg1540191119773Widget,'ProduceTaskActive_dg1540191119773Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign isRef = false >
				<#assign parentActive_defaultValue=''>
						 						<#assign parentActive_defaultValue=''>
				<#assign parentActive_defaultText=''>
				<parentActive
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						 IsHiddenField="true"					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">父活动</parentActive>
				<#assign isRef = false >
				<#assign parentActiveId_defaultValue=''>
						 						<#assign parentActiveId_defaultValue=''>
				<#assign parentActiveId_defaultText=''>
				<parentActiveId
					sort="true"  onPropertyChange="ProduceTaskActive_dg1540191119773Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">父活动ID</parentActiveId>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.orderProcessId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.activeBatchState.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_makeTaskOperaViewdg1540191119773", "DATAGRID", "produceTaskActive")>
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
