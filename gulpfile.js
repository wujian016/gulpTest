var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var runSequence = require('run-sequence');
var browserSync = require('browser-sync');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
var bowerMain = require('main-bower-files');
var clean = require('gulp-clean');
var jsFiles = ['client/**/*.js'];
var cssFiles = ['**/*.css'];
var coffeeFiles = ['client/**/*.coffee'];
var htmlFiles = ['**/*.html'];
var allFiles = jsFiles.concat(cssFiles).concat(coffeeFiles).concat(htmlFiles);

gulp.task('cleanScripts', function() {
	console.log('clear scripts firstly');
	gulp.src(['build/**/*.js', '!build/js/vender/*.*'], {
			read: false
		})
		.pipe(clean());
});

gulp.task('mergeScripts', function() {
	//console.log('hello world!');
	console.log('sequence 1');
	gulp.src(jsFiles, {
			base: 'client'
		}) // 匹配 'client/js/somedir/somefile.js' 并且将 `base` 解析为 `client/js/`
		.pipe(concat('all.js'))
		.pipe(uglify())
		.pipe(gulp.dest('build')); // 写入 'build/somedir/somefile.js'
});

gulp.task('coffeeScripts', function() {
	console.log('coffee beging');
	gulp.src(coffeeFiles)
		//.pipe(sourcemaps.init())
		.pipe(coffee({
			bare: true
		}))
		//.pipe(sourcemaps.write({addComment: false}))
		// .pipe(coffee({
		// 	bare: true
		// })).on('error', gutil.log)
		.pipe(gulp.dest('build'));
	console.log('coffee end');
});

gulp.task('browserFiles', function() {
	browserSync({
		server: {
			basdDir: "./"
		},
		port: 9000,
		files: []
	});
});

gulp.task('bowerMain', function() {
	return gulp.src(bowerMain())
		.pipe(gulp.dest('./build/js/vender'))
});

gulp.task('default', function() {
	runSequence('cleanScripts','bowerMain','coffeeScripts','mergeScripts','browserFiles');
});

// var Q = require('q');
// gulp.task('one', function() {
// 	//one是一个异步执行的任务
// 	var deferred = Q.defer();
// 	setTimeout(function() {
// 		console.log('one is done');
// 		deferred.resolve();
// 	}, 5000);
// 	return deferred.promise;
// });

// //two任务虽然依赖于one任务,但并不会等到one任务中的异步操作完成后再执行
// gulp.task('two', ['one'], function() {
// 	console.log('two is done');
// });

gulp.task('server-reload', function() {
	// console.log('reload begin');
	console.log('sequence 2');
	browserSync.reload();
	// console.log('reload end');
});


gulp.task('reload-all', function(cb) {
	runSequence('mergeScripts', 'coffeeScripts', 'server-reload', cb);
	//  function() {
	// 	console.log('sequence 3');
	// }
});
gulp.watch(allFiles, ['reload-all']);
// gulp.watch(['client/**/*.css', 'client/**/*.js'], function(event) {
// 	console.log(event.type); //变化类型 added为新增,deleted为删除，changed为改变 
// 	console.log(event.path);
// });