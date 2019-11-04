package com.supcon.orchid.WOM.utils;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.util.*;


public class XmlMapUtil {

    protected static final Logger logger = LoggerFactory.getLogger(XmlMapUtil.class);
    /**
     * xml字符串转map
     * @param xml
     * @return
     */
    public static Map<String, Object> xml2map(String xml)
    {
        Document doc = null;
        try
        {
            xml = xml.replaceAll("\r|\n|\t", "");
            //将xml字符串转为document对象
            doc = DocumentHelper.parseText(xml);
        }
        catch (DocumentException e)
        {
            logger.error( e.getMessage()+ "响应参数解析失败:{}", xml);
        }
        Map<String, Object> map = new HashMap<>();
        if (doc == null)
        {
            return map;
        }
        else
        {
            //获取根节点
            Element rootElement = doc.getRootElement();
            element2map(rootElement, map);
        }
        return map;
    }

    /**
     * map转xml字符串
     * @param map
     * @return
     */
    public static String map2xml(Map<String, Object> map, String rootElement)
    {
        new HashMap<>().isEmpty();
        StringBuffer xmlStr = new StringBuffer("");
        if (map==null||map.isEmpty())
            return xmlStr.toString();
        xmlStr.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?><" + rootElement + ">");
        map2Element(map, xmlStr);
        xmlStr.append("</" + rootElement + ">");
        return xmlStr.toString();
    }

    /**
     * 递归原则 : 一个map对应一个xml节点,key为当前xml节点名,value为当前xml节点子集
     * 如果xml节点没有子节点(叶子节点),那么map的key为xml节点名,value为xml节点文本内容
     * 如果xml节点有一个子节点,那么map的key为xml节点名,value为xml节点子集
     * 如果xml节点有多个子节点,对应map的key不存在(每一次),map的key为xml节点名,value为xml节点子集
     * 如果xml节点有多个子节点,对应map的key已存在,且value为map类型(第二次),map的key为xml节点名,值从map类型转为list,而list中添加2份当前xml节点子集
     * 如果xml节点有多个子节点,对应map的key已存在,且value为list类型(第三/多次),那么直接加到list中去.
     * @param elmt
     * @param map
     * @see [类、类#方法、类#成员]
     */
    @SuppressWarnings("unchecked")
    private static void element2map(Element elmt, Map<String, Object> map)
    {
        if (null == elmt)
        {
            return;
        }
        String name = elmt.getName();

        //判断当前节点的内容是否为文本（最里面一层节点）
        if (elmt.isTextOnly())
        {
            map.put(name, elmt.getText());
        }
        else
        {
            Map<String, Object> mapSub = new HashMap<>();

            //获取当前节点的所有子节点
            List<Element> elements = (List<Element>)elmt.elements();

            //利用递归获取节点值
            for (Element elmtSub : elements)
            {
                element2map(elmtSub, mapSub);
            }
            Object first = map.get(name);

            //判断
            if (null == first)
            {
                map.put(name, mapSub);
            }
            else
            {
                if (first instanceof List<?>)
                {
                    ((List<Map<String, Object>>)first).add(mapSub);
                }
                else
                {
                    List<Object> listSub = new ArrayList<Object>();
                    listSub.add(first);
                    listSub.add(mapSub);
                    map.put(name, listSub);
                }
            }
        }
    }

    /**
     * 递归map转xml字符串
     * @param map
     * @param sb
     */
    @SuppressWarnings("unchecked")
    private static void map2Element(Map<String, Object> map, StringBuffer sb)
    {
        Set<String> set = map.keySet();
        for (Iterator<String> it = set.iterator(); it.hasNext();)
        {
            String key = (String)it.next();
            Object value = map.get(key);
            if (null == value)
                value = "";
            if (value instanceof List<?>)
            {
                List<Object> list = (List<Object>)map.get(key);
                sb.append("<" + key + ">");
                for (int i = 0; i < list.size(); i++)
                {
                    Map<String, Object> hm = (Map<String, Object>)list.get(i);
                    map2Element(hm, sb);
                }
                sb.append("</" + key + ">");
            }
            else
            {
                if (value instanceof Map<?, ?>)
                {
                    sb.append("<" + key + ">");
                    map2Element((Map<String, Object>)value, sb);
                    sb.append("</" + key + ">");
                }
                else
                {
                    sb.append("<" + key + ">" + value + "</" + key + ">");
                }

            }
        }
    }

    /**
     * 将xml转换为对象列表
     */
    public static List convertXmlToList(String xml, Class clazz, String root, String child) throws IllegalAccessException, InstantiationException {
        Map<String, Object> map = XmlMapUtil.xml2map(xml);
        List objects = new ArrayList();
        Object root2 = map.get(root);
        if (root2 instanceof String) {
            return objects;
        }
        Object item = ((Map<String, Object>) root2).get(child);
        if (item instanceof Map) {
            HashMap<String, String> result = (HashMap<String, String>)item;
            Object object = clazz.newInstance();
            for (Field field : clazz.getDeclaredFields()) {
                field.setAccessible(true);
                String value = result.get(field.getName());
                field.set(object, value);
            }
            objects.add(object);
            return objects;
        }
        List<HashMap<String, String>> itemList = (List<HashMap<String, String>>) item;
        for (int i = 0; i < itemList.size(); i++) {
            Object object = clazz.newInstance();
            for (Field field : clazz.getDeclaredFields()) {
                field.setAccessible(true);
                field.set(object, itemList.get(i).get(field.getName()));
            }
            objects.add(object);
        }
        return objects;
    }

    /**
     * 将列表转换为xml
     */
    public static String convertListToXml(List objects, String root, String child) {
        if (objects == null || objects.size() == 0) {
            return "";
        }
        StringBuffer xml = new StringBuffer();
        xml.append("<").append(root).append(">");
        for (Object object : objects) {
            xml.append(convertObjectToXml(object, child));
        }
        xml.append("</").append(root).append(">");
        return xml.toString();
    }

    /**
     * 将对象转换为xml
     */
    public static String convertObjectToXml(Object object, String root) {
        if (object == null) {
            return "";
        }
        Field[] fields = object.getClass().getDeclaredFields();
        if (fields.length == 0) {
            return "";
        }
        StringBuffer xml = new StringBuffer();
        xml.append("<").append(root).append(">");
        try {
            for (Field field : fields) {
                field.setAccessible(true);
                Object value = field.get(object);
                xml.append("<").append(field.getName()).append(">").append(value != null ? value.toString() : "").append("</").append(field.getName()).append(">");
            }
        } catch (IllegalAccessException e) {
            return "";
        }
        xml.append("</").append(root).append(">");
        return xml.toString();
    }
}
