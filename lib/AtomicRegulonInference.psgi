use AtomicRegulonInference::AtomicRegulonInferenceImpl;

use AtomicRegulonInference::AtomicRegulonInferenceServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = AtomicRegulonInference::AtomicRegulonInferenceImpl->new;
    push(@dispatch, 'AtomicRegulonInference' => $obj);
}


my $server = AtomicRegulonInference::AtomicRegulonInferenceServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
