#!/bin/bash

#./Konvertiere Quellverzeichnis Zielverzeichnis MaxPixelHöhe MaxPixelBreite.
 
for file in $1;do

    if file $file | grep -q image; then
        echo "Resizing file" ${file}
        convert "${file}" -resize "$3"x"$4" -o "$2"/"${file}" "${file}"
        #convert existiert nicht
    else
        echo $file is no image!
    fi
done
 