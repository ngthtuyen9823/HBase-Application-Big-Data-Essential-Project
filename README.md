## 4.1. Mô tả bài toán

Xây dựng website quản lý thông tin sách của thư viện và website hiển thị thông tin sách cho người dùng, cho phép xem và tìm hiểu các sách hiện có trong thư viện bằng việc tìm kiếm và lọc theo các yêu cầu khác nhau. Ngoài ra, có thể tạo thống kê từ cơ sở dữ liệu và hiển thị bằng biểu đồ.

## 4.2. Mô tả tập dữ liệu

Dữ liệu được lấy từ [đây](https://www.kaggle.com/datasets/dylanjcastillo/7k-books-with-metadata/data). Tập dữ liệu gồm 7000 dòng với các cột được mô tả như sau:

- `isbn13` (ISBN 13 Identifier): Mã số duy nhất gồm 13 chữ số để nhận dạng một quyển sách cụ thể.
- `isbn10` (ISBN 10 Identifier): Mã số duy nhất gồm 10 chữ số để nhận dạng một quyển sách cụ thể.
- `title` (Title of book): Tiêu đề của sách.
- `authors` (Authors of book): Danh sách các tác giả của sách, được phân tách bởi dấu chấm phẩy.
- `categories` (Categories): Danh sách các danh mục của sách, được phân tách bởi dấu chấm phẩy.
- `thumbnail` (URL of thumbnail): Đường dẫn đến hình ảnh minh họa (thumbnail) của sách.
- `description` (Description of book): Mô tả về nội dung của sách.
- `published_year` (Year of publication): Năm xuất bản của sách.
- `average_rating` (Average rating in Goodreads): Điểm đánh giá trung bình của sách trên Goodreads.
- `num_page`: Số trang sách.

## 4.3. Hướng dẫn cài đặt project

### Clone project từ GitHub

Clone project tại link: [ngthtuyen9823/BigdataEssential_Hbase](https://github.com/ngthtuyen9823/BigdataEssential_Hbase)

### Import và chuyển đổi tập dữ liệu

1. Mở Eclipse và chọn **Import Project From File System**.
2. Chọn thư mục `AZShopFurni` và nhấn **OK**.

### Import và chuyển đổi dữ liệu

1. Nhấn chuột phải vào class `InitData`. trong thư mục config
2. Chọn **Run as Java Application** để tạo bảng và import dữ liệu từ file csv.

### Màn hình console hiện kết quả: Test Complete

Cho thấy đã import và convert data thành công.

### Tiến hành Run Project

1. Nhấn chuột phải vào Project.
2. Chọn **Run on Server** để mở ứng dụng web.

### Màn hình hiện kết quả:
