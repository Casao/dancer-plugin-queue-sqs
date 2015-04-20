package Dancer::Plugin::Queue::SQS;

use strict;
use warnings;

use Amazon::SQS::Simple;

use Moo;
use namespace::autoclean;
with 'Dancer::Plugin::Queue::Role::Queue';

=head1 NAME

Dancer::Plugin::Queue::SQS - SQS Adapter for Dancer::Plugin::Queue

=head1 VERSION

Version 0.0.1

=cut

our $VERSION = '0.0.1';

my $settings = plugin_setting;

has secret_key => (
  is => 'ro',
  required => 1
);

has access_key => (
  is => 'ro',
  required => 1
);

has queue_name => (
  is => 'ro',
  required => 1
);

has queue => (
  is => 'lazy'
);

has sqs => (
  is => 'lazy'
);

sub _build_queue {
  my ($self) = @_;
  return $self->sqs->CreateQueue($self->queue_name);
}

sub _build_sqs {
  my ($self) = @_;
  return new Amazon::SQS::Simple($self->access_key, $self->secret_key);
}

sub add_msg {
  my ($self, $data) = @_;
  return $self->queue->SendMessage($data);
}

sub get_msg {
  my ($self) = @_;
  my $msg = $self->queue->ReceiveMessage();
  return ( $msg, $msg->MessageBody() );
}

sub remove_msg {
  my ($self, $msg) = @_;
  $self->queue->DeleteMessage($msg);
}

1;
