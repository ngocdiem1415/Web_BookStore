package vn.edu.hcmuaf.fit.bookstore.cloundinary;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import java.util.Properties;


public class CloundinaryConfig {

    private static Properties properties = new Properties();

    static {
        try {
            properties.load(CloundinaryConfig.class.getClassLoader().getResourceAsStream("cloundinary.Properties"));
        } catch (Exception e) {
            throw new RuntimeException("Failed to load cloundinary.properties file", e);
        }
    }

    public static Cloudinary getCloudinary() {
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name",
                properties.getProperty("cloud_name"),
                "api_key", properties.getProperty("api_key"),
                "api_secret", properties.getProperty("api_secret")));

        return cloudinary;
    }

    public static String getUrl(Part filePart) throws IOException {
        if (filePart != null) {
            // Lay ten file tu phan yeu cau
            String fileName = filePart.getSubmittedFileName();

            // Luu tep vao mot tep tam thoi
            File tempFile = File.createTempFile("upload_", fileName);

            try (InputStream fileContent = filePart.getInputStream()) {
                // copy inputstream to temp file
                Files.copy(fileContent, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

                // Tai tep len Cloudinary
                Map<String, Object> uploadResult = getCloudinary().uploader().upload(tempFile, ObjectUtils.emptyMap());
                System.out.println("Upload result: " + uploadResult);

                // Lay URL cua tep da tai len
                String fileUrl = uploadResult.get("url").toString();

                return fileUrl;
            } catch (Exception e) {
                e.printStackTrace();
                return "https://res.cloudinary.com/dh90ponfw/image/upload/v1736864014/defaultavatar.jpg";
            } finally {
                // Xoa tep tam sau khi su dung
                tempFile.delete();
            }
        } else {
            return "https://res.cloudinary.com/dh90ponfw/image/upload/v1736864014/defaultavatar.jpg";
        }
    }
}
