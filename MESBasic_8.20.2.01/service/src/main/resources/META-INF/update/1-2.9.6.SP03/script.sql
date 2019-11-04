--更新菜单的url
update   base_menuinfo set ec_entity_code='MESBasic_1_equipManage',entity_code='MESBasic_1_equipManage',namespace='/MESBasic/equipManage/equipment',url='/MESBasic/equipManage/equipment/list.action'  where  code='MESBasic_1_equipment_eamlist';

--更新菜单的entityCode
update   base_menuoperate  set   entity_code='MESBasic_1_equipManage'  where  entity_code='MESBasic_1_equipment';

