package vn.edu.hcmuaf.fit.bookstore.apighn;

import org.cloudinary.json.JSONArray;
import org.cloudinary.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class GHNUtils {

    public static JSONArray getJSONArrayFromGHN(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Token", APIGHNConfig.getToken());

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) json.append(line);
        reader.close();

        JSONObject response = new JSONObject(json.toString());
        return response.getJSONArray("data");
    }

    public static JSONArray getJSONArrayFromGHNWithBody(String urlStr, JSONObject body) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Token", APIGHNConfig.getToken());
        conn.setRequestProperty("Content-Type", "application/json");

        OutputStream os = conn.getOutputStream();
        os.write(body.toString().getBytes("UTF-8"));
        os.flush();

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) json.append(line);
        reader.close();

        JSONObject response = new JSONObject(json.toString());
        return response.getJSONArray("data");
    }
}