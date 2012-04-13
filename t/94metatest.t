use Test::More;

# Skip if doing a regular install
plan skip_all => "Author tests not required for installation"
    unless ( $ENV{AUTOMATED_TESTING} );

eval "use Test::CPAN::Meta::YAML";
plan skip_all => "Test::CPAN::Meta::YAML required for testing META.yml" if $@;

plan no_plan;

my $yaml = meta_spec_ok(undef,undef,@_);

use Test::CPAN::Meta::YAML;
is($yaml->{version},$Test::CPAN::Meta::YAML::VERSION,
    'META.yml distribution version matches');

if($yaml->{provides}) {
    for my $mod (keys %{$yaml->{provides}}) {
        is($yaml->{provides}{$mod}{version},$Test::CPAN::Meta::YAML::VERSION,
            "META.yml entry [$mod] version matches");
    }
}
