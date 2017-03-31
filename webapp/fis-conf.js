//npm install -g fis3-postpackager-loader
//npm install -g fis3-hook-amd
fis.match('*', {
  release: '$0' // 所有资源发布时产出到 /static 目录下
});
fis.match('WEB-INF/({*,**/*}.{ftl,xml})', {
  isHtmlLike: true,
  release: 'WEB-INF/$1'
});
fis.hook('amd', {
    baseUrl: '/',
    paths: {
        jquery: '/static/v6/js/lib/jquery-1.11.2.min',
        d3: '/static/v6/js/lib/d3.min',
        jsencrypt: '/static/v6/js/module/jsencrypt',
        artTemplate: '/static/v6/js/module/template.min'
    }
});
fis.match('/static/v6/js/{module,page}/**.js', {
    isMod: true
});
/*
// npm install [-g] fis-optimizer-uglify-js
fis.match('*.js', {
  optimizer: fis.plugin('uglify-js')
});
*/
fis.match('::packager', {
    postpackager: fis.plugin('loader', {
        resourceType: 'amd',
        useInlineMap: true,
        processor: {
            '.ftl': 'html'
        },
        obtainScript: false,
        obtainStyle: false
    })
});
fis.media('develop').match('*.{js,css,png,jpg}', {
    useHash: true,
    domain: ''
}).match('/static/v6/js/module/**.js', {
    packTo: '/static/v6/js/pkg/module.js'
});
fis.media('develop').match('{/static/v6/images/nomd5/**,/static/images/buy*.png,/static/js/laydate/js/**/*,/static/images/*CN.png,/static/images/*EN.png,/static/images/*TW.png,/static/images/node-*.png,/static/images/mine-*.png,/static/images/core-m.png,/static/images/logo_bter.png,/static/images/mindlink.jpg,/static/v6/images/index/Memorabilia0*}', {
    useHash: false,
    domain: ''
});
fis.media('product').match('*.{js,css,png,jpg}', {
    useHash: true,
    domain: 'https://oepud6a2o.qnssl.com'
}).match('/static/v6/js/module/**.js', {
    packTo: '/static/v6/js/pkg/module.js'
});
fis.media('product').match('{/static/v6/images/nomd5/**,/static/images/buy*.png,/static/js/laydate/js/**/*,/static/images/*CN.png,/static/images/*EN.png,/static/images/*TW.png,/static/images/node-*.png,/static/images/mine-*.png,/static/images/core-m.png,/static/images/logo_bter.png,/static/images/mindlink.jpg,/static/v6/images/index/Memorabilia0*}', {
    useHash: false,
    domain: 'https://oepud6a2o.qnssl.com'
});
/*


// 启用 fis-spriter-csssprites 插件
fis.match('::package', {
  spriter: fis.plugin('csssprites')
});
// 对 CSS 进行图片合并
fis.match('static/css/*.css', {
  // 给匹配到的文件分配属性 `useSprite`
  useSprite: true
});
*/
