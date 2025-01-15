package vn.edu.hcmuaf.fit.bookstore.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.edu.hcmuaf.fit.bookstore.adapter.LocalDateTimeDeserializer;
import vn.edu.hcmuaf.fit.bookstore.adapter.LocalDateTimeSerializer;


import java.time.LocalDateTime;

public class GsonUtil {
    private GsonBuilder builder;
    private Gson gson;


    public GsonUtil() {
        builder = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer())
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeDeserializer());

        gson = builder.create();
    }

    public String toJSon(Object object) {
        return gson.toJson(object);
    }
}
