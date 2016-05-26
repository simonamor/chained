package TestApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->res->body("Index<br><a href='/about'>About</a> <a href='/broken'>Not here</a> <a href='/admin'>Admin</a>");
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->res->body("Page not found<br><a href='/'>Index</a>");
    $c->res->status(404);
}

sub about :Path("/about") :Args(0) {
    my ($self, $c) = @_;
    $c->res->body("About<br><a href='/'>Index</a> <a href='/broken'>Not here</a>");
}

sub chained_root :Path("/") :CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->log->debug("dummy root for chain");
}

sub end : ActionClass('RenderView') {}


__PACKAGE__->meta->make_immutable;

1;
