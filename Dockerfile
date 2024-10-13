# Menggunakan image Node.js resmi sebagai base image
FROM node:16-alpine

# Set working directory di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json ke container
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin seluruh project file ke dalam container
COPY . .

# Build aplikasi Vue untuk production
RUN npm run build

# Gunakan image Nginx untuk serving build hasil Vue
FROM nginx:alpine

# Salin hasil build Vue ke direktori default Nginx
COPY --from=0 /app/dist /usr/share/nginx/html

# Expose port 80 agar aplikasi bisa diakses
EXPOSE 80

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
