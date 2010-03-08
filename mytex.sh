#!/bin/bash
bibtex Chapter1/chapter1
bibtex Chapter2/chapter2
bibtex main
bibtex Appendix/appendix2b
makeindex main
latex main
latex main
xpdf main.pdf