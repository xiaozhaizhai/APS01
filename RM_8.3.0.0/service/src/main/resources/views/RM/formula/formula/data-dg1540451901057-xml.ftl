<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1540451901057" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<lflineId.id IsHiddenField="true"></lflineId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign lflineId_name_defaultValue=''>
												<#assign lflineId_name_defaultValue=''>
				<#if (lflineId_name_defaultValue!)?string=="currentUser">
					<#assign lflineId_name_defaultValue='${staffJson!}'>
				<#elseif (lflineId_name_defaultValue!)?string=="currentPost">
					<#assign lflineId_name_defaultValue='${postJson!}'>
				<#elseif (lflineId_name_defaultValue!)?string=="currentDepart">
					<#assign lflineId_name_defaultValue='${deptJson!}'>
				<#elseif (lflineId_name_defaultValue!)?string=="currentComp">
					<#assign lflineId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign lflineId_name_defaultText=''>
				<lflineId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ForLineFormula_dg1540451901057Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ForLineFormula_dg1540451901057Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factoryProductRef.action','dg1540451901057lflineId.name','${getText("MESBasic.viewtitle.randon1490322427886")}',sPTGridID,nRow,sFieldName,ForLineFormula_dg1540451901057Widget,null,false,false,'','MESBasic_1_factoryModel_factoryProductRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (lflineId_name_defaultValue)?? &&(lflineId_name_defaultValue)?has_content>
							defaultValue='${(lflineId_name_defaultValue!)?string}'
						</#if>
						<#if (lflineId_name_defaultText)?? &&(lflineId_name_defaultText)?has_content>
							defaultText='${(lflineId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">生产线</lflineId.name>
				<#assign isRef = false >
				<#assign maxCapacity_defaultValue=''>
						 						<#assign maxCapacity_defaultValue=''>
				<#assign maxCapacity_defaultText=''>
				<maxCapacity
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (maxCapacity_defaultValue)?? &&(maxCapacity_defaultValue)?has_content>
							defaultValue='${(maxCapacity_defaultValue!)?string}'
						</#if>
						<#if (maxCapacity_defaultText)?? &&(maxCapacity_defaultText)?has_content>
							defaultText='${(maxCapacity_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">最大产能</maxCapacity>
				<#assign isRef = false >
				<#assign longTime_defaultValue=''>
						 						<#assign longTime_defaultValue=''>
				<#assign longTime_defaultText=''>
				<longTime
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (longTime_defaultValue)?? &&(longTime_defaultValue)?has_content>
							defaultValue='${(longTime_defaultValue!)?string}'
						</#if>
						<#if (longTime_defaultText)?? &&(longTime_defaultText)?has_content>
							defaultText='${(longTime_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">标准时长（分）</longTime>
				<#assign isRef = false >
				<#assign theoreYield_defaultValue=''>
						 						<#assign theoreYield_defaultValue=''>
				<#assign theoreYield_defaultText=''>
				<theoreYield
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (theoreYield_defaultValue)?? &&(theoreYield_defaultValue)?has_content>
							defaultValue='${(theoreYield_defaultValue!)?string}'
						</#if>
						<#if (theoreYield_defaultText)?? &&(theoreYield_defaultText)?has_content>
							defaultText='${(theoreYield_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">理论收率</theoreYield>
				<#assign isRef = false >
				<#assign autoReportOnFinish_defaultValue=''>
						 						<#assign autoReportOnFinish_defaultValue=''>
				<#assign autoReportOnFinish_defaultText=''>
				<autoReportOnFinish.id
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('autoReportOnFinish')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (autoReportOnFinish_defaultValue)?? &&(autoReportOnFinish_defaultValue)?has_content>
							defaultValue='${(autoReportOnFinish_defaultValue!)?string}'
						</#if>
						<#if (autoReportOnFinish_defaultText)?? &&(autoReportOnFinish_defaultText)?has_content>
							defaultText='${(autoReportOnFinish_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">完成后自动报工</autoReportOnFinish.id>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">备注</meno>
				<#assign isRef = false >
				<#assign tempId_defaultValue=''>
						 						<#assign tempId_defaultValue=''>
				<#assign tempId_defaultText=''>
				<tempId
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">临时id</tempId>
				<#assign isRef = false >
				<#assign lflineId_id_defaultValue=''>
												<#assign lflineId_id_defaultValue=''>
				<#if (lflineId_id_defaultValue!)?string=="currentUser">
					<#assign lflineId_id_defaultValue='${staffJson!}'>
				<#elseif (lflineId_id_defaultValue!)?string=="currentPost">
					<#assign lflineId_id_defaultValue='${postJson!}'>
				<#elseif (lflineId_id_defaultValue!)?string=="currentDepart">
					<#assign lflineId_id_defaultValue='${deptJson!}'>
				<#elseif (lflineId_id_defaultValue!)?string=="currentComp">
					<#assign lflineId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign lflineId_id_defaultText=''>
				<lflineId.id
					sort="false"  onPropertyChange="ForLineFormula_dg1540451901057Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</lflineId.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ForLineFormula_dg1540451901057Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.lflineId.id)!}</c>
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
