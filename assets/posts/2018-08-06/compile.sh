set -e
rm -f *.log
latex -shell-escape -output-directory=/tmp area.tex
for filename in ./*.dvi; do
	dvisvgm --libgs=/usr/local/lib/libgs.dylib --font-format=woff --exact "$filename"
done
for filename in ./*.log; do
	mv "$filename" "logs/$filename"
done
rm -f *.dpth
rm -f *.ps
rm -f *.dvi
