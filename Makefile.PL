use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'			=> 'Test::CPAN::Meta::YAML',
    'VERSION_FROM'	=> 'lib/Test/CPAN/Meta/YAML.pm',
    'PREREQ_PM'		=> {
		Test::Builder       => 0,
		Test::YAML::Valid	=> 0.03,
		Test::More	        => 0.70,	# for testing
	},
	NO_META			=> 1,

    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT	=> 'A test module to validate a CPAN META.yml file.',
       AUTHOR	=> 'Barbie <barbie@cpan.org>') : ()),
);
