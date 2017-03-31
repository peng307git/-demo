<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>七牛云存储 - JavaScript SDK</title>
    <link rel="stylesheet" href="/static/qiniu/styles/bootstrap.css">
    <link rel="stylesheet" href="/static/qiniu/styles/main.css">

    <!--[if lt IE 9]>
      <script src="bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="body"> 
        <input type="hidden" id="domain" value="7xsqqk.com1.z0.glb.clouddn.com">
        <input type="hidden" id="uptoken_url" value="/admin/upload/getToken">
        <div class="col-md-12">
            <div id="container">
                <a class="btn btn-default btn-small " id="pickfiles" href="#" >
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>选择文件</span>
                </a>
            </div>
        </div>

        
    </div>
</div>

<script type="text/javascript" src="/static/qiniu/scripts/jquery.min.js"></script>
<script type="text/javascript" src="/static/qiniu/scripts/plupload.full.min.js"></script>
<script type="text/javascript" src="/static/qiniu/scripts/qiniu.js"></script>
<script type="text/javascript" >
var tokurl = $.ajax({
                url: $('#uptoken_url').val(),
                type: 'GET',
                dataType: 'JSON',
                data:{"key":"123.jpg"},
                success: function (data) {
                    console.log("Data: " + data.uptoken);
                    return data.uptoken;
                }
            });
var uploader = Qiniu.uploader({
    runtimes: 'html5,flash,html4',    //上传模式,依次退化
    browse_button: 'pickfiles',       //上传选择的点选按钮，**必需**
    //uptoken_url: '/admin/upload/getToken',            //Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
    uptoken : "N-iIeLfD9bgRqXgLCZBC2nKtxF64IeHcSkfewTR_:KFgAdBsPo1Xe6T7wt-0IuI6XJv8=:eyJzY29wZSI6Im1pbmRhc3NldG1vc3RlciIsImRlYWRsaW5lIjoxNDYwMTE1NDM5fQ==", //若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
    // unique_names: true, // 默认 false，key为文件名。若开启该选项，SDK为自动生成上传成功后的key（文件名）。
    // save_key: true,   // 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK会忽略对key的处理
    domain: '7xsqqk.com1.z0.glb.clouddn.com',   //bucket 域名，下载资源时用到，**必需**
    get_new_uptoken: false,  //设置上传文件的时候是否每次都重新获取新的token
    container: 'container',           //上传区域DOM ID，默认是browser_button的父元素，
    max_file_size: '100mb',           //最大文件体积限制
    flash_swf_url: 'js/plupload/Moxie.swf',  //引入flash,相对路径
    max_retries: 3,                   //上传失败最大重试次数
    dragdrop: true,                   //开启可拖曳上传
    drop_element: 'container',        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
    chunk_size: '4mb',                //分块上传时，每片的体积
    auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
    init: {
        'FilesAdded': function(up, files) {
            plupload.each(files, function(file) {
                // 文件添加进队列后,处理相关的事情
            });
        },
        'BeforeUpload': function(up, file) {
               // 每个文件上传前,处理相关的事情
        },
        'UploadProgress': function(up, file) {
               // 每个文件上传时,处理相关的事情
        },
        'FileUploaded': function(up, file, info) {
               // 每个文件上传成功后,处理相关的事情
               // 其中 info 是文件上传成功后，服务端返回的json，形式如
               // {
               //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
               //    "key": "gogopher.jpg"
               //  }
               // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

                var domain = up.getOption('domain');
                var res = parseJSON(info);
                var sourceLink = domain + res.key; //获取上传成功后的文件的Url
                console.log(sourceLink);
        },
        'Error': function(up, err, errTip) {
               //上传出错时,处理相关的事情
               console.log(errTip)
        },
        'UploadComplete': function() {
               //队列文件处理完毕后,处理相关的事情
        },
        'Key': function(up, file) {
            // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
            // 该配置必须要在 unique_names: false , save_key: false 时才生效

            var key = "";
            // do something with key here
            return key
        }
    }
});

</script>
</body>
</html>
