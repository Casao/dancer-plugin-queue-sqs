package Dancer::Plugin::Queue::SQS;

use strict;
use warnings;

use Amazon::SQS::Simple;

use Moo;
with 'Dancer::Plugin::Queue::Role::Queue';

=head1 NAME

Dancer::Plugin::Queue::SQS - SQS Adapter for Dancer::Plugin::Queue

=head1 VERSION

Version 0.0.1

=cut

our $VERSION = '0.0.1';


sub add_msg {}

sub get_msg {}

sub remove_msg {}
