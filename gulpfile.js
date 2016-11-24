'use strict';
var gulp = require('gulp');
var gulpLoadPlugins = require('gulp-load-plugins');
var plugins = gulpLoadPlugins();
var rubySass = require('gulp-ruby-sass');
var sourcemaps = require('gulp-sourcemaps');
var fs = require('fs');
var merge = require('merge-stream');
var imageminOptipng = require('imagemin-optipng');
var buffer = require('vinyl-buffer');
var imageminPngquant = require('imagemin-pngquant');
var imageminZopfli = require('imagemin-zopfli');
var gutil = require("gulp-util");
var webpack = require("webpack");
var webpackStream = require('webpack-stream');
var WebpackDevServer = require("webpack-dev-server");

//var browserSync = require('browser-sync').create();
//var devip = require('dev-ip');
//console.log(devip());
gulp.task('generateDistVersion', function () {
    fs.writeFileSync('app/Public/College/js/config.dist.js',''+
        '(function(){' +
        '"use strict";' +
        'window.appConfig={};' +
        'window.appConfig.debug=false;' +
        'window.appConfig.version="' +(new Date().getTime())+'";'+
        'if(window.appConfig.debug){' +
        '    window.appConfig.bust="?v="+(new Date().getTime());' +
        '}else{' +
        '    window.appConfig.bust="?v="+window.appConfig.version;' +
        '}' +
        '}());' +
        '' +
        '');
});

gulp.task('clearDistVersion',['build'], function () {
    fs.writeFileSync('app/Public/College/js/config.dist.js','');
});

gulp.task('sass', function () {
    return gulp.src(['app/public/css/*.scss'])
        .pipe(sourcemaps.init())
        .pipe(plugins.sass({outputStyle: 'compact'}))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest('app/public/css'));
});

gulp.task('less', function () {
    return gulp.src('app/Public/College/css/second.less')
        .pipe(sourcemaps.init())
        .pipe(plugins.less())
        .pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('app/Public/College/css/'));
});


gulp.task('hb.js', function () {
    return gulp.src('hb.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});

gulp.task('hb.scroll.js', function () {
    return gulp.src('hb.scroll/hb.scroll.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.scroll.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.autoScroll.js', function () {
    return gulp.src('hb.auto_scroll/hb.autoScroll.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.autoScroll.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.vKeyboard.js', function () {
    return gulp.src('hb.vKeyboard/hb.vKeyboard.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.vKeyboard.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('jsViewport.js', function () {
    return gulp.src('jsViewport/jsViewport.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("jsViewport.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('jsViewportRootSize.js', function () {
    return gulp.src('jsViewport/jsViewportRootSize.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("jsViewportRootSize.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.drag', function () {
    return gulp.src('hb.drag/hb.drag.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.drag.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.loopClass', function () {
    return gulp.src('hb.loopClass/hb.loopClass.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.loopClass.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.fancyNumber', function () {
    return gulp.src('hb.fancyNumber/hb.fancyNumber.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.fancyNumber.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});

gulp.task('hb.modernizr.js', function () {
    return gulp.src('hb.modernizr.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.modernizr.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});
gulp.task('hb.angular', function () {
    return gulp.src('hb.angular.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.angular.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});


gulp.task('hb.jquery', function () {
    return gulp.src('hb.jquery.js')
        //.pipe(sourcemaps.init())
        .pipe(gulp.dest('dist'))
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.jquery.min.js"))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});



gulp.task('hb.angular.pack', function () {
    var timestamp=new Date().getTime();
    var version='1.0.0';
    var banner = `/**
     * version: ${version}
     * 1.5.5 angular,angular-animate,angular-messages,angular-resource,angular-sanitize,angular-touch
     * 0.2.18 angular-ui-router
     * 1.3.2 ui-bootstrap.tpl
     */\n`;

    return gulp.src([
        'node_modules/angular/angular.js',
        'node_modules/angular-animate/angular-animate.js',
        'node_modules/angular-messages/angular-messages.js',
        'node_modules/angular-resource/angular-resource.js',
        'node_modules/angular-sanitize/angular-sanitize.js',
        'node_modules/angular-touch/angular-touch.js',
        'node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls.js',
        'node_modules/angular-ui-router/release/angular-ui-router.js',
    ])
        //.pipe(sourcemaps.init())
        .pipe(plugins.concat(`hb.angular.pack.${version}.js`))
        .pipe(gulp.dest('dist'))
        .pipe(plugins.uglify())
        .pipe(plugins.header(banner))
        .pipe(plugins.rename(`hb.angular.pack.min.${version}.js`))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});

gulp.task('hb.jquery.angular.pack', function () {
    var timestamp=new Date().getTime();
    var version='1.0.0';
    var banner = `/**
     * version: ${version}
     * 2.2.3 jquery
     * 1.5.5 angular,angular-animate,angular-messages,angular-resource,angular-sanitize,angular-touch
     * 0.2.18 angular-ui-router
     * 1.3.2 ui-bootstrap.tpl
     */\n`;
    return gulp.src([
        'node_modules/jquery/dist/jquery.js',
        'node_modules/angular/angular.js',
        'node_modules/angular-animate/angular-animate.js',
        'node_modules/angular-messages/angular-messages.js',
        'node_modules/angular-resource/angular-resource.js',
        'node_modules/angular-sanitize/angular-sanitize.js',
        'node_modules/angular-touch/angular-touch.js',
        'node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls.js',
        'node_modules/angular-ui-router/release/angular-ui-router.js',
    ])
        //.pipe(sourcemaps.init())
        .pipe(plugins.concat(`hb.jquery.angular.pack.${version}.js`))
        .pipe(gulp.dest('dist'))
        .pipe(plugins.uglify())
        .pipe(plugins.header(banner))
        .pipe(plugins.rename(`hb.jquery.angular.pack.min.${version}.js`))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});

gulp.task('hb.modernizr.pack', function () {
    var timestamp=new Date().getTime();
    var version='1.0.0';
    var banner = `/**
     * version: ${version}
     * modernizr v3.3.1  no feature
     * detectizr v2.2.0
     */\n`;
    return gulp.src([
        'modernizr-custom.js',
        'node_modules/detectizr/dist/detectizr.min.js',
    ])
        //.pipe(sourcemaps.init())
        .pipe(plugins.concat(`hb.modernizr.pack.${version}.js`))
        .pipe(gulp.dest('dist'))
        .pipe(plugins.uglify())
        .pipe(plugins.header(banner))
        .pipe(plugins.rename(`hb.modernizr.pack.min.${version}.js`))
        //.pipe(sourcemaps.write('../maps/less'))
        .pipe(gulp.dest('dist'));
});

gulp.task("hb.account", function(callback) {
    // run webpack
    var webpackConfig=require('./hb.account/webpack.config.js');
    return gulp.src('hb.account/entry.js')
        .pipe(webpackStream( webpackConfig ))
        .pipe(gulp.dest('hb.account/'))
        .pipe(plugins.rename("hb.account.min.js"))
        .pipe(gulp.dest('dist'))
    ;

});
gulp.task("hb.account2", function(callback) {
    // run webpack
    var webpackConfig=require('./hb.account/webpack.config.js');


    webpack( webpackConfig, function(err, stats) {
        if(err) throw new gutil.PluginError("webpack", err);
        gutil.log("[webpack]", stats.toString({
            // output options
        }));
        //gutil.log("[webpack]", "Gonna sit around and watch for file changes. CTRL^C to kill me");
        //callback();
    });

});


gulp.task("hb.account.dev", function(callback) {

    // run webpack
    var webpackConfig=require('./hb.account/webpack.config.dev.js');


    webpack( webpackConfig, function(err, stats) {
        if(err) throw new gutil.PluginError("webpack", err);
        gutil.log("[webpack]", stats.toString({
            // output options
        }));
        //gutil.log("[webpack]", "Gonna sit around and watch for file changes. CTRL^C to kill me");
        //callback();
    });
});

gulp.task("hb.account.dev2", function(callback) {
    // Start a webpack-dev-server
    var compiler = webpack(require('./webpack.config.js'));

    new WebpackDevServer(compiler, {
        // server and middleware options
        contentBase: "./hb.account",
        // or: contentBase: "http://localhost/",
        hot: false
    }).listen(8080, "localhost", function(err) {
        if(err) throw new gutil.PluginError("webpack-dev-server", err);
        // Server listening
        gutil.log("[webpack-dev-server]", "http://localhost:8080/webpack-dev-server/hb.account.dev/index.html");

        // keep the server alive or continue?
        // callback();
    });
});

gulp.task("hb.js.v2.dev", function(callback) {

    // run webpack
    var webpackConfig=require('./hb.jsv2/webpack.config.dev.js');


    webpack( webpackConfig, function(err, stats) {
        if(err) throw new gutil.PluginError("webpack", err);
        gutil.log("[webpack]", stats.toString({
            // output options
        }));
        //gutil.log("[webpack]", "Gonna sit around and watch for file changes. CTRL^C to kill me");
        //callback();
    });
});

gulp.task("hb.js.v2", function(callback) {

    var webpackConfig=require('./hb.jsv2/webpack.config.js');
    return gulp.src('hb.jsv2/entry.js')
        .pipe(webpackStream( webpackConfig ))
        .pipe(gulp.dest('hb.jsv2/'))
        .pipe(plugins.rename("hb.min.js"))
        .pipe(gulp.dest('hb.jsv2/dist'))
        ;
});



gulp.task('lib', function(){
    gulp.start(['hb.angular.pack','hb.jquery.angular.pack','hb.modernizr.pack']);
});


//gulp.task('rubySass', function () {
//    return rubySass('app/vendor/bootstrap-sass-3.3.5/assets/stylesheets/bootstrap.scss',{ sourcemap: true })
//        .pipe(sourcemaps.write('./'))
//        .pipe(gulp.dest('app/vendor/bootstrap-sass-3.3.5/assets/stylesheets/'));
//});

gulp.task('typescript', function () {
    return gulp.src('hb.ieupdate.ts')
        .pipe(plugins.typescript())
        .pipe(gulp.dest('ieupdate/dist/js'))
        .pipe(plugins.uglify())
        .pipe(plugins.rename("hb.ieupdate.min.js"))
        .pipe(gulp.dest('ieupdate/dist/js'));
});


gulp.task('ieupdate',['typescript'], function () {
    var spriteData = gulp.src('ieupdate/app/images/*_8.png').pipe(plugins.spritesmith({
        imgName: 'ieupdate_s.png',
        cssName: 'sprite.css',
        imgPath  : 'http://7xopel.com2.z0.glb.qiniucdn.com/serarch/ieupdate_s.png',
        cssVarMap: function (sprite) {
            sprite.name = 'ieupdate_' + sprite.name;
        }
    }));

    // Pipe image stream through image optimizer and onto disk

    var imgStream = spriteData.img
        // DEV: We must buffer our stream into a Buffer for `imagemin`
        .pipe(buffer())
        .pipe(plugins.imagemin({
            optimizationLevel: 2,

        }))
        .pipe(imageminPngquant({posterize: 1})())
        .pipe(gulp.dest('ieupdate/dist/images'));

    // Pipe CSS stream through CSS optimizer and onto disk
    var cssStream = spriteData.css
        .pipe(gulp.dest('ieupdate/dist/css'));

    // Return a merged stream to handle both `end` events
    return merge(imgStream, cssStream);
    //return spriteData.pipe(gulp.dest('ieupdate/dist'))
});


gulp.task('styles',['sass','less'], function () {

});

//gulp.task('coffee', function () {
//    return gulp.src('app/**/*.coffee')
//        .pipe(plugins.coffee())
//        .pipe(gulp.dest('app/'));
//});
//gulp.task('transJson', function () {
//    return gulp.src('app/i18n/*.json')
//        .pipe(gulp.dest('dist/i18n'))
//
//});

gulp.task('html', function () {
    return gulp.src('app/Public/College/views/**/*.html')
        .pipe(plugins.minifyHtml({
            empty: true,
            spare: true,
            quotes: true,
            conditionals: true
        }))
        .pipe(gulp.dest('dist/Public/College/views/'))
});

//gulp.task('fonts', function () {
//    return gulp.src(require('main-bower-files')({
//            filter: '**/*.{eot,svg,ttf,woff,woff2}'
//        }).concat('app/fonts/**/*'))
//        .pipe(gulp.dest('.tmp/fonts'))
//        .pipe(gulp.dest('dist/fonts'));
//});

//gulp.task('fonts', function () {
//    return gulp.src('**/*.{eot,svg,ttf,woff,woff2}')
//        .pipe(plugins.flatten())
//        .pipe(gulp.dest('dist/fonts'));
//});


//gulp.task('favicon', function () {
//    return gulp.src('app/favicon.ico')
//        .pipe(gulp.dest('dist/'))
//});

//gulp.task('docIcons', function () {
//    return gulp.src('app/images/docIcons/*.{png,gif,jpg}')
//        .pipe(gulp.dest('dist/images/docIcons'))
//
//});


gulp.task('haloIcon', function () {
    return gulp.src('app/public/css/lib/ux_*/**/*iconfont.*')
        .pipe(gulp.dest('public/css/lib'))
});

gulp.task('videojs', function () {
    var jsFilter = plugins.filter('**/*.js',{restore: true});
    var cssFilter = plugins.filter('**/*.css',{restore: true});
    return gulp.src(['app/Public/College/js/lib/video.js/5.5.3/dist/video-js.css', 'app/Public/College/js/lib/video.js/5.5.3/dist/video.js'])
        .pipe(jsFilter)
        .pipe(plugins.uglify())
        .pipe(jsFilter.restore)
        .pipe(cssFilter)
        .pipe(plugins.autoprefixer({
            browsers:  ['> 0%'],
            cascade: false
        }))
        .pipe(plugins.csso())
        .pipe(cssFilter.restore)
        .pipe(gulp.dest('dist/Public/College/js/lib/video.js/5.5.3/dist/'))
});
gulp.task('swiper', function () {
    var jsFilter = plugins.filter('**/*.js',{restore: true});
    var cssFilter = plugins.filter('**/*.css',{restore: true});
    return gulp.src(['app/Public/College/js/lib/Swiper/3.3.0/dist/css/swiper.css', 'app/Public/College/js/lib/Swiper/3.3.0/dist/js/swiper.jquery.js'])
        .pipe(jsFilter)
        .pipe(plugins.uglify())
        .pipe(gulp.dest('dist/Public/College/js/lib/Swiper/3.3.0/dist/js/'))
        .pipe(jsFilter.restore)
        .pipe(cssFilter)
        .pipe(plugins.autoprefixer({
            browsers:  ['> 0%'],
            cascade: false
        }))
        .pipe(plugins.csso())
        .pipe(gulp.dest('dist/Public/College/js/lib/Swiper/3.3.0/dist/css/'))
        .pipe(cssFilter.restore)

});


//
//gulp.task('images', function () {
//    return gulp.src(['app/images/*.{png,gif,jpg,mp3,mp4}'])
//        .pipe(plugins.flatten())
//        .pipe(gulp.dest('dist/images'))
//});

gulp.task('images', function () {
    return gulp.src(['app/public/images/**/*.{png,gif,jpg,mp3,mp4}'])
        .pipe(gulp.dest('public/images'))
});

gulp.task('map', function () {
    return gulp.src(['app/css/*.map'])
        .pipe(gulp.dest('dist/css'))
});


gulp.task('build', ['sass','images','haloIcon'], function () {
    var htmlFilter = plugins.filter('*.html',{restore: true});
    var ejsFilter = plugins.filter('**/*.ejs',{restore: true});
    var jsFilter = plugins.filter('**/*.js',{restore: true});
    var cssFilter = plugins.filter('**/*.css',{restore: true});
    //var assets;
    return gulp.src(['app/views/**/*.ejs'])
        .pipe(plugins.useref())
        .pipe(jsFilter)
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        .pipe(plugins.uglify())
        .pipe(plugins.rev())
        .pipe(gulp.dest('public'))
        .pipe(jsFilter.restore)
        .pipe(cssFilter)
        .pipe(plugins.autoprefixer({
            browsers:  ['> 0%'],
            cascade: false
        }))
        .pipe(plugins.csso())
        .pipe(plugins.rev())
        .pipe(gulp.dest('public'))
        .pipe(cssFilter.restore)
        .pipe(plugins.revReplace({
            replaceInExtensions: ['.js', '.css', '.html', '.ejs']
        }))
        .pipe(ejsFilter)
        .pipe(plugins.cdnizer({
            defaultCDNBase: "/",
            allowRev: true,
            allowMin: true,
            //relativeRoot: 'app/public',
            files: [
                // Thi
                // s file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
                'css/**/*.css',
                'js/**/*.js',
                //'/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        //.pipe(ejsFilter)
        //.pipe(plugins.minifyHtml({
        //    empty: true,
        //    spare: true,
        //    quotes: true,
        //    conditionals: true
        //}))
        .pipe(plugins.htmlmin({
            removeComments: true,
            collapseWhitespace: true,
            conservativeCollapse: true,
            minifyJS: true,
            minifyCSS: true,
        }))
        //.pipe(ejsFilter.restore)
        .pipe(gulp.dest('views'))
});

gulp.task('build:dev', ['map','images','haloIcon','sass'], function () {
    var htmlFilter = plugins.filter('*.html',{restore: true});
    var jsFilter = plugins.filter('**/*.js',{restore: true});
    var cssFilter = plugins.filter('**/*.css',{restore: true});
    //var assets;
    return gulp.src(['app/*.ejs'])
        //.pipe(assets = plugins.useref.assets())
        .pipe(plugins.useref())
        .pipe(jsFilter)
        .pipe(plugins.babel({
            presets: ['es2015']
        }))
        //.pipe(plugins.uglify())
        .pipe(plugins.rev())
        .pipe(jsFilter.restore)
        .pipe(gulp.dest('dist'))
        .pipe(cssFilter)
        .pipe(plugins.autoprefixer({
            browsers:  ['> 0%'],
            cascade: false
        }))
        //.pipe(plugins.csso())
        .pipe(plugins.rev())
        .pipe(cssFilter.restore)

        .pipe(gulp.dest('dist'))
        .pipe(plugins.revReplace({
            replaceInExtensions: ['.js', '.css', '.html', '.ejs']
        }))
        //.pipe(htmlFilter)
        //.pipe(plugins.minifyHtml({
        //    empty: true,
        //    spare: true,
        //    quotes: true,
        //    conditionals: true
        //}))
        //.pipe(htmlFilter.restore)
        .pipe(plugins.cdnizer({
            defaultCDNBase: "/qingjian/1/dist",
            allowRev: true,
            allowMin: true,
            files: [
                // This file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
                'css/**/*.css',
                'js/*.js',
                //'images/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(plugins.cdnizer({
            defaultCDNBase: "/",
            //defaultCDNBase: "../",
            allowRev: true,
            allowMin: true,
            files: [
                '/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(gulp.dest('dist'))
});

gulp.task('browser-sync', function() {
    browserSync.init({
        open: false,
        ui: false,
        //notify: false,
        port: 9000,
        server: {
            baseDir: "./",
            middleware: function (req, res, next) {
                res.setHeader('Access-Control-Allow-Origin', '*');
                next();
            },
        }
    });

});



gulp.task('build:test', function () {

    var htmlFilter = plugins.filter('*.html',{restore: true});
    var jsFilter = plugins.filter('**/*.js',{restore: true});
    var cssFilter = plugins.filter('**/*.css',{restore: true});
    //var assets;
    return gulp.src(['app/views/*.ejs'])
        .pipe(plugins.useref())
        .pipe(jsFilter)
        //.pipe(plugins.babel({
        //    presets: ['es2015']
        //}))
        ////.pipe(plugins.uglify())
        .pipe(plugins.rev())
        .pipe(jsFilter.restore)
        .pipe(cssFilter)
        //.pipe(plugins.autoprefixer({
        //    browsers:  ['> 0%'],
        //    cascade: false
        //}))
        //.pipe(plugins.csso())
        .pipe(plugins.rev())
        .pipe(cssFilter.restore)
        .pipe(plugins.revReplace({
            replaceInExtensions: ['.js', '.css', '.html', '.ejs']
        }))
        //.pipe(htmlFilter)
        //.pipe(plugins.minifyHtml({
        //    empty: true,
        //    spare: true,
        //    quotes: true,
        //    conditionals: true
        //}))
        //.pipe(htmlFilter.restore)
        .pipe(plugins.cdnizer({
            defaultCDNBase: "/qingjian/1/dist",
            allowRev: true,
            allowMin: true,
            files: [
                // This file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
                'css/**/*.css',
                'js/*.js',
                //'images/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(gulp.dest('dist'))
});


gulp.task('copy:dev:style',['sass'], function () {
    return gulp
        .src('app/public/css/**/*.{css,map}')
        .pipe(gulp.dest('publicTest/css'));
});


gulp.task('copy:view', function () {
    var ejsFilter = plugins.filter('*.ejs',{restore: true});
    var ejsFilterPublic = plugins.filter('Public/*.ejs',{restore: true});
    return gulp
        .src('app/views/**/*.ejs')
        .pipe(ejsFilter)
        .pipe(plugins.cdnizer({
            defaultCDNBase: "http://"+devip()[0]+":9000/app",
            //defaultCDNBase: "../",
            allowRev: true,
            allowMin: true,
            relativeRoot: 'app',
            files: [
                // Thi
                // s file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
                'public/css/**/*.css',
                'public/js/**/*.js',
                //'public/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(plugins.cdnizer({
            defaultCDNBase: "http://"+devip()[0]+":9000/app/public",
            //defaultCDNBase: "../",
            allowRev: true,
            allowMin: true,
            files: [
                '/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(gulp.dest('views'))
        .pipe(ejsFilter.restore)
        .pipe(ejsFilterPublic)
        .pipe(plugins.cdnizer({
            defaultCDNBase: "http://"+devip()[0]+":9000/app",
            //defaultCDNBase: "../",
            allowRev: true,
            allowMin: true,
            relativeRoot: 'app/public',
            files: [
                // Thi
                // s file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
                'public/css/**/*.css',
                'public/js/**/*.js',
                //'public/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(plugins.cdnizer({
            defaultCDNBase: "http://"+devip()[0]+":9000/app/public",
            //defaultCDNBase: "../",
            allowRev: true,
            allowMin: true,
            files: [
                '/images/**/*.{jpg,png,mp3,mp4}',
            ]
        }))
        .pipe(gulp.dest('views'))


        ;
});

//gulp.task('copy:dev',['build:dev'], function () {
//    return gulp
//        .src('dist/index.ejs')
//        .pipe(gulp.dest('../../../views/qingjian/1/'));
//
//});


gulp.task('clean', require('del').bind(null, [ 'dist']));



gulp.task('default', ['clean'], function(){
    gulp.start([
        'hb.js',
        'ieupdate',
        'jsViewport.js',
        'hb.angular',
        'hb.jquery',
        'hb.scroll.js',
        'hb.autoScroll.js',
        'hb.account',
        'hb.vKeyboard.js',
        'lib'
    ]);
});



gulp.task('dev', ['clean'], function() {
    gulp.start('watch:dev');
});



gulp.task("watch", function(){
    gulp.watch(['app/js/**/*.js','app/css/**/*.css','app/images/**/*.{jpg,png,mp3,mp4}','app/*.ejs'], function(event) {
        console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
        gulp.start('default');

    });
});


//gulp.task("watch:dev", function(){
//    gulp.watch(['app/views/**/*.ejs'], function(event) {
//        gulp.src('app/views/**/*.ejs')
//        .pipe(gulp.dest('publicTest/css'));
//    });
//});

gulp.task("watch:dev", ['browser-sync','copy:view','sass','images'], function(){
    gulp.watch(['app/views/**/*.ejs'],function(event) {
        //console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');

        gulp.start('copy:view');
        //gulp.src(['app/views/**/*.ejs'])
        //    .pipe(plugins.cdnizer({
        //        defaultCDNBase: "http://localhost:9000/app",
        //        //defaultCDNBase: "../",
        //        allowRev: true,
        //        allowMin: true,
        //        relativeRoot: 'app',
        //        files: [
        //            // Thi
        //            // s file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
        //            'public/css/**/*.css',
        //            'public/js/**/*.js',
        //            //'public/images/**/*.{jpg,png,mp3,mp4}',
        //        ]
        //    }))
        //    .pipe(plugins.cdnizer({
        //        defaultCDNBase: "http://localhost:9000/app/public",
        //        //defaultCDNBase: "../",
        //        allowRev: true,
        //        allowMin: true,
        //        files: [
        //            '/images/**/*.{jpg,png,mp3,mp4}',
        //        ]
        //    }))
        //    .pipe(gulp.dest('views'));
    });
    //gulp.watch(['app/public/images/**/*.{png,gif,jpg,mp3,mp4}'],['images']);
    //gulp.watch(['app/public/css/*.scss'],['sass']);
});
//gulp.task("watch:dev", function(){
//    gulp.watch(['app/views/**/*.ejs']).on("change", function(event) {
//        console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
//        gulp.src(event.path)
//        .pipe(plugins.cdnizer({
//            defaultCDNBase: "http://localhost:9000/app",
//            //defaultCDNBase: "../",
//            allowRev: true,
//            allowMin: true,
//            relativeRoot: 'app',
//            files: [
//                // Thi
//                // s file is on the default CDN, and will replaced with //my.cdn.host/base/js/app.js
//                '**/public/css/**/*.css',
//                '**/public/js/**/*.js',
//                '**/public/images/**/*.{jpg,png,mp3,mp4}',
//            ]
//        })).pipe(gulp.dest('views'));
//    });
//    gulp.watch(['app/public/css/*.scss'],['sass']);
//});






var rev = require("gulp-rev");
var revReplace = require("gulp-rev-replace");
gulp.task("revision", function(){
    return gulp.src(["dist/**/*.css", "dist/**/*.js"])
        .pipe(rev())
        .pipe(gulp.dest('dist2'))
        .pipe(rev.manifest())
        .pipe(gulp.dest('dist2'))
});




gulp.task("revreplace", ["revision"], function(){
    var manifest = gulp.src("./" + 'dist2' + "/rev-manifest.json");

    return gulp.src('dist' + "/index.html")
        .pipe(revReplace({
            manifest: manifest
        }))
        .pipe(gulp.dest('dist2'));
});
