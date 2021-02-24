<mkconfig

MKSHELL = rc

PUBHTMFILE = `{eval '
for( i in `{goblin ls -r 100 '$PPDIR'}){
	~ $i *.htm && {echo $i | sed -e s!^'$PPDIR'!'$PUBDIR'!}
}
'}

PUBMDFILE = `{eval '
for( i in `{ goblin ls -r 100 '$PPDIR' } ) {
	~ $i *.md && {echo $i | sed -e s!^'$PPDIR'!'$PUBDIR'!}
}
'}

PUBTXTFILE = `{eval '
for( i in `{ goblin ls -r 100 '$PPDIR' } ) {
	~ $i *.txt && {echo $i | sed -e s!^'$PPDIR'!'$PUBDIR'!}
}
'}

BUILDFILE = $PUBHTMFILE $PUBMDFILE $PUBTXTFILE
WEBFILE = $HTMFILE

INC = `{goblin ls -r 100 inc}
TGT = $BUILDFILE

all:VQ: build
build:V: $PUBDIR $TGT
minify:V: build
	for(i in $PUBHTMFILE)
		$MINIFY $i -o $i

%.jpg %.png %.svg %.mp4 %.m3 %.mkv :N:

$PUBDIR:
	mkdir -p $target

$PUBDIR/%.htm : $INC $PPDIR/%.htm $PUBDIR/%.md
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.htm > $PUBDIR/$stem.htm

$PUBDIR/%.md : $INC $PPDIR/%.md
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.md > $PUBDIR/$stem.md

$PUBDIR/%.txt : $INC $PPDIR/%.txt
	mkdir -p `{dirname $target}
	$PP $PPDIR/$stem.txt > $PUBDIR/$stem.txt

$PPDIR/% :N:

tree:V:
	goblin ls -r 100

run:V: clean
	goblin ls $PPDIR | entr mk	
sync:V: minify
	rsync -ak $DELFLAG $PUBDIR $RPUBDIR

syncrun:VQ:
	while(true){
		sleep 1
		mk sync > /dev/null
	}

clean:V:
	rm -f $TGT

