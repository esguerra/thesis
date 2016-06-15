#!/bin/bash
#set -x
#trap read debug
rm -f *.aux *.log *.idx *.lof *.lot *.toc main.pdf
rm -f Chapter*/*.aux *.log *.idx *.lof *.lot *.toc main.pdf *.bbl *.blg 
pdflatex main
bibtex Chapter1/chapter1
bibtex Chapter2/chapter2
bibtex Chapter3/chapter3
bibtex Chapter4/chapter4
bibtex Chapter5/chapter5
bibtex main
bibtex Appendix/appendix1a
bibtex Appendix/appendix2a
bibtex Appendix/appendix2b
bibtex Appendix/appendix4a
bibtex Appendix/appendix5a
bibtex main
makeindex main
pdflatex main
pdflatex main
#xpdf main.pdf
#/sw/bin/xpdf main.pdf
