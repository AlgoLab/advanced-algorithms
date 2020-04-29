LATEXMK = latexmk -recorder -use-make -pdf -interaction=nonstopmode 
SOURCES = $(wildcard *.tex)
OBJECTS = $(SOURCES:.tex=.pdf)
svgfigs=$(wildcard img/*.svg)
pdffigs = $(svgfigs:.svg=.pdf)

pdf: $(OBJECTS) $(pdffigs)

%.pdf : %.tex 
	$(LATEXMK) $<

%.pdf : %.svg
	inkscape --file=$< --export-area-drawing --without-gui --export-pdf=$@
