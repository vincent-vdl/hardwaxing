# 'This Week' Hardwax's releases

use strict;
use warnings;

use DDP;
use URI;
use Web::Scraper;

my $URL = 'https://hardwax.com/this-week/?paginate_by=1000';

# Scraping process
my $releases = scraper {
    process '//div[contains(@id, "record")]', "releases[]" => scraper {
        process 'strong', artist => [
            'TEXT', sub { s/:\s*// }
        ];
        process '//div[@class="linebig"]/text()[last()]', release => 'TEXT';
        process 'p', description => 'TEXT';
        process 'ul.tracklisting li', "tracks[]" => 'TEXT';
    };
};

my $data = $releases->scrape(URI->new($URL));
p $data;
