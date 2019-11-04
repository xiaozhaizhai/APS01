<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1557897210217" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign STATUS_defaultValue=''>
						 						<#assign STATUS_defaultValue=''>
				<#assign STATUS_defaultText=''>
				<STATUS
					sort="false"  onPropertyChange="InvolveItemsetups_dg1557897210217Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (STATUS_defaultValue)?? &&(STATUS_defaultValue)?has_content>
							defaultValue='${(STATUS_defaultValue!)?string}'
						</#if>
						<#if (STATUS_defaultText)?? &&(STATUS_defaultText)?has_content>
							defaultText='${(STATUS_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">STATUS</STATUS>
				<#assign isRef = false >
				<#assign version_defaultValue=''>
						 						<#assign version_defaultValue=''>
				<#assign version_defaultText=''>
				<version
					sort="false"  onPropertyChange="InvolveItemsetups_dg1557897210217Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (version_defaultValue)?? &&(version_defaultValue)?has_content>
							defaultValue='${(version_defaultValue!)?string}'
						</#if>
						<#if (version_defaultText)?? &&(version_defaultText)?has_content>
							defaultText='${(version_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">version</version>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="InvolveItemsetups_dg1557897210217Widget._DT._autoAddNewRow(nRow)" >
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
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
