# Get current user and group info
usr := `id -u`
grp := `id -g`
pwd := `pwd`

# Build bibliography
bib:
    biber graypaper

# Build tex
tex:
    xelatex -synctex=1 -interaction=nonstopmode graypaper.tex

# Build everything (tex, bib, tex again)
all: tex bib tex

# Build using docker
docker:
    docker run --rm -u {{usr}}:{{grp}} -v {{pwd}}:/wd -w /wd -e HOME=/wd texlive/texlive just
