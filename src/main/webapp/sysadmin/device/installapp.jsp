<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>MDM-安装APP</title>
    <link href="${css_ctx }/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="main1">
    <table width="100%" border="0">
        <tr>
            <td align="left" valign="top">
                <div class="right1">
                    <div class="top"><span>APP信息&nbsp;[<a
                            href="${sysadmin_ctx }/installAppInput.do?deviceId=${device.deviceId }" target="rightFrame"
                            style="color: #4285F4;font-size: 14px;">刷新</a>] <a href="${sysadmin_ctx }/deviceList.do"
                                                                               target="rightFrame"
                                                                               style="color: #4285F4;font-size: 14px;">&lt;&lt;返回</a></span>
                    </div>
                    <div class="top1 clear"></div>
                    <form action="${ctx }/device/install.do" method="post" id="submitForm" name="submitForm">
                        <input type="hidden" name="deviceId" value="${device.deviceId }"/>
                        <table width="100%" border="0" cellspacing="10">
                            <tr>
                                <td width="110" height="14" align="right">设备类型：</td>
                                <td>${device.modelName } [ ${device.model } ]</td>
                            </tr>
                            <tr>
                                <td width="110" height="14" align="right">设备编号：</td>
                                <td>${device.deviceId }</td>
                            </tr>
                            <tr>
                                <td width="110" height="14" align="right">安装类型：</td>
                                <td>
                                    <input type="radio" name="ctype" value="iTunesStoreID" checked="checked"/>APP ID
                                    <input type="radio" name="ctype" value="ManifestURL"/>PList安装
                                </td>
                            </tr>
                            <tr>
                                <td width="110" height="14" align="right">输入值：</td>
                                <td><input type="text" id="cvalue" name="cvalue" value=""
                                           style="width: 400px; height: 22px;"/></td>
                            </tr>
                            <tr>
                                <td width="110" height="14" align="right"><input type="button" onclick="installForm();"
                                                                                 value="提交请求"
                                                                                 style="width: 65px; height: 24px;"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </div>
                <!--主题部分的左边-->
            </td>
        </tr>
    </table>
</div>
<div class="footer1"></div>
<script type="text/javascript">
    function installForm() {
        var cvalue = $("#cvalue").val();
        if (cvalue != "") {
            $.ajax({
                type: "post",
                url: "${ctx }/device/install.do",
                dataType: "json",
                data: $('#submitForm').serialize(),
                success: function (data) {
                    alert(data.msg);
                    window.location.href = "${sysadmin_ctx }/deviceList.do";
                }
            });
        } else {
            alert("请输入值!");
        }
    }
</script>
<script type="text/javascript" src="${js_ctx }/jquery-1.8.2.min.js"></script>
</body>
</html>