# Sử dụng image Nginx chính thức
FROM nginx:alpine

# Copy toàn bộ nội dung portfolio vào thư mục web root của nginx
COPY . /usr/share/nginx/html

# Expose port 80 cho container
EXPOSE 80
