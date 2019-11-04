<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1398236153862" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign code_defaultValue=''>
						 						<#assign code_defaultValue=''>
				<#assign code_defaultText=''>
				<code
						style="font-color:0303B3"
					sort="true"  onPropertyChange="BaseUnit_dg1398236153862Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (code_defaultValue)?? &&(code_defaultValue)?has_content>
							defaultValue='${(code_defaultValue!)?string}'
						</#if>
						<#if (code_defaultText)?? &&(code_defaultText)?has_content>
							defaultText='${(code_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位代码</code>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
						style="font-color:0303B3"
					sort="true"  onPropertyChange="BaseUnit_dg1398236153862Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">单位名称</name>
				<#assign isRef = false >
				<#assign isMain_defaultValue=''>
						 						<#assign isMain_defaultValue=''>
				<#assign isMain_defaultText=''>
				<isMain
						style="font-color:0303B3"
					sort="true"  onPropertyChange="BaseUnit_dg1398236153862Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMain_defaultValue)?? &&(isMain_defaultValue)?has_content>
							defaultValue='${(isMain_defaultValue!)?string}'
						</#if>
						<#if (isMain_defaultText)?? &&(isMain_defaultText)?has_content>
							defaultText='${(isMain_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="40">主单位</isMain>
				<#assign isRef = false >
				<#assign rate_defaultValue=''>
						 						<#assign rate_defaultValue=''>
				<#assign rate_defaultText=''>
				<rate
						style="font-color:0303B3"
					sort="true"  onPropertyChange="BaseUnit_dg1398236153862Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (rate_defaultValue)?? &&(rate_defaultValue)?has_content>
							defaultValue='${(rate_defaultValue!)?string}'
						</#if>
						<#if (rate_defaultText)?? &&(rate_defaultText)?has_content>
							defaultText='${(rate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">比率</rate>
				<#assign isRef = false >
				<#assign comments_defaultValue=''>
						 						<#assign comments_defaultValue=''>
				<#assign comments_defaultText=''>
				<comments
					sort="true"  onPropertyChange="BaseUnit_dg1398236153862Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (comments_defaultValue)?? &&(comments_defaultValue)?has_content>
							defaultValue='${(comments_defaultValue!)?string}'
						</#if>
						<#if (comments_defaultText)?? &&(comments_defaultText)?has_content>
							defaultText='${(comments_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="200">备注</comments>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
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
