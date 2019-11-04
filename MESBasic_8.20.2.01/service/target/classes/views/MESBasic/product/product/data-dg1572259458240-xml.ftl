<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1572259458240" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<baseUnit.id IsHiddenField="true"></baseUnit.id>
				<secUnit.id IsHiddenField="true"></secUnit.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign baseUnit_name_defaultValue=''>
												<#assign baseUnit_name_defaultValue=''>
				<#if (baseUnit_name_defaultValue!)?string=="currentUser">
					<#assign baseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (baseUnit_name_defaultValue!)?string=="currentPost">
					<#assign baseUnit_name_defaultValue='${postJson!}'>
				<#elseif (baseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign baseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (baseUnit_name_defaultValue!)?string=="currentComp">
					<#assign baseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign baseUnit_name_defaultText=''>
				<baseUnit.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdSecUnit_dg1572259458240Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdSecUnit_dg1572259458240Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/X6Basic/unitGroup/baseUnit/unitRef.action','dg1572259458240baseUnit.name','${getText("X6Basic.viewtitle.radion1398240433147")}',sPTGridID,nRow,sFieldName,ProdSecUnit_dg1572259458240Widget,null,false,false,'','X6Basic_1.0_unitGroup_unitRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProdSecUnit_dg1572259458240Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (baseUnit_name_defaultValue)?? &&(baseUnit_name_defaultValue)?has_content>
							defaultValue='${(baseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (baseUnit_name_defaultText)?? &&(baseUnit_name_defaultText)?has_content>
							defaultText='${(baseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">主单位</baseUnit.name>
				<#assign isRef = false >
				<#assign secUnit_name_defaultValue=''>
												<#assign secUnit_name_defaultValue=''>
				<#if (secUnit_name_defaultValue!)?string=="currentUser">
					<#assign secUnit_name_defaultValue='${staffJson!}'>
				<#elseif (secUnit_name_defaultValue!)?string=="currentPost">
					<#assign secUnit_name_defaultValue='${postJson!}'>
				<#elseif (secUnit_name_defaultValue!)?string=="currentDepart">
					<#assign secUnit_name_defaultValue='${deptJson!}'>
				<#elseif (secUnit_name_defaultValue!)?string=="currentComp">
					<#assign secUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign secUnit_name_defaultText=''>
				<secUnit.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdSecUnit_dg1572259458240Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdSecUnit_dg1572259458240Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/X6Basic/unitGroup/baseUnit/unitRef.action','dg1572259458240secUnit.name','${getText("X6Basic.viewtitle.radion1398240433147")}',sPTGridID,nRow,sFieldName,ProdSecUnit_dg1572259458240Widget,null,false,false,'','X6Basic_1.0_unitGroup_unitRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProdSecUnit_dg1572259458240Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (secUnit_name_defaultValue)?? &&(secUnit_name_defaultValue)?has_content>
							defaultValue='${(secUnit_name_defaultValue!)?string}'
						</#if>
						<#if (secUnit_name_defaultText)?? &&(secUnit_name_defaultText)?has_content>
							defaultText='${(secUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">辅单位</secUnit.name>
				<#assign isRef = false >
				<#assign changeRate_defaultValue=''>
						 						<#assign changeRate_defaultValue=''>
				<#assign changeRate_defaultText=''>
				<changeRate
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProdSecUnit_dg1572259458240Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (changeRate_defaultValue)?? &&(changeRate_defaultValue)?has_content>
							defaultValue='${(changeRate_defaultValue!)?string}'
						</#if>
						<#if (changeRate_defaultText)?? &&(changeRate_defaultText)?has_content>
							defaultText='${(changeRate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">换算比率</changeRate>
				<#assign isRef = false >
				<#assign demo_defaultValue=''>
						 						<#assign demo_defaultValue=''>
				<#assign demo_defaultText=''>
				<demo
					sort="false"  onPropertyChange="ProdSecUnit_dg1572259458240Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">备注</demo>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProdSecUnit_dg1572259458240Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.baseUnit.id)!}</c>
					<c>${(row.secUnit.id)!}</c>
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
