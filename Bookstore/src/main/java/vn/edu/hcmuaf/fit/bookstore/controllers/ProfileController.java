package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.cloundinary.CloundinaryConfig;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ProfileController", value = "/profile")
@MultipartConfig
public class ProfileController extends HttpServlet {
    UserServices userServices = new UserServices();
    RoleServices roleServices = RoleServices.getInstance();
    LogService logService;

    public ProfileController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int resourceId = roleServices.selectResourceByUserId(((User) session.getAttribute("userSession")).getUid());
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("userSession");
        boolean isAdmin = roleServices.isAdmin(user.getUid(), resourceId);
        request.setAttribute("isAdmin", isAdmin);
        System.out.println("Profile: uid=" + user.getUid() + ", username=" + user.getUsername() + ", role=" + user.getRole() + ", isAdmin=" + isAdmin);
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();
        User user = (User) session.getAttribute("userSession");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int id = user.getUid(); // Lấy UID từ đối tượng user
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        // Log: dữ liệu trước cập nhật
        Gson gson = new Gson();
        Map<String, String> dataBefore = new HashMap<>();
        dataBefore.put("username", user.getUsername());
        dataBefore.put("email", user.getEmail());
        dataBefore.put("phone", user.getPhone());
        dataBefore.put("gender", user.getGender());
        dataBefore.put("dob", user.getDob().toString());
        dataBefore.put("avatar", user.getAvatar());

        if (username == null || email == null || username.trim().isEmpty() || email.trim().isEmpty()) {
            request.setAttribute("baoloi", "Tên đăng nhập và Email không được để trống");
            Map<String, String> dataAfter = new HashMap<>();
            dataAfter.put("usename", username);
            dataAfter.put("email", email);
            Log log = new Log(id, sessionId, ip, LogLevel.WARNING, "profile", "UPDATE_PROFILE_FAIL",
                    false, gson.toJson(dataBefore), gson.toJson(dataAfter));
            logService.insert(log);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("baoloi", "Email không hợp lệ");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        if (phone != null && !phone.matches("0\\d{9}")) {
            request.setAttribute("baoloi", "Số điện thoại không hợp lệ (10 số, bắt đầu bằng 0)");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
            request.setAttribute("baoloi", "Giới tính không hợp lệ");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        if (dob != null && !dob.matches("\\d{4}-\\d{2}-\\d{2}")) {
            request.setAttribute("baoloi", "Ngày sinh không đúng định dạng YYYY-MM-DD");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // xu lý ảnh
        Part filePart = request.getPart("imageFile");
        String imageUrl = user.getAvatar(); // mặc định là ảnh cũ

        if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null) {
            try {
                imageUrl = CloundinaryConfig.getUrl(filePart);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("baoloi", "Lỗi khi tải ảnh lên");
                Log log = new Log(id, sessionId, ip, LogLevel.WARNING, "profile", "UPLOAD_IMAGE_FAIL",
                        false, gson.toJson(dataBefore), "{}");
                logService.insert(log);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                return;
            }
        }
        try {
            Date dobDate = java.sql.Date.valueOf(dob);
            // Cập nhật thông tin người dùng
            userServices.updateImageByID(username, gender, dob, phone, email, imageUrl, id);

            // Cap nhat lai thong tin user trong session
            user.setUsername(username);
            user.setEmail(email);
            user.setUsername(username);
            user.setEmail(email);
            user.setPhone(phone);
            user.setGender(gender);
            user.setDob(dobDate);
            user.setAvatar(imageUrl);
            session.setAttribute("userSession", user);

            Map<String, String> dataAfter = new HashMap<>();
            dataAfter.put("username", username);
            dataAfter.put("email", email);
            dataAfter.put("phone", phone);
            dataAfter.put("gender", gender);
            dataAfter.put("dob", dob);
            dataAfter.put("avatar", imageUrl);

            Log log = new Log(id, sessionId, ip, LogLevel.INFO, "profile", "UPDATE_PROFILE_SUCCESS",
                    false, gson.toJson(dataBefore), gson.toJson(dataAfter));
            logService.insert(log);

            response.sendRedirect("profile");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("baoloi", "Lỗi khi cập nhật thông tin");
            Log log = new Log(id, sessionId, ip, LogLevel.WARNING, "profile", "UPDATE_PROFILE_FAIL",
                    false, gson.toJson(dataBefore), "{}");
            logService.insert(log);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }
}