<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1555572135834" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign checkItems_defaultValue=''>
						 						<#assign checkItems_defaultValue=''>
				<#assign checkItems_defaultText=''>
				<checkItems
						style="font-color:0303B3"
					sort="false"  onPropertyChange="CheckDetail_dg1555572135834Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (checkItems_defaultValue)?? &&(checkItems_defaultValue)?has_content>
							defaultValue='${(checkItems_defaultValue!)?string}'
						</#if>
						<#if (checkItems_defaultText)?? &&(checkItems_defaultText)?has_content>
							defaultText='${(checkItems_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">检查项</checkItems>
				<#assign isRef = false >
				<#assign standrad_defaultValue=''>
						 						<#assign standrad_defaultValue=''>
				<#assign standrad_defaultText=''>
				<standrad
					sort="false"  onPropertyChange="CheckDetail_dg1555572135834Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (standrad_defaultValue)?? &&(standrad_defaultValue)?has_content>
							defaultValue='${(standrad_defaultValue!)?string}'
						</#if>
						<#if (standrad_defaultText)?? &&(standrad_defaultText)?has_content>
							defaultText='${(standrad_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">标准值</standrad>
				<#assign isRef = false >
				<#assign itemClassNew_defaultValue=''>
						 						<#assign itemClassNew_defaultValue=''>
				<#assign itemClassNew_defaultText=''>
				<itemClassNew.id
					sort="false"  onPropertyChange="CheckDetail_dg1555572135834Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
								<#assign optionMap = getSystemCodeList('ITEM_PROPERTY')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (itemClassNew_defaultValue)?? &&(itemClassNew_defaultValue)?has_content>
							defaultValue='${(itemClassNew_defaultValue!)?string}'
						</#if>
						<#if (itemClassNew_defaultText)?? &&(itemClassNew_defaultText)?has_content>
							defaultText='${(itemClassNew_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">位号属性</itemClassNew.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="CheckDetail_dg1555572135834Widget._DT._autoAddNewRow(nRow)" >
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
