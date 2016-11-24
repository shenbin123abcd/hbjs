gulp.task('copy:view', function () {
    var htmlFilter = plugins.filter('**/*.html',{restore: true});
    return gulp
        .src(['app/*.html'])
        .pipe(htmlFilter)
        .pipe(plugins.inject(gulp.src(['./app/js/jquery.min.2.2.4.js']), {
            starttag: '<!-- inject:jquery:{{ext}} -->',
            transform: function (filePath, file) {
                // console.log(file.contents)
                // return file contents as string
                return `<script id="jQuery">${file.contents.toString('utf8').replace(/\\/g,'\\\\')}</script>`
            }
        }))

        .pipe(gulp.dest('../../../Modules/Wfc2016/Tpl/Bear'))

        ;
});