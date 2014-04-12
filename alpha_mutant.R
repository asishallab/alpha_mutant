# Read input:
inp.args <- commandArgs( trailingOnly=TRUE )
alph.maps <- read.table( inp.args[[1]],
  stringsAsFactors=FALSE, sep='\t', quote='', comment.char='',
  colClasses=c( 'character',  'character' )
)
txt <- strsplit( paste( readLines( inp.args[[2]] ), collapse='' ), NULL )[[1]]
writeLines( 
  unlist( lapply( txt, function(x) {
    m <- alph.maps[ which( alph.maps[,1] == x ), 2 ]
    if ( length(m) > 0 ) {
      paste( "file '", m, "'", sep='' )
    } else {
      NULL
    }
  } ) ), 
  inp.args[[3]]
)

message( "Now use:" )
message( "ffmpeg -f concat -i ", inp.args[[3]], " -c copy your_movie_name.mov" )
