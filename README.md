# my-vue-project
# Proyek Vue.js dengan Docker

Repositori ini berisi proyek Vue.js yang disiapkan untuk dijalankan di dalam kontainer Docker. Berikut adalah instruksi untuk mengatur dan menjalankan proyek menggunakan Docker.

## Prasyarat

- Pastikan Anda telah menginstal [Docker](https://www.docker.com/get-started) di mesin Anda.
- Pastikan Anda telah menginstal [Docker Compose](https://docs.docker.com/compose/install/).

## Memulai

Ikuti langkah-langkah berikut untuk menyiapkan dan menjalankan aplikasi Vue.js Anda dalam kontainer Docker.

### 1. Kloning Repositori
git clone https://github.com/caesarars/my-vue-project.git


### 2. Docker
docker build -t my-vue-project .
docker-compose up

akan ada di PORT : 
http://localhost:8090
