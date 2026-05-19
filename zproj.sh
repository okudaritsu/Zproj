#!/bin/bash

tdir="/var/zproj/templates"
ddir="/var/zproj/default"
cur="$PWD"

usage() {
    >&2 echo "Usage:"
    >&2 echo "  $0 <projectname>  - create new Project"
    return 0
}
if ! [ -d "$tdir" ]; then
    >&2 echo "Unable to find template dir: $tdir"
    exit 2
fi
        pname=$1
        pdir="./${pname}"

        if [ -d "$pdir" ]; then
            >&2 echo "Project dir already exists: $pdir"
            exit 3
        fi

        cd "$tdir" || exit 1
        echo "Please select a template:"
        select x in *; do
            if [ -n "$x" ]; then
                template="$x"
                break
            fi
        done

        cd "$cur" || exit 1
        cp -R "${tdir}/$template" "$pdir"
        cd "$pdir" || exit 1
        for x in *; do
            if [ -f "$x" ]; then
                new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
                if [ "$x" = "$new" ]; then
                    sed "s,PROJECTNAME,$pname,g" < "$x" > temp
                    mv -f temp "$x"
                else
                    sed "s,PROJECTNAME,$pname,g" < "$x" > "$new"
                    if [ -e "$new" ]; then
                        rm -f "$x"
                    fi
                fi
            fi
        done
        echo "Project $pname successfully created!"
        ;;
esac