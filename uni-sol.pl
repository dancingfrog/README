# This file defines routes for uni-sol (https://github.com/uni-sol/uni-sol)
use Mojo::Log;

get '/revlin' => sub {
	my $self = shift;
	getSVGReadme($self, 'revlin/README.md');
};

1;
