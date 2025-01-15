package vn.edu.hcmuaf.fit.bookstore.util;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.edu.hcmuaf.fit.bookstore.controllers.json.LocalDateTimeAdapter;

import java.time.LocalDateTime;

public class GsonUtil {
    public static Gson createGsonWithAdapters() {
        return new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
    }
}
