'use strict';

var gulp = require('gulp');
var browserSync = require('browser-sync');
var cjsx = require('gulp-cjsx');
var $ = require('gulp-load-plugins')();

module.exports = function(options){
  gulp.task('cjsx', function() {
    return gulp.src(options.src + '/app/**/*.cjsx')
      .pipe(cjsx({bare: true}).on('error', options.errorHandler('CoffeeScript')))
      .pipe(gulp.dest(options.tmp + '/serve/app'))
      .pipe(browserSync.reload({ stream: true }))
      .pipe($.size());
  });
};