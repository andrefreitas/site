watch:
	sass --watch styles.sass:styles.css --style compressed

deploy:
	scp -rp * neo:/var/www/andrefreitas.pt/public_html

serve:
	python3 -m http.server 8001
