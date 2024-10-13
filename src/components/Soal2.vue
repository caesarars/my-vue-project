<template>
    <div class="container mt-5 mb-5">
       <input type="text" class="form-control w-25" placeholder="masukan nominal uang" v-model="nilaiUang" @keypress.enter="handleKeyPress" >
       <h1>{{denominasi}}</h1>
    </div>
</template>


<script>
import axios from 'axios'
export default {
    name : "Soal2",
    data() {
        return {
            denominasi : '',
            nilaiUang : ''
        }
    },
    methods: {
        async handleKeyPress () {
            const url = "http://localhost:8082/api/rupiah/";
            console.log(url + this.nilaiUang)
            const response = await axios.get(url+ this.nilaiUang);
            this.denominasi =  response.data;
        }
    }



}
</script>