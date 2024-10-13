<template>
    <div>
        
        <div class="mt-5 mb-5">
             <button class="btn btn-primary" @click="openModal">Add Karyawan</button>

        <Modal :isVisible="isModalVisible" :modalTitle="'Add Karyawan'" @close="closeModal" @submit="onSubmit">
            <input v-model="newKaryawan.id_karyawan" type="text" class="form-control" placeholder="ID Karyawan" /><br>
            <input v-model="newKaryawan.nama" type="text" class="form-control" placeholder="Nama Karyawan" /><br>
            <input v-model="newKaryawan.nik" type="text" class="form-control" placeholder="NIK Karyawan" /><br>
            <select class="form-control mb-3" v-model="newKaryawan.id_level">
               <option value="" disabled selected>Level</option> <!-- Placeholder option -->
                <option v-for="(level) in levelList" :key="level.id_level" :value="level.id_level">
                    {{ level.nama_level }} <!-- Menggunakan nama level untuk ditampilkan -->
                </option>
            </select>
            <select class="form-control" v-model="newKaryawan.id_jabatan">
               <option value="" disabled selected>Jabatan</option> <!-- Placeholder option -->
                <option v-for="(jbt) in jabatanList" :key="jbt.id_jabatan" :value="jbt.id_jabatan">
                    {{ jbt.nama_jabatan }} <!-- Menggunakan nama level untuk ditampilkan -->
                </option>
            </select>
        </Modal>

        </div>
        <table class="table mt-5">
        <thead>
            <tr>
            <th scope="col">No.</th>
            <th scope="col">ID Karyawan</th>
            <th scope="col">Nama</th>
            <th scope="col">NIK</th>
            <th scope="col">Level</th>
            <th scope="col">Jabatan</th>
            <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
             <tr  v-for="(karyawan, index) in karyawanList" :key="karyawan.id">
                    <td>{{ index + 1 }}</td>
                    <td>{{ karyawan.id_karyawan }}</td>
                    <td>{{ karyawan.nama_karyawan }}</td>
                    <td>{{ karyawan.nik }}</td>
                    <td>{{ karyawan.nama_level }}</td>
                    <td>{{ karyawan.nama_jabatan }}</td>
                    <td>
                        <button class="btn btn-warning mr-2" @click="openModalDelete(karyawan.id_karyawan)">Delete</button>
                        <button class="btn btn-default" @click="openEditModal(karyawan.id_karyawan)">Edit</button>
                    </td>
                </tr>
        </tbody>
        </table>
        
        <Modal :isVisible="isModalDeleteVisible" :modalTitle="'Delete Karyawan'" @close="closeModalDelete" @submit="onSubmitDelete">
            Apakah anda yakin delete karyawan ? 
        </Modal>

        <Modal :isVisible="isEditModalVisible" :modalTitle="'Edit Karyawan'" @close="closeModalEdit" @submit="onSubmitEdit">
            <input v-model="editKaryawan.id_karyawan" type="text" class="form-control" placeholder="ID Karyawan" disabled /><br>
            <input v-model="editKaryawan.nama" type="text" class="form-control" placeholder="Nama Karyawan" /><br>
            <input v-model="editKaryawan.nik" type="text" class="form-control" placeholder="NIK Karyawan" /><br>
            <select class="form-control mb-3" v-model="editKaryawan.id_level">
                <option value="" disabled selected>Level</option>
                <option v-for="(level) in levelList" :key="level.id_level" :value="level.id_level">
                {{ level.nama_level }}
                </option>
            </select>
            <select class="form-control" v-model="editKaryawan.id_jabatan">
                <option value="" disabled selected>Jabatan</option>
                <option v-for="(jbt) in jabatanList" :key="jbt.id_jabatan" :value="jbt.id_jabatan">
                {{ jbt.nama_jabatan }}
                </option>
            </select>
            </Modal>
    </div>
</template>

<script>
import axios from 'axios';
import Modal from './Modal.vue';

export default {
    name :'Soal4',
    components: {
        Modal
    },
    data() {
         return {
            karyawanList: [],
            jabatanList : [],
            levelList : [],
            isModalVisible: false,
            isModalDeleteVisible : false,
            isEditModalVisible: false,
            idDelete : '',
            newKaryawan: {
                nama: "",
                id_karyawan: "",
                nik: "",
                id_level: "",
                id_jabatan: ""
            },
             editKaryawan: {
                id_karyawan: '',
                nama: '',
                nik: '',
                id_level: '',
                id_jabatan: '',
            },
        };
    },
    methods : {
        async fetchKaryawanData() {
            try {
                const response = await axios.get('http://localhost:8082/api/karyawan');
                this.karyawanList = response.data;
            } catch (error) {
                console.error('Error fetching karyawan data:', error); 
            }
        },
         openModal() {
            this.isModalVisible = true;
        },
        closeModal() {
            this.isModalVisible = false;
        },

        openModalDelete(id) {
            console.log(id)
            this.isModalDeleteVisible = true;
            this.idDelete = id;
        },

         closeModalDelete() {
            this.isModalDeleteVisible = false;
            this.idDelete = '';
        },

        closeModalEdit() {
            this.isEditModalVisible = false
        },

        async openEditModal(id_karyawan) {
            try {
                const response = await axios.get(`http://localhost:8082/api/karyawan/${id_karyawan}`);
                this.editKaryawan = response.data; // Set the response data to editKaryawan
                this.isEditModalVisible = true; // Show the modal
            } catch (error) {
                console.error('Error fetching karyawan data for editing:', error);
            }
        },

        async onSubmitEdit() {
            const url = `http://localhost:8082/api/karyawan/${this.editKaryawan.id_karyawan}`;
            try {
                const response = await axios.put(url, this.editKaryawan);
                alert("Karyawan updated successfully");
                this.fetchKaryawanData();
                this.closeModal();
            } catch (error) {
                console.error("Error updating karyawan:", error);
            }
        },

        async onSubmit () {
            const url = "http://localhost:8082/api/karyawan/add";
            console.log(this.newKaryawan)
            try {
                const response = await axios.post(url, this.newKaryawan, {});
                console.log(response)
                alert("Karyawan added successfully");
                this.fetchKaryawanData();
            } catch (error) {
                alert(error.response.data.message)
                console.error("There was an error adding the karyawan:", error.response.data.message);
            }
        },

        async onSubmitDelete() {
            const url = "http://localhost:8082/api/karyawan/delete/" + this.idDelete;
           
            try {
                const response = await axios.delete(url);
                console.log(response)
                alert("Karyawan deleted successfully");
                this.fetchKaryawanData();
            } catch (error) {
                alert(error.response.data.message)
                console.error("There was an error delete the karyawan:", error.response.data.message);
            }
        },

        async getLevel() {
            try {
                const response = await axios.get('http://localhost:8082/api/level'); 
                this.levelList = response.data;
            } catch (error) {
                console.error('Error fetching leve data:', error); 
            }
        },

        async getJabatan() {
            try {
                const response = await axios.get('http://localhost:8082/api/jabatan'); 
                this.jabatanList = response.data; 
            } catch (error) {
                console.error('Error fetching jabatan data:', error); 
            }
        }
    },
    mounted() {
        this.getLevel();
        this.getJabatan();
        this.fetchKaryawanData();
    },
}
</script>