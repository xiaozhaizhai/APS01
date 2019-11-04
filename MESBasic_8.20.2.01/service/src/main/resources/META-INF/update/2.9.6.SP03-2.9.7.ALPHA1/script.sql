--龙盛专用
--移动权限--设备档案
--查询
update BASE_ROLEPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='MESBasic_1_equipManage_list_self')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='MESBasic_1_equipment_eamlist_self'); 
update BASE_USERPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='MESBasic_1_equipManage_list_self')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='MESBasic_1_equipment_eamlist_self');

--新增
update BASE_ROLEPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_add_add_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_add_add_MESBasic_1_equipment_eamlist');
update BASE_USERPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_add_add_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_add_add_MESBasic_1_equipment_eamlist'); 

--修改
update BASE_ROLEPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_modify_modify_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_modify_modify_MESBasic_1_equipment_eamlist'); 
update BASE_USERPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_modify_modify_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_modify_modify_MESBasic_1_equipment_eamlist');
--删除
update BASE_ROLEPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_delete_del_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_delete_del_MESBasic_1_equipment_eamlist');
update BASE_USERPERMISSION  set MENUOPERATE_ID=(select id  from  base_menuoperate where  code='list_delete_del_MESBasic_1_equipManage_list')  where  MENUOPERATE_ID=(select id  from  base_menuoperate where  code='eamlist_delete_del_MESBasic_1_equipment_eamlist');


--删除旧的菜单

update BASE_MENUINFO SET VALID=0  WHERE   code='MESBasic_1_equipment_eamlist';

--隐藏能源
update   base_menuinfo set  valid=0 where  code='ems';

--隐藏批次
update   base_menuinfo set  valid=0 where  code='batchManageFolder';

--mes基础
update   base_menuinfo set  valid=0 where  code='mesBasic';

--画面管理
update   base_menuinfo set  valid=0 where  code='pims_P_1104';

--删除EMS
update   runtime_MODULE  set valid=0   where  code='EMS_1.0';

--EMSReport
update   runtime_MODULE  set valid=0   where  code='EMSReport_1';

--修改菜单类型
update   base_menuinfo   set  menu_type=null;




