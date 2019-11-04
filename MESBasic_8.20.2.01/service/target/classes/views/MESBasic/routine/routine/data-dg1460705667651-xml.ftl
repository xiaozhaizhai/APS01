<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1460705667651" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<sort IsHiddenField="true"></sort>
				<meter.id IsHiddenField="true"></meter.id>
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
						style="font-color:0303B3"
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">名称</name>
				<#assign isRef = false >
				<#assign measurement_defaultValue='measurement/001'>
						 				<#assign measurement_defaultText=''>
				<measurement.id
						style="font-color:0303B3"
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);Config_dg1460705667651Widget.evalCustomFunction(nRow,sFieldName,'onchangemesu()');"
				    
						hideButtonsOnReadOnly="true"
								<#assign optionMap = getSystemCodeList('measurement')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (measurement_defaultValue)?? &&(measurement_defaultValue)?has_content>
							defaultValue='${(measurement_defaultValue!)?string}'
						</#if>
						<#if (measurement_defaultText)?? &&(measurement_defaultText)?has_content>
							defaultText='${(measurement_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">赋值方式</measurement.id>
				<#assign isRef = false >
				<#assign formula_defaultValue=''>
						 						<#assign formula_defaultValue=''>
				<#assign formula_defaultText=''>
				<formula
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (formula_defaultValue)?? &&(formula_defaultValue)?has_content>
							defaultValue='${(formula_defaultValue!)?string}'
						</#if>
						<#if (formula_defaultText)?? &&(formula_defaultText)?has_content>
							defaultText='${(formula_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="120">计算公式</formula>
				<#assign isRef = false >
				<#assign meter_itemName_defaultValue=''>
												<#assign meter_itemName_defaultValue=''>
				<#if (meter_itemName_defaultValue!)?string=="currentUser">
					<#assign meter_itemName_defaultValue='${staffJson!}'>
				<#elseif (meter_itemName_defaultValue!)?string=="currentPost">
					<#assign meter_itemName_defaultValue='${postJson!}'>
				<#elseif (meter_itemName_defaultValue!)?string=="currentDepart">
					<#assign meter_itemName_defaultValue='${deptJson!}'>
				<#elseif (meter_itemName_defaultValue!)?string=="currentComp">
					<#assign meter_itemName_defaultValue='${compJson!}'>
				</#if>
				<#assign meter_itemName_defaultText=''>
				<meter.itemName
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(Config_dg1460705667651Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(Config_dg1460705667651Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/itemManage/itemSetup/aggregateOnlyRef.action','dg1460705667651meter.itemName','${getText("MESBasic.viewtitle.radion1417920362885")}',sPTGridID,nRow,sFieldName,Config_dg1460705667651Widget,null,false,false,'','MESBasic_1_itemManage_aggregateOnlyRef')"
								onKeyUp="MESBasic.routine.routine.routineViewAll.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':Config_dg1460705667651Widget,
										'sGridName':'Config_dg1460705667651Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/itemManage/itemSetup/aggregateOnlyRef.action',
										'displayfieldname':'itemName',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.routine.routine.routineViewAll.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.routine.routine.routineViewAll._querycustomFunc(\'dg1460705667651meter.itemName\'.replace(/\./g, \'_\'))'
										
									})"
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (meter_itemName_defaultValue)?? &&(meter_itemName_defaultValue)?has_content>
							defaultValue='${(meter_itemName_defaultValue!)?string}'
						</#if>
						<#if (meter_itemName_defaultText)?? &&(meter_itemName_defaultText)?has_content>
							defaultText='${(meter_itemName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">测点名称</meter.itemName>
				<#assign isRef = false >
				<#assign meter_code_defaultValue=''>
												<#assign meter_code_defaultValue=''>
				<#if (meter_code_defaultValue!)?string=="currentUser">
					<#assign meter_code_defaultValue='${staffJson!}'>
				<#elseif (meter_code_defaultValue!)?string=="currentPost">
					<#assign meter_code_defaultValue='${postJson!}'>
				<#elseif (meter_code_defaultValue!)?string=="currentDepart">
					<#assign meter_code_defaultValue='${deptJson!}'>
				<#elseif (meter_code_defaultValue!)?string=="currentComp">
					<#assign meter_code_defaultValue='${compJson!}'>
				</#if>
				<#assign meter_code_defaultText=''>
				<meter.code
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (meter_code_defaultValue)?? &&(meter_code_defaultValue)?has_content>
							defaultValue='${(meter_code_defaultValue!)?string}'
						</#if>
						<#if (meter_code_defaultText)?? &&(meter_code_defaultText)?has_content>
							defaultText='${(meter_code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">测点编码</meter.code>
				<#assign isRef = false >
				<#assign meter_itemNumber_defaultValue=''>
												<#assign meter_itemNumber_defaultValue=''>
				<#if (meter_itemNumber_defaultValue!)?string=="currentUser">
					<#assign meter_itemNumber_defaultValue='${staffJson!}'>
				<#elseif (meter_itemNumber_defaultValue!)?string=="currentPost">
					<#assign meter_itemNumber_defaultValue='${postJson!}'>
				<#elseif (meter_itemNumber_defaultValue!)?string=="currentDepart">
					<#assign meter_itemNumber_defaultValue='${deptJson!}'>
				<#elseif (meter_itemNumber_defaultValue!)?string=="currentComp">
					<#assign meter_itemNumber_defaultValue='${compJson!}'>
				</#if>
				<#assign meter_itemNumber_defaultText=''>
				<meter.itemNumber
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (meter_itemNumber_defaultValue)?? &&(meter_itemNumber_defaultValue)?has_content>
							defaultValue='${(meter_itemNumber_defaultValue!)?string}'
						</#if>
						<#if (meter_itemNumber_defaultText)?? &&(meter_itemNumber_defaultText)?has_content>
							defaultText='${(meter_itemNumber_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">位号</meter.itemNumber>
				<#assign isRef = false >
				<#assign maxAggValue_defaultValue=''>
						 						<#assign maxAggValue_defaultValue=''>
				<#assign maxAggValue_defaultText=''>
				<maxAggValue
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="4"
						
						 dataType="float"
						
						<#if (maxAggValue_defaultValue)?? &&(maxAggValue_defaultValue)?has_content>
							defaultValue='${(maxAggValue_defaultValue!)?string}'
						</#if>
						<#if (maxAggValue_defaultText)?? &&(maxAggValue_defaultText)?has_content>
							defaultText='${(maxAggValue_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">最大有效累积量</maxAggValue>
				<#assign isRef = false >
				<#assign forSource_defaultValue='true'>
						 						<#assign forSource_defaultValue='true'>
				<#assign forSource_defaultText=''>
				<forSource
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (forSource_defaultValue)?? &&(forSource_defaultValue)?has_content>
							defaultValue='${(forSource_defaultValue!)?string}'
						</#if>
						<#if (forSource_defaultText)?? &&(forSource_defaultText)?has_content>
							defaultText='${(forSource_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">用于源</forSource>
				<#assign isRef = false >
				<#assign forDestination_defaultValue=''>
						 						<#assign forDestination_defaultValue=''>
				<#assign forDestination_defaultText=''>
				<forDestination
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (forDestination_defaultValue)?? &&(forDestination_defaultValue)?has_content>
							defaultValue='${(forDestination_defaultValue!)?string}'
						</#if>
						<#if (forDestination_defaultText)?? &&(forDestination_defaultText)?has_content>
							defaultText='${(forDestination_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">用于目的</forDestination>
				<#assign isRef = false >
				<#assign isDefault_defaultValue='false'>
						 				<#assign isDefault_defaultText=''>
				<isDefault
					sort="true"  onPropertyChange="Config_dg1460705667651Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isDefault_defaultValue)?? &&(isDefault_defaultValue)?has_content>
							defaultValue='${(isDefault_defaultValue!)?string}'
						</#if>
						<#if (isDefault_defaultText)?? &&(isDefault_defaultText)?has_content>
							defaultText='${(isDefault_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="80">默认计量</isDefault>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.sort)!}</c>
					<c>${(row.meter.id)!}</c>
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
