LATEXMK = latexmk -recorder -use-make -pdf -interaction=nonstopmode -pdflatex="xelatex %O %S" 
SOURCES = $(wildcard *.tex)
OBJECTS = $(SOURCES:.tex=.pdf)

pdf: $(OBJECTS) 

%.pdf : %.tex 
	$(LATEXMK) $<

today.txt: .git/logs/HEAD
	autorevision -t tex > today.txt
