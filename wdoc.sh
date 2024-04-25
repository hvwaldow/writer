#!/bin/bash
#
# Preview of markdown documents in html

set -e

help() {
    basename $0
    echo Watches a markdown file and calls pandoc upon changes to render the corresponding html.
    echo -e "Usage:\n\t""$(basename "$0")"" <file>"
    echo -e "\nIf file doesn't exist, it is created empty."
}

runpandoc() {
    echo "Running pandoc on $origfile."
    pandoc -F mermaid-filter -o "$outfile" "$origfile"
}

mainloop() {
    echo "Watching $origfile."
    echo $origfile |entr -s "$0 runpandoc $origfile; xdotool key --window $wid \"F5\""
}

mkfilenames() {
    fbase=$(basename "$1")
    fbasebase=${fbase%.*}
    outfile="${fbasebase}.html"
}

initialize() {
    if [[ ! -f $origfile ]]; then
        echo "Creating $origfile."
        cat > "$origfile" <<EOF
# Title

Here is your Markdown-document!

EOF
    else
        echo "$origfile already exists."
    fi
    mkfilenames "$origfile"
    runpandoc
    echo "Outfile is $outfile"
    xdg-open "$outfile"
    #wid=$(xdotool selectwindow)
    wid=$(xdotool search -name "Firefox Developer Edition" |tail -n1)
    echo "X-Window ID is $wid"
    mainloop
}

if [[ $# == 2 ]] && [[ $1 == "runpandoc" ]] && [[ -f $2 ]]; then
    origfile="$2"
    echo "Just running pandoc"
    mkfilenames "$origfile"
    runpandoc
    exit 0
elif [[ $# == 1 ]]; then
    origfile=$1
    initialize
else
    help
    exit 1
fi
