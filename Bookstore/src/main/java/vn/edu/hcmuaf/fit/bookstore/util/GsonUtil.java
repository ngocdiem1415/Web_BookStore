package vn.edu.hcmuaf.fit.bookstore.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.time.LocalDateTime;
import vn.edu.hcmuaf.fit.bookstore.adapter.*;

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
    public Gson getGson() {
        return gson;
    }

    public void setGson(Gson gson) {
        this.gson = gson;
    }

}
