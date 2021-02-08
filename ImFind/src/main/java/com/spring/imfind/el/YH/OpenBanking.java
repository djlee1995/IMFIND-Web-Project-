
package com.spring.imfind.el.YH;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

public class OpenBanking {

	public String getAuthorize() {

		// �׽�Ʈ ����
		final String Url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
				+ "client_id=1245365a-f9f6-4ad8-b86d-fb42f8a9deb8" + "&scope=login inquiry transfer"
				+ "&response_type=code" + "&redirect_uri=http://localhost:8080/imfind/getOpenBankingToken"
				+ "&state=12345678901234567890123456789012" + "&auth_type=0";
		return Url;
	}

	/*
	 * 3 legged
	 */
	public void getToken(String code) throws Exception {

		final String url = "https://testapi.openbanking.or.kr/oauth/2.0/token" + "?code=" + code
				+ "&client_id=1245365a-f9f6-4ad8-b86d-fb42f8a9deb8"
				+ "&client_secret=efa082ac-cad6-41ab-a97d-7e15a5734622" + "&grant_type=authorization_code"
				+ "&redirect_uri=http://localhost:8080/imfind/getOpenBankingToken";

		// final secret = "efa082ac-cad6-41ab-a97d-7e15a5734622";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		// con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setRequestProperty("content-type", "application/x-www-form-urlencoded; charset=UTF-8");
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

		Map<String, Object> responseJSON = bufferToJson(response);

		responseJSON.forEach((K, V) -> System.out.println(K + ":" + V));

	}

	// M202111000 �̿��� M202111000
	public Map<String, Object> bufferToJson(StringBuffer response) throws ScriptException {

		ScriptEngineManager sem = new ScriptEngineManager();
		ScriptEngine engine = sem.getEngineByName("javascript");

		String json = response.toString();
		String script = "Java.asJSONCompatible(" + json + ")";
		Object result = engine.eval(script);

		Map<String, Object> contents = (Map) result;

		return contents;
	}

	/*
	 * 2 legged
	 * 
	 * response - json access_token client_use_code
	 * 
	 */
	public String leggedToken() throws IOException, ScriptException {

		final String url = "https://testapi.openbanking.or.kr/oauth/2.0/token"
				+ "?client_id=1245365a-f9f6-4ad8-b86d-fb42f8a9deb8"
				+ "&client_secret=efa082ac-cad6-41ab-a97d-7e15a5734622" + "&scope=oob"
				+ "&grant_type=client_credentials";

		// final secret = "efa082ac-cad6-41ab-a97d-7e15a5734622";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		// con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setRequestProperty("content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		con.setConnectTimeout(10000);
		con.setReadTimeout(5000);

		// Send post request
		con.setDoOutput(true);

		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.flush();
		wr.close();

		// response
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
		String access_token = (String) responseJSON.get("access_token");

		return access_token;
	}

	public Map<String, String> getAccountInfo(Map<String, String> map, String token)
			throws IOException, ScriptException {

		String bank_tran_id = "M202111000" + "U" + Integer.toString((int) (Math.random() * 1000000000));
		String bank_code_std = map.get("bank_code_std");
		String account_num = map.get("account_num");
		String account_holder_info = map.get("account_holder_info");
		String tran_dtime = map.get("time");

		String url = "https://testapi.openbanking.or.kr/oauth/2.0/inquiry/real_name";
		/*
		 * + "Authorization=Bearer " + token;
		 */

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + token);
		con.setRequestProperty("content-type", "application/json; charset=UTF-8");
		con.setRequestProperty("Accept", "application/json");
		con.setConnectTimeout(10000);
		con.setReadTimeout(5000);

		// Send post request
		con.setDoOutput(true);

		map.put("account_holder_info_type", " ");
		map.put("bank_tran_id", bank_tran_id);
		String json2 = "";
		ObjectMapper mapper = new ObjectMapper();
		json2 = mapper.writeValueAsString(map);
		json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);

		try (OutputStream os = con.getOutputStream()) {
			byte[] input = json2.getBytes("utf-8");

			os.write(input, 0, input.length);
		}

		try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"))) {
			StringBuilder response = new StringBuilder();
			String responseLine = null;

			while ((responseLine = br.readLine()) != null) {
				response.append(responseLine.trim());
			}
		}

		return null;
	}

}
