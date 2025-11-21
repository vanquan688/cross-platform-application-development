Destini là một ứng dụng Flutter đơn giản cho phép người
dùng trải nghiệm câu chuyện tương tác dạng “chọn lựa
hành động”, tương tự như trò chơi “chọn lối đi”. Dự án này
giúp người học làm quen với các kiến thức về quản lý logic
nhiều nhánh, phân chia class hợp lý và sử dụng
Visibility để kiểm soát hiển thị.

Nội dung tìm hiểu
1. Phân tách dữ liệu câu chuyện theo mô hình hướng đối
tượng:
o Class Story: Lưu trữ dữ liệu từng đoạn truyện và
các lựa chọn tiếp theo.
o Class StoryBrain: Xử lý logic điều hướng câu
chuyện và trạng thái ứng dụng.
2. Quản lý trạng thái ứng dụng với StatefulWidget:
o Giao diện thay đổi theo hành động người dùng.
o Lựa chọn câu chuyện tiếp theo dựa vào người
dùng chọn choice1 hoặc choice2.
3. Sử dụng Visibility để ẩn/hiện nút bấm khi cần
thiết:
o Tự động ẩn nút khi đến cuối câu chuyện và chỉ
còn 1 lựa chọn (ví dụ: “Bắt đầu lại”).
4. Tương tác UI theo Material Design:
o Dùng TextButton, Expanded, Container, và
SafeArea.
o Nút màu đỏ và xanh tương ứng với lựa chọn 1 và
2.
5. Sử dụng hình nền trong Flutter UI:
o Cài đặt hình nền từ assets
(images/background.png).
Chức năng thực hiện
1. Hiển thị nội dung câu chuyện:
o Một đoạn nội dung văn bản chính (storyTitle).
o Hai lựa chọn tương ứng cho người dùng.
2. Điều hướng logic câu chuyện:
o Mỗi lựa chọn đưa người dùng đến một câu
chuyện khác nhau.
o Sử dụng chỉ số nextStory1, nextStory2 để
chuyển đến đoạn tiếp theo trong danh sách
_storyData.
3. Tùy biến hiển thị:
o Khi đến đoạn kết thúc, chỉ hiển thị nút “Bắt đầu
lại”.
