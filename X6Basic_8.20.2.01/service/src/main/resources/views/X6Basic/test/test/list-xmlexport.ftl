<#assign exportFields = page.exportFields />
<#assign result = page.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign xmlState = xmlState>
<#assign properties = page.properties />
<#assign viewCode = 'X6Basic_1.0_test_Test' />
<#assign propertyCode = '' />
<#assign customerFlag =  page.customerExport />
<#assign styleFormats =  page.styleFormats />
<#assign useForImportFlag =  page.useForImportFlag />
<#if xmlState=='START'>
<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Created>1899-12-30T00:00:00</Created>
	</DocumentProperties>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowWidth>18800</WindowWidth>
 		<WindowHeight>10540</WindowHeight>
 		<ProtectStructure>False</ProtectStructure>
 		<ProtectWindows>False</ProtectWindows>
	</ExcelWorkbook>
	<Styles>
 		<Style ss:ID="Default" ss:Name="Normal">
  			<Alignment/>
  			<Borders/>
  			<Font ss:FontName="Arial" x:CharSet="134" ss:Size="12"/>
  			<Interior/>
 			<NumberFormat/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s4">
  			<NumberFormat ss:Format="_ * #,##0.00_ ;_ * -#,##0.00_ ;_ * &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s5">
  			<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0.00_ ;_ &quot;￥&quot;* -#,##0.00_ ;_ &quot;￥&quot;* &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s2">
  			<NumberFormat ss:Format="0%"/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s1">
  			<NumberFormat ss:Format="_ * #,##0_ ;_ * -#,##0_ ;_ * &quot;-&quot;_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s3">
  			<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0_ ;_ &quot;￥&quot;* -#,##0_ ;_ &quot;￥&quot;* &quot;-&quot;_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s6"/>
 		<Style ss:ID="s7">
  			<NumberFormat ss:Format="yyyy-m-d;-;-;@"/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s8">
  			<NumberFormat ss:Format="yyyy-m-d\ H:mm;-;-;@"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="unNullable">
			<Alignment />
			<Borders />
			<Font ss:FontName="宋体" x:CharSet="134" ss:Size="12" ss:Color="#FF0000" />
			<Interior />
			<NumberFormat />
			<Protection />
		</Style>
		<#if !customerFlag>
	  		<Style ss:ID="name">
	  			<NumberFormat/>
	  			<Protection/>
	  		</Style>
	  	<#else>
	  		<#if styleFormats??>
	  		<#list  styleFormats as  item>
	  		<#if  item.key?? >
	  		<Style ss:ID="${item.key}">
	  			<#if item['format']?? >
	  			<NumberFormat ss:Format="${item['format']}"/>
	  			<#else>
	  			<NumberFormat/>
	  			</#if>
	  			<Protection/>
	  		</Style>
	  		</#if>
	  		</#list>
	  		</#if>
	  	</#if>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
	 			    <#if !customerFlag>
		 				<#assign count = 1>
		 				<#if !exportFields?contains(',*,')>
							<#list exportFieldList as item>
								<#if item?length gt 0 && item != "checkbox">
											<#if item == 'name' || item == '*'>
														<Column ss:Index="${count}" ss:StyleID="${item}"   ss:Width="70"/>
													<#assign count = count + 1>
											</#if>
			 						
		 						
								</#if>
							</#list>
						</#if>
					<#else>
						<#assign count = 1>
						<#list properties as item>
						    <#assign  width = 70 />
							<#if item.showWidth??&&item.showWidth!="">
									<#assign  width = item.showWidth />
							<#else>
								<#if item.name?index_of(".")!=-1>
									<#assign layer = item.dispalyName?split(",")  />
									<#assign number =  layer?size  />
									<#assign  width = 70*number />
								<#else>
									<#if item.columntype == 'DECIMAL'||item.columntype == 'DATE'||item.columntype == 'BOOLEAN'>
									<#assign  width = 70 />
									<#elseif item.columntype == 'DATETIME'||item.columntype == 'SYSTEMCODE'>
									<#assign  width = 140 />
									<#elseif item.name.indexOf('tableNo')!=-1>
									<#assign  width = 140 />
									<#else>
									<#assign  width = 70 />
									</#if>
								</#if>
							</#if>
							<Column ss:Index="${count}" ss:Width="${width}"   ss:StyleID="${item.name}" />
							<#assign count = count + 1>
						</#list>
					</#if>
	 				<#if !customerFlag>
	 					<!-- 视图表头开始 -->
		 				<Row ss:AutoFitHeight="0">
			 				<#if !exportFields?contains(',*,')>
								<#list exportFieldList as item>
									<#if item?length gt 0>
			 			
											<#if item == 'name' || item == '*'>
													<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.randon1460695607594')}</Data></Cell>
											</#if>
			 			
										
									</#if>
								</#list>
							</#if>
						</Row>
						<!-- 视图表头结束 -->
	 				<#else>
			 			<!-- 主体头部开始 -->
			 			<Row ss:AutoFitHeight="0">
			 				<#if properties??>
								<#list properties  as headName>
										<#if headName?? >
												<#if headName.dispalyName?index_of(",")!=-1 >
												    <#assign display=""  />
												    <#list headName.dispalyName?split(",") as key>
														<#assign display=display+getText(key!'')+'.'   />
													</#list>
													<Cell   <#if useForImportFlag??&&useForImportFlag ><#if headName.nullable??&&headName.nullable=="false">ss:StyleID="unNullable" </#if></#if> >
													   <Data ss:Type="String">${display?substring(0,display?length-1)}</Data>
													      <Comment ss:Author="">
													            <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
													            ${headName.propertyCode}
													            </ss:Data>
												          </Comment>
													</Cell>
												<#else >
													<Cell <#if useForImportFlag??&&useForImportFlag ><#if headName.nullable??&&headName.nullable=="false">ss:StyleID="unNullable" </#if></#if> >
														 <Data ss:Type="String">${getText(headName.dispalyName!'')}</Data>
														 <Comment ss:Author="">
														            <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
														            ${headName.propertyCode}
														            </ss:Data>
													     </Comment>
												     </Cell>
												</#if>
										</#if>
								</#list>
							</#if>
						</Row>
						<!-- 主体头部结束 -->
	 				</#if>
				<#elseif xmlState == 'BODY'>
			
	 				<#if !customerFlag>
							<!-- 视图数据循环开始 -->
							<#list result as data>
							<Row ss:AutoFitHeight="0">
								<#list exportFieldList as item>
									<#if item?length gt 0>
							
												<#if item == 'name' || item == '*'>
													<Cell>
													<#if checkFieldPermission('name','X6Basic_1.0_test_Test','X6Basic_1.0_test_Test_name') != 0>
														<#if data.name??><Data ss:Type="String"><![CDATA[${(data.name)!}]]></Data></#if>
													</#if>
													</Cell>
												</#if>
							
									</#if>
								</#list>
							</Row>
							</#list>
							<!-- 视图数据输出结束 -->
	 			   <#else>
						<!-- 主体数据开始循环输出 -->
						<#list result as data>
						<Row ss:AutoFitHeight="0">
							<#list properties as item>
								<#if item??>
									<#if item.name?index_of(".")!=-1>
											<#assign tempRes=data />
											<#if item.columntype == 'SYSTEMCODE'>
												<#---以下需要测试--->
												<#assign itemList = item.name?split(".")  />
												<#assign itemListLength = itemList?size />
												<#list itemList as key>
													<#if key_index==itemListLength>
														<#break>
													<#else>
														<#assign tempRes=(tempRes["${key?if_exists}"])!   />
													</#if>
												</#list>
												<#assign innerTemp=tempRes />
												<#assign  displayKey="" />
												<#if !(item.multable?? && item.multable=="true")>
												<#if item.seniorsystemcode?? && item.seniorsystemcode=="true">
												    <#assign displayKey ="ForDisplay"  />
												<#else>	
													<#assign displayKey =".value"  />
												</#if>
												</#if>
												<#assign displayKey =item.name+displayKey  />
												<#list displayKey?split(".") as key>
														<#assign innerTemp=(innerTemp["${key?if_exists}"])!   />
												</#list>
											<#else >
												<#list item.name?split(".") as key>
													<#assign tempRes=(tempRes["${key?if_exists}"])!   />
												</#list>
											</#if>
											<Cell  ss:StyleID="${item.name}" >
												<#if checkFieldPermission('${(item.name)!}','X6Basic_1.0_test_Test','${(item.propertyCode)!}') != 0>
												<#if item.columntype == 'DECIMAL'>  
													<#if tempRes?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${(data["${tempRes?if_exists}"])!}</Data></#if>
												<#elseif item.columntype == 'DATETIME' >
													<#if tempRes??  ><Data ss:Type="DateTime">${(tempRes?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif item.columntype == 'DATE' >
													<#if tempRes??  ><Data ss:Type="DateTime">${(tempRes?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
											    <#elseif item.columntype == 'BOOLEAN' >
													<#if tempRes??  ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${(tempRes?string("是","否"))!}</Data></#if>
												<#elseif item.columntype == 'SYSTEMCODE'>
													<#if tempRes??  ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${getText('${(innerTemp)!}')}</Data></#if>
												<#else>
													<#if tempRes?? ><Data <#if tempRes?string!="" > ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"<#else> ss:Type="String" </#if> ><![CDATA[${tempRes!}]]></Data></#if>
												</#if>
												</#if>
											</Cell>
									<#else >
											<Cell ss:StyleID="${item.name}" >
												<#if checkFieldPermission('${(item.name)!}','X6Basic_1.0_test_Test','${(item.propertyCode)!}') != 0>
												<#if item.columntype == 'DECIMAL'>
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${(data["${item.name?if_exists}"])!}</Data></#if>
												<#elseif item.columntype == 'DATETIME' >
													<#if data[item.name]?? ><Data ss:Type="DateTime">${(data["${item.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif item.columntype == 'DATE' >
													<#if data[item.name]?? ><Data ss:Type="DateTime">${(data["${item.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
											    <#elseif item.columntype == 'BOOLEAN' >
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${(data["${item.name?if_exists}"]?string("是","否"))!}</Data></#if>
												<#elseif item.columntype == 'SYSTEMCODE'>
													<#assign innerTemp=data />
													<#assign  displayKey="" />
													<#if !(item.multable?? && item.multable=="true")>
													<#if item.seniorsystemcode?? && item.seniorsystemcode=="true">
													    <#assign displayKey ="ForDisplay"  />
													<#else>	
														<#assign displayKey =".value"  />
													</#if>
													</#if>
													<#assign displayKey =item.name+displayKey  />
													<#list displayKey?split(".") as key>
														<#assign innerTemp=(innerTemp["${key?if_exists}"])!   />
													</#list>																							
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${getText('${(innerTemp)!}')}</Data></#if>
												<#elseif item.columntype == 'ENUMERATE'>
													<#if data[item.name]?? && data[item.name]!=""><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if item.multable!false>${r'<#list'} data.${col.key} as item${r'>'}<#if col.fill.fillContent?has_content>${r'<#if item_index gt 0>,</#if>'}<#list col.fill.fillContent?keys as key>${r'<#if '}item == '${key}'>${col.fill.fillContent[key]}${r'</#if>'}</#list></#if>${r'</#list>'}<#else><#if col.fill.fillContent?has_content><#list col.fill.fillContent?keys as key>${r'<#if '}data.${col.key}?? && data.${col.key} == '${key}'>${col.fill.fillContent[key]}${r'</#if>'}</#list><#else>${r'$'}{(data.${col.key})!}</#if></#if></Data></#if>
												<#else>
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><![CDATA[${(data["${item.name?if_exists}"])!}]]></Data></#if>
												</#if>
												</#if>
											</Cell>
									</#if>
								</#if>
							</#list>
						</Row>
						</#list>
						<!-- 主体数据输出结束-->
	 			   </#if>
				<#elseif xmlState == 'END'>
		</Table>
		<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
  			<PageSetup>
				<Header x:Margin="0.511805555555556"/>
				<Footer x:Margin="0.511805555555556"/>
			</PageSetup>
			<Print>
				<HorizontalResolution>1200</HorizontalResolution>
				<VerticalResolution>1200</VerticalResolution>
			</Print>
				<Selected/>
				<PageBreakZoom>100</PageBreakZoom>
			<Panes>
				<Pane>
					<Number>3</Number>
					<ActiveRow>0</ActiveRow>
					<ActiveCol>2</ActiveCol>
					<RangeSelection>R1C3</RangeSelection>
				</Pane>
			</Panes>
			<ProtectObjects>False</ProtectObjects>
			<ProtectScenarios>False</ProtectScenarios>
		</WorksheetOptions>
		<#assign booleanIndex = 1/>
		<#list properties as item>
			<#if item.columntype == 'BOOLEAN' >
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C${booleanIndex}:R65536C${booleanIndex}</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;是,否&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
			</#if>
			<#assign booleanIndex = booleanIndex +1 />
		</#list>
	</Worksheet>
	</Workbook>
</#if>
<#macro datatype type><#if type == 'MONEY' || type == 'DECIMAL' || type== 'INTEGER' || type == 'LONG' || type == 'DATETIME' || type == 'DATE'>Number<#return></#if>String</#macro>


<#macro workerdate datetime>
	<#assign totalday = 1>
	<#assign date = datetime?split(' ')>
	<#assign dates = date[0]?split('-')>
	<#list 1900..(dates[0]?number-1) as year>
		<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
			<#assign totalday = totalday + 366>
		<#else>
			<#assign totalday = totalday + 365>
		</#if>
	</#list>
	<#if dates[1]?number != 1>
	<#list 1..(dates[1]?number-1) as month>
		<#assign year = dates[0]?number>
		<#if month == 2>
				<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
					<#assign totalday = totalday + 29>
				<#else>
					<#assign totalday = totalday + 28>
				</#if>
		<#elseif "1,3,5,7,8,10,12"?contains('${month}') >
			<#assign totalday = totalday + 31>
		<#else>
			<#assign totalday = totalday + 30>
		</#if>
	</#list>
	</#if>
	<#assign totalday = totalday + dates[2]?number>
	<#assign totaltime = 0>
	<#if (date?size>1)>
		<#assign times = date[1]?split(':')>
		<#setting number_format="0.000000000000#">
		<#assign totaltime = ((times[0]?number*60) + times[1]?number)/1440>
	</#if>${totalday + totaltime}</#macro>
						
								
								
								
