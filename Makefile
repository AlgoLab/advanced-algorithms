LATEXMK = latexmk -recorder -use-make -pdf -interaction=nonstopmode 
SOURCES = $(wildcard *.tex)
OBJECTS = $(SOURCES:.tex=.pdf)
svgfigs=$(wildcard img/*.svg)

pdf: $(OBJECTS) 

%.pdf : %.tex 
	$(LATEXMK) $<

%.pdf : %.svg
	inkscape $< --export-pdf=$@
