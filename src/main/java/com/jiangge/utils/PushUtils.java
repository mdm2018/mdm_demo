package com.jiangge.utils;

import com.jiangge.apns4j.IApnsService;
import com.jiangge.apns4j.impl.ApnsServiceImpl;
import com.jiangge.apns4j.model.ApnsConfig;
import com.jiangge.apns4j.model.Payload;
import com.jiangge.pojo.Device;
import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Java向Apple服务器PUSH消息
 *
 * @author jiang.li
 */
public class PushUtils {

    /*************************************************************
     * 测试推送服务器地址：gateway.sandbox.push.apple.com 端口 2195
     * 产品推送服务器地址：gateway.push.apple.com         端口 2195
     ************************************************************/
    private static String MDMPASS = null;
    private static IApnsService apnsService;


    /**初始化配置**/
    static {
        MDMPASS = ConfigUtils.getConfig("APNS_MDMPASS");
    }

    private static IApnsService getApnsService(String p12Path) {
        try {
            if (apnsService == null) {
                ApnsConfig config = new ApnsConfig();
                File file = new File(p12Path);
                InputStream is = new FileInputStream(file);
                config.setKeyStore(is);
                config.setDevEnv(false);
                config.setPassword(MDMPASS);
                config.setPoolSize(3);
                apnsService = ApnsServiceImpl.createInstance(config);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return apnsService;
    }

    /**
     * 向单个iPhone手机推送消息.
     *
     * @param mdm 推送参数
     * @return pushState    返回执行状态(1：成功,0：失败)
     */
    public static int singleMDMPush(String p12Path, Device mdm) {
        int pushState = 0;
        try {
            IApnsService service = getApnsService(p12Path);
            Payload payload = new Payload();
            payload.addParam("mdm", mdm.getPushMagic());
            service.sendNotification(mdm.getToken(), payload);
            Thread.sleep(500);
            pushState = 1;
            System.out.println("推送信息已发送！");
        } catch (Exception e) {
            System.out.println("出错了：" + e.getMessage());
            pushState = 0;
        }
        return pushState;
    }


    /**
     * 向单个iPhone手机推送消息.
     *
     * @param mdm 推送参数
     * @return pushState    返回执行状态(1：成功,0：失败)
     */
    public static int singleMDMPush_old(String p12Path, Device mdm) {
        int pushState = 0;
        try {
            ApnsService service =
                    APNS.newService()
                            .withCert(p12Path, MDMPASS)
                            .withProductionDestination()
                            .build();
            String mdmPayload = APNS.newPayload().customField("mdm", mdm.getPushMagic()).build();
            service.push(mdm.getToken(), mdmPayload);
            pushState = 1;
            System.out.println("推送信息已发送！");
        } catch (Exception e) {
            System.out.println("出错了：" + e.getMessage());
            pushState = 0;
        }
        return pushState;
    }

    public static void main(String[] as) throws InterruptedException {
        Device mdm = new Device();
//      mdm.setPushMagic("26A1FD5C-2D78-45E6-B864-19327BD1C0AD");
//      mdm.setToken("67c7882a1a95db2931ba35ae45428013bace921605c5bc7e8f3a07c7eb243402");
        mdm.setPushMagic("6UseDevelopmentAPNSF6E0EB6-62D0-461B-811D-D8B14D337CE9");
        mdm.setToken("e828c270f48e62bb791271f186851303653aaba8e64320eef976e983c3b6fb8c");
        String p12Path = "mdmtool/MDMPush.p12";
        PushUtils.singleMDMPush(p12Path, mdm);
        Thread.sleep(10000);
    }


}