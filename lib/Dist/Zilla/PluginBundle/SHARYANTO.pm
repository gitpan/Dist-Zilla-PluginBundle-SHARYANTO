package Dist::Zilla::PluginBundle::SHARYANTO;

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

our $VERSION = '0.07'; # VERSION

use Dist::Zilla::PluginBundle::Filter;

sub configure {
    my $self = shift;

    $self->add_bundle(Filter => {
        -bundle => '@Classic',
        -remove => [qw/PkgVersion PodVersion Readme/],
    });

    $self->add_plugins(
        'CheckChangeLog',
        'MetaJSON',
        'OurPkgVersion',
        'PodWeaver',
        'ReadmeFromPod',
        'Test::Compile',

        'Test::Rinci',
        'Rinci::Validate',

        [InstallRelease => {install_command => 'cpanm -n .'}],
        ['Run::Release' => {run => 'archive-perl-release %s'}],
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
# ABSTRACT: Dist::Zilla like SHARYANTO when you build your dists

__END__

=pod

=head1 NAME

Dist::Zilla::PluginBundle::SHARYANTO - Dist::Zilla like SHARYANTO when you build your dists

=head1 VERSION

version 0.07

=head1 SYNOPSIS

 # dist.ini
 [@SHARYANTO]

is equivalent to:

 [@Filter]
 bundle=@Classic
 remove=PkgVersion
 remove=PodVersion
 remove=Readme

 [CheckChangeLog]
 [MetaJSON]
 [OurPkgVersion]
 [PodWeaver]
 [ReadmeFromPod]
 [Test::Compile]
 [Test::Rinci]

 [InstallRelease]
 install_command=cpanm -n .

 [Run::Release]
 ;notexist_fatal = 0
 run=archive-perl-release %s

=head1 DESCRIPTION

For most dists, I use Module::Build instead of Extutils::MakeMaker. I avoid
stuffs that might change line numbers (so I also always add # ABSTRACT and POD
at the end after '1;'). I still maintain dependencies and increase version
number manually.

I install my dists after release. I also archive them. The
C<archive-perl-release> is a script on my computer, you can get them from my
'scripts' github repo but the release process won't fail if the script does not
exist.

=for Pod::Coverage ^(configure)$

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
