<#assign exportFields = page.exportFields />
<#assign result = page.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign xmlState = xmlState>
<#assign properties = page.properties />
<#assign viewCode = 'X6Basic_1.0_ggSignetManage_Signature' />
<#assign propertyCode = '' />
<#assign customerFlag =  page.customerExport />
<#assign styleFormats =  page.styleFormats />
<#assign useForImportFlag =  page.useForImportFlag />
<#assign showCusProps =  page.showCusProps />
<#if xmlState=='START'>
<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>listExport</Author>
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
  			<Font ss:FontName="Arial" x:CharSet="134" ss:Size="10"/>
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
			<Font ss:FontName="宋体" x:CharSet="134" ss:Size="10" ss:Color="#FF0000" />
			<Interior />
			<NumberFormat />
			<Protection />
		</Style>
		<Style ss:ID="isNullable">
			<NumberFormat/>
			<Protection/>
		</Style>
		<Style ss:ID="mainVisualId">
			<NumberFormat/>
			<Protection/>
		</Style>
		<#if !customerFlag>
	  		<Style ss:ID="description">
	  			<NumberFormat/>
	  			<Protection/>
	  		</Style>
	  		<Style ss:ID="signature">
	  			<NumberFormat/>
	  			<Protection/>
	  		</Style>
	  		<Style ss:ID="staff.name">
	  			<NumberFormat/>
	  			<Protection/>
	  		</Style>
	  		
	  	<#else>
	  		<#assign notHasBK = "true">
	  		<#assign notHasMD = "true">
	  		<#if styleFormats??>
	  		<#list  styleFormats as  item>
	  		<#if item.key?? && item.key != "mainVisualId">
	  		<#if item.key == "parentNodeBusinessKey" ><#-- 节点相关列，该列的格式为文本格式 -->
	  		<#if notHasBK == "true">
	  		<Style ss:ID="${item.key}">	
	  			<Alignment />
				<Borders />
				<Font ss:FontName="宋体" x:CharSet="134" ss:Size="10" />
				<Interior />
				<NumberFormat />
				<Protection />
			</Style>	
			<#assign notHasBK = "false">
			</#if>
	  		<#elseif item.key == "parentNodeMainDisplay"  >
	  		<#if notHasMD == "true">
	  		<Style ss:ID="${item.key}">	
	  			<Alignment />
				<Borders />
				<Font ss:FontName="宋体" x:CharSet="134" ss:Size="10" />
				<Interior />
				<NumberFormat />
				<Protection />
			</Style>		
			<#assign notHasMD = "false">
			</#if>
			<#else>	
	  		<Style ss:ID="${item.key}">
	  			<#if  item.propType?? >
		  			<#if item.propType == "SYSTEMCODE"><#-- 系统编码时，该列的格式为文本格式 -->
		  				<Interior/>
						<NumberFormat ss:Format="@"/>
		  			<#else>
			  			<#if item['format']?? && item.propType != "DECIMAL">
			  			<NumberFormat ss:Format="${item['format']}"/>
			  			<#else>
			  			<NumberFormat/>
			  			</#if>
			  			<Protection/>
			  		</#if>	
			  	<#else>
			  		<#if item['format']?? && item.propType != "DECIMAL">
			  			<NumberFormat ss:Format="${item['format']}"/>
			  			<#else>
			  			<NumberFormat/>
			  			</#if>
			  			<Protection/>	
		  		</#if>	
	  		</Style>
	  		</#if>
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
											<#if item == 'staff.name' || item == '*'>
														<Column ss:Index="${count}" ss:StyleID="${item}"   ss:Width="140"/>
													<#assign count = count + 1>
											</#if>
											<#if item == 'description' || item == '*'>
														<Column ss:Index="${count}" ss:StyleID="${item}"   ss:Width="70"/>
													<#assign count = count + 1>
											</#if>
											<#if item == 'signature' || item == '*'>
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
			 							<#assign customGeneratedFlag=false />
											<#if item == 'staff.name' || item == '*'>
													<Cell><Data ss:Type="String">${getText('foundation.staff.dimissionStaff_xls.staffName')}</Data></Cell>
											</#if>
			 							<#assign customGeneratedFlag=false />
											<#if item == 'description' || item == '*'>
													<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.radion1385014251629')}</Data></Cell>
											</#if>
			 							<#assign customGeneratedFlag=false />
											<#if item == 'signature' || item == '*'>
													<Cell><Data ss:Type="String">${getText('X6Basic.propertydisplayName.radion1385455235403')}</Data></Cell>
											</#if>
			 							<#assign customGeneratedFlag=false />
			 			
										
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
													<Cell   <#if useForImportFlag??&&useForImportFlag ><#if headName.nullable??&&headName.nullable=="false">ss:StyleID="unNullable"<#else>ss:StyleID="isNullable"</#if></#if> >
													   <Data ss:Type="String">${display?substring(0,display?length-1)}</Data>
													     <#if useForImportFlag??&&useForImportFlag >
													     <Comment ss:Author="">
													            <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
													            	${headName.propertyCode}
													            </ss:Data>
												         </Comment>
												         </#if>
													</Cell>
												<#else >
													<Cell <#if useForImportFlag??&&useForImportFlag ><#if headName.nullable??&&headName.nullable=="false">ss:StyleID="unNullable"<#else>ss:StyleID="isNullable"</#if></#if> >
														 <Data ss:Type="String">${getText(headName.dispalyName!'')}</Data>
														 <#if useForImportFlag??&&useForImportFlag >
														 <Comment ss:Author="">
													            <ss:Data xmlns="http://www.w3.org/TR/REC-html40">
													            	<#if useForImportFlag??&&useForImportFlag&& headName.isCustom??&&headName.isCustom=='true'&& headName.customPropImportCode?? && headName.customPropImportCode!="undefined">
														            		${headName.customPropImportCode}
														            <#else>
														           	 		${headName.propertyCode}
														            </#if>
													            </ss:Data>
													     </Comment>
													     </#if>
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
												<#if item == 'staff.name' || item == '*'>
													<Cell>
													
														<#if data.staff.name??><Data ss:Type="String"><![CDATA[${(data.staff.name)!}]]></Data></#if>
													
													</Cell>
												</#if>
												<#if item == 'description' || item == '*'>
													<Cell>
													
														<#if data.description??><Data ss:Type="String"><![CDATA[${(data.description)!}]]></Data></#if>
													
													</Cell>
												</#if>
												<#if item == 'signature' || item == '*'>
													<Cell>
													
														<#if data.signature??><Data ss:Type="String"><![CDATA[${(data.signature)!}]]></Data></#if>
													
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
											<#assign lastIndexDateName = ''/>
											<#if item.columntype == 'SYSTEMCODE'>
												<#---以下需要测试--->
												<#assign itemList = item.name?split(".")  />
												<#assign itemListLength = itemList?size />
												<#list itemList as propName>
													<#if propName_index==itemListLength>
														<#break>
													<#else>
														<#assign tempRes=(tempRes["${propName?if_exists}"])!   />
													</#if>
												</#list>
												<#assign innerTemp=tempRes />
												<#assign  displayKey="" />
												<#if !(item.multable?? && item.multable=="true")>
												<#if item.seniorsystemcode?? && item.seniorsystemcode=="true">
												    <#assign displayKey ="ForDisplay"  />
												    <#assign displayKey =item.name+displayKey  />
													<#list displayKey?split(".") as propName>
															<#assign innerTemp=(innerTemp["${propName?if_exists}"])!   />
													</#list>
												<#else>	
													<#--<#assign displayKey =".value"  />-->
													<#assign innerTemp=(innerTemp["value"])!/>
												</#if>
												</#if>
											<#elseif item.columntype == 'DATETIME'>
												<#assign itemList = item.name?split(".")  />
												<#assign itemListLength = itemList?size />
												<#list itemList as propName>
													<#if propName_index==itemListLength-1>
														<#assign lastIndexDateName=propName!   />
													<#else>
														<#assign tempRes=(tempRes["${propName?if_exists}"])!   />
													</#if>
												</#list>
											<#elseif item.columntype == 'DATE'>
												<#assign itemList = item.name?split(".")  />
												<#assign itemListLength = itemList?size />
												<#list itemList as propName>
													<#if propName_index==itemListLength-1>
														<#assign lastIndexDateName=propName!   />
													<#else>
														<#assign tempRes=(tempRes["${propName?if_exists}"])!   />
													</#if>
												</#list>
											<#else>
												<#list item.name?split(".") as propName>
													<#assign tempRes=(tempRes["${propName?if_exists}"])!   />
												</#list>
											</#if>
											<Cell  ss:StyleID="${item.styleid}" >
												
												<#if item.columntype == 'DECIMAL'>  
													<#if tempRes?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><![CDATA[${tempRes!}]]></Data></#if>
												<#elseif item.columntype == 'DATETIME' >
													<#--<#if tempRes?? ><Data ss:Type="DateTime">${(tempRes?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>	-->
													<#if tempRes[lastIndexDateName]?? ><Data ss:Type="DateTime">${(tempRes["${lastIndexDateName}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif item.columntype == 'DATE' >
													<#--<#if tempRes?? ><Data ss:Type="DateTime">${(tempRes?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>	-->
													<#if tempRes[lastIndexDateName]?? ><Data ss:Type="DateTime">${(tempRes["${lastIndexDateName}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
											    <#elseif item.columntype == 'BOOLEAN' >
													<#if tempRes?? && tempRes?string!="" ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if lang?? && lang?lower_case == 'en_us'>${(tempRes?string("Yes","No"))!}<#else>${(tempRes?string("是","否"))!}</#if></Data></#if>
												<#elseif item.columntype == 'SYSTEMCODE'>
													<#if item.multable == "true">
														<#if innerTemp?starts_with(',')>
															<#assign innerTemp= innerTemp?substring(1) />
														</#if>
														<#if innerTemp?ends_with(',')>
															<#assign innerTemp= innerTemp?substring(0,innerTemp?length-1) />
														</#if>
													</#if>
													<#if tempRes??  ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${getText('${(innerTemp)!}')}</Data></#if>
												<#else>
													<#if tempRes?? ><Data <#if tempRes?string!="" > ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"<#else> ss:Type="String" </#if> ><![CDATA[${tempRes!}]]></Data></#if>
												</#if>
												
											</Cell>
									<#else >
											<Cell ss:StyleID="${item.styleid}" >
												
												<#if item.columntype == 'DECIMAL'>
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>">${(data["${item.name?if_exists}"])!}</Data></#if>
												<#elseif item.columntype == 'DATETIME' >
													<#if data[item.name]?? ><Data ss:Type="DateTime">${(data["${item.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
												<#elseif item.columntype == 'DATE' >
													<#if data[item.name]?? ><Data ss:Type="DateTime">${(data["${item.name?if_exists}"]?string("yyyy-MM-dd'T'HH:mm:ss.SSS"))!}</Data></#if>
											    <#elseif item.columntype == 'BOOLEAN' >
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if lang?? && lang?lower_case == 'en_us'>${(data["${item.name?if_exists}"]?string("Yes","No"))!}<#else>${(data["${item.name?if_exists}"]?string("是","否"))!}</#if></Data></#if>
												<#elseif item.columntype == 'SYSTEMCODE'>
													<#if item.isCustom??&&item.isCustom=='true' >
														<#if (data['attrMap']['${item.name?if_exists}'])?? && (data['attrMap']['${item.name?if_exists}'])?has_content>
															<#assign attrMapVal = "${(data['attrMap']['${item.name?if_exists}'][0])!}"  />
														<#else>
															<#assign attrMapVal = "" />
														</#if>
														<#if item.multable == "true">
															<#if attrMapVal?starts_with(',')>
																<#assign attrMapVal= attrMapVal?substring(1) />
															</#if>
															<#if attrMapVal?ends_with(',')>
																<#assign attrMapVal= attrMapVal?substring(0,attrMapVal?length-1) />
															</#if>
														</#if>
														<Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if attrMapVal?? ><![CDATA[${attrMapVal}]]><#else><![CDATA[${(data["${item.name?if_exists}"])!}]]></#if></Data>
													<#else>
														<#assign innerTemp=data />
														<#assign  displayKey="" />
														<#if !(item.multable?? && item.multable=="true")>
															<#if item.seniorsystemcode?? && item.seniorsystemcode=="true">
															    <#assign displayKey ="ForDisplay"  />
															<#else>	
																<#assign displayKey =".value"  />
															</#if>
														<#else>
															<#assign displayKey ="ForDisplay"  />
														</#if>
														<#assign displayKey =item.name+displayKey  />
														<#list displayKey?split(".") as key>
															<#assign innerTemp=(innerTemp["${key?if_exists}"])!   />
														</#list>
														<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if item.multable == "true"><#if innerTemp?starts_with(',')><#assign innerTemp= innerTemp?substring(1) /></#if><#if innerTemp?ends_with(',')><#assign innerTemp= innerTemp?substring(0,innerTemp?length-1) /></#if></#if>${getText('${(innerTemp)!}')}</Data></#if>
													</#if>			
												<#elseif item.columntype == 'ENUMERATE'>
													<#if data[item.name]?? && data[item.name]!=""><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><![CDATA[<#list item.fillContent?keys as keyval><#if data["${item.name?if_exists}"]?contains(keyval)>${item.fillContent[keyval]} </#if></#list>]]></Data></#if>
												<#elseif item.columntype == 'OBJECT'>
													<#if item.isCustom??&&item.isCustom=='true' >
														<#if useForImportFlag??&&useForImportFlag>
															<#assign attrMapVal="${(data['attrMap']['${item.name?if_exists}'][1])!}"  />
														<#else>
															<#assign attrMapVal="${(data['attrMap']['${item.name?if_exists}'][0])!}"  />
														</#if>
														<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><#if attrMapVal?? ><![CDATA[${attrMapVal}]]><#else><![CDATA[${(data["${item.name?if_exists}"])!}]]></#if></Data></#if>
													<#else>
														<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><![CDATA[${(data["${item.name?if_exists}"])!}]]></Data></#if>
													</#if>
												<#else>
													<#if data[item.name]?? ><Data ss:Type="<@datatype type='${(item.columntype)!Text}'></@datatype>"><![CDATA[${(data["${item.name?if_exists}"])!}]]></Data></#if>
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
						<#if lang?? && lang?lower_case == 'en_us'>
						<Value>&quot;Yes,No&quot;</Value>
						<#else>
						<Value>&quot;是,否&quot;</Value>
						</#if>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
			<#elseif item.columntype == 'SYSTEMCODE' && item.selectValue?? && item.selectValue != ''><#-- 如果是系统编码，设置下拉框 -->
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C${booleanIndex}:R65536C${booleanIndex}</Range>
						<Type>List</Type>
						<CellRangeList />
						<Value>&quot;${item.selectValue}&quot;</Value>
						<ErrorStyle>Stop</ErrorStyle>
					</DataValidation>
			<#elseif item.columntype == 'DATE' || item.columntype == 'DATETIME'><#-- 如果是时间，设置格式验证，同时输入时间不能大于9999-12-31 -->
				<DataValidation xmlns="urn:schemas-microsoft-com:office:excel">
						<Range>R2C${booleanIndex}:R65536C${booleanIndex}</Range>
						<Type>Date</Type>
						<Qualifier>Less</Qualifier>
						<Value>2958465</Value>
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
						
								
								
								
