PSU-thesis-latex-template
=========================

The latex template for PSU thesis  

How to use
==========
Full report  

```sh
$ xelatex thesis.tex
$ xelatex thesis.tex

or

$ xelatex thesis.tex && xelatex thesis.tex
```

Compile with Bibtex

```sh
$ xelatex thesis.tex 
$ bibtex thesis
$ xelatex thesis.tex
$ xelatex thesis.tex

or

$ xelatex thesis.tex && bibtex thesis && xelatex thesis.tex && xelatex thesis.tex
```

File Structures
==============

|File|Description|
|---|---|
|abstract.tex|บทคัดย่อ|
|acknowledgement.tex|กิตติกรรมประกาศ|
|appendix|ภาคผนวก|
|chapter|บทที่|
|thesis.tex|วิทยานิพนธ์ฉบับเต็ม|
|vitae.tex|ประวัติผู้เขียน|
|references.bib| เอกสารอ้างอิง (bibtex)|



Team
====

* [Thanathip Limna](https://github.com/sdayu)
* [Teerasak Kroputaponchai](http://github.com/ibotdotout)
