gulp       = require 'gulp'
runSequence = require 'run-sequence'

#gulp.task 'default', ['watch', 'browserSync','copyimg','distjson','jsBundle']
gulp.task 'default', (callback) ->
	runSequence 'stylusReload','jadeReload','jsReload',
		['watch', 'browserSync','copyimg','distjson','jsBundle'], callback


#delが上手くいかない時があるのでエラーが出たら再度叩く
gulp.task 'build', (callback) ->
	runSequence 'imgclean',
		['imagemin','cssmin','jsmin','htmlprettify','json','buildJsBundle'], callback

#build
#cleanDir,imgclean
#一旦build以下を削除,dist以下の画像を削除
#imagemin,
#dist,buildにsrc以下の画像を圧縮
#cssmin,jsmin,htmlprettify
#dist以下のファイルをミニファイしてbuild以下に
#json
#src以下のjsonファイルをミニファイしてbuild以下に
#buildJsBundle
#dist/js/lib/bundle.min.jsをbuild以下にコピー