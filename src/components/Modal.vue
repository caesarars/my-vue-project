<template>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" v-if="isVisible">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{modalTitle}}</h5>
                    <button type="button" class="btn-close" @click="closeModal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <slot></slot>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="onSubmit">Submit</button>
                    <button type="button" class="btn btn-secondary" @click="closeModal">Close</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Modal',
    props: {
        isVisible: {
            type: Boolean,
            default: false
        },
        modalTitle: {
            type: String,
             default: ''
        }
    },
    methods: {
        closeModal() {
            this.$emit('close'); // Emit event ke parent untuk menutup modal
            const modalElement = document.getElementById('exampleModal');
            const modal = bootstrap.Modal.getInstance(modalElement);
            console.log("running hide")
            if (modal) {
                modal.hide(); // Menutup modal menggunakan Bootstrap API
            }

         
        },
        onSubmit() {
            this.$emit('submit')
         }
    },
    watch: {
        isVisible(newValue) {
            if (newValue) {
                this.$nextTick(() => {
                    const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
                    modal.show();
                });
            }
        }
    }
}
</script>
