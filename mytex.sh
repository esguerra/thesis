#!/bin/bash
bibtex Chapter1/chapter1
bibtex Chapter2/chapter2
bibtex main
bibtex Appendix/appendix2a
bibtex Appendix/appendix2b
makeindex main
pdflatex main
pdflatex main
xpdf main.pdf
