<template>
  <div class="Accordion">
    <header class="mui-bar mui-bar-nav">
      <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
      <h1 class="mui-title">折叠面板</h1>
    </header>
    <div class="mui-content">
      <div class="mui-card">
        <ul class="mui-table-view">
          <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">表单</a>
            <div class="mui-collapse-content">
              <form class="mui-input-group">
                <div class="mui-input-row">
                  <label>Input</label>
                  <input type="text" placeholder="普通输入框">
                </div>
                <div class="mui-input-row">
                  <label>Input</label>
                  <input type="text" class="mui-input-clear" placeholder="带清除按钮的输入框">
                </div>

                <div class="mui-input-row mui-plus-visible">
                  <label>Input</label>
                  <input type="text" class="mui-input-speech mui-input-clear" placeholder="语音输入">
                </div>
                <div class="mui-button-row">
                  <button class="mui-btn mui-btn-primary" type="button" onclick="return false;">确认</button>&nbsp;&nbsp;
                  <button class="mui-btn mui-btn-primary" type="button" onclick="return false;">取消</button>
                </div>
              </form>
            </div>
          </li>
          <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">图片轮播</a>
            <div class="mui-collapse-content">
              <div id="slider" class="mui-slider">
                <div class="mui-slider-group mui-slider-loop">
                  <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
                  <div class="mui-slider-item mui-slider-item-duplicate">
                    <a href="#">
                      <img src="/static/images/yuantiao.jpg">
                    </a>
                  </div>
                  <!-- 第一张 -->
                  <div class="mui-slider-item">
                    <a href="#">
                      <img src="/static/images/shuijiao.jpg">
                    </a>
                  </div>
                  <!-- 第二张 -->
                  <div class="mui-slider-item">
                    <a href="#">
                      <img src="/static/images/muwu.jpg">
                    </a>
                  </div>
                  <!-- 第三张 -->
                  <div class="mui-slider-item">
                    <a href="#">
                      <img src="/static/images/cbd.jpg">
                    </a>
                  </div>
                  <!-- 第四张 -->
                  <div class="mui-slider-item">
                    <a href="#">
                      <img src="/static/images/yuantiao.jpg">
                    </a>
                  </div>
                  <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
                  <div class="mui-slider-item mui-slider-item-duplicate">
                    <a href="#">
                      <img src="/static/images/shuijiao.jpg">
                    </a>
                  </div>
                </div>
                <div class="mui-slider-indicator">
                  <div class="mui-indicator mui-active"></div>
                  <div class="mui-indicator"></div>
                  <div class="mui-indicator"></div>
                  <div class="mui-indicator"></div>
                </div>
              </div>
            </div>
          </li>
          <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">文字排版</a>
            <div class="mui-collapse-content">
              <h1>h1. Heading</h1>
              <h2>h2. Heading</h2>
              <h3>h3. Heading</h3>
              <h4>h4. Heading</h4>
              <h5>h5. Heading</h5>
              <h6>h6. Heading</h6>
              <p>
                p. 目前最接近原生App效果的框架。
              </p>
            </div>
          </li>
        </ul>
      </div>
    </div>
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
    name      : 'Home',
    created() {
      console.log('%c%s', 'color:blue', 'Accordion.vue -: call created')
    },

    destroyed() {
      console.log('%c%s', 'color:blue', 'Accordion.vue -: call destroyed')
    },

    mounted() {
      console.log('%c%s', 'color:blue', 'Accordion.vue -: call mounted')
    },
    data() {
      return {}
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
  .Accordion {
    /* important code */
    height : 100%
  }


</style>
