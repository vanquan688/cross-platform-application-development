# BMI Calculator

BMI Calculator là một ứng dụng Flutter cơ bản giúp người dùng tính chỉ số khối cơ thể (BMI) dựa trên chiều cao và cân nặng. Ứng dụng này là một bài tập tuyệt vời cho người mới học Flutter để tìm hiểu về cách xây dựng giao diện người dùng có thể tương tác, quản lý trạng thái, và điều hướng giữa các màn hình.

## Nội dung tìm hiểu

### 1. Sử dụng Flutter SDK để xây dựng ứng dụng:
- Tạo dự án Flutter và tổ chức mã nguồn theo module: `components`, `screens`, `constants`
- Tạo giao diện bằng các widget Flutter như `MaterialApp`, `Scaffold`, `Column`, `Expanded`, `Slider`, `Row`, `Text`, `IconButton`

### 2. Tùy chỉnh giao diện người dùng theo Material Design:
- Áp dụng `AppBar`, `Card`, `Color`, `Icons`, `TextStyle`
- Dùng `SliderTheme`, `RoundIconButton`, và `TextStyle` để thiết kế giao diện đẹp mắt và tương tác tốt

### 3. Quản lý trạng thái với Stateful Widget:
- Sử dụng `setState()` để cập nhật giao diện khi người dùng thay đổi giới tính, chiều cao, cân nặng hoặc tuổi

### 4. Phân chia giao diện thành các thành phần tái sử dụng:
- Tạo `ReuseableCard`, `BottomButton`, `IconContent`, `RoundIconButton` để tái sử dụng dễ dàng và tổ chức mã sạch sẽ

### 5. Điều hướng giữa các màn hình (Navigation):
- Chuyển sang `ResultsPage` bằng `Navigator.push()` khi nhấn nút CALCULATE
- Quay lại `InputPage` với `Navigator.pop()` khi nhấn nút RE-CALCULATE

### 6. Tính toán chỉ số BMI và đưa ra đánh giá:
- Dùng lớp `CalculatorBrain` để tính chỉ số BMI, phân loại (Normal, Overweight, Underweight), và đưa ra lời khuyên phù hợp

## Chức năng thực hiện

### 1. Nhập thông tin cá nhân:
- Cho phép người dùng chọn giới tính (Male, Female)
- Nhập chiều cao bằng Slider (120 – 220 cm)
- Tăng/giảm cân nặng và tuổi bằng các nút + và –

### 2. Tính toán chỉ số BMI:
- Nhấn CALCULATE để tính BMI dựa trên công thức: **BMI = weight / (height/100)²**
- Hiển thị kết quả trên màn hình `ResultsPage` bao gồm:
  - Giá trị BMI
  - Tình trạng sức khỏe (NORMAL / OVERWEIGHT / UNDERWEIGHT)
  - Lời khuyên dựa theo kết quả

### 3. Tái sử dụng giao diện bằng các widget riêng biệt:
- `ReuseableCard` chứa các mục giới tính, chiều cao, cân nặng, tuổi
- `RoundIconButton` để tạo nút tròn với icon
- `BottomButton` để dùng chung cho các nút ở cuối màn hình

### 4. Điều hướng kết quả và tính lại:
- Kết quả hiển thị ở trang `ResultsPage`
- Nhấn RE-CALCULATE để quay lại trang nhập liệu và thử lại với thông tin khác

## Cấu trúc dự án

```
lib/
├── main.dart                 # Entry point của ứng dụng
├── constants.dart            # Định nghĩa các hằng số (colors, text styles)
├── calculator_brain.dart     # Logic tính toán BMI
├── components/
│   ├── bottom_button.dart    # Nút bottom button
│   ├── icon_content.dart     # Icon với label
│   ├── reuseable_card.dart   # Card có thể tái sử dụng
│   └── round_icon_button.dart # Nút tròn với icon
└── screens/
    ├── input_page.dart       # Màn hình nhập liệu
    └── results_page.dart     # Màn hình hiển thị kết quả
```

## Cài đặt và chạy ứng dụng

1. Cài đặt dependencies:
```bash
flutter pub get
```

2. Chạy ứng dụng:
```bash
flutter run
```

## Screenshots

### Màn hình nhập liệu
- Chọn giới tính (Male/Female)
- Điều chỉnh chiều cao bằng slider
- Tăng/giảm cân nặng và tuổi

### Màn hình kết quả
- Hiển thị chỉ số BMI
- Phân loại tình trạng sức khỏe
- Đưa ra lời khuyên phù hợp
