package com.kh.iblossom.common.bootpay.model.service;

import java.lang.reflect.Type;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.kh.iblossom.common.bootpay.BootpayObject;
import com.kh.iblossom.common.bootpay.model.vo.request.Payload;
import com.kh.iblossom.common.bootpay.model.vo.response.ResDefault;

public class LinkService {
    static public ResDefault<String> requestLink(BootpayObject bootpay, Payload payload) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
//        if(userToken.userId == null || userToken.userId.isEmpty()) throw new Exception("userId 값을 입력해주세요.");

        HttpClient client = HttpClientBuilder.create().build();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();
        HttpPost post = bootpay.httpPost("request/payment", new StringEntity(gson.toJson(payload), "UTF-8"));

        post.setHeader("Authorization", bootpay.token);
        HttpResponse response = client.execute(post);
        String str = IOUtils.toString(response.getEntity().getContent(), "UTF-8");

        Type resType = new TypeToken<ResDefault<String>>(){}.getType();
        ResDefault res = new Gson().fromJson(str, resType);
        return res;
//        return new Gson().fromJson(str, ResDefault.class);
    }
}
