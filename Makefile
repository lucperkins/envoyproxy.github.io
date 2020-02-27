JEKYLL = bundle exec jekyll

build:
	$(JEKYLL) build

serve:
	$(JEKYLL) serve

serve-reload:
	$(JEKYLL) serve --livereload

clean:
	rm -rf _site

link-checker-setup:
	curl https://raw.githubusercontent.com/wjdp/htmltest/master/godownloader.sh | bash

run-link-checker:
	bin/htmltest

check-internal-links: clean build link-checker-setup run-link-checker

check-all-links: clean build link-checker-setup
	bin/htmltest --conf .htmltest.external.yml