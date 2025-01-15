package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductAjaxController", value = "/admin/ProductAjaxController")
public class ProductAjaxController extends HttpServlet {
    BookDetailService bookDetailService ;

    public ProductAjaxController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("all")) {
            List<Book> producer = bookDetailService.listAllProduct();
            PrintWriter printWriter = response.getWriter();
            printWriter.println(new GsonUtil().toJSon(producer));
            printWriter.flush();
            printWriter.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String address= request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");


        PrintWriter printWriter = response.getWriter();

//        ProducerService producerService = new ProducerService();
//        Producer producer = new Producer();
//
//        try {
//            producer.setId(id);
//            producer.setName(name);
//            producer.setEmail(email);
//            producer.setAddress(address);
//            producer.setPhone(phone);
//        } catch (Exception e) {
//            resp.setStatus(400);
//            printWriter.println(new ExceptionModel(e.toString()));
//            printWriter.close();
//        }
//        System.out.println(producer);
//        try {
//            if (id == null || id.equals("")) {
//                id = StringUtil.genIDWithLength(10);
//                producer.setId(id);
//                producerService.insert(producer);
//                printWriter.println("Insert Success");
//            } else {
//                // update
//                producerService.update(producer);
//                printWriter.println("Update Success");
//            }
//            printWriter.close();
//        } catch (Exception e) {
//            System.out.println(e);
//            resp.setStatus(400);
//            printWriter.close();
//        }
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
}