#!/bin/bash

usage() {
    >&2 echo "Usage: $0 <projectname>"
    return 0
}

pname=$1
pdir="./${pname}"
tdir=/var/zproj/templates

if [ -z "$pname" ]; then
    usage
    exit 1
elif ! [ -d "$tdir" ]; then
    >&2 echo "Unable to find template dir: $tdir"
    exit 2
elif [ -d "$pdir" ]; then
    >&2 echo "Project dir already exists: $pdir"
    exit 3
fi

# 1. Template auswählen
cur="$PWD"
cd $tdir
echo "Please select a template:"
select x in *; do
    template="$x"
    break
done

cd $cur
cp -R ${tdir}/$template $pdir
cd $pdir

# 2. Lizenz auswählen (Inklusive MPL-2.0)
echo "---------------------------------------"
echo "Please select a LICENSE for your project:"
options=("MIT" "Apache-2.0" "GPL-3.0" "MPL-2.0" "None")
select lic in "${options[@]}"; do
    case $lic in
        "MIT")
            echo "Generating MIT License..."
            year=$(date +%Y)
            author=$(git config user.name 2>/dev/null || echo "[Your Name]")
            echo "Copyright (c) $year $author" > LICENSE
            echo "" >> LICENSE
            echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:" >> LICENSE
            echo "" >> LICENSE
            echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software." >> LICENSE
            echo "" >> LICENSE
            echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> LICENSE
            break
            ;;
        "Apache-2.0")
            echo "Downloading Apache 2.0 License..."
            curl -s https://www.apache.org/licenses/LICENSE-2.0.txt > LICENSE
            break
            ;;
        "GPL-3.0")
            echo "Downloading GPL v3 License..."
            curl -s https://www.gnu.org/licenses/gpl-3.0.txt > LICENSE
            break
            ;;
        "MPL-2.0")
            echo "Downloading Mozilla Public License 2.0..."
            curl -s https://www.mozilla.org/MPL/2.0/index.txt > LICENSE
            break
            ;;
        "None")
            echo "Skipping License generation."
            break
            ;;
        *)
            echo "Invalid option $REPLY";;
    esac
done
echo "---------------------------------------"

# 3. Platzhalter ersetzen
find . -type f | while read -r x; do
    if [ "$(basename "$x")" = "LICENSE" ]; then continue; fi

    new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
    if [ "$x" = "$new" ]; then
        sed "s,PROJECTNAME,$pname,g" < "$x" > temp
        mv -f temp "$x"
    else
        mkdir -p "$(dirname "$new")"
        sed "s,PROJECTNAME,$pname,g" < "$x" > "$new"
        if [ -e "$new" ]; then
            rm -f "$x"
        fi
    fi
done

echo "Project $pname successfully created!"