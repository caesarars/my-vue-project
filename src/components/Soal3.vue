<template>
    <div class="container mt-5 mb-5">
        <h3>Create Table Karyawan</h3>
        <div class="mt-5 mb-5">
            CREATE TABLE karyawan (
                id_karyawan VARCHAR(24) PRIMARY KEY,
                nama_karyawan VARCHAR(50),
                nik VARCHAR(16),
                id_level INT,
                id_jabatan VARCHAR(25)
            ) 
        </div>
        <h3>Create Table Jabatan</h3>
        <div class="mt-5 mb-5">
            CREATE TABLE jabatan (
                id_jabatan VARCHAR(25) PRIMARY KEY,
                nama_jabatan VARCHAR(50)
            );

        </div>
        <h3>Create Table level</h3>
        <div class="mt-5 mb-5">
            CREATE TABLE level (
                id_level INT PRIMARY KEY,
                nama_level VARCHAR(50)
            );
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>