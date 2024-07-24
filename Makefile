
server:
	(cd wwwroot; python3 ../webserver.py)

# First delete all the file end with .huf
#
# Second do "make server" in your terminal, then, open your browser and go 
# to http://localhost:8000/, you should see there are error popping up
#
# Third do "make reload" in your terminal, then, refresh your browser in 
# http://localhost:8000/
# If you can see all the image display correctly and no errors appear, 
# then the implementation is mostly good
#
# If you want to test different image, like "arrow.png", open the index.html, 
# add "<img src="arrow.png">" after"<img src="oval.png">", then do "make reload" 
# again and refresh your browser

reload:
	(cd wwwroot; python3 ../compress.py index.html)
	(cd wwwroot; python3 ../compress.py huffman.bmp)
	(cd wwwroot; python3 ../compress.py oval.png)
	(cd wwwroot; python3 ../compress.py favicon.ico)
	(cd wwwroot; python3 ../compress.py arrow.png)

# If there's no error pops up (like EOF error or others), then the implementation 
# is most likely good.
test:
	make single FILE=test.txt
	make single FILE=arrow.png
	make single FILE=oval.png

single:
	python3 compress.py $(FILE)
	python3 decompress.py $(FILE).huf
	cmp $(FILE) $(FILE).huf.decomp
	cksum $(FILE) $(FILE).huf.decomp

h:
	python3 huffman.py

# remove all the .huf and .decomp file
clean:
	-rm arrow.png.huf
	-rm arrow.png.huf.decomp
	-rm oval.png.huf
	-rm oval.png.huf.decomp
	-rm test.txt.huf
	-rm test.txt.huf.decomp
	-rm -r -f __pycache__

