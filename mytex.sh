#!/bin/bash
bibtex Chapter1/chapter1
bibtex Chapter2/chapter2
bibtex main
makeindex main
latex main
latex main
xpdf main.pdf