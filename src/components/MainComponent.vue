<template>
    <div class="container">
        <div class="d-flex flex-row justify-content-around">
            <div @click="handleNav('soal1')">Soal 1</div>
            <div @click="handleNav('soal2')">Soal 2</div>
            <div @click="handleNav('soal4')">CRUD</div>
        </div> 
        <soal-1-vue v-show="showSoal == 'soal1'"></soal-1-vue>
        <soal-2-vue v-show="showSoal == 'soal2'"></soal-2-vue>
        <soal-3-vue v-show="showSoal == 'soal3'"></soal-3-vue>
        <soal-4-vue v-show="showSoal == 'soal4'"></soal-4-vue>
    </div>
</template>

<script>
import Soal1Vue from './Soal1.vue'
import Soal2Vue from './Soal2.vue'
import Soal3Vue from './Soal3.vue'
import Soal4Vue from './Soal4.vue'


export default {
     name : "MainComponent",
     components : {
        Soal1Vue,
        Soal2Vue,
        Soal3Vue,
        Soal4Vue
     },
     data() {
        return {
            showSoal : 'soal1'
        }
     },
     methods: {
         handleNav(event) {
            this.showSoal = event;
         }
     },
     
}
</script>