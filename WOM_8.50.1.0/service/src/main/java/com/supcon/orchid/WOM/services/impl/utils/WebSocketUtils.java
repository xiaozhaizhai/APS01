package com.supcon.orchid.WOM.services.impl.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//import java.io.IOException;

/**
 * Created By guding on 2019/4/12 17:01
 */
//@ServerEndpoint("/websocket")
public class WebSocketUtils {

    private Logger log = LoggerFactory.getLogger(getClass());

    //@OnMessage
    //public void onMessage(String message, Session session) throws IOException,InterruptedException {
        //log.info("接收到数据 : {}",message);

        //测试发送数据
        //session.getBasicRemote().sendText("发送数据 : 测试数据 1 ,成功发送！");
   // }

    //@OnOpen
    public void onOpen(){
        log.info("成功接入！");
    }

    //@OnClose
    public void onClose(){
        log.info("离开！");
    }

}
