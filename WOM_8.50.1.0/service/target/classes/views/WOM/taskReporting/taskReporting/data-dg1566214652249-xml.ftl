<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1566214652249" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="200">入库批号</batchNum>
				<#assign isRef = false >
				<#assign reportNum_defaultValue=''>
						 						<#assign reportNum_defaultValue=''>
				<#assign reportNum_defaultText=''>
				<reportNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (reportNum_defaultValue)?? &&(reportNum_defaultValue)?has_content>
							defaultValue='${(reportNum_defaultValue!)?string}'
						</#if>
						<#if (reportNum_defaultText)?? &&(reportNum_defaultText)?has_content>
							defaultText='${(reportNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="200">数量</reportNum>
				<#assign isRef = false >
				<#assign modifyNum_defaultValue=''>
						 						<#assign modifyNum_defaultValue=''>
				<#assign modifyNum_defaultText=''>
				<modifyNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="3"
						
						 dataType="float"
						
						<#if (modifyNum_defaultValue)?? &&(modifyNum_defaultValue)?has_content>
							defaultValue='${(modifyNum_defaultValue!)?string}'
						</#if>
						<#if (modifyNum_defaultText)?? &&(modifyNum_defaultText)?has_content>
							defaultText='${(modifyNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">原数量</modifyNum>
				<#assign isRef = false >
				<#assign content_defaultValue=''>
						 						<#assign content_defaultValue=''>
				<#assign content_defaultText=''>
				<content
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (content_defaultValue)?? &&(content_defaultValue)?has_content>
							defaultValue='${(content_defaultValue!)?string}'
						</#if>
						<#if (content_defaultText)?? &&(content_defaultText)?has_content>
							defaultText='${(content_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">含量</content>
				<#assign isRef = false >
				<#assign modifyCont_defaultValue=''>
						 						<#assign modifyCont_defaultValue=''>
				<#assign modifyCont_defaultText=''>
				<modifyCont
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="3"
						
						 dataType="float"
						
						<#if (modifyCont_defaultValue)?? &&(modifyCont_defaultValue)?has_content>
							defaultValue='${(modifyCont_defaultValue!)?string}'
						</#if>
						<#if (modifyCont_defaultText)?? &&(modifyCont_defaultText)?has_content>
							defaultText='${(modifyCont_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">原含量</modifyCont>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="TaskReportingPart_dg1566214652249Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="200">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="TaskReportingPart_dg1566214652249Widget._DT._autoAddNewRow(nRow)" >
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
