package DDG::Spice::Lastfm::ArtistTracks;
# ABSTRACT: Get the tracks of a musician.

use DDG::Spice;

primary_example_queries "songs by she & him";
secondary_example_queries "songs from maroon 5";
description "Top tracks from an artist";
name "LastFM Artist Tracks";
icon_url "/i/www.last.fm.ico";
source "Last.fm";
code_url "https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Lastfm/ArtistTracks.pm";
topics "entertainment", "music";
category "entertainment";
attribution github => ['https://github.com/jagtalon','Jag Talon'],
           twitter => ['http://twitter.com/juantalon','Jag Talon'];

spice to => 'http://ws.audioscrobbler.com/2.0/?limit=5&format=json&method=artist.gettoptracks&artist=$1&autocorrect=1&api_key={{ENV{DDG_SPICE_LASTFM_APIKEY}}}&callback={{callback}}';

#Queries like "songs by ben folds" and "ben folds songs"
my $synonyms = "songs?|tracks?|music";
triggers query_lc => qr/^(?:(?:all|the)\s+)?(?:$synonyms)\s+(?:(?:by|from|of)\s+)?([^\s]+(?:\s+[^\s]+)*)$
                        |
                        ^([^\s]+(?:\s+[^\s]+)*)\s+(?:$synonyms)$/x;


handle query_lc => sub {
    return $1 if $1;
    return $2 if $2;
    return;
};
1;
