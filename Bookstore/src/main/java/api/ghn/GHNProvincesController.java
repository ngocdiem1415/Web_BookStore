package api.ghn;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.apighn.APIGHNConfig;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "GHNProvincesController", value = "/api/ghn/provinces")
public class GHNProvincesController extends HttpServlet {
    private static final String GHN_TOKEN = APIGHNConfig.getToken();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String apiUrl = "https://online-gateway.ghn.vn/shiip/public-api/master-data/province";

        HttpURLConnection conn = (HttpURLConnection) new URL(apiUrl).openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("token", GHN_TOKEN);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (InputStream in = conn.getInputStream();
             OutputStream out = response.getOutputStream()) {
            in.transferTo(out);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
