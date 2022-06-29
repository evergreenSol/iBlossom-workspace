package com.kh.iblossom.common.bootpay.model.service;

import java.lang.reflect.Type;
import java.util.HashMap;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.iblossom.common.bootpay.BootpayObject;
import com.kh.iblossom.common.bootpay.model.vo.response.ResDefault;

public class VerificationService {
    static public ResDefault<HashMap<String, Object>> verify(BootpayObject bootpay, String receiptId) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");

        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = bootpay.httpGet("receipt/" + receiptId);
        get.setHeader("Authorization", bootpay.token);
        HttpResponse response = client.execute(get);
        String str = IOUtils.toString(response.getEntity().getContent(), "UTF-8");

        Type resType = new TypeToken<ResDefault<HashMap<String, Object>>>(){}.getType();
        ResDefault res = new Gson().fromJson(str, resType);
        return res;
    }

    static public ResDefault<HashMap<String, Object>> certificate(BootpayObject bootpay, String receiptId) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");

        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = bootpay.httpGet("certificate/" + receiptId + ".json");
        get.setHeader("Authorization", bootpay.token);
        HttpResponse response = client.execute(get);
        String str = IOUtils.toString(response.getEntity().getContent(), "UTF-8");

        Type resType = new TypeToken<ResDefault<HashMap<String, Object>>>(){}.getType();
        ResDefault res = new Gson().fromJson(str, resType);
        return res;
    }
}