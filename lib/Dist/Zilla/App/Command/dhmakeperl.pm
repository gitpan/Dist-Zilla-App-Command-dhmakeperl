use strict;
use warnings;

package Dist::Zilla::App::Command::dhmakeperl;

# PODNAME: Dist::Zilla::App::Command::dhmakeperl
# ABSTRACT: use dh-make-perl to generate .deb archives from your CPAN package
#
# This file is part of Dist-Zilla-App-Command-dhmakeperl
#
# This software is copyright (c) 2013 by Shantanu Bhadoria.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
our $VERSION = '0.001'; # VERSION

# Dependencies
use Dist::Zilla::App -command;
use autodie qw(:all);


sub abstract {
    'build debian package using dh-make-perl from your dzil package.
    look for the deb file in ./debuild folder after running dzil dhmakeperl';
}


sub opt_spec { }


sub validate_args {
    my ( $self, $opt, $args ) = @_;
    die 'no args expected' if @$args;
}


sub execute {
    my ( $self, $opt, $args ) = @_;

    system('rm -rf debuild');
    mkdir('debuild');
    $self->zilla->build_in('debuild/source');
    system('dh-make-perl make --vcs none --build debuild/source');
}
1;

__END__

=pod

=head1 NAME

Dist::Zilla::App::Command::dhmakeperl - use dh-make-perl to generate .deb archives from your CPAN package

=head1 VERSION

version 0.001

=head1 METHODS

=head2 abstract

=head2 opt_spec

=head2 validate_args

=head2 execute

=head1 NOTES

=over

=item *

You must have dh-make-perl installed on your system to use this command. use
sudo apt-get install dh-make-perl to install it on debian and ubuntu

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through github at 
L<https://github.com/shantanubhadoria/dist-zilla-app-command-dhmakeperl/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/shantanubhadoria/dist-zilla-app-command-dhmakeperl>

  git clone git://github.com/shantanubhadoria/dist-zilla-app-command-dhmakeperl.git

=head1 AUTHOR

Shantanu Bhadoria <shantanu at cpan dott org>

=head1 CONTRIBUTOR

Shantanu <shantanu@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Shantanu Bhadoria.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
