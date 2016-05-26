package TestApp::Controller::Admin;
use Moose;
use namespace::autoclean;

use strict;
use warnings;

BEGIN { extends 'Catalyst::Controller'; }

=head2 /admin (intermediate)

=cut

sub get_ready :Chained("/") :PathPart("admin") :CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->log->debug("get_ready");
    $c->res->body("get_ready");
}

=head2 /admin

:PathPart("") adds nothing to the url
:Args(0) terminates the chain

=cut

sub get_root :Chained("get_ready") :PathPart("") :Args(0) {
    my ($self, $c) = @_;
    $c->log->debug("get_root");
    $c->res->body("Admin<br><a href='/'>Index</a> <a href='/admin/broken'>Not Admin</a> <a href='/admin/who'>List who</a> <a href='/admin/who/Sleepy'>edit Sleepy</a> <a href='/admin/who/Sleepy/evict'>evict Sleepy</a>");
}

=head2 /admin/who (intermediate)

:PathPart("who") adds '/who' to the url
:CaptureArgs(0) removes nothing but doesn't terminate the chain

=cut

sub get_info_ready :Chained("get_ready") :PathPart("who") :CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->log->debug("get_info_ready");
    $c->res->body("get_info_ready");
}

=head2 /admin/who

:PathPart("") adds nothing to the url
:Args(0) terminates the chain

=cut

sub list :Chained("get_info_ready") :PathPart("") :Args(0) {
    my ($self, $c) = @_;
    $c->log->debug("list");
    $c->res->body("list");
}

=head2 /admin/who/XXX (intermediate)

:PathPart("") adds nothing to the url
:CaptureArgs(1) removes the bit after /admin/who/

=cut

sub get_id :Chained("get_info_ready") :PathPart("") :CaptureArgs(1) {
    my ($self, $c, $capture) = @_;
    $c->stash( capture => $capture );
    $c->log->debug("get_id");
}

=head2 /admin/who/XXX/evict

:PathPart("evict") adds /evict to the url but after
/admin/who/XXX has been dealt with by Chained("get_id")
:Args(0) terminates the chain

=cut

sub delete :Chained("get_id") :PathPart("evict") :Args(0) {
    my ($self, $c) = @_;
    my $capture = $c->stash->{ capture };
    $c->log->debug("delete $capture");
    $c->res->body("delete $capture");
}

=head2 /admin/who/XXX

:PathPart("") adds nothing to url
:Args(0) terminates the chain

=cut

sub edit :Chained("get_id") :PathPart("") :Args(0) {
    my ($self, $c) = @_;
    my $capture = $c->stash->{ capture };
    $c->log->debug("edit $capture");
    $c->res->body("edit $capture");
}

__PACKAGE__->meta->make_immutable;

1;
