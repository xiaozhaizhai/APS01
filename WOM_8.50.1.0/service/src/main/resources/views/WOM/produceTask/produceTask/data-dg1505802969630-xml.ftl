<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1505802969630" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<batchNumObj.id IsHiddenField="true"></batchNumObj.id>
				<orderProcessId.id IsHiddenField="true"></orderProcessId.id>
				<activeId.id IsHiddenField="true"></activeId.id>
				<formulaId.id IsHiddenField="true"></formulaId.id>
				<processId.id IsHiddenField="true"></processId.id>
				<putBatMateId.id IsHiddenField="true"></putBatMateId.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout.action','dg1505802969630productId.productCode','${getText("MESBasic.viewtitle.randon1450085069587")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505802969630Widget,'clearBatchNum()',false,false,'','MESBasic_1_product_refProductLayout')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物料编码</productId.productCode>
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
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
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
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign activeType_defaultValue='activeType/activeType3'>
						 				<#assign activeType_defaultText=''>
				<activeType.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</activeType.id>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">性质</property.id>
				<#assign isRef = false >
				<#assign standardNum_defaultValue=''>
						 						<#assign standardNum_defaultValue=''>
				<#assign standardNum_defaultText=''>
				<standardNum
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">理论数量</standardNum>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="60">计划数量</planNum>
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
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="60">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign phase_defaultValue=''>
						 						<#assign phase_defaultValue=''>
				<#assign phase_defaultText=''>
				<phase
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (phase_defaultValue)?? &&(phase_defaultValue)?has_content>
							defaultValue='${(phase_defaultValue!)?string}'
						</#if>
						<#if (phase_defaultText)?? &&(phase_defaultText)?has_content>
							defaultText='${(phase_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="60">阶段</phase>
				<#assign isRef = false >
				<#assign sequence_defaultValue=''>
						 						<#assign sequence_defaultValue=''>
				<#assign sequence_defaultText=''>
				<sequence
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (sequence_defaultValue)?? &&(sequence_defaultValue)?has_content>
							defaultValue='${(sequence_defaultValue!)?string}'
						</#if>
						<#if (sequence_defaultText)?? &&(sequence_defaultText)?has_content>
							defaultText='${(sequence_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="60">次序</sequence>
				<#assign isRef = false >
				<#assign needWeigh_defaultValue=''>
						 						<#assign needWeigh_defaultValue=''>
				<#assign needWeigh_defaultText=''>
				<needWeigh
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (needWeigh_defaultValue)?? &&(needWeigh_defaultValue)?has_content>
							defaultValue='${(needWeigh_defaultValue!)?string}'
						</#if>
						<#if (needWeigh_defaultText)?? &&(needWeigh_defaultText)?has_content>
							defaultText='${(needWeigh_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">需要称重</needWeigh>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action','dg1505802969630batchNumObj.batchText','${getText("WOM.viewtitle.randon1503994294075")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505802969630Widget,null,false,false,'','WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchNumObj_batchText_defaultValue)?? &&(batchNumObj_batchText_defaultValue)?has_content>
							defaultValue='${(batchNumObj_batchText_defaultValue!)?string}'
						</#if>
						<#if (batchNumObj_batchText_defaultText)?? &&(batchNumObj_batchText_defaultText)?has_content>
							defaultText='${(batchNumObj_batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料批号</batchNumObj.batchText>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="80">区间上限</maxQuality>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="200">备注</remark>
				<#assign isRef = false >
				<#assign batchNumObj_id_defaultValue=''>
												<#assign batchNumObj_id_defaultValue=''>
				<#if (batchNumObj_id_defaultValue!)?string=="currentUser">
					<#assign batchNumObj_id_defaultValue='${staffJson!}'>
				<#elseif (batchNumObj_id_defaultValue!)?string=="currentPost">
					<#assign batchNumObj_id_defaultValue='${postJson!}'>
				<#elseif (batchNumObj_id_defaultValue!)?string=="currentDepart">
					<#assign batchNumObj_id_defaultValue='${deptJson!}'>
				<#elseif (batchNumObj_id_defaultValue!)?string=="currentComp">
					<#assign batchNumObj_id_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNumObj_id_defaultText=''>
				<batchNumObj.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</batchNumObj.id>
				<#assign isRef = false >
				<#assign orderProcessId_id_defaultValue=''>
												<#assign orderProcessId_id_defaultValue=''>
				<#if (orderProcessId_id_defaultValue!)?string=="currentUser">
					<#assign orderProcessId_id_defaultValue='${staffJson!}'>
				<#elseif (orderProcessId_id_defaultValue!)?string=="currentPost">
					<#assign orderProcessId_id_defaultValue='${postJson!}'>
				<#elseif (orderProcessId_id_defaultValue!)?string=="currentDepart">
					<#assign orderProcessId_id_defaultValue='${deptJson!}'>
				<#elseif (orderProcessId_id_defaultValue!)?string=="currentComp">
					<#assign orderProcessId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign orderProcessId_id_defaultText=''>
				<orderProcessId.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</orderProcessId.id>
				<#assign isRef = false >
				<#assign activeId_id_defaultValue=''>
												<#assign activeId_id_defaultValue=''>
				<#if (activeId_id_defaultValue!)?string=="currentUser">
					<#assign activeId_id_defaultValue='${staffJson!}'>
				<#elseif (activeId_id_defaultValue!)?string=="currentPost">
					<#assign activeId_id_defaultValue='${postJson!}'>
				<#elseif (activeId_id_defaultValue!)?string=="currentDepart">
					<#assign activeId_id_defaultValue='${deptJson!}'>
				<#elseif (activeId_id_defaultValue!)?string=="currentComp">
					<#assign activeId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign activeId_id_defaultText=''>
				<activeId.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</activeId.id>
				<#assign isRef = false >
				<#assign formulaId_id_defaultValue=''>
												<#assign formulaId_id_defaultValue=''>
				<#if (formulaId_id_defaultValue!)?string=="currentUser">
					<#assign formulaId_id_defaultValue='${staffJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentPost">
					<#assign formulaId_id_defaultValue='${postJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentDepart">
					<#assign formulaId_id_defaultValue='${deptJson!}'>
				<#elseif (formulaId_id_defaultValue!)?string=="currentComp">
					<#assign formulaId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formulaId_id_defaultText=''>
				<formulaId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formula/formulaTaskRef.action','dg1505802969630formulaId.id','${getText("RM.viewtitle.randon1498047455529")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505802969630Widget,null,false,false,'','RM_7.5.0.0_formula_formulaTaskRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</formulaId.id>
				<#assign isRef = false >
				<#assign processId_id_defaultValue=''>
												<#assign processId_id_defaultValue=''>
				<#if (processId_id_defaultValue!)?string=="currentUser">
					<#assign processId_id_defaultValue='${staffJson!}'>
				<#elseif (processId_id_defaultValue!)?string=="currentPost">
					<#assign processId_id_defaultValue='${postJson!}'>
				<#elseif (processId_id_defaultValue!)?string=="currentDepart">
					<#assign processId_id_defaultValue='${deptJson!}'>
				<#elseif (processId_id_defaultValue!)?string=="currentComp">
					<#assign processId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign processId_id_defaultText=''>
				<processId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processReference.action','dg1505802969630processId.id','${getText("RM.viewtitle.randon1488596828660")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505802969630Widget,null,false,false,'','RM_7.5.0.0_formula_processReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</processId.id>
				<#assign isRef = false >
				<#assign putBatMateId_id_defaultValue=''>
												<#assign putBatMateId_id_defaultValue=''>
				<#if (putBatMateId_id_defaultValue!)?string=="currentUser">
					<#assign putBatMateId_id_defaultValue='${staffJson!}'>
				<#elseif (putBatMateId_id_defaultValue!)?string=="currentPost">
					<#assign putBatMateId_id_defaultValue='${postJson!}'>
				<#elseif (putBatMateId_id_defaultValue!)?string=="currentDepart">
					<#assign putBatMateId_id_defaultValue='${deptJson!}'>
				<#elseif (putBatMateId_id_defaultValue!)?string=="currentComp">
					<#assign putBatMateId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign putBatMateId_id_defaultText=''>
				<putBatMateId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505802969630Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcessActive/activeCheckRef.action','dg1505802969630putBatMateId.id','${getText("RM.viewtitle.randon1497922173328")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505802969630Widget,null,false,false,'','RM_7.5.0.0_formula_activeCheckRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505802969630Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</putBatMateId.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceTaskActive_dg1505802969630Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.batchNumObj.id)!}</c>
					<c>${(row.orderProcessId.id)!}</c>
					<c>${(row.activeId.id)!}</c>
					<c>${(row.formulaId.id)!}</c>
					<c>${(row.processId.id)!}</c>
					<c>${(row.putBatMateId.id)!}</c>
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
