<template>
  <div class="Home">
    <ul>
      <li v-for="(item,index) in routes" :key="index">
        <router-link :to="{name:item.name}">{{item.name}}</router-link>
      </li>
    </ul>
  </div>
</template>

<script type="text/ecmascript-6">

  import {routes}                                         from '../router'
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
    name      : 'Home',
    created() {
      console.log('%c%s', 'color:blue', 'Home.vue -: call created')
    },

    destroyed() {
      console.log('%c%s', 'color:blue', 'Home.vue -: call destroyed')
    },

    mounted() {
      console.log('%c%s', 'color:blue', 'Home.vue -: call mounted')
      console.log(routes)
    },
    data() {
      return {
        routes: routes.filter(item => !item.hasOwnProperty('redirect')),
      }
    },
    /** methods */
    methods : {},
    /** computed */
    computed: {},
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

<!--cnpm i -D less less-loader stylus stylus-loader node-sass sass-loader-->
<!--<style scoped lang="less" rel="stylesheet/less">-->
<!--<style scoped lang="stylus" rel="stylesheet/stylus">-->
<style scoped lang="scss" rel="stylesheet/scss">

  // @import "../common/stylus/mixin.styl"
  .Home {
    /* important code */
    height : 100%;

  }
</style>
