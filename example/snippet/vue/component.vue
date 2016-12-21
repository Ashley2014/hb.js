<template>
    <div v-if='data'>


        <!-- use the modal component, pass in the prop -->
        <modal-tag  v-if="showModal" @close="showModal = false" :my-tag="selectTag" ></modal-tag>


    </div>


</template>
<script type="text/babel">
    import {MessageBox, Indicator} from 'mint-ui';

    import {query} from '../services/goods'

    var modalTag= {
        props: ['myTag'],
        template: `
<transition name="modal">
    <div class="modal-mask">
        <div class="modal-wrapper">
            <div class="modal-container">
                <img :src='myTag.cover' >
                <div>{{myTag.title}}</div>
                <div>{{myTag.remark}}</div>

                <button  @click="$emit('close')">
                    close
                </button>
            </div>
        </div>
    </div>
</transition>
  `
    };



    var isData = false;

    export default {
        name: 'good',
        data (){
            return {
                data: null,
            }


        },
        methods: {


            openTagModal(tag){
                // console.log(tag,this.showModal);
                this.selectTag = tag
                this.showModal = true
            },

        },
        components: {
            'modal-tag': modalTag,
        },
        mounted(){
            $('html').addClass('html-goods');
            $('body').addClass('body-goods');

        },
        updated(){

        },
        destroyed(){
            $('html').removeClass('html-goods');
            $('body').removeClass('body-goods');
        }
    };

</script>


<style scoped lang="scss" >

    a {
        text-decoration: none;
        display:block;
    }

</style>
