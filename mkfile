<mkconfig

MKSHELL = rc

PUBHTMFILE = `{./exe/getpubfile htm}
PUBMDFILE = `{./exe/getpubfile md}
PUBTXTFILE = `{./exe/getpubfile txt}
PUBTSVFILE = `{./exe/getpubfile tsv}
PUBPNGFILE = `{./exe/getpubfile png}
PUBJPGFILE = `{./exe/getpubfile jpg}

BUILDFILE = $PUBHTMFILE\
	$PUBMDFILE\
	$PUBTXTFILE\
	$PUBTSVFILE\
	$PUBPNGFILE\
	$PUBJPGFILE\

WEBFILE = $HTMFILE

INC = `{goblin ls -r 100 inc}
TGT = $BUILDFILE

all:VQ: build
build:V: $PUBDIR $TGT

%.svg %.mp4 %.m3 %.mkv :N:

$PUBDIR:
	mkdir -p $target

$PUBDIR/%.png : $PPDIR/%.png
	mkdir -p `{dirname $target}
	cp -f $prereq $target

$PUBDIR/%.jpg : $PPDIR/%.jpg
	mkdir -p `{dirname $target}
	cp -f $prereq $target

$PUBDIR/%.htm : $INC $PPDIR/%.htm $PUBDIR/%.md
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.htm > $PUBDIR/$stem.htm

$PUBDIR/%.md : $INC $PPDIR/%.md
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.md > $PUBDIR/$stem.md

$PUBDIR/%.txt : $INC $PPDIR/%.txt
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.txt > $PUBDIR/$stem.txt

$PUBDIR/%.tsv : $INC $PPDIR/%.tsv
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.tsv > $PUBDIR/$stem.tsv

$PPDIR/% :N:

tree:V:
	goblin ls -r 100

run:V: clean
	goblin ls $PPDIR | entr mk	
sync:V: build
	rsync -ak $DELFLAG $PUBDIR $RPUBDIR

syncrun:VQ:
	while(true){
		sleep 1
		mk sync > /dev/null
	}

clean:V:
	rm -f $TGT

