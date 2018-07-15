SPRITES=$(wildcard flairs/*.png)
all: flairs.png final.css

flairs.css flairs.png: $(SPRITES)
	glue-sprite --css-template=template.css \
		--namespace "flair" --sprite-namespace "" \
		flairs .
	optipng -o7 flairs.png
	sed -i 's/-hover/:hover/' flairs.css

final.css: flairs.css
	cat sub.css flairs.css > final.css
