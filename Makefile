LATEXMK = latexmk -recorder -use-make -pdf -interaction=nonstopmode
SOURCES = $(wildcard *.tex)
OBJECTS = $(SOURCES:.tex=.pdf)

pdf: $(OBJECTS) 

%.pdf : %.tex 
	$(LATEXMK) $<

today.txt: .git/logs/HEAD
	autorevision -t tex > today.txt
