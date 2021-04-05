package com.agjycxys.util;

import com.agjycxys.domain.Token;
import com.agjycxys.menu.Button;
import com.agjycxys.menu.ClickButton;
import com.agjycxys.menu.Menu;
import com.agjycxys.menu.ViewButton;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class WeiXinUtil {
	// 微信号基本信息
	public static final String AppID = "wxcdc94f5bd03aa8e6";
	public static final String AppSecret = "4e99950e213fad871aac765c5a1eedaa";
	public static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	public static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	public static final String Query_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	public static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	/**
	 * get请求微信
	 * 
	 * @param url
	 * @return 将请求URL后返回的数据转换为JSON类型并返回
	 */
	public static JSONObject doGetStr(String url) {
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();// 获取CloseableHttpClient请求
		HttpGet httpGet = new HttpGet(url);// HttpGet将使用Get方式发送请求
		JSONObject jsonObject = null;
		try {
			HttpResponse response = httpClient.execute(httpGet);// 使用HttpResponse接收httpClient执行的结果
			HttpEntity entity = response.getEntity();// 从response中获取结果
														// 类型为HttpEntity
			if (entity != null) {
				String result = EntityUtils.toString(entity, "UTF-8"); // HttpEntity转为字符串类型
				jsonObject = JSONObject.fromObject(result); // 字符串类型转为JSON类型
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * post请求微信
	 * 
	 * @param url
	 *            需要请求的URL
	 * @param outStr
	 *            需要传递的参数
	 * @return 将请求URL后返回的数据转换为JSON类型并返回
	 */
	public static JSONObject doPostStr(String url, String outStr) {
		CloseableHttpClient httpClient = HttpClientBuilder.create().build(); // 获取CloseableHttpClient请求
		HttpPost httpPost = new HttpPost(url);// HttpGet将使用Get方式发送请求
		JSONObject jsonObject = null;
		try {
			httpPost.setEntity(new StringEntity(outStr, "UTF-8")); // 使用setEntity方法,将传递的参数放入请求中
			HttpResponse response = httpClient.execute(httpPost); // 使用HttpResponse接收httpClient执行的结果
			String result = EntityUtils.toString(response.getEntity(), "UTF-8");// HttpEntity转为字符串类型
			jsonObject = JSONObject.fromObject(result);// 字符串类型转为JSON类型
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * 获取access_token
	 * 
	 * @return 返回拿到的access_token 和 有效期
	 */
	public static Token getAccessToken() {
		Token token = new Token();
		String url = ACCESS_TOKEN_URL.replace("APPID", AppID).replace(
				"APPSECRET", AppSecret);// 将URL两个参数替换
		JSONObject jsonObject = doGetStr(url);// 使用doGetStr接收结果
		// System.out.println(url);
		// System.out.println(jsonObject.toString());
		if (jsonObject != null) { // 如果返回不为空 将结果封装进AccessToken实体类
			token.setAccessToken(jsonObject.getString("access_token")); // 取出access_token
			token.setExpiresIn(jsonObject.getInt("expires_in")); // 取出expires_in
		}
		return token;
	}

	/**
	 * 组装菜单
	 */
	public static Menu initMenu() {
		Menu menu = new Menu();
		ViewButton button11 = new ViewButton();
		button11.setName("HR");
		button11.setType("view");
		button11.setUrl("http://sxlg.tunnel.echomod.cn/WeiXin/HR/hrLogin.jsp");

		ViewButton button21 = new ViewButton();
		button21.setName("面试官");
		button21.setType("view");
		button21.setUrl("http://sxlg.tunnel.echomod.cn/WeiXin/MSG/msgLogin.jsp");

		ClickButton button31 = new ClickButton();
		button31.setName("扫一扫");
		button31.setType("scancode_push");
		button31.setKey("31");

		menu.setButton(new Button[] { button11, button21, button31 }); // 一级菜单
		return menu;
	}

	/**
	 * 创建菜单
	 * 
	 * @param accessToken
	 * @param menu
	 * @return
	 */
	public static int createMenu(String accessToken, String menu) {
		int result = 1;
		String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", accessToken);
		JSONObject jsonObject = doPostStr(url, menu);
		if (jsonObject != null) {
			result = jsonObject.getInt("errcode");
		}
		return result;
	}

	/**
	 * 查询菜单
	 * 
	 * @param accessToken
	 * @return
	 */
	public static String getMenu(String accessToken) {
		String url = Query_MENU_URL.replace("ACCESS_TOKEN", accessToken);
		JSONObject jsonObject = doGetStr(url);
		return jsonObject.toString();
	}

	/**
	 * 删除菜单
	 * 
	 * @param accessToken
	 * @return
	 */
	public static final int deleteMenu(String accessToken) {
		int result = 1;
		String url = DELETE_MENU_URL.replace("ACCESS_TOKEN", accessToken);
		JSONObject jsonObject = doGetStr(url);
		if (jsonObject != null) {
			result = jsonObject.getInt("errcode");
		}
		return result;
	}

//	/**
//	 * 获取网页授权凭证
//	 * 
//	 * @param appId
//	 *            公众账号的唯一标识
//	 * @param appSecret
//	 *            公众账号的密钥
//	 * @param code
//	 * @return WeixinAouth2Token
//	 */
//	public static WeixinOauth2Token getOauth2AccessToken(String code) {
//		WeixinOauth2Token wat = null;
//		// 拼接请求地址
//		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
//		requestUrl = requestUrl.replace("APPID", AppID);
//		requestUrl = requestUrl.replace("SECRET", AppSecret);
//		requestUrl = requestUrl.replace("CODE", code);
//		// 获取网页授权凭证
//		JSONObject jsonObject = doGetStr(requestUrl);
//		if (null != jsonObject) {
//			try {
//				wat = new WeixinOauth2Token();
//				wat.setAccessToken(jsonObject.getString("access_token"));
//				wat.setExpiresIn(jsonObject.getInt("expires_in"));
//				wat.setRefreshToken(jsonObject.getString("refresh_token"));
//				wat.setOpenId(jsonObject.getString("openid"));
//				wat.setScope(jsonObject.getString("scope"));
//			} catch (Exception e) {
//				wat = null;
//				int errorCode = jsonObject.getInt("errcode");
//				String errorMsg = jsonObject.getString("errmsg");
//				log.error("获取网页授权凭证失败 errcode:{} errmsg:{}", errorCode,
//						errorMsg);
//			}
//		}
//		return wat;
//	}
//
//	/**
//	 * 刷新网页授权凭证
//	 * 
//	 * @param appId
//	 *            公众账号的唯一标识
//	 * @param refreshToken
//	 * @return WeixinAouth2Token
//	 */
//	public static WeixinOauth2Token refreshOauth2AccessToken(String appId,
//			String refreshToken) {
//		WeixinOauth2Token wat = null;
//		// 拼接请求地址
//		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
//		requestUrl = requestUrl.replace("APPID", appId);
//		requestUrl = requestUrl.replace("REFRESH_TOKEN", refreshToken);
//		// 刷新网页授权凭证
//		JSONObject jsonObject = doGetStr(requestUrl);
//		if (null != jsonObject) {
//			try {
//				wat = new WeixinOauth2Token();
//				wat.setAccessToken(jsonObject.getString("access_token"));
//				wat.setExpiresIn(jsonObject.getInt("expires_in"));
//				wat.setRefreshToken(jsonObject.getString("refresh_token"));
//				wat.setOpenId(jsonObject.getString("openid"));
//				wat.setScope(jsonObject.getString("scope"));
//			} catch (Exception e) {
//				wat = null;
//				int errorCode = jsonObject.getInt("errcode");
//				String errorMsg = jsonObject.getString("errmsg");
//				log.error("刷新网页授权凭证失败 errcode:{} errmsg:{}", errorCode,
//						errorMsg);
//			}
//		}
//		return wat;
//	}
//
//	/**
//	 * 通过网页授权获取用户信息
//	 * 
//	 * @param accessToken
//	 *            网页授权接口调用凭证
//	 * @param openId
//	 *            用户标识
//	 * @return SNSUserInfo
//	 */
//	@SuppressWarnings({ "deprecation", "unchecked" })
//	public static SNSUserInfo getSNSUserInfo(String accessToken, String openId) {
//		SNSUserInfo snsUserInfo = null;
//		// 拼接请求地址
//		String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
//		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace(
//				"OPENID", openId);
//		// 通过网页授权获取用户信息
//		JSONObject jsonObject = doGetStr(requestUrl);
//		if (null != jsonObject) {
//			try {
//				snsUserInfo = new SNSUserInfo();
//				// 用户的标识
//				snsUserInfo.setOpenId(jsonObject.getString("openid"));
//				// 昵称
//				snsUserInfo.setNickname(jsonObject.getString("nickname"));
//				// 性别（1是男性，2是女性，0是未知）
//				snsUserInfo.setSex(jsonObject.getInt("sex"));
//				// 用户所在国家
//				snsUserInfo.setCountry(jsonObject.getString("country"));
//				// 用户所在省份
//				snsUserInfo.setProvince(jsonObject.getString("province"));
//				// 用户所在城市
//				snsUserInfo.setCity(jsonObject.getString("city"));
//				// 用户头像
//				snsUserInfo.setHeadImgUrl(jsonObject.getString("headimgurl"));
//				// 用户特权信息
//				snsUserInfo.setPrivilegeList(JSONArray.toList(
//						jsonObject.getJSONArray("privilege"), List.class));
//			} catch (Exception e) {
//				snsUserInfo = null;
//				int errorCode = jsonObject.getInt("errcode");
//				String errorMsg = jsonObject.getString("errmsg");
//				log.error("获取用户信息失败 errcode:{} errmsg:{}", errorCode, errorMsg);
//			}
//		}
//		return snsUserInfo;
//	}
}
