<template>
    <div class="mt-5">

        <select  class="form-control mb-5 mt-5 w-25" v-model="typeValue">
            <option value="">Tipe 1</option>
            <option value="2">Tipe 2</option>
            <option value="3">Tipe 3</option>
        </select>

        <input class="form-control w-25" type="text" placeholder="masukan nilai" @input="handleInputValue" v-model="inputValue" @keyup.enter="getValue"/>

        <div id="container_text" class="">
            <div class="container" v-html="resultHtmlValue"></div>
        </div>
    </div>
</template>

<style scoped>
    #container_text > div > p {
        font-size: 12px;
        font-weight: 700;
        font-family: 'Courier New', Courier, monospace;
    }

    #container_text {
        width: 120px;
        margin: 36px auto;
    }

</style>

<script>

import axios from "axios"


export default {
    name: "Soal1",
    components : {

    },
    data() {
        return {
            inputValue : '',
            resultHtmlValue : '',
            typeValue : ''
        }
    },
    methods: {
        handleInputValue() {
            console.log(this.inputValue)
        },

        async getValue() {
            const url = "http://localhost:8082/api/"
            console.log(url + `bintang${this.typeValue}/` + this.inputValue)
            const response = await axios.get(url + `bintang${this.typeValue}/` + this.inputValue)
            this.resultHtmlValue = response.data.replace(/_/g, '<span style="color:white;">_</span>');
        }
    },
}
</script>