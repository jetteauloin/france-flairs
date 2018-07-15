all: flairs.png flairs.css final.css

flairs.css flairs.png:
	glue-sprite --css-template=template.css \
		--namespace "flair" --sprite-namespace "" \
		flairs .
	optipng -o7 flairs.png

final.css: flairs.css
	cat sub.css flairs.css > final.css
