use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
	      'NAME'	=> 'XML::Generator::vCard::RDF',
	      ($[ >= 5.005) ?
	      (AUTHOR   => 'Aaron Straup Cope (ascope@cpan.org)',
	       ABSTRACT => 'Generate RDF/XML SAX 2 events for vCard 3.0') : (),
	      'VERSION_FROM' => 'lib/XML/Generator/vCard/RDF.pm',
	      'PREREQ_PM'    => {
		  'XML::SAX'      => '0.12',
		  'Text::vCard'   => '1.9',
		  'Encode'        => '0',
		  'Memoize'       => '0',
		  'Test::More'    => '0',
				},
	      dist	        => {COMPRESS => 'gzip', SUFFIX => 'tar.gz'},
);
