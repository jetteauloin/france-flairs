# Deps: moreutils glue-sprite optipng

SPRITES=$(wildcard flairs/*.png)
all: flairs.png final.css

flairs.css flairs.png: $(SPRITES) Makefile
	glue-sprite --css-template=template.css \
		--namespace "flair" --sprite-namespace "" \
		--padding 1 \
		flairs .
	optipng -o7 flairs.png
# special variant of the de Funes flair
	grep ".flair-deFunes " flairs.css | sed 's/deFunes/deFunesSurprise/' >> flairs.css
	sed -i 's/-hover/:hover/' flairs.css
	sort flairs.css | sponge flairs.css

final.css: flairs.css
	cat sub.css > final.css
	echo >> final.css
	echo '/* <flairs> */' >> final.css
	cat flairs.css >> final.css
	echo '/* </flairs> */' >> final.css
