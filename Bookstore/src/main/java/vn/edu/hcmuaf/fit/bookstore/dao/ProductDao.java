package vn.edu.hcmuaf.fit.bookstore.dao;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.util.*;

public class ProductDao {
    static Map<Integer, Book> data = new HashMap<>();

    static {
        data.put(1, new Book(1, "Sách Nhà Giả Kim (Tái bản năm 2020)", 1, 1, 1, 2021, "13 x 20.5 cm", 3, 227, "Bìa mềm", 79.000, "Nhà Giả Kim Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.” (trích đoạn)", 1, 40, 79, new Date(2021, 06, 21), new Date(2021, 06, 21), 1));
        data.put(2, new Book(2, "Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều", 2, 2, 2, 2024, "20 x 13 x 1.1 cm", 3, 232, "Bìa mềm", 95.000, "NHẠY CẢM - KHÔNG PHẢI MÓN QUÀ CŨNG CHẲNG LÀ BẤT HẠNH\n\n\n\n- Bạn là người luôn cố kìm nén cảm xúc của bản thân dù là tích cực hay tiêu cực?\n\n- Bạn dễ xúc động, “hở tí là khóc”?\n\n- Bạn cũng là người thường bị ảnh hưởng bởi cái nhìn, suy nghĩ của người khác?\n\n- Đôi khi bạn cảm thấy dường như không ai hiểu được mình?\n\n\n\nVậy rất có thể bạn là người vừa nhạy cảm, lại vừa nghĩ nhiều. \n\n\n\nAi cũng hiểu sự nhạy cảm là nguyên nhân của những đêm trằn trọc mất ngủ, những câu hỏi không có câu trả lời, những cơn đau xé lòng, những suy nghĩ miên man như muốn nổ tung tâm trí, những lần bộc phát cảm xúc để rồi hối hận hay những lần bất lực với bản thân... Dù cả thế giới nói nhạy cảm là một món quà thì sâu bên trong, dường như chẳng ai muốn đón nhận món quà đó. \n\n\n\nVậy nhạy cảm là điều bất hạnh sao? Cũng không hẳn nhỉ, tác giả Monet có chia sẻ trong cuốn sách đầu tay “Một trái tim nhạy cảm, một cái đầu nghĩ nhiều” rằng: “Ý nghĩa của sự nhạy cảm không phân rõ trắng đen. Chúng không cần dán nhãn là món quà hay nỗi bất hạnh, không cần gạt bỏ cũng không cần tôn vinh. Chúng đến nhưng không kèm theo hướng dẫn sử dụng. Cách bạn đối diện và đối xử mới quyết định chúng là nỗi bất hạnh hay món quà trời ban.”\n\n\n\nChứa đựng những lời chia sẻ và kiến thức bổ ích từ chủ nhân podcast phát triển bản thân với hơn 1 triệu lượt nghe Monet’s Talk & Touch, cuốn sách “Một trái tim nhạy cảm, một cái đầu nghĩ nhiều” sẽ giúp bạn đón nhận sự nhạy cảm một cách tự nhiên như chúng vốn là, giúp bạn điềm tĩnh làm quen, làm thân và làm lành với phiên bản nhạy cảm bên trong mình.", 1, 195, 40, new Date(2024, 01, 21), new Date(2024, 01, 21), 1));
    }

    public List<Book> getAllBooks() {
        return new ArrayList<>(data.values());
    }

    public Book getById(int bid) {
        if (!data.containsKey(bid))
            return null;
        return data.get(bid);
    }
}
