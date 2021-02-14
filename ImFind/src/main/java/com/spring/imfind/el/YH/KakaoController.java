
package com.spring.imfind.el.YH;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonParser;

public class KakaoController {

	public String getAccessToken(String code) throws Exception {

		final String K_CLIENT_ID = "d5e7c97eeecbba70fa5f4e5f4bc57517";
		final String REQUEST_URI = "https://kauth.kakao.com/oauth/token";
		final String K_REDIRECT_URI = "http://localhost:8080/imfind/login/oauth_kakao";

		final String Parameters = "?grant_type=authorization_code" + "&client_id=" + K_CLIENT_ID + "&redirect_uri="
				+ K_REDIRECT_URI + "&code=" + code;

		URL obj = new URL(REQUEST_URI + Parameters);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setConnectTimeout(10000);
		con.setReadTimeout(5000);

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(Parameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();

		Charset charset = Charset.forName("UTF-8");
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		Map<String, Object> responseJSON = bufferToJson(response);

		return (String) responseJSON.get("access_token");
	}

	public Map<String, Object> getUserInfo(String access_token) throws IOException, ScriptException {

		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

		URL obj = new URL(RequestUrl);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setRequestProperty("Authorization", "Bearer " + access_token);
		con.setConnectTimeout(10000);
		con.setReadTimeout(5000);

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();

		Charset charset = Charset.forName("UTF-8");
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		Map<String, Object> info = bufferToJson(response);

		return info;
	}

	public Map<String, Object> bufferToJson(StringBuffer response) throws ScriptException {

		ScriptEngineManager sem = new ScriptEngineManager();
		ScriptEngine engine = sem.getEngineByName("javascript");

		String json = response.toString();
		String script = "Java.asJSONCompatible(" + json + ")";
		Object result = engine.eval(script);

		Map<String, Object> contents = (Map) result;

		String access_token = (String) contents.get("access_token");

		return contents;
	}
}
