package com.spring.imfind.el.EJ;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PaymentCheck {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String KEY = "7141568998201928";
	public static final String SECRET = "RqLPsZQc9jmKWcHS3XTeUa7vF1d0KtxCTjsmjiztBWdy8VrbSlpNvxibzvbkZJWT2pfmHOPjL3STYj5R";

	
	// 접근을 위한 access token 생성 후 반환
	public String getImportToken() {
		String result="";
		
		HttpClient client = HttpClientBuilder.create().build(); // 클라이언트 생성
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); // post 메소드 URL생성
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); // 클라이언트로 결과 전송
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			System.out.println("body=" + body);
			JsonNode rootNode = mapper.readTree(body);
			System.out.println("rootNode" + rootNode);
			JsonNode resNode = rootNode.get("response");
			System.out.println("resNode=" + resNode);
			
			result = resNode.get("access_token").asText();
			System.out.println("result=" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} return result;
	}


	private List<? extends NameValuePair> convertParameter(Map<String, String> m) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
