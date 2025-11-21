# Weather App - Ứng dụng Thời tiết Flutter

## Giới thiệu

Dự án **Weather App** là một ứng dụng Flutter cơ bản sử dụng API thời tiết miễn phí từ **Open-Meteo** để hiển thị thông tin thời tiết hiện tại theo vị trí người dùng hoặc thành phố được nhập vào. Đây là một bài tập lý tưởng giúp người mới học làm quen với việc tích hợp API, xử lý dữ liệu JSON và xây dựng giao diện động trong Flutter.

**Ưu điểm của Open-Meteo API:**
- ✅ Hoàn toàn miễn phí
- ✅ Không cần đăng ký API key
- ✅ Không giới hạn số lượng requests
- ✅ Dữ liệu chính xác và cập nhật thường xuyên

## Tính năng

- ✅ Hiển thị thời tiết hiện tại dựa trên vị trí GPS
- ✅ Tìm kiếm thời tiết theo tên thành phố
- ✅ Hiển thị nhiệt độ, cảm giác nhiệt độ, độ ẩm, tốc độ gió
- ✅ Biểu tượng thời tiết động thay đổi theo điều kiện thời tiết
- ✅ Giao diện Material Design hiện đại, thân thiện người dùng
- ✅ Trạng thái loading với animation

## Giao diện

Ứng dụng bao gồm:
- **Thanh tìm kiếm**: Nhập tên thành phố để tìm kiếm thời tiết
- **Thông tin vị trí**: Hiển thị tên thành phố và ngày tháng hiện tại
- **Biểu tượng thời tiết**: Icon động thay đổi theo điều kiện thời tiết
- **Nhiệt độ chính**: Hiển thị nhiệt độ lớn và cảm giác nhiệt độ
- **Thông tin chi tiết**: 
  - Độ ẩm (Humidity)
  - Tốc độ gió (Wind Speed)
  - Nhiệt độ thấp nhất (Min Temp)
  - Nhiệt độ cao nhất (Max Temp)

## Nội dung tìm hiểu

### 1. Cách sử dụng Flutter SDK để xây dựng ứng dụng

- Tạo dự án Flutter cơ bản
- Sử dụng các widget như:
  - `MaterialApp`: Widget gốc của ứng dụng
  - `Scaffold`: Cấu trúc layout cơ bản
  - `SafeArea`: Đảm bảo nội dung không bị che bởi notch/status bar
  - `Column`, `Row`: Layout widgets
  - `Text`: Hiển thị văn bản
  - `IconButton`: Nút có biểu tượng
  - `TextField`: Nhập liệu từ người dùng
- Áp dụng `StatefulWidget` để xử lý thay đổi trạng thái khi cập nhật dữ liệu thời tiết

### 2. Tích hợp Material Design

- Thiết kế giao diện thời tiết hiện đại, thân thiện người dùng theo hướng dẫn Material Design
- Dùng các biểu tượng `Icons` sẵn có của Flutter (ví dụ: `location_on`, `search`, `water_drop`, `air`, `thermostat`)
- Tùy chỉnh màu sắc nền và bố cục linh hoạt để hiển thị thông tin thời tiết
- Sử dụng `Container`, `BoxDecoration` để tạo các thành phần UI đẹp mắt

### 3. Gọi API và xử lý dữ liệu JSON

- Sử dụng package `http` để gọi API từ OpenWeatherMap
- Nhận và phân tích dữ liệu JSON trả về (nhiệt độ, mô tả thời tiết, tên thành phố)
- Ánh xạ dữ liệu JSON vào giao diện người dùng
- Xử lý các trường hợp lỗi khi gọi API

### 4. Sử dụng thư viện để lấy vị trí thiết bị

- Tích hợp thư viện `geolocator` để lấy vị trí hiện tại của người dùng (GPS)
- Dùng tọa độ (latitude, longitude) để gọi API và trả về dữ liệu thời tiết tương ứng
- Xử lý quyền truy cập vị trí (Location Permissions)

### 5. Quản lý cấu trúc thư mục và pubspec.yaml

- Khai báo các dependencies cần thiết:
  - `http`: ^1.1.0 - Gọi HTTP requests
  - `geolocator`: ^10.1.0 - Lấy vị trí GPS
  - `flutter_spinkit`: ^5.2.0 - Animation loading
- Tổ chức mã nguồn thành nhiều file để dễ bảo trì:
  - `lib/services/location.dart`: Xử lý vị trí GPS
  - `lib/services/networking.dart`: Xử lý HTTP requests
  - `lib/services/weather_model.dart`: Logic nghiệp vụ và model
  - `lib/main.dart`: Giao diện chính

## Cấu trúc thư mục

```
lib/
├── main.dart                     # Giao diện chính của ứng dụng
└── services/
    ├── location.dart             # Xử lý lấy vị trí GPS
    ├── networking.dart           # Xử lý HTTP requests
    └── weather_model.dart        # Logic nghiệp vụ và model dữ liệu
```

## Cài đặt

### 1. Clone repository

```bash
git clone <repository-url>
cd lap1_i_am_rich
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Lấy API Key từ OpenWeatherMap

1. Truy cập [OpenWeatherMap](https://openweathermap.org/)
2. Đăng ký tài khoản miễn phí
3. Lấy API Key từ phần API keys
4. Mở file `lib/services/weather_model.dart`
5. Thay thế `YOUR_API_KEY_HERE` bằng API key của bạn:

```dart
const apiKey = 'your_actual_api_key_here';
```

### 4. Cấu hình quyền truy cập vị trí

#### Android (`android/app/src/main/AndroidManifest.xml`)

Thêm các quyền sau vào file AndroidManifest.xml:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET"/>
```

#### iOS (`ios/Runner/Info.plist`)

Thêm các key sau vào file Info.plist:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to get weather data.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location to get weather data.</string>
```

### 5. Chạy ứng dụng

```bash
flutter run
```

## Sử dụng

1. **Khởi động ứng dụng**: Ứng dụng sẽ tự động lấy vị trí hiện tại và hiển thị thời tiết
2. **Tìm kiếm thành phố**: 
   - Nhập tên thành phố vào ô tìm kiếm (ví dụ: "Hanoi", "Ho Chi Minh")
   - Nhấn nút tìm kiếm hoặc Enter
   - Xem thông tin thời tiết của thành phố đó

## Chức năng thực hiện

### 1. Hiển thị giao diện thời tiết

- Giao diện chính hiển thị:
  - Nhiệt độ hiện tại
  - Cảm giác nhiệt độ (Feels like)
  - Mô tả thời tiết (overcast clouds, clear sky, etc.)
  - Tên thành phố hiện tại
  - Độ ẩm không khí
  - Tốc độ gió
  - Nhiệt độ thấp nhất và cao nhất trong ngày
- Biểu tượng thời tiết thay đổi động dựa trên dữ liệu API:
  - 🌩 Thunderstorm (< 300)
  - 🌧 Drizzle (300-400)
  - ☔️ Rain (400-600)
  - ☃️ Snow (600-700)
  - 🌫 Atmosphere (700-800)
  - ☀️ Clear sky (800)
  - ☁️ Clouds (801-804)

### 2. Tìm kiếm thời tiết theo vị trí

- Cho phép người dùng nhập tên thành phố để lấy thông tin thời tiết tương ứng
- Hiển thị dữ liệu mới sau mỗi lần tìm kiếm thành công
- Xử lý trường hợp không tìm thấy thành phố

### 3. Lấy vị trí tự động

- Tự động lấy vị trí GPS khi khởi động ứng dụng
- Hiển thị thời tiết theo vị trí hiện tại của người dùng

## Công nghệ sử dụng

- **Flutter SDK**: ^3.8.1
- **Dart**: ^3.8.1
- **Dependencies**:
  - `http`: ^1.1.0 - HTTP requests
  - `geolocator`: ^10.1.0 - GPS location
  - `flutter_spinkit`: ^5.2.0 - Loading animations
  - `cupertino_icons`: ^1.0.8 - iOS icons

## API Reference

Ứng dụng sử dụng OpenWeatherMap API:
- **Endpoint**: `https://api.openweathermap.org/data/2.5/weather`
- **Parameters**:
  - `lat`, `lon`: Tọa độ GPS
  - `q`: Tên thành phố
  - `appid`: API key
  - `units`: metric (Celsius)

## Lưu ý

- Đảm bảo thiết bị có kết nối Internet
- Cấp quyền truy cập vị trí cho ứng dụng
- API key miễn phí của OpenWeatherMap có giới hạn số lượng requests
- Tên thành phố nên nhập bằng tiếng Anh (ví dụ: "Hanoi" thay vì "Hà Nội")

## Tài liệu tham khảo

- [Flutter Documentation](https://docs.flutter.dev/)
- [OpenWeatherMap API Documentation](https://openweathermap.org/api)
- [Geolocator Package](https://pub.dev/packages/geolocator)
- [HTTP Package](https://pub.dev/packages/http)
- [Material Design Guidelines](https://material.io/design)

## License

This project is open source and available for educational purposes.
