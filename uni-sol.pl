# This file defines routes for uni-sol (https://github.com/uni-sol/uni-sol)
use Mojo::Log;

get '/dev' => sub {
	no strict;
	
	my $self = shift;
	unless( defined &getSVGReadme ) {
		getReadme($self, 'revlin/README.md');
	} else {
		getSVGReadme($self, 'revlin/README.md')
	}
	
};

get '/revlin' => sub {
	no strict;
	
	my $self = shift;
	unless( defined &getSVGReadme ) {
		getReadme($self, 'revlin/README.md');
	} else {
		getSVGReadme($self, 'revlin/README.md')
	}
	
};

1;
