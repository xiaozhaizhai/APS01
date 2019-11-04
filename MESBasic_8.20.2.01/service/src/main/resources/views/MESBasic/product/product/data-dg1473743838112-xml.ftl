<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1473743838112" pageSize="${dg1473743838112Page.pageSize}" totalCount="${dg1473743838112Page.totalCount}" totalPages="${dg1473743838112Page.totalPages}" pageNo="${dg1473743838112Page.pageNo}" hasPre="${dg1473743838112Page.hasPre?string}" hasNext="${dg1473743838112Page.hasNext?string}" prePage="${dg1473743838112Page.prePage}" nextPage="${dg1473743838112Page.nextPage}">
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
				<#assign resetCyc_defaultValue=''>
						 						<#assign resetCyc_defaultValue=''>
				<#assign resetCyc_defaultText=''>
				<resetCyc
					sort="false"  onPropertyChange="ProdResetDaily_dg1473743838112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdResetDaily_resetCyc_permit = checkFieldPermission('resetCyc','MESBasic_1_product_ProdResetDaily','MESBasic_1_product_ProdResetDaily_resetCyc')>
						<#if MESBasic_1_product_ProdResetDaily_resetCyc_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdResetDaily_resetCyc_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (resetCyc_defaultValue)?? &&(resetCyc_defaultValue)?has_content>
							defaultValue='${(resetCyc_defaultValue!)?string}'
						</#if>
						<#if (resetCyc_defaultText)?? &&(resetCyc_defaultText)?has_content>
							defaultText='${(resetCyc_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">周期(天)</resetCyc>
				<#assign isRef = false >
				<#assign notifyDays_defaultValue=''>
						 						<#assign notifyDays_defaultValue=''>
				<#assign notifyDays_defaultText=''>
				<notifyDays
					sort="false"  onPropertyChange="ProdResetDaily_dg1473743838112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdResetDaily_notifyDays_permit = checkFieldPermission('notifyDays','MESBasic_1_product_ProdResetDaily','MESBasic_1_product_ProdResetDaily_notifyDays')>
						<#if MESBasic_1_product_ProdResetDaily_notifyDays_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdResetDaily_notifyDays_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (notifyDays_defaultValue)?? &&(notifyDays_defaultValue)?has_content>
							defaultValue='${(notifyDays_defaultValue!)?string}'
						</#if>
						<#if (notifyDays_defaultText)?? &&(notifyDays_defaultText)?has_content>
							defaultText='${(notifyDays_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">提前提醒(天)</notifyDays>
	</thead>
	<tbody>
		<#list dg1473743838112Page.result as row>
		<row  onClick="ProdResetDaily_dg1473743838112Widget._DT._autoAddNewRow(nRow)" >
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
					<#if !MESBasic_1_product_ProdResetDaily_resetCyc_permit??>
					<#assign MESBasic_1_product_ProdResetDaily_resetCyc_permit = checkFieldPermission('resetCyc','MESBasic_1_product_ProdResetDaily','MESBasic_1_product_ProdResetDaily_resetCyc')>
					</#if>
							<c><#if MESBasic_1_product_ProdResetDaily_resetCyc_permit != 0><#if (row.resetCyc)?has_content>${(row.resetCyc)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdResetDaily_notifyDays_permit??>
					<#assign MESBasic_1_product_ProdResetDaily_notifyDays_permit = checkFieldPermission('notifyDays','MESBasic_1_product_ProdResetDaily','MESBasic_1_product_ProdResetDaily_notifyDays')>
					</#if>
							<c><#if MESBasic_1_product_ProdResetDaily_notifyDays_permit != 0><#if (row.notifyDays)?has_content>${(row.notifyDays)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>