/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.X6Basic.services.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.binary.Base64;
import org.osgi.service.event.Event;
import org.osgi.service.event.EventConstants;
import org.osgi.service.event.EventHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.services.X6BasicEventHandler;
import com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService;
import com.supcon.orchid.X6Basic.services.X6BasicSyncLogService;
import com.supcon.orchid.foundation.entities.Department;
import com.supcon.orchid.foundation.entities.Position;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.notification.Notification;
import com.supcon.orchid.notification.NotificationException;
import com.supcon.orchid.notification.NotificationService;
import com.supcon.orchid.orm.entities.ICompany;
import com.supcon.orchid.orm.entities.IDepartment;
import com.supcon.orchid.orm.entities.IPosition;
import com.supcon.orchid.orm.entities.IStaff;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.utils.AESCoder;
import com.supcon.orchid.utils.BAPEventPublisher;

/**
 * X6基础事件监听器
 * 
 * @author zhuyuyin
 * @version 1.0
 */
@Service("x6BasicEventHandler")
public class X6BasicEventHandlerImp  extends BaseServiceImpl implements X6BasicEventHandler,  EventHandler {
	private static Logger logger = LoggerFactory.getLogger(X6BasicEventHandlerImp.class);
	/**
	 * 新增用户topic
	 */
	private static final String EVENT_USER_ADD_TOPIC = "com/supcon/orchid/entities/sync/user/add";
	private static final String EVENT_USER_MODIFY_TOPIC = "com/supcon/orchid/entities/sync/user/modify";
	private static final String EVENT_USER_DELETE_TOPIC = "com/supcon/orchid/entities/sync/user/delete";
	@Autowired
	private UserService userService;
	@Autowired
	private X6BasicSyncConfigsService syncConfigsService;
	
	private PasswordEncoder passwordEncoder;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private X6BasicSyncLogService syncLogService;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public PasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}
	@Autowired(required = false)
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	@Override
	public void syncBBs(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log){
		
		String email=staff.getEmail();
		if(email==null || email.length()==0){
			String domain=syncConfig.getEmailDomain();
			String mailDomain=getSecDomain(domain);
			email=user.getName()+"@"+mailDomain;
		}
		String userName=user.getName();
		String bbsUrl = syncConfig.getBbsDataSourse();
		String bbsUserName = syncConfig.getBbsUserName();
		String bbsPsw = syncConfig.getBbsPassword();
		String alias=syncConfig.getBbsAlias();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			Class.forName(com.mysql.jdbc.Driver.class.getName());
			connection = DriverManager.getConnection(bbsUrl, bbsUserName, bbsPsw);
			if (null == connection) {
					return ;	
			}
			String newPassword=new String(org.springframework.security.core.codec.Hex.encode(org.springframework.security.core.codec.Base64.decode(user.getPassword().getBytes())));
			String rdString=randomString(6).toLowerCase();
			
			newPassword=passwordEncoder.encodePassword(newPassword+rdString, null);
			String pass=new String(org.springframework.security.core.codec.Hex.encode(org.springframework.security.core.codec.Base64.decode(newPassword.getBytes())));
			
			if(EVENT_USER_ADD_TOPIC.equals(topic)){
				String maxSql="select MAX(uid) + 1 as MaxUid from "+alias+"common_member where uid > 0 "; 
				ps = connection.prepareStatement(maxSql);
				ResultSet resutlSet=ps.executeQuery(maxSql);
				Long maxId=1L;
				if(resutlSet.next()){
					maxId=resutlSet.getLong(1);
				}
				
				String insertSql1="INSERT INTO  "+alias+"common_member (uid,email,username,password,status,emailstatus,avatarstatus,videophotostatus,adminid,groupid,groupexpiry,extgroupids,regdate,credits,notifysound,timeoffset,newpm,newprompt,accessmasks,allowadmincp,onlyacceptfriendpm,conisbind) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
				ps = connection.prepareStatement(insertSql1);
				ps.setLong(1,  maxId);
				ps.setString(2, email);
				ps.setString(3, userName);
				ps.setString(4, pass);
				ps.setInt(5,  0);
				ps.setInt(6, 0);
				ps.setInt(7, 0);
				ps.setInt(8, 0);
				ps.setInt(9,  0);
				ps.setInt(10, 10);
				ps.setInt(11,  0);
				ps.setString(12, "");
				ps.setInt(13, 1372251301);
				ps.setInt(14,  0);
				ps.setInt(15, 0);
				ps.setString(16, "9999");
				ps.setInt(17,  0);
				ps.setInt(18,  0);
				ps.setInt(19,  0);
				ps.setInt(20,  0);
				ps.setInt(21,  0);
				ps.setInt(22,  0);
				ps.executeUpdate();
				
				String insertSql2="INSERT INTO "+alias+"ucenter_members (uid,username,password,email,myid,myidkey,regip,regdate,lastloginip,lastlogintime,salt,secques) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";	
				ps = connection.prepareStatement(insertSql2);
				ps.setLong(1,  maxId);
				ps.setString(2, userName);
				ps.setString(3, pass);
				ps.setString(4, email);
				ps.setString(5,  "");
				ps.setString(6, "");
				ps.setString(7, "");
				ps.setInt(8, 1372251301);
				ps.setInt(9,  0);
				ps.setInt(10, 0);
				ps.setString(11, rdString);
				ps.setString(12, "");
				ps.executeUpdate();
				//	BBS_Sql.execute('INSERT INTO bbs_common_member (uid,email,username,password,status,emailstatus,avatarstatus,videophotostatus,adminid,groupid,groupexpiry,extgroupids,regdate,credits,notifysound,timeoffset,newpm,newprompt,accessmasks,allowadmincp,onlyacceptfriendpm,conisbind) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
				//	[MaxUid,BBSEmail,User_Name,87d97d2e2b99660b4b5ffaed74b0fc0b',0,0,0,0,0,10,0,'',1372251301,0,0,'9999',0,0,0,0,0,0]);	
				
				//BBS_Sql.execute('INSERT INTO bbs_ucenter_members (uid,username,password,email,myid,myidkey,regip,regdate,lastloginip,lastlogintime,salt,secques) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)',
				//[MaxUid,User_Name,'8249fde4b796653cc64693e9c3f366db',BBSEmail,'','','192.168.2.165',1372427857,0,0,'d55668','']);	
					
				
			}else if(EVENT_USER_MODIFY_TOPIC.equals(topic)){
				String usql="update "+alias+"common_member set password=? where username=?";
				ps = connection.prepareStatement(usql);
				ps.setString(1,  pass);
				ps.setString(2, userName);
				ps.executeUpdate();
				
				String usql2="update "+alias+"ucenter_members set password=?,salt=? where username=?";
				ps = connection.prepareStatement(usql2);
				ps.setString(1,  pass);
				ps.setString(2, rdString);
				ps.setString(3, userName);
				ps.executeUpdate();
			}else if(EVENT_USER_DELETE_TOPIC.equals(topic) && syncConfig.getBbsDeleteSync()){
				String deleteSql="delete from "+alias+"ucenter_members where username=?";
				ps = connection.prepareStatement(deleteSql);
				ps.setString(1, userName);
				ps.executeUpdate();
			}
							
		} catch (ClassNotFoundException e) {
			logger.error(e.getMessage(), e);
			log.setBbsFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append(" ---------------BBS  LOG----------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
		} catch (SQLException e) {
			log.setBbsFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append(" ---------------BBS  LOG----------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
			logger.error(e.getMessage(), e);
		} catch (NotificationException e) {
			log.setBbsFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append(" ---------------BBS  LOG----------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
			logger.error(e.getMessage(), e);
		} finally {
			try {
				if (null != ps && !ps.isClosed()) {
					ps.close();
				}
				if (null != connection && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				log.setBbsFlag(true);
				StringBuilder sb =new StringBuilder();
				if(log.getLog()!=null && log.getLog().length()>0){
					sb.append(log.getLog());
					sb.append("\n");
				}
				
				sb.append(" ---------------BBS  LOG----------------\n");
				sb.append(e.getMessage().toString());
				log.setLog(sb.toString());
				logger.error(e.getMessage(), e);
			}
		}
		
	}
	@Override
	public void syncPandion(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log){
		
		String userName=user.getName();
		String pdUrl = syncConfig.getPandionDataSourse();
		String pdUserName = syncConfig.getPandionUserName();
		String pdPsw = syncConfig.getPandionPassword();
		String newPassword="";
		if(user.getSyncPassword()!=null){
			String syncPass=user.getSyncPassword();
			byte[]  pppp=AESCoder.decrypt(Base64.decodeBase64(syncPass), "orchid".getBytes());
			 newPassword=new String(pppp);
		}
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			Class.forName(com.mysql.jdbc.Driver.class.getName());
			connection = DriverManager.getConnection(pdUrl, pdUserName, pdPsw);
			if (null == connection) {
					return ;	
			}
			if(EVENT_USER_ADD_TOPIC.equals(topic)){
										
				String insertSql3="INSERT INTO OFUSER (USERNAME,NAME,PLAINPASSWORD,CREATIONDATE,MODIFICATIONDATE) VALUES (?,?,?,?,?)";	
				ps = connection.prepareStatement(insertSql3);
				ps.setString(1,userName);
				ps.setString(2,staff.getName());
				ps.setString(3,newPassword);
				ps.setString(4, String.valueOf(new Date().getTime()));
				ps.setString(5, String.valueOf(new Date().getTime()));
														
				ps.executeUpdate();
				
				String insertSql4="INSERT INTO OFVCARD (USERNAME,VCARD) VALUES (?,?)";	
				ps = connection.prepareStatement(insertSql4);
				ps.setString(1,  userName);
				StringBuilder sb=new StringBuilder();
				sb.append("<vCard xmlns='vcard-temp'><FN/><N><GIVEN>");
				sb.append(staff.getName());
				sb.append("</GIVEN><FAMILY/><MIDDLE/></N><NICKNAME/><URL/><BDAY/><AGE/><GENDER/><MARITALSTATUS/><LOCATION/><WORKCELL/><HOMECELL/><ORG><ORGNAME/><ORGUNIT/></ORG><TITLE/><ROLE/><TEL><HOME/><VOICE/><NUMBER/></TEL><TEL><HOME/><FAX/><NUMBER/></TEL><TEL><HOME/><MSG/><NUMBER/></TEL><ADR><HOME/><EXTADD/><STREET/><LOCALITY/><REGION/><PCODE/><COUNTRY/></ADR><TEL><WORK/><VOICE/><NUMBER/></TEL><TEL><WORK/><FAX/><NUMBER/></TEL><TEL><WORK/><MSG/><NUMBER/></TEL><ADR><WORK/><EXTADD/><STREET/><LOCALITY/><REGION/><PCODE/><COUNTRY/></ADR><EMAIL><INTERNET/><PREF/><USERID/></EMAIL><EMAIL><INTERNET/><USERID/></EMAIL><DESC/><JABBERID/></vCard>");
				ps.setString(2, sb.toString());
				ps.executeUpdate();
				
				String insertSql5="INSERT INTO OFGROUPUSER (GROUPNAME,USERNAME,ADMINISTRATOR) VALUES (?,?,?)";
				ps = connection.prepareStatement(insertSql5);
				if(staff.getMainPosition()!=null){
					Position position=(Position)staff.getMainPosition();
					Department dept=position.getDepartment();
					ps.setString(1,  dept.getName());
				}else{
					ps.setString(1,  "");	
				}
				
				ps.setString(2, staff.getName());
				ps.setInt(3, 0);
				ps.executeUpdate();
				 /* Pandion_Sql.execute('INSERT INTO OFUSER (USERNAME,NAME,ENCRYPTEDPASSWORD,CREATIONDATE,MODIFICATIONDATE) VALUES (?,?,?,?,?)',
				[User_Name,Staff_Name,'8c69cfe2cfc4dc8d7e645e33aae66c6e','001385359682738','001385359682738']);	
	  Pandion_Sql.execute('INSERT INTO OFVCARD (USERNAME,VCARD) VALUES (?,?)',
				[User_Name,'<vCard xmlns="vcard-temp"><FN/><N><GIVEN>'+Staff_Name + '</GIVEN><FAMILY/><MIDDLE/></N><NICKNAME/><URL/><BDAY/><AGE/><GENDER/><MARITALSTATUS/><LOCATION/><WORKCELL/><HOMECELL/><ORG><ORGNAME/><ORGUNIT/></ORG><TITLE/><ROLE/><TEL><HOME/><VOICE/><NUMBER/></TEL><TEL><HOME/><FAX/><NUMBER/></TEL><TEL><HOME/><MSG/><NUMBER/></TEL><ADR><HOME/><EXTADD/><STREET/><LOCALITY/><REGION/><PCODE/><COUNTRY/></ADR><TEL><WORK/><VOICE/><NUMBER/></TEL><TEL><WORK/><FAX/><NUMBER/></TEL><TEL><WORK/><MSG/><NUMBER/></TEL><ADR><WORK/><EXTADD/><STREET/><LOCALITY/><REGION/><PCODE/><COUNTRY/></ADR><EMAIL><INTERNET/><PREF/><USERID/></EMAIL><EMAIL><INTERNET/><USERID/></EMAIL><DESC/><JABBERID/></vCard>']);
	  Pandion_Sql.execute('INSERT INTO OFGROUPUSER (GROUPNAME,USERNAME,ADMINISTRATOR) VALUES (?,?,?)',
				[Dept_Name,User_Name,0]);	*/
				
			}else if(EVENT_USER_MODIFY_TOPIC.equals(topic)){
				String usql4="update OFUSER set ENCRYPTEDPASSWORD=null ,PLAINPASSWORD=? where username=?";
				ps = connection.prepareStatement(usql4);
				ps.setString(1,  newPassword);
				ps.setString(2, userName);
				ps.executeUpdate();
			
			}else if(EVENT_USER_DELETE_TOPIC.equals(topic) && syncConfig.getPandionDelSync()){
				
				String deleteSql="delete from OFUSER where username=?";
				ps = connection.prepareStatement(deleteSql);
				ps.setString(1, userName);
				ps.executeUpdate();
			}
			
		} catch (ClassNotFoundException e) {
			logger.error(e.getMessage(), e);
			log.setPandionFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			                 
			sb.append("-------------PANDION LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
		} catch (SQLException e) {
			logger.error(e.getMessage(), e);
			log.setPandionFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append("-------------PANDION LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
		} catch (NotificationException e) {
			logger.error(e.getMessage(), e);
			log.setPandionFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append("-------------PANDION LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
		} finally {
			try {
				if (null != ps && !ps.isClosed()) {
					ps.close();
				}
				if (null != connection && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				log.setBbsFlag(true);
				StringBuilder sb =new StringBuilder();
				if(log.getLog()!=null && log.getLog().length()>0){
					sb.append(log.getLog());
					sb.append("\n");
				}
				
				sb.append("-------------PANDION LOG-------------\n");
				sb.append(e.getMessage().toString());
				log.setLog(sb.toString());
				logger.error(e.getMessage(), e);
			}
		}
		
	}
	@Override
	public void syncEmail(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log){
		String userName=user.getName();
		String url = syncConfig.getEmailDataSourse();
	//	String dbName = mailServer.getDbName();
		String dbUserName = syncConfig.getEmailUserName();
		String psw = syncConfig.getEmailPassword();
		String domain=syncConfig.getEmailDomain();
		//String dirverName = "com.mysql.jdbc.Driver";
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			//String dirverName = "com.mysql.jdbc.Driver";
			Class.forName(com.mysql.jdbc.Driver.class.getName());
			//Class.forName(dirverName);
			connection = DriverManager.getConnection(url, dbUserName, psw);
			if (null == connection) {
					return ;	
			}
			String newPassword=new String(org.springframework.security.core.codec.Hex.encode(org.springframework.security.core.codec.Base64.decode(user.getPassword().getBytes())));
			
			//String domain = email.substring(email.lastIndexOf("@") + 1);
			String mailDomain=getSecDomain(domain);
			String email=userName+"@"+mailDomain;
			if(EVENT_USER_ADD_TOPIC.equals(topic)){
				String sql = "insert into mailbox(username,uid,password,name,maildir,homedir,domain,active,createdate,chinesename) values(?,?,?,?,?,?,?,?,?,?)";
				ps = connection.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, userName);
				ps.setString(3, newPassword);
				ps.setString(4, userName);
				ps.setString(5, domain + "/" + userName + "/Maildir");
				ps.setString(6, domain + "/" + userName);
				ps.setString(7, domain);
				ps.setInt(8, 1);
				ps.setTimestamp(9, new Timestamp(new Date().getTime()));

				ps.setString(10, staff.getName());
				ps.executeUpdate();
				String emailContent = new String("欢迎使用新邮箱");
				Notification emailNotification = notificationService.createNotification(Notification.EMAIL_TYPE, new String[] { email }, "欢迎邮件",
						emailContent, "", null);
				notificationService.send(emailNotification);
				
			}else if(EVENT_USER_MODIFY_TOPIC.equals(topic)){
				String sql="update mailbox set password=? where username=? and uid=?";
				ps = connection.prepareStatement(sql);
				ps.setString(1,  newPassword);
				ps.setString(2, email);
				ps.setString(3, userName);
				ps.executeUpdate();
			}else if (EVENT_USER_DELETE_TOPIC.equals(topic) ){
				String delSql="delete from  mailbox  where username=? and uid=?";
				ps = connection.prepareStatement(delSql);
				ps.setString(1, email);
				ps.setString(2, userName);
				ps.executeUpdate();
			}
			
		} catch (ClassNotFoundException e) {
			logger.error(e.getMessage(), e);
			log.setEmailFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			sb.append("---------------EMAIL LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
		} catch (SQLException e) {
			log.setEmailFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append("---------------EMAIL LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
			logger.error(e.getMessage(), e);
		} catch (NotificationException e) {
			log.setEmailFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append("---------------EMAIL LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			log.setEmailFlag(true);
			StringBuilder sb =new StringBuilder();
			if(log.getLog()!=null && log.getLog().length()>0){
				sb.append(log.getLog());
				sb.append("\n");
			}
			
			sb.append("---------------EMAIL LOG-------------\n");
			sb.append(e.getMessage().toString());
			log.setLog(sb.toString());
			logger.error(e.getMessage(), e);
		} finally {
			try {
				if (null != ps && !ps.isClosed()) {
					ps.close();
				}
				if (null != connection && !connection.isClosed()) {
					connection.close();
				}
			} catch (SQLException e) {
				log.setBbsFlag(true);
				StringBuilder sb =new StringBuilder();
				if(log.getLog()!=null && log.getLog().length()>0){
					sb.append(log.getLog());
					sb.append("\n");
				}
				
				sb.append("---------------EMAIL LOG-------------\n");
				sb.append(e.getMessage().toString());
				log.setLog(sb.toString());
				logger.error(e.getMessage(), e);
			}
		}
		
		
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see org.osgi.service.event.EventHandler#handleEvent(org.osgi.service.event.Event)
	 */
	@Override
	public void handleEvent(Event event) {
		String topic = (String) event.getProperty(EventConstants.EVENT_TOPIC);
		if (EVENT_USER_ADD_TOPIC.equals(topic) || EVENT_USER_MODIFY_TOPIC.equals(topic) || EVENT_USER_DELETE_TOPIC.equals(topic)) {
			Object[] mainEntity = (Object[]) event.getProperty(EventConstants.EVENT);
			if ( mainEntity == null)
				return;
			Staff staff = (Staff) mainEntity[0];
			if (null != staff) {
				User user = staff.getUser();
				if (null == user || null == user.getName()) {
					user = userService.getUserByStaff(staff);
				}
				if (null != user) {
					List<X6BasicSyncConfigs> syncList = syncConfigsService.getSyncConfigss(" valid=true",null);
					
					if (null == syncList || syncList.isEmpty()) {
						return ;
					}
					/*if (dbType.getCode().equals("MySQL")) {
					dirverName = "com.mysql.jdbc.Driver";
					} else if (dbType.getCode().equals("Oracle")) {
						dirverName = "oracle.jdbc.driver.OracleDriver";
					} else if (dbType.getCode().equals("MSSQL")) {
						dirverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
					} else {
						dirverName = "com.mysql.jdbc.Driver";
					}*/
					
					X6BasicSyncLog log=new  X6BasicSyncLog();
					log.setSyncStaff(staff);
					log.setSyncPassword(user.getSyncPassword());
					log.setValid(true);
					log.setUserName(user.getUsername());
					log.setEventTopic(topic);
					
					X6BasicSyncConfigs syncConfig = syncList.get(0);
					//同步email
					if(syncConfig.getSyncEmailFlag()!=null&&syncConfig.getSyncEmailFlag()){
						syncEmail(syncConfig, topic, user, staff,log);
					}
					//同步bbs
					if(syncConfig.getSyncBBSFlag()!=null&&syncConfig.getSyncBBSFlag()){
						syncBBs(syncConfig, topic, user, staff,log);
					}
					//同步pandion
					if(syncConfig.getSyncPandionFlag()!=null&&syncConfig.getSyncPandionFlag()){
						syncPandion(syncConfig, topic, user, staff,log);
					}
					if(log.getBbsFlag() || log.getEmailFlag() || log.getPandionFlag()){
						Staff dealStaff = null;
						ICompany sessionCompany = null;
						if (event.getProperty("company") != null) {
							sessionCompany = (ICompany) event.getProperty("company");
						}
						if (event.getProperty("dealUser") != null) {
							User dealUser = (User) event.getProperty("dealUser");
							dealStaff = (dealUser != null) ? dealUser.getStaff() : null;
						}
						
						log.setCreateTime(new Date());
						log.setCid(sessionCompany.getId());
						if(dealStaff!=null){
							log.setCreateStaff(dealStaff);
							log.setCreateStaffId(dealStaff.getId());
							log.setOwnerStaff(dealStaff);
							log.setOwnerStaffId(dealStaff.getId());
							IPosition p=dealStaff.getMainPosition();
							if(p!=null){
								log.setCreatePosition(p);
								log.setOwnerPosition(p);
								log.setCreatePositionId(p.getId());
								log.setOwnerPositionId(p.getId());
							}
							
							if(dealStaff.getMainPosition()!=null){
								IDepartment dept=dealStaff.getMainPosition().getDepartment();
								if(dept!=null){
									log.setCreateDepartmentId(dept.getId());
								}
								log.setOwnerDepartment(dept);
								log.setOwnerDepartmentId(dept.getId());
							}
						}
						
						
						
						syncLogService.saveSyncLog(log, null);
					}

					}
				}
			}
		}
	private static Random randGen = null;
	private static char[] numbersAndLetters = null;

	public static final String randomString(int length) {
	         if (length < 1) {
	             return null;
	         }
	         if (randGen == null) {
	                randGen = new Random();
	                numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
	                   "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                  //numbersAndLetters = ("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	                 }
	         char [] randBuffer = new char[length];
	         for (int i=0; i<randBuffer.length; i++) {
	             randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
	          //randBuffer[i] = numbersAndLetters[randGen.nextInt(35)];
	         }
	         return new String(randBuffer);
	}
	
	
	public static final String getSecDomain(String url){
		Pattern p = Pattern.compile("(?<=http://|\\.)[^.]*?\\.(com|cn|net|org|biz|info|cc|tv)",Pattern.CASE_INSENSITIVE);
		Matcher matcher = p.matcher(url);
		matcher.find();
		return matcher.group();
		
	}
	
	
	
	
		public static void main(String[] args) {
			Connection connection = null;
			PreparedStatement ps = null;
				try {
					Class.forName(com.mysql.jdbc.Driver.class.getName());
					connection = DriverManager.getConnection("jdbc:mysql://192.168.90.62:3306/extmail", "root", "111111");
					System.out.println("xxxxxxxxxxx");
					String sql = "insert into mailbox(username,uid,password,name,maildir,homedir,domain,active,createdate,chinesename) values(?,?,?,?,?,?,?,?,?,?)";
					ps = connection.prepareStatement(sql);
					ps.setString(1, "qy99@emos.com");
					ps.setString(2,  "qy99");
					ps.setString(3, "c4ca4238a0b923820dcc509a6f75849b");
					ps.setString(4, "qy99");
					ps.setString(5,  "ml2.emos.com/qy99/Maildir");
					ps.setString(6,  "ml2.emos.com/qy99");
					ps.setString(7, "ml2.emos.com");
					ps.setInt(8, 1);
					ps.setTimestamp(9, new Timestamp(new Date().getTime()));
					/*byte[] a= "柳申洪".getBytes("utf-8");
					String b = new String(a,"latin1");
					byte[] c = b.getBytes("Latin1");
					String str=new String(c,"Latin1");
					System.out.println(str);*/
					ps.setString(10, "柳申洪");
					ps.executeUpdate();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					if(connection!=null){
						try {
							connection.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				//Class.forName(dirverName);
				
		}
		@Override
		public void setBAPEventPublisher(String event, Object[] objs,
				Map<String, Object> properties,boolean syncFlag) throws BAPException {
			Map<String, Object> props = new Hashtable<String, Object>();
			if (null != properties && !properties.isEmpty()) {
				Set<String> names = properties.keySet();
				for (String name : names) {
					if (!EventConstants.EVENT.equals(name) && !EventConstants.EVENT_TOPIC.equals(name) && properties.get(name) != null) {
						props.put(name, properties.get(name));
					}
				}
			}
			if (props.get("company") == null) {
				if (getCurrentCompany() != null) {
					props.put("company", getCurrentCompany());
				}
			}
			if (props.get("dealUser") == null) {
				if (getCurrentUser() != null) {
					props.put("dealUser", getCurrentUser());
				}
			}
			try {
					if(syncFlag){
						X6EventPublisher.sendEvent(event, objs, props);
					}else{
						X6EventPublisher.postEvent(event, objs, props);
					}
					
				
			} catch (Exception e) {
				throw new BAPException(BAPException.Code.SEND_ACTIVEMQ_MESSAGE_ERROR);
			}
			
		}
		
	}
