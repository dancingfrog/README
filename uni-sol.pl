# This file defines routes for uni-sol (https://github.com/uni-sol/uni-sol)
use Mojo::Log;

get '/dev' => sub {
	no strict;
	
	my $self = shift;
	unless( defined &getSVGReadme ) {
		getReadme($self, 'revlin/index.md');
	} else {
		getSVGReadme($self, 'revlin/index.md')
	}
	
};

get '/revlin' => sub {
	no strict;
	
	my $self = shift;
	unless( defined &getSVGReadme ) {
		getReadme($self, 'revlin/index.md');
	} else {
		getSVGReadme($self, 'revlin/index.md')
	}
	
};

1;
