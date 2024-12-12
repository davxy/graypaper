OUTDIR = build

USR = $(shell id -u)
GRP = $(shell id -g)
PWD = $(shell pwd)

.PHONY: all clean graypaper

all: graypaper

$(OUTDIR):
	mkdir -p $(OUTDIR)

graypaper: $(OUTDIR)
	xelatex -output-directory=$(OUTDIR) graypaper.tex
	biber $(OUTDIR)/graypaper
	xelatex -output-directory=$(OUTDIR) graypaper.tex
	mv $(OUTDIR)/graypaper.pdf graypaper.pdf

docker-build:
	@docker run --rm -u $(USR):$(GRP) -v $(PWD):/wd -w /wd -e HOME=/wd/$(OUTDIR) texlive/texlive make

clean:
	rm -rf build
