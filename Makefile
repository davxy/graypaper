USR = $(shell id -u)
GRP = $(shell id -g)
PWD = $(shell pwd)

.PHONY: all clean bib tex

bib:
	biber graypaper

tex:
	xelatex -synctex=1 -interaction=nonstopmode graypaper.tex

all: tex bib tex

clean:
	rm -rf build

docker-build:
	@docker run --rm -u $(USR):$(GRP) -v $(PWD):/wd -w /wd -e HOME=/wd texlive/texlive make
