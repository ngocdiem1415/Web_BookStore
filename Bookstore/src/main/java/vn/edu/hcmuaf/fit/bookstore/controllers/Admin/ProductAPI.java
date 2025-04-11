package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.*;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.cloundinary.CloundinaryConfig;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "ProductAPI", value = "/admin/product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProductAPI extends HttpServlet {
    private BookDetailService bookService;
    private CategoryService categoryService;
    private PublisherService publisherService;
    private PromotionService promotionService;
    private BookDetailService bookDetailService;
    private ImageService imageService;

    public ProductAPI() {
        this.bookService = BookDetailService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.publisherService = PublisherService.getInstance();
        this.promotionService = PromotionService.getInstance();
        this.bookDetailService = BookDetailService.getInstance();
        this.imageService = ImageService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        System.out.println("da nhan duoc data");
        String title = request.getParameter("tenSanPham");
        String author = request.getParameter("Tacgia");
        String dimensions = request.getParameter("dimensions");
        String format = request.getParameter("format");
        String description = request.getParameter("description");

        int publishYear = 0, pageCount = 0;
        double price = 0, weight = 0;
        int status = 0, category = 0, pulisher = 0, promotion = 0;

        try {
            publishYear = Integer.parseInt(request.getParameter("NamXB"));
            weight = Double.parseDouble(request.getParameter("khoiLuong"));
            pageCount = Integer.parseInt(request.getParameter("pageCount"));

            price = Double.parseDouble(request.getParameter("price"));
            status = Integer.parseInt(request.getParameter("status"));
            category = Integer.parseInt(request.getParameter("category"));
            pulisher = Integer.parseInt(request.getParameter("publisher"));
            promotion = Integer.parseInt(request.getParameter("promotion"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi định dạng dữ liệu số: " + e.getMessage());
            return;
        }

        Book book = new Book();
        Category categoryObj = categoryService.getCategoryById(category);
        Publisher publisherObj = publisherService.getPublisherById(pulisher);
        if (promotion != 0) {
            Promotion promotionObj = promotionService.getPromotionById(promotion);
            book.setPromotionId(promotion);
            book.setPromotion(promotionObj);
        } else {
            book.setPromotionId(null);
            book.setPromotion(null);
        }

        System.out.println(book.toString());
        // Tạo đối tượng Book và gán các giá trị
        book.setTitle(title);
        book.setAuthor(author);
        book.setCategoryId(category);
        book.setPublisherId(pulisher);
        book.setCategory(categoryObj);
        book.setPublisher(publisherObj);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setOriginalPrice(price);
        book.setDescription(description);
        book.setStatus(status);
        int idNewBook = 0;

        System.out.println("bat dau insert");
        System.out.println(book.toString());
        if (bookDetailService.findByName(title) == null) {
            book = bookService.insertProduct(book);
            idNewBook = book.getbId();
        } else {
            request.setAttribute("baoloi", "Sản phẩm đã tồn tại");
        }

//        //xu li hinh anh

//        String uploadPath = request.getServletContext().getRealPath("/img/uploadProducts");
//        File uploadDir = new File(uploadPath);
//        if (!uploadDir.exists()) uploadDir.mkdirs();
////
////        Part anhTrungBay = request.getPart("anhTrungBay");
////        if (anhTrungBay != null && anhTrungBay.getSize() > 0) {
////            String originalName = Paths.get(anhTrungBay.getSubmittedFileName()).getFileName().toString();
////            String thumbNailImageNames = originalName.replaceAll("\\s+", "_");
////            if (isValidImage(thumbNailImageNames)) {
////                anhTrungBay.write(uploadPath + File.separator + thumbNailImageNames);
////                System.out.println("Ảnh đã lưu vào: " + uploadPath + File.separator + thumbNailImageNames);
////                otherImageNames.add("/img/uploadProducts/" + thumbNailImageNames);
////            }
////        }
//
        // xu lý ảnh
        List<String> otherImageNames = new ArrayList<>();
        Part anhTrungBay = request.getPart("anhTrungBay");

        if (anhTrungBay != null && anhTrungBay.getSize() > 0 && anhTrungBay.getSubmittedFileName() != null) {
            try {
                String thumbNailImageNames = CloundinaryConfig.getUrl(anhTrungBay);
                otherImageNames.add(thumbNailImageNames);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải ảnh lên");
                return;
            }
        }

        String originalName;
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if ("themAnhKhac".equals(part.getName()) && part.getSize() > 0) {
                originalName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (isValidImage(originalName)) {
                    try {
                        String imageUrl = CloundinaryConfig.getUrl(part); // ✅ dùng đúng part hiện tại
                        otherImageNames.add(imageUrl);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("baoloi", "Lỗi khi tải ảnh khác lên");
                        return;
                    }
                }
            }
        }
        System.out.println(otherImageNames.toString());
////        String originalName;
////        Collection<Part> parts = request.getParts();
////        for (Part part : parts) {
////            if ("themAnhKhac".equals(part.getName()) && part.getSize() > 0) {
////                originalName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
////                String fileName = originalName.replaceAll("\\s+", "_");
////                if (isValidImage(fileName)) {
////                    part.write(uploadPath + File.separator + fileName);
////                    System.out.println("Ảnh đã lưu vào: " + uploadPath + File.separator + fileName);
////                    otherImageNames.add("/img/uploadProducts/" + fileName);
////                }
////            }
////        }
//
        System.out.println("them ds anh vao sach");
        List<Image> listImage = new ArrayList<>();
        for (int i = 0; i < otherImageNames.size(); i++) {
            boolean isThumbnail = (i == 0);
            Image image = new Image(idNewBook, otherImageNames.get(i), isThumbnail);
            listImage.add(image);
            System.out.println(image.toString());
            Image savedImage = imageService.insertImage(image);
            image.setImgId(savedImage.getImgId());
        }
        System.out.println(listImage.toString());

        book.setImage(listImage.get(0));
        System.out.println("them anh thumbnail");
        book.setImageList(listImage);
        System.out.println(book.toString());

        try {
            PrintWriter printWriter = response.getWriter();
            printWriter.println(new GsonUtil().toJSon(book));
            printWriter.flush();
            printWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Serialization error");
        }

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        Gson gson = new Gson();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        System.out.println("da nhan duoc data");
        int idBook = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("tenSanPham");
        String author = request.getParameter("Tacgia");
        String dimensions = request.getParameter("dimensions");
        String format = request.getParameter("format");
        String description = request.getParameter("description");

        int publishYear = 0, pageCount = 0;
        double price = 0, weight = 0;
        int status = 0, category = 0, pulisher = 0, promotion = 0;

        try {
            publishYear = Integer.parseInt(request.getParameter("NamXB"));
            weight = Double.parseDouble(request.getParameter("khoiLuong"));
            pageCount = Integer.parseInt(request.getParameter("pageCount"));

            price = Double.parseDouble(request.getParameter("price"));
            status = Integer.parseInt(request.getParameter("status"));
            category = Integer.parseInt(request.getParameter("category"));
            pulisher = Integer.parseInt(request.getParameter("publisher"));
            promotion = Integer.parseInt(request.getParameter("promotion"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi định dạng dữ liệu số: " + e.getMessage());
            return;
        }

        Book book = new Book();
        Category categoryObj = categoryService.getCategoryById(category);
        Publisher publisherObj = publisherService.getPublisherById(pulisher);
        if (promotion != 0) {
            Promotion promotionObj = promotionService.getPromotionById(promotion);
            book.setPromotionId(promotion);
            book.setPromotion(promotionObj);
        } else {
            book.setPromotionId(null);
            book.setPromotion(null);
        }

        // Tạo đối tượng Book và gán các giá trị
        book.setTitle(title);
        book.setAuthor(author);
        book.setCategoryId(category);
        book.setPublisherId(pulisher);
        book.setCategory(categoryObj);
        book.setPublisher(publisherObj);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setOriginalPrice(price);
        book.setDescription(description);
        book.setStatus(status);

        System.out.println("bat dau update");
        book = bookService.updateProduct(book);
        System.out.println(book.toString());

        // xu lý ảnh
        List<String> otherImageNames = new ArrayList<>();
        Part anhTrungBay = request.getPart("anhTrungBay");

        if (anhTrungBay != null && anhTrungBay.getSize() > 0 && anhTrungBay.getSubmittedFileName() != null) {
            try {
                String thumbNailImageNames = CloundinaryConfig.getUrl(anhTrungBay);
                otherImageNames.add(thumbNailImageNames);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải ảnh lên");
                return;
            }
        }

        String originalName;
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if ("themAnhKhac".equals(part.getName()) && part.getSize() > 0) {
                originalName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (isValidImage(originalName)) {
                    try {
                        String imageUrl = CloundinaryConfig.getUrl(part); // ✅ dùng đúng part hiện tại
                        otherImageNames.add(imageUrl);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("baoloi", "Lỗi khi tải ảnh khác lên");
                        return;
                    }
                }
            }
        }
        System.out.println(otherImageNames.toString());
////        String originalName;
////        Collection<Part> parts = request.getParts();
////        for (Part part : parts) {
////            if ("themAnhKhac".equals(part.getName()) && part.getSize() > 0) {
////                originalName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
////                String fileName = originalName.replaceAll("\\s+", "_");
////                if (isValidImage(fileName)) {
////                    part.write(uploadPath + File.separator + fileName);
////                    System.out.println("Ảnh đã lưu vào: " + uploadPath + File.separator + fileName);
////                    otherImageNames.add("/img/uploadProducts/" + fileName);
////                }
////            }
////        }
//
        System.out.println("them ds anh vao sach");
        List<Image> listImage = new ArrayList<>();
        imageService.delete(idBook);
        for (int i = 0; i < otherImageNames.size(); i++) {
            boolean isThumbnail = (i == 0);
            Image image = new Image(idBook, otherImageNames.get(i), isThumbnail);
            listImage.add(image);
            System.out.println(image.toString());
            Image savedImage = imageService.insertImage(image);
            image.setImgId(savedImage.getImgId());
        }
        System.out.println(listImage.toString());

        book.setImage(listImage.get(0));
        System.out.println("them anh thumbnail");
        book.setImageList(listImage);
        System.out.println(book.toString());

        try {
            PrintWriter printWriter = response.getWriter();
            printWriter.println(new GsonUtil().toJSon(book));
            printWriter.flush();
            printWriter.close();
        } catch (
                Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Serialization error");
        }
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        PrintWriter printWriter = resp.getWriter();
        try {
            bookDetailService.delete(id);
            printWriter.println("Delete Done");
            printWriter.close();
        } catch (Exception e) {
            resp.setStatus(400);
            printWriter.println("Error");
            printWriter.close();
        }
    }


    private boolean isValidImage(String fileName) {
        String extension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        return extension.matches("jpg|jpeg|png|gif");
    }

}