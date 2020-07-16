var gulp = require('gulp');
var concat = require('gulp-concat');
var terser = require('gulp-terser');

gulp.task('CrudBase', function () {
	gulp.src('../js/CrudBase/*.js')
	.pipe(concat('CrudBase.min.js'))
	.pipe(gulp.dest('../js/CrudBase/dist'));
});

gulp.task('CrudBaseForCss', function () {
	gulp.src('../css/CrudBase/*.css')
	.pipe(concat('CrudBase.min.css'))
	.pipe(gulp.dest('../css/CrudBase/dist'));
});