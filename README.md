# Quizzler

Quizzler là một ứng dụng Flutter cơ bản mô phỏng trò chơi câu đố đúng/sai, nơi người dùng trả lời các câu hỏi hiển thị tuần tự. Đây là một bài thực hành giúp người mới làm quen với cách xây dựng giao diện, xử lý logic, và quản lý trạng thái trong Flutter.

## Nội dung tìm hiểu

1.  **Cách sử dụng Flutter SDK để xây dựng ứng dụng:**
    *   Tạo dự án Flutter cơ bản.
    *   Sử dụng các widget như `MaterialApp`, `Scaffold`, `SafeArea`, `Column`, `Expanded`, `TextButton`, `Text`, và `Icon`.
2.  **Tích hợp Material Design:**
    *   Xây dựng giao diện đơn giản nhưng trực quan.
    *   Sử dụng màu sắc nổi bật cho các nút tương tác (green cho "Đúng", red cho "Sai").
3.  **Quản lý dữ liệu câu hỏi:**
    *   Sử dụng class `Question` để định nghĩa dữ liệu câu hỏi.
    *   Sử dụng danh sách (`List`) để lưu trữ nhiều câu hỏi.
4.  **Quản lý trạng thái với `StatefulWidget`:**
    *   Cập nhật trạng thái của câu hỏi hiện tại và danh sách điểm số sau mỗi câu trả lời.
    *   Thiết lập lại trạng thái khi kết thúc câu hỏi.
5.  **Tạo trải nghiệm người dùng:**
    *   Hiển thị biểu tượng (✔ hoặc ✘) sau mỗi lần trả lời.
    *   Cập nhật câu hỏi tiếp theo sau khi trả lời.

## Chức năng thực hiện

1.  **Hiển thị giao diện câu hỏi:**
    *   Một câu hỏi sẽ được hiển thị ở phần trên màn hình với font lớn.
    *   Hai nút bấm tương ứng với câu trả lời "Đúng" và "Sai".
2.  **Xử lý logic câu hỏi:**
    *   So sánh câu trả lời người dùng với đáp án đúng.
    *   Cập nhật danh sách biểu tượng kết quả (`scoreKeeper`).
3.  **Sử dụng các widget Flutter cơ bản:**
    *   `Expanded`: Tạo bố cục các thành phần cân đối trên màn hình.
    *   `TextButton`: Tạo nút bấm với màu sắc và hiệu ứng tương tác.
    *   `Row`: Hiển thị biểu tượng kết quả theo thứ tự trả lời.
4.  **Thiết lập lại trạng thái khi kết thúc:**
    *   Sau khi trả lời hết tất cả các câu hỏi, ứng dụng sẽ khởi động lại từ câu đầu tiên và xoá điểm số cũ.
