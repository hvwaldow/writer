# doc

Write shopping lists, memos, notes, research papers and PhD theses with Markdown in a real editor.
See the nicely typeset result in real-time.

## Requirements

+ [`entr`](http://entrproject.org/) installed.
+ [`pandoc`](http://pandoc.org/) installed.
+ [`LaTeX`](http://www.latex-project.org/) installed.
+ [`evince`](https://wiki.gnome.org/Apps/Evince) installed.

## Usage

`doc <docname> &`

That will

1. Create a file `<docname>.md`.
2. Call `entr` to watch that file for changes and in case it changes call `pandoc` to produce a PDF `<docname>.pdf`.
3. Call evince on `<docname>.pdf`.

Edit `<docname>.md` with an editor of your choice. Upon saving it a new
PDF will be automatically produced and evince will reload it so you
immediately see the result.

Thats it.

Beats MS Word for me. And LibreOffice Writer too.

Essentially I am using Markdown these days as an elegant interface to
LaTeX. If requirements become too complex for Markdown just mix with pure LaTeX.

# Related

+ [Markdown](https://daringfireball.net/projects/markdown/)
+ [`pandoc` user manual](http://pandoc.org/MANUAL.html)
+ [The KOMA-Script documentation](http://texdoc.net/texmf-dist/doc/latex/koma-script/scrguide.pdf)
