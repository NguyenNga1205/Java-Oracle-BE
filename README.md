# QLSV Backend — Spring Boot + PostgreSQL

Backend quản lý sinh viên (Spring Boot 3, Java 21, Flyway, PostgreSQL). Frontend nằm ở repo riêng và được deploy trên Vercel.

## Chạy bằng Docker (backend + DB là 2 service riêng)

```
docker compose up --build
```

Health check: http://localhost:8080/api/health

Schema và dữ liệu mẫu do Flyway tự migrate khi khởi động (`src/main/resources/db/migration`). Muốn đổi schema, thêm `V3__...sql`, đừng sửa V1/V2.

## Tài khoản mẫu

Chỉ còn tài khoản `admin` (mật khẩu `Demo@2026!`, chỉ dùng cho bài tập). Dữ liệu mẫu ở V2 được V3 xoá; tạo dữ liệu qua giao diện Admin.

## Biến môi trường

| Biến | Mặc định | Ý nghĩa |
|---|---|---|
| `DB_HOST` / `DB_PORT` / `DB_NAME` | `localhost` / `5432` / `java_oracle` | Kết nối PostgreSQL |
| `DB_USER` / `DB_PASSWORD` | `postgres` / `postgres` | Tài khoản DB |
| `DB_SSLMODE` | `prefer` | Dùng `require` khi nối DB ngoài qua Internet |
| `CORS_ALLOWED_ORIGINS` | `http://localhost:3000` | Origin của FE, phân tách bằng dấu phẩy, hỗ trợ `https://*.vercel.app` |
| `PORT` | `8080` | Render tự set |

## Deploy lên Render

1. New Web Service từ repo này, runtime *Docker* (hoặc dùng `render.yaml`), region trùng với PostgreSQL.
2. Đặt `DB_HOST` (Internal hostname `dpg-xxxx-a`), `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `CORS_ALLOWED_ORIGINS` (URL Vercel). Nếu dùng External hostname, thêm `DB_SSLMODE=require`.
3. Health check path `/api/health`.
4. Trên Vercel đặt `NEXT_PUBLIC_API_URL` = URL service Render rồi redeploy FE.

Không commit mật khẩu DB; chỉ nhập trong Render Dashboard.

Các script Oracle cũ được giữ trong `database/oracle/` để tham khảo, backend không dùng.

## Test

```
mvn test
```
