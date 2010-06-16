#!/bin/bash
bibtex Chapter1/chapter1
bibtex Chapter2/chapter2
bibtex Chapter3/chapter3
bibtex Chapter4/chapter4
#bibtex Chapter5/chapter5
#bibtex Chapter6/chapter6
bibtex main
bibtex Appendix/appendix1a
bibtex Appendix/appendix2a
bibtex Appendix/appendix2b
bibtex Appendix/appendix4a
makeindex main
pdflatex main
pdflatex main
#xpdf main.pdf
