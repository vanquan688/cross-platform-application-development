# Dự án Xylophone

Dự án Xylophone là một ứng dụng Flutter cơ bản mô phỏng đàn Xylophone, giúp người dùng tạo ra âm thanh bằng cách chạm vào các phím màu sắc. Đây là một bài tập giúp người mới học làm quen với quy trình phát triển ứng dụng di động bằng Flutter.

## Nội dung tìm hiểu

1.  **Cách sử dụng Flutter SDK để xây dựng ứng dụng:**
    *   Tạo dự án Flutter cơ bản.
    *   Sử dụng các widget như `MaterialApp`, `Scaffold`, `Column`, `Expanded`, và `TextButton`.
2.  **Tích hợp Material Design:**
    *   Xây dựng ứng dụng dựa trên Material Design.
    *   Sử dụng các màu sắc sinh động để thiết kế giao diện.
3.  **Quản lý tài nguyên (âm thanh) trong ứng dụng Flutter:**
    *   Thêm tệp âm thanh vào thư mục `assets/`.
    *   Khai báo tài nguyên trong file `pubspec.yaml`.
4.  **Sử dụng phương thức phát âm thanh:**
    *   Sử dụng thư viện `audioplayers` để phát âm thanh khi nhấn phím.
    *   Cài đặt package `audioplayers` trong `pubspec.yaml`.
5.  **Cấu trúc file và thiết lập dự án Flutter qua `pubspec.yaml`:**
    *   Khai báo dependencies và quản lý tài nguyên âm thanh.

## Chức năng thực hiện

1.  **Hiển thị giao diện đàn Xylophone:**
    *   Bao gồm các phím đàn với màu sắc khác nhau.
2.  **Sử dụng tài nguyên từ thư mục `assets/`:**
    *   Phát âm thanh tương ứng khi người dùng nhấn vào các phím đàn.
3.  **Tích hợp các thành phần cơ bản của Flutter:**
    *   Sử dụng các widget cơ bản như `AppBar`, `Column`, `Expanded`, và `TextButton`.
    *   Thay đổi màu sắc và hiệu ứng khi người dùng tương tác.
4.  **Xử lý phát âm thanh:**
    *   Sử dụng thư viện `audioplayers` để phát từng nốt nhạc tương ứng với phím đàn.
    *   Xây dựng hàm phát âm thanh với đầu vào là số thứ tự của phím đàn.
