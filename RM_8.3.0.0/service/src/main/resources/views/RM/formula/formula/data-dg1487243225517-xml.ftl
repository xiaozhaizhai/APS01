<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1487243225517" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign unitQuality_defaultValue=''>
						 						<#assign unitQuality_defaultValue=''>
				<#assign unitQuality_defaultText=''>
				<unitQuality
					sort="false"  onPropertyChange="FormulaBom_dg1487243225517Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (unitQuality_defaultValue)?? &&(unitQuality_defaultValue)?has_content>
							defaultValue='${(unitQuality_defaultValue!)?string}'
						</#if>
						<#if (unitQuality_defaultText)?? &&(unitQuality_defaultText)?has_content>
							defaultText='${(unitQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">单位数量</unitQuality>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FormulaBom_dg1487243225517Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
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
					<#if !RM_7_5_0_0_formula_FormulaBom_unitQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit != 0><#if (row.unitQuality)?has_content>#{(row.unitQuality)!; m6M6}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>