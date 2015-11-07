all:
	gmake compress
	gmake watch

compress:
	gmake browserify

browserify:
	browserify lightHttp.js  -o lightHttp-browserify.js
	java -jar  /usr/local/lib/java/yuicompressor-2.4.6.jar --charset utf8 --type js -o lightHttp.min.js  lightHttp-browserify.js
	rm lightHttp-browserify.js

watch:
	ps aux |grep watchify  |grep -v grep | awk '{print $$2}' | xargs -I%s -t -n 1  sudo kill -9 %s 2>&1 
	watchify lightHttp.js -o test.js &


depInit:
	sudo npm install -g browserify watchify 
