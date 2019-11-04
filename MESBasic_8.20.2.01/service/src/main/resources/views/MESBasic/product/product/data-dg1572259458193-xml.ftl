<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1572259458193" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign reinspect_defaultValue=''>
						 						<#assign reinspect_defaultValue=''>
				<#assign reinspect_defaultText=''>
				<reinspect
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdResetDaily_dg1572259458193Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (reinspect_defaultValue)?? &&(reinspect_defaultValue)?has_content>
							defaultValue='${(reinspect_defaultValue!)?string}'
						</#if>
						<#if (reinspect_defaultText)?? &&(reinspect_defaultText)?has_content>
							defaultText='${(reinspect_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">复验周期</reinspect>
				<#assign isRef = false >
				<#assign reinspectUnit_defaultValue=''>
						 						<#assign reinspectUnit_defaultValue=''>
				<#assign reinspectUnit_defaultText=''>
				<reinspectUnit.id
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdResetDaily_dg1572259458193Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('reinspectUnit')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (reinspectUnit_defaultValue)?? &&(reinspectUnit_defaultValue)?has_content>
							defaultValue='${(reinspectUnit_defaultValue!)?string}'
						</#if>
						<#if (reinspectUnit_defaultText)?? &&(reinspectUnit_defaultText)?has_content>
							defaultText='${(reinspectUnit_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">复验周期单位</reinspectUnit.id>
				<#assign isRef = false >
				<#assign expireDaysForNotify_defaultValue=''>
						 						<#assign expireDaysForNotify_defaultValue=''>
				<#assign expireDaysForNotify_defaultText=''>
				<expireDaysForNotify
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdResetDaily_dg1572259458193Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (expireDaysForNotify_defaultValue)?? &&(expireDaysForNotify_defaultValue)?has_content>
							defaultValue='${(expireDaysForNotify_defaultValue!)?string}'
						</#if>
						<#if (expireDaysForNotify_defaultText)?? &&(expireDaysForNotify_defaultText)?has_content>
							defaultText='${(expireDaysForNotify_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">到期天数(提醒)</expireDaysForNotify>
				<#assign isRef = false >
				<#assign expireDaysInterval_defaultValue=''>
						 						<#assign expireDaysInterval_defaultValue=''>
				<#assign expireDaysInterval_defaultText=''>
				<expireDaysInterval
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdResetDaily_dg1572259458193Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (expireDaysInterval_defaultValue)?? &&(expireDaysInterval_defaultValue)?has_content>
							defaultValue='${(expireDaysInterval_defaultValue!)?string}'
						</#if>
						<#if (expireDaysInterval_defaultText)?? &&(expireDaysInterval_defaultText)?has_content>
							defaultText='${(expireDaysInterval_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">到期天数间隔</expireDaysInterval>
				<#assign isRef = false >
				<#assign demo_defaultValue=''>
						 						<#assign demo_defaultValue=''>
				<#assign demo_defaultText=''>
				<demo
					sort="false"  onPropertyChange="ProdResetDaily_dg1572259458193Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (demo_defaultValue)?? &&(demo_defaultValue)?has_content>
							defaultValue='${(demo_defaultValue!)?string}'
						</#if>
						<#if (demo_defaultText)?? &&(demo_defaultText)?has_content>
							defaultText='${(demo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">说明</demo>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProdResetDaily_dg1572259458193Widget._DT._autoAddNewRow(nRow)" >
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
