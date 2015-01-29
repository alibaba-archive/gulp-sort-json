
gulp-sort-json
==============

## Install

```
npm i gulp-sort-json
```

## Example

```
sortJSON = require('gulp-sort-json')

gulp.task 'sort-json', ->
  gulp.src('path/to/*.json')
    .pipe(sortJSON())
    .pipe(gulp.dest("path/to/dist"))
```