package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.*;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
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

        int publishYear = 0, weight = 0, pageCount = 0;
        double price = 0;
        int quantity = 0, status = 0, category = 0, pulisher = 0, promotion = 0;

        try {
            publishYear = Integer.parseInt(request.getParameter("NamXB"));
            weight = Integer.parseInt(request.getParameter("khoiLuong"));
            pageCount = Integer.parseInt(request.getParameter("pageCount"));

            price = Double.parseDouble(request.getParameter("price"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
            status = Integer.parseInt(request.getParameter("status"));
            category = Integer.parseInt(request.getParameter("category"));
            pulisher = Integer.parseInt(request.getParameter("publisher"));
            promotion = Integer.parseInt(request.getParameter("promotion"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi định dạng dữ liệu số: " + e.getMessage());
            return;
        }

        Category categoryObj = categoryService.getCategoryById(category);
        Publisher publisherObj = publisherService.getPublisherById(pulisher);
        Promotion promotionObj = promotionService.getPromotionById(promotion);

        // Tạo đối tượng Book và gán các giá trị
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setCategoryId(category);
        book.setPublisherId(pulisher);
        book.setPromotionId(promotion);
        book.setCategory(categoryObj);
        book.setPublisher(publisherObj);
        book.setPromotion(promotionObj);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setOriginalPrice(price);
        book.setDescription(description);
        book.setStockQuantity(quantity);
        book.setStatus(status);
        book = bookService.insertProduct(book);
        System.out.println(book.toString());
        int idNewBook = book.getbId();

        //xu li hinh anh
        String thumbNailImageNames;
        List<String> otherImageNames = new ArrayList<>();

        String uploadPath = request.getServletContext().getRealPath("/img/uploadProducts");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        Part anhTrungBay = request.getPart("anhTrungBay");
        if (anhTrungBay != null && anhTrungBay.getSize() > 0) {
            thumbNailImageNames = Paths.get(anhTrungBay.getSubmittedFileName()).getFileName().toString();
            if (isValidImage(thumbNailImageNames)) {
                anhTrungBay.write(uploadPath + File.separator + thumbNailImageNames);
                System.out.println("Ảnh đã lưu vào: " + uploadPath + File.separator + thumbNailImageNames);
                otherImageNames.add("/img/uploadProducts/" + thumbNailImageNames);
            }
        }

        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if ("themAnhKhac".equals(part.getName()) && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (isValidImage(fileName)) {
                    part.write(uploadPath + File.separator + fileName);
                    System.out.println("Ảnh đã lưu vào: " + uploadPath + File.separator + fileName);
                    otherImageNames.add("/img/uploadProducts/" + fileName);
                }
            }
        }

        List<Image> listImage = new ArrayList<>();
        for (int i = 0; i < otherImageNames.size(); i++) {
            boolean isThumbnail = (i == 0);
            Image image = new Image(idNewBook, otherImageNames.get(i), isThumbnail);
            listImage.add(image);
            Image savedImage = imageService.insertImage(image);
            image.setImgId(savedImage.getImgId());
        }

        book.setImage(listImage.get(0));
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

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int publisher = Integer.parseInt(request.getParameter("publisher"));
        int publishYear = Integer.parseInt(request.getParameter("publishYear"));
        String dimensions = request.getParameter("dimensions");
        int weight = Integer.parseInt(request.getParameter("weight"));
        int pageCount = Integer.parseInt(request.getParameter("pageCount"));
        String format = request.getParameter("format");
        String description = request.getParameter("description");

        // Lấy dữ liệu từ các input trong Right Column
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String status = request.getParameter("status");
        String category = request.getParameter("category");
        String promotion = request.getParameter("promotion");
        Category categoryObj = categoryService.getCategoryById(Integer.parseInt(category));
        Promotion promotionObj = promotionService.getPromotionById(Integer.parseInt(promotion));

        // Tạo đối tượng Book và gán các giá trị
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setDescription(description);
        book.setOriginalPrice(Double.parseDouble(price));
        book.setStockQuantity(Integer.parseInt(quantity));
        book.setStatus(Integer.parseInt(status));
        book.setCategory(categoryObj);
        book.setPromotion(promotionObj);

        book = bookService.updateProduct(book);
        gson.toJson(book, response.getWriter());
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