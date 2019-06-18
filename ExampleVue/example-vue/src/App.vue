<template>
  <div id="app">
    <transition>
      <router-view></router-view>
    </transition>
  </div>
</template>

<script type="text/ecmascript-6">

  import {mapMutations, mapActions, mapState, mapGetters} from 'vuex'

  export default {
    // props     : ['users'],
    // props     : {
    //   users: {
    //     type    : Array,
    //     required: true,
    //   },
    // },
    components: {},
    name      : 'App',
    created() {
      console.log('%c%s', 'color:blue', 'App.vue created')
    },
    destroyed() {
      console.log('%c%s', 'color:blue', 'App.vue destroyed')
    },
    mounted() {
      this.$axios.get('http://jsonplaceholder.typicode.com/posts').then(({ data }) => {
        // this.$axios.get('http://api.51tsr.com/zaotoutiao-api-home-1.0.0/news/channels11111111111111111').then(({ data }) => {
        // let posts = data
        // this.setState(({ data }) => {return { data: data.set('posts', posts) }})
        // hlog(data, `data`, 'App.vue:33', 0)
        // hlog(JSON.stringify(data, null, 2), `ljs`, 'App.vue:33', 0)

      }).catch((err) => {
        console.log(`\x1b[41m${err}\x1b[0m`)
      })
      window.localStorage.hello = 'hello world'
      hlog(Reflect.ownKeys(localStorage), `lks`, 'App.vue:41', 0)
    },
    data() {
      return {
        text: 'start',
        end : 'end',
      }
    },
    /** methods */
    methods   : {},
    /** computed */
    computed  : {
      transition() {
        return 'slide-normal'
      },
    },
    //  watch: {
    //    title(newValue, oldValue){
    //      console.log('【rightpanel.vue:84】-:', newValue, oldValue);
    //    }
    //  }
    //  filters:{
    //    // 使用方法: {{item.title | toUp}}
    //    toUp(str){
    //      return str.toUpperCase();
    //    }
    //  },
    //  directives: {
    //    // 使用方法: https://cn.vuejs.org/v2/guide/custom-directive.html#ad
    //    height: {
    //      inserted(el, binding, vnode, oldVnode){
    //        console.log('【index.vue:21】-:', 'el = ', el);
    //        console.log('【index.vue:22】-:', 'binding = ', binding);
    //      }
    //    }
    //  },

  }
</script>
<style lang="scss" rel="stylesheet/scss">
  .App {
    /* important code */
    height : 100%;
  }

  /* 解决 [Intervention] Unable to preventDefault inside passive event listener due to target being treated as passive.
See https://www.chromestatus.com/features/5093566007214080*/
  * {touch-action : none;}

  .v-enter, .v-leave-to {
    opacity          : 0;
    transform: translate3d(100%, 0, 0);
  }
  .v-enter-active, .v-leave-active {
    transition       : all 0.25s;
  }

  /* .v-move 和 .v-leave-active 配合使用, 能够实现列表后续的元素, 渐渐地飘上来的效果*/
  /*.v-move {*/
    /*transition       : all 0.25s ease;*/
    /*background-color : #FFE4B5;*/
  /*}*/

  .v-leave-active {
    position  : absolute;
    opacity          : 0;
  }

</style>
