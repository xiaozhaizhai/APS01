<#assign cpObjHideKey = '' >
		<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveEditdg1487555065561", "DATAGRID", "precessStandards")>
		<#list customPropViewMappings as cpvm>
			<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
				<#assign cpObjHideKey = cpObjHideKey + "," + cpvm.propertyLayRec>
			</#if>
		</#list>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487555065561" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<activeId.id IsHiddenField="true"></activeId.id>
				<processId.id IsHiddenField="true"></processId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign quota_defaultValue=''>
						 						<#assign quota_defaultValue=''>
				<#assign quota_defaultText=''>
				<quota
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (quota_defaultValue)?? &&(quota_defaultValue)?has_content>
							defaultValue='${(quota_defaultValue!)?string}'
						</#if>
						<#if (quota_defaultText)?? &&(quota_defaultText)?has_content>
							defaultText='${(quota_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">指标</quota>
				<#assign isRef = false >
				<#assign stValue_defaultValue=''>
						 						<#assign stValue_defaultValue=''>
				<#assign stValue_defaultText=''>
				<stValue
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (stValue_defaultValue)?? &&(stValue_defaultValue)?has_content>
							defaultValue='${(stValue_defaultValue!)?string}'
						</#if>
						<#if (stValue_defaultText)?? &&(stValue_defaultText)?has_content>
							defaultText='${(stValue_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准值</stValue>
				<#assign isRef = false >
				<#assign overrunFlag_defaultValue=''>
						 						<#assign overrunFlag_defaultValue=''>
				<#assign overrunFlag_defaultText=''>
				<overrunFlag
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'overRunFlag(nRow,sFieldName)');"
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (overrunFlag_defaultValue)?? &&(overrunFlag_defaultValue)?has_content>
							defaultValue='${(overrunFlag_defaultValue!)?string}'
						</#if>
						<#if (overrunFlag_defaultText)?? &&(overrunFlag_defaultText)?has_content>
							defaultText='${(overrunFlag_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">统计超限</overrunFlag>
				<#assign isRef = false >
				<#assign limitInter_defaultValue=''>
						 						<#assign limitInter_defaultValue=''>
				<#assign limitInter_defaultText=''>
				<limitInter
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (limitInter_defaultValue)?? &&(limitInter_defaultValue)?has_content>
							defaultValue='${(limitInter_defaultValue!)?string}'
						</#if>
						<#if (limitInter_defaultText)?? &&(limitInter_defaultText)?has_content>
							defaultText='${(limitInter_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">扫描间隔（超限）</limitInter>
				<#assign isRef = false >
				<#assign upperLimit_defaultValue=''>
						 						<#assign upperLimit_defaultValue=''>
				<#assign upperLimit_defaultText=''>
				<upperLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'upChange()');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (upperLimit_defaultValue)?? &&(upperLimit_defaultValue)?has_content>
							defaultValue='${(upperLimit_defaultValue!)?string}'
						</#if>
						<#if (upperLimit_defaultText)?? &&(upperLimit_defaultText)?has_content>
							defaultText='${(upperLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">上限</upperLimit>
				<#assign isRef = false >
				<#assign maxLimit_defaultValue=''>
						 						<#assign maxLimit_defaultValue=''>
				<#assign maxLimit_defaultText=''>
				<maxLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'maxChange()');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (maxLimit_defaultValue)?? &&(maxLimit_defaultValue)?has_content>
							defaultValue='${(maxLimit_defaultValue!)?string}'
						</#if>
						<#if (maxLimit_defaultText)?? &&(maxLimit_defaultText)?has_content>
							defaultText='${(maxLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">上上限</maxLimit>
				<#assign isRef = false >
				<#assign lowerLimit_defaultValue=''>
						 						<#assign lowerLimit_defaultValue=''>
				<#assign lowerLimit_defaultText=''>
				<lowerLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'lowChange()');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (lowerLimit_defaultValue)?? &&(lowerLimit_defaultValue)?has_content>
							defaultValue='${(lowerLimit_defaultValue!)?string}'
						</#if>
						<#if (lowerLimit_defaultText)?? &&(lowerLimit_defaultText)?has_content>
							defaultText='${(lowerLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">下限</lowerLimit>
				<#assign isRef = false >
				<#assign loweMxLimit_defaultValue=''>
						 						<#assign loweMxLimit_defaultValue=''>
				<#assign loweMxLimit_defaultText=''>
				<loweMxLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'minChange()');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (loweMxLimit_defaultValue)?? &&(loweMxLimit_defaultValue)?has_content>
							defaultValue='${(loweMxLimit_defaultValue!)?string}'
						</#if>
						<#if (loweMxLimit_defaultText)?? &&(loweMxLimit_defaultText)?has_content>
							defaultText='${(loweMxLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">下下限</loweMxLimit>
				<#assign isRef = false >
				<#assign fluctuateFlag_defaultValue=''>
						 						<#assign fluctuateFlag_defaultValue=''>
				<#assign fluctuateFlag_defaultText=''>
				<fluctuateFlag
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'fluctuateChange(nRow,sFieldName)');"
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (fluctuateFlag_defaultValue)?? &&(fluctuateFlag_defaultValue)?has_content>
							defaultValue='${(fluctuateFlag_defaultValue!)?string}'
						</#if>
						<#if (fluctuateFlag_defaultText)?? &&(fluctuateFlag_defaultText)?has_content>
							defaultText='${(fluctuateFlag_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">统计波动</fluctuateFlag>
				<#assign isRef = false >
				<#assign flucUpperLimit_defaultValue=''>
						 						<#assign flucUpperLimit_defaultValue=''>
				<#assign flucUpperLimit_defaultText=''>
				<flucUpperLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'UpperLimitChange(nRow,sFieldName)');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (flucUpperLimit_defaultValue)?? &&(flucUpperLimit_defaultValue)?has_content>
							defaultValue='${(flucUpperLimit_defaultValue!)?string}'
						</#if>
						<#if (flucUpperLimit_defaultText)?? &&(flucUpperLimit_defaultText)?has_content>
							defaultText='${(flucUpperLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">波动上限</flucUpperLimit>
				<#assign isRef = false >
				<#assign flucLowerLimit_defaultValue=''>
						 						<#assign flucLowerLimit_defaultValue=''>
				<#assign flucLowerLimit_defaultText=''>
				<flucLowerLimit
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);PrecessStandards_dg1487555065561Widget.evalCustomFunction(nRow,sFieldName,'rowLimitChange()');"
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (flucLowerLimit_defaultValue)?? &&(flucLowerLimit_defaultValue)?has_content>
							defaultValue='${(flucLowerLimit_defaultValue!)?string}'
						</#if>
						<#if (flucLowerLimit_defaultText)?? &&(flucLowerLimit_defaultText)?has_content>
							defaultText='${(flucLowerLimit_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">波动下限</flucLowerLimit>
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
					sort="false"  onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">工序活动ID</activeId.id>
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
					sort="false" numberproperty="sum" onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">工序ID</processId.id>
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveEditdg1487555065561", "DATAGRID", "precessStandards")>
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
							onFocus="CUI.toggleClearBtn_DG_IE(PrecessStandards_dg1487555065561Widget,nRow,sFieldName)"
							onBtnClick="CUI.clearCellValue_DG_IE(PrecessStandards_dg1487555065561Widget,nRow,sFieldName,true)"
							subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('${viewUrl!}','dg1487555065561${cpvm.propertyLayRec}','${getText("${viewTitle}")}',sPTGridID,nRow,'${cpvm.propertyLayRec}',PrecessStandards_dg1487555065561Widget,null,false,true,'${mainDisplayName},${pkName}','${viewCode}')"
							hideEditOnReadOnly="true"
						</#if>
					</#if>
						sort="false"
						onPropertyChange="PrecessStandards_dg1487555065561Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
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
						onClick="initCalender(PrecessStandards_dg1487555065561Widget,'PrecessStandards_dg1487555065561Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
						onBtnClick="showCalender(PrecessStandards_dg1487555065561Widget,'PrecessStandards_dg1487555065561Widget',nRow,sFieldName,<#if cpvm.format == 'YMD_H'>'dateTimeHour'<#elseif cpvm.format == 'YMD_HM'>'dateTimeMin'<#else>'datetime'</#if>)"
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
		<row  onClick="PrecessStandards_dg1487555065561Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.activeId.id)!}</c>
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
				<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_PrecessStandards", "RM_7.5.0.0_formula_processActiveEditdg1487555065561", "DATAGRID", "precessStandards")>
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
	<row></row>
	</tfoot>
</GridData>
