<%@page contentType="text/html; charset=gb2312"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="DBstep.iMsgServer2000.*"%>
<%@page import="DBstep.iDBManager2000.*"%>
<%@ page import="DBstep.iWebOffice" %>


<%
  iWebOffice officeServer = new iWebOffice();
  officeServer.ExecuteRun(request, response);
  out.clear();                                                                    //用于解决JSP页面中“已经调用getOutputStream()”问题
  out=pageContext.pushBody();                                                     //用于解决JSP页面中“已经调用getOutputStream()”问题
%>