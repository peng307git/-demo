<!DOCTYPE html>

<head>
    <title>对 api 进行测试</title>
    <script src="/static/js/jquery-1.11.2.min.js" type="application/javascript"></script>
</head>

<body>

<#--对 api 进行测试-->
<h2>
    api 测试工具页， 加载此页面， 运行JS，请求接口
</h2>

<ul>
    <li>
        <a href="/mindbank/api/news" id="newses" methods="get"> 新闻列表 </a>
    </li>
    <li>
        <a href="/mindbank/api/news/comment" id="news_comment" methods="post"> 新闻评论 </a>
    </li>
    <li>
        <a href="/mindbank/api/news/comments" id="news_comments" methods="get"> 新闻评论列表 </a>
    </li>

    <li>
        <a href="/mindbank/api/org/comment" id="org-comment" methods="post"> 公益组织评论 </a>
    </li>

    <li>
        <a href="/mindbank/api/org/comments" id="org-comments" methods="get"> 公益组织评论 </a>
    </li>

    <li>
        <a href="/mindbank/api/news/banner" id="banner" methods="get"> 推荐新闻 </a>
    </li>

    <li>
        <a href="/mindbank/api/org/application" id="org-app-form" methods="post">公益组织申请</a>
    </li>

    <li>
        <a href="/mindbank/api/news_info/{newsId}" id="news-info">新闻内容</a>
    </li>

    <li>
        <a href="/mindbank/api/banner"> banner 资源</a>
    </li>

</ul>

<script type="application/javascript">
    (function (Window) {
        var BK = {};
        Window.BK = BK;


        BK.isNotBlank = function isNotBlank(n) {
            if (typeof(n) === 'undefined')
                return false;
            if (typeof(n) !== 'string')
                return false;
            if (n.trim().length === 0)
                return false;
            return true;
        }

        BK.isBlank = function isBlank(n) {
            return !BK.isNotBlank(n);
        }

        BK.assert = function assert(value) {
            if (typeof( value) === 'boolean' && value) {
                console.log(" assert " + value)
                return;
            }
            if (typeof(value) === 'string' && 'true' === value.trim()) {
                console.log(" assert " + value)
                return;
            }
            console.error("assert error" + value)
        }

    })(Window)
</script>

<script type="application/javascript">


    (function () {
        /** 公益组织申请 **/
        function requestOrgAppForm() {
            var url = $('#org-app-form').attr('href')
            $.ajax({
                url: url,
                method: 'POST',
                data: {
                    locale: 'zh_CN',
                    orgName: '创世者联盟',
                    address: '中华人民共和国华东地区秘密基地',
                    email: 'root@root.org.com',
                    site: 'http://sample.com',
                    info: '这这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了这里是比较复杂的介绍了里是比较复杂的介绍了'
                }, success: function (data) {
                    console.log(data)
                }, error: function (e) {
                    console.error(e)
                }
            })
        }

        requestOrgAppForm();
    })();

    (function () {
        /** 推荐新闻 **/
        function requestNewsBanner() {
            var url = $('#banner').attr('href');
            $.ajax({
                url: url,
                method: 'GET',
                data: {
                    locale: 'zh_CN'
                }, success: function (data) {
                    console.log(" -------- 获取新闻 banner ----------- ")
                    console.log(data)
                }, error: function (e) {
                    console.error(e)

                }
            })
        }

        requestNewsBanner();
        console.log(" -------- 获取新闻 banner ----------- ")

    })();

    (function () {
        var bk = Window.BK

        /**
         * 提交公益组织评论
         */
        function requestOrgComment() {

            var url = $('#org-comment').attr('href')
            $.ajax({
                url: url,
                method: 'POST',
                data: {
                    orgId: 12,
                    username: 'J-Rabbit',
                    comment: '这是一条公益组织的测试评论'
                },
                success: function (data) {
                    console.log(data)
                },

                error: function (e) {
                    console.log(e)
                }
            })
        }

        /**
         * 公益组织评论列表
         */
        function requestOrgComments() {

            var url = $('#org-comments').attr('href')
            $.ajax({
                url: url,
                method: 'GET',
                success: function (data) {
                    console.log(data)
                },
                error: function (e) {
                    console.log(e)
                }
            })
        }

        requestOrgComment();

        requestOrgComments();
    })()
</script>
<script type="application/javascript">

    (function () {

        var bk = Window.BK;

        /**
         * 新闻详情
         */
        function requestNewsInfo(newsId) {
            bk.assert(bk.isNotBlank(newsId));
            var url = "/mindbank/api/news_info/" + newsId;
            url = url + "?locale=zh_CN"

            $.get(url, function (data) {
                console.log(data);
            });
        }

        /**
         * 提交新闻评论
         */
        function requestComment(newsId) {

            bk.assert(bk.isNotBlank(newsId));

            var url = $('#news_comment').attr('href');

            $.ajax({
                url: url,
                method: 'POST',
                data: {
                    newsId: newsId,  // 新闻id
                    locale: 'zh_CN', // 语言
                    username: 'J-Rab', // 用户名
                    comment: '这是一个未经确认的评论,请处理!' // 评论内容
                },
                success: function (data) {
                    console.log(" result -> " + data);
                }, error: function (e) {
                    console.log(" e -> " + e)
                }
            })

        }

        function requestComments(newsId) {
            bk.assert(bk.isNotBlank(newsId));

            var url = $('#news_comments').attr('href')

            bk.assert(bk.isNotBlank(url));

            $.ajax({
                url: url,
                method: 'GET',
                data: {},
                success: function (data) {

                    bk.assert(data.status === 0 || data.status === '0')

//                    评论列表

                    // var o = data.data[0]
                    // o.comment // 评论内容
                    // o.newsId
                    // o.username // 名称
                    // o.reviewedAt // unix 时间， 审核时间
                    // o.createdAt // unix 时间， 创建时间

                    console.log(data);

                }, error: function (e) {
                    console.error(e);
                }
            })

        }

        // 新闻列表
        $.ajax({
            url: $('#newses').attr('href'),
            data: {locale: 'zh_CN'},
            success: function (data) {
                console.log(data)

                bk.assert(typeof(data) === 'object')

                bk.assert(data.status === 0 || data.status === '0')

                bk.assert(data.data.hasOwnProperty('length'))

                if (data.data.length > 0) {

                    var newsId = data.data[0].newsId;

                    console.log('newsId => ' + newsId)

                    requestComment(newsId);

                    requestComments(newsId);

                    requestNewsInfo(newsId);

                } else {
                    console.log('接口中未获取到合适的元素')
                }


            }, error: function (e) {
                console.log(e)
            }
        })
        console.log("get news form ", $('#newses').attr('href'))
    })()

</script>
</body>