ifndef TARGET
	TARGET=draft
endif

INTEX = presentation.tex
INNAME:=$(INTEX:.tex=)
AUXEXTS = *.aux *.bbl *.bcf *.blg *.gz *.log *.nav *.out *.pdf *.run.xml *.snm *.synctex.gz *.tdo *.toc

final: $(INTEX)
	pdflatex $(INTEX)

draft: $(INNAME).pdf

$(INNAME).pdf: *.tex
	pdflatex "\def\isdraft{1} \input{$(INTEX)}"

clean-aux:
	rm -f $(AUXEXTS)

clean:
	rm -f  $(AUXEXTS) $(INNAME).pdf

view: $(INNAME).pdf
	foxit $(INNAME).pdf
