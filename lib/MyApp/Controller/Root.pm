package MyApp::Controller::Root;
use Moose;
use namespace::autoclean;

use MyApp::Form::Article;

has '_form' => qw/is rw isa MyApp::Form::Article lazy 1/, default => sub { MyApp::Form::Article->new };

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub form :Local Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( form => $self->_form );

    my $params = $c->req->params;

    $self->_form->process(
        item => $c->model("DB::Article")->new_result({}),
        params => $params,
        );

    return if !$self->_form->is_valid;
    return 1;
}


=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
