LATEXMK = latexmk -recorder -use-make -pdf -interaction=nonstopmode 
SOURCES = $(wildcard *.tex)
OBJECTS = $(SOURCES:.tex=.pdf)
svgfigs=$(wildcard img/*.svg)

pdf: $(OBJECTS) 

%.pdf : %.tex 
	$(LATEXMK) $<

today.txt: .git/logs/HEAD
	autorevision -t tex > today.txt

%.pdf : %.svg
	inkscape $< --export-pdf=$@

release: $(OBJECTS)
	rsync -avc $(OBJECTS) ~/Corsi/advanced-algorithms
