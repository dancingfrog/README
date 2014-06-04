# This file defines routes for uni-sol (https://github.com/uni-sol/uni-sol)
use Mojo::Log;

sub getSVGReadme {
	my( $self, $readme ) = @_;
	my $log = Mojo::Log->new();
	my $URL = $self->req->url->base;
	my( $fh, $mh, $save_line_sep );
	my $mark2html = '';
	open $mh, '>', \$mark2html;
	my $mark = Markdent::Parser->new(
		dialect => 'GitHub',
		handler => Markdent::Handler::HTMLStream::Fragment->new(
			output => $mh
		)
	);
	
	open $fh, '<'.$readme;
	$save_line_sep = $/; # Save line seperator vaule
    undef $/; # Allows one pass input of entire file
	$mark->parse( markdown => <$fh> );
    $/ = $save_line_sep; # Restore line seprator
	close $fh;
	close $mh;
	
	my( $apppath ) = $readme =~ /([\w\-]+\/)\w+\.md/;
	$apppath = $URL.'/'.$apppath if( $apppath );
	$apppath = $URL unless( defined $apppath );
	$mark2html = rel2AbsURI( 
		$mark2html, 
		$URL.'/',
		$apppath
	);
	
	$self->stash( 
		url => $URL,
		version => $version,
		mark2html => $mark2html,
		svgApp => 'svg-demos/data/bounce.rl.svg'
	);
	$self->render('readme');
};

get '/revlin' => sub {
	my $self = shift;
	getSVGReadme($self, 'revlin/README.md');
};

1;
