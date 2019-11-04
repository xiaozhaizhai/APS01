<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1542101192438" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<activeDealID.id IsHiddenField="true"></activeDealID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign activeDealID_activeName_defaultValue=''>
												<#assign activeDealID_activeName_defaultValue=''>
				<#if (activeDealID_activeName_defaultValue!)?string=="currentUser">
					<#assign activeDealID_activeName_defaultValue='${staffJson!}'>
				<#elseif (activeDealID_activeName_defaultValue!)?string=="currentPost">
					<#assign activeDealID_activeName_defaultValue='${postJson!}'>
				<#elseif (activeDealID_activeName_defaultValue!)?string=="currentDepart">
					<#assign activeDealID_activeName_defaultValue='${deptJson!}'>
				<#elseif (activeDealID_activeName_defaultValue!)?string=="currentComp">
					<#assign activeDealID_activeName_defaultValue='${compJson!}'>
				</#if>
				<#assign activeDealID_activeName_defaultText=''>
				<activeDealID.activeName
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeDealID_activeName_defaultValue)?? &&(activeDealID_activeName_defaultValue)?has_content>
							defaultValue='${(activeDealID_activeName_defaultValue!)?string}'
						</#if>
						<#if (activeDealID_activeName_defaultText)?? &&(activeDealID_activeName_defaultText)?has_content>
							defaultText='${(activeDealID_activeName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动名称</activeDealID.activeName>
				<#assign isRef = false >
				<#assign activeDealID_activeType_defaultValue=''>
												<#assign activeDealID_activeType_defaultValue=''>
				<#if (activeDealID_activeType_defaultValue!)?string=="currentUser">
					<#assign activeDealID_activeType_defaultValue='${staffJson!}'>
				<#elseif (activeDealID_activeType_defaultValue!)?string=="currentPost">
					<#assign activeDealID_activeType_defaultValue='${postJson!}'>
				<#elseif (activeDealID_activeType_defaultValue!)?string=="currentDepart">
					<#assign activeDealID_activeType_defaultValue='${deptJson!}'>
				<#elseif (activeDealID_activeType_defaultValue!)?string=="currentComp">
					<#assign activeDealID_activeType_defaultValue='${compJson!}'>
				</#if>
				<#assign activeDealID_activeType_defaultText=''>
				<activeDealID.activeType.id
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
						
						
						
						
						<#if (activeDealID_activeType_defaultValue)?? &&(activeDealID_activeType_defaultValue)?has_content>
							defaultValue='${(activeDealID_activeType_defaultValue!)?string}'
						</#if>
						<#if (activeDealID_activeType_defaultText)?? &&(activeDealID_activeType_defaultText)?has_content>
							defaultText='${(activeDealID_activeType_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">活动类型</activeDealID.activeType.id>
				<#assign isRef = false >
				<#assign activeState_defaultValue=''>
						 						<#assign activeState_defaultValue=''>
				<#assign activeState_defaultText=''>
				<activeState.id
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">活动执行状态</activeState.id>
				<#assign isRef = false >
				<#assign activeDealID_product_productCode_defaultValue=''>
												<#assign activeDealID_product_productCode_defaultValue=''>
				<#if (activeDealID_product_productCode_defaultValue!)?string=="currentUser">
					<#assign activeDealID_product_productCode_defaultValue='${staffJson!}'>
				<#elseif (activeDealID_product_productCode_defaultValue!)?string=="currentPost">
					<#assign activeDealID_product_productCode_defaultValue='${postJson!}'>
				<#elseif (activeDealID_product_productCode_defaultValue!)?string=="currentDepart">
					<#assign activeDealID_product_productCode_defaultValue='${deptJson!}'>
				<#elseif (activeDealID_product_productCode_defaultValue!)?string=="currentComp">
					<#assign activeDealID_product_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign activeDealID_product_productCode_defaultText=''>
				<activeDealID.product.productCode
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeDealID_product_productCode_defaultValue)?? &&(activeDealID_product_productCode_defaultValue)?has_content>
							defaultValue='${(activeDealID_product_productCode_defaultValue!)?string}'
						</#if>
						<#if (activeDealID_product_productCode_defaultText)?? &&(activeDealID_product_productCode_defaultText)?has_content>
							defaultText='${(activeDealID_product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品编码</activeDealID.product.productCode>
				<#assign isRef = false >
				<#assign activeDealID_product_productName_defaultValue=''>
												<#assign activeDealID_product_productName_defaultValue=''>
				<#if (activeDealID_product_productName_defaultValue!)?string=="currentUser">
					<#assign activeDealID_product_productName_defaultValue='${staffJson!}'>
				<#elseif (activeDealID_product_productName_defaultValue!)?string=="currentPost">
					<#assign activeDealID_product_productName_defaultValue='${postJson!}'>
				<#elseif (activeDealID_product_productName_defaultValue!)?string=="currentDepart">
					<#assign activeDealID_product_productName_defaultValue='${deptJson!}'>
				<#elseif (activeDealID_product_productName_defaultValue!)?string=="currentComp">
					<#assign activeDealID_product_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign activeDealID_product_productName_defaultText=''>
				<activeDealID.product.productName
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (activeDealID_product_productName_defaultValue)?? &&(activeDealID_product_productName_defaultValue)?has_content>
							defaultValue='${(activeDealID_product_productName_defaultValue!)?string}'
						</#if>
						<#if (activeDealID_product_productName_defaultText)?? &&(activeDealID_product_productName_defaultText)?has_content>
							defaultText='${(activeDealID_product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</activeDealID.product.productName>
				<#assign isRef = false >
				<#assign startTime_defaultValue=''>
						 						<#assign startTime_defaultValue=''>
				<#assign startTime_defaultText=''>
					<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							<#assign startTime_defaultValue  = getDefaultDateTime(startTime_defaultValue!)?datetime>
					</#if>
				<startTime
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AdjustOrTempRecords_dg1542101192438Widget,'AdjustOrTempRecords_dg1542101192438Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(AdjustOrTempRecords_dg1542101192438Widget,'AdjustOrTempRecords_dg1542101192438Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (startTime_defaultValue)?? &&(startTime_defaultValue)?has_content>
							defaultValue='${(startTime_defaultValue!)?string}'
						</#if>
						<#if (startTime_defaultText)?? &&(startTime_defaultText)?has_content>
							defaultText='${(startTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">开始时间</startTime>
				<#assign isRef = false >
				<#assign endTime_defaultValue=''>
						 						<#assign endTime_defaultValue=''>
				<#assign endTime_defaultText=''>
					<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							<#assign endTime_defaultValue  = getDefaultDateTime(endTime_defaultValue!)?datetime>
					</#if>
				<endTime
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(AdjustOrTempRecords_dg1542101192438Widget,'AdjustOrTempRecords_dg1542101192438Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(AdjustOrTempRecords_dg1542101192438Widget,'AdjustOrTempRecords_dg1542101192438Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (endTime_defaultValue)?? &&(endTime_defaultValue)?has_content>
							defaultValue='${(endTime_defaultValue!)?string}'
						</#if>
						<#if (endTime_defaultText)?? &&(endTime_defaultText)?has_content>
							defaultText='${(endTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="100">结束时间</endTime>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="AdjustOrTempRecords_dg1542101192438Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
		<row  onClick="AdjustOrTempRecords_dg1542101192438Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.activeDealID.id)!}</c>
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
