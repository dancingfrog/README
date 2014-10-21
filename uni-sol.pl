# This file defines routes for uni-sol (https://github.com/uni-sol/uni-sol)
use Mojo::Log;

get '/dev' => sub {
	my $self = shift;
	#getReadme($self, 'revlin/README.md');
	getSVGReadme($self, 'revlin/README.md');
	
};

get '/revlin' => sub {
	my $self = shift;
	#getReadme($self, 'revlin/README.md');
	getSVGReadme($self, 'revlin/README.md');
	
};

1;
