package Dist::Zilla::PluginBundle::SHARYANTO::Task;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

our $VERSION = '0.07'; # VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@SHARYANTO',
        -remove => [qw/PodCoverageTests PodSyntaxTests PodWeaver/],
    });

    $self->add_plugins(
        'TaskWeaver',
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your task dists

__END__

=pod

=head1 NAME

Dist::Zilla::PluginBundle::SHARYANTO::Task - Dist::Zilla like SHARYANTO when you build your task dists

=head1 VERSION

version 0.07

=head1 SYNOPSIS

 # dist.ini
 [@SHARYANTO::Task]

is equivalent to:

 [@Filter]
 bundle=@SHARYANTO
 remove=PodCoverageTests
 remove=PodSyntaxTests
 remove=PodWeaver

 [TaskWeaver]

=head1 DESCRIPTION

=for Pod::Coverage ^(configure)$

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
