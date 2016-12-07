ROOTFILE=burndown

quick:
	- pdflatex --interaction=nonstopmode $(ROOTFILE).tex | \
	grep -inE --color=always "^\!.*" | cat

final: clear
	pdflatex --interaction=batchmode $(ROOTFILE).tex
	pdflatex --interaction=batchmode $(ROOTFILE).tex
	pdflatex --interaction=batchmode $(ROOTFILE).tex
	xdg-open $(ROOTFILE).pdf

show:
	xdg-open $(ROOTFILE).pdf

clean:
	find . -type f -name '*.aux' -delete
	find . -type f -name '*.bbl' -delete
	find . -type f -name '*.lot' -delete
	find . -type f -name '*.lof' -delete
	find . -type f -name '*.lol' -delete
	find . -type f -name '*.loa' -delete
	find . -type f -name '*.loe' -delete
	find . -type f -name '*.toc' -delete
	find . -type f -name '*.blg' -delete
	find . -type f -name '*.out' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.1' -delete
	find . -type f -name '*.mp' -delete
	find . -type f -name '*.synctex.gz' -delete
	find . -type f -name '*.preview.pdf' -delete

clear: clean
	find . -type f -name "$(ROOTFILE).pdf" -delete
