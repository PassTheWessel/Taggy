/**
 * @name Taggy#Gulp
 * @author Wessel Tip <discord@go2it.eu>
 * @license GPL-3.0 
 * @description Used to compress files for distribution versions
 */
const gulp = require('gulp');
const copy = require('gulp-copy');
const strip = require('gulp-strip-comments');
const minify = require('gulp-minify');

gulp.task('compress', () => {
    gulp.src(['application.yml', 'tmp/**/*', 'assets/**/*']).pipe(copy('../dist'));
    gulp.src('**/*.js').pipe(strip()).pipe(minify({ noSource: true, ext: { min: '.js' } })).pipe(gulp.dest('../dist'));
});

gulp.task('strip', () => {
    gulp.src(['application.yml', 'tmp/**/*', 'assets/**/*']).pipe(copy('../dist'));
    gulp.src('**/*.js').pipe(strip()).pipe(gulp.dest('../dist'));
});