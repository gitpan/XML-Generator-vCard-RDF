# $Id: 30-rdf.t,v 1.1 2004/10/17 02:38:10 asc Exp $

use strict;
use Test::More;

plan tests => 9;

my $res = "";

SKIP: {
  eval { 
    require XML::SAX::Writer;
  };

  if ($@) {
    skip("XML::SAX::Writer not installed", 9);
  }

  eval { 
    require RDF::Simple::Parser;
  };

  if ($@) {
    skip("RDF::Simple::Parser not installed", 9);
  }

  #

  use_ok("XML::Generator::vCard::RDF");
  use_ok("XML::SAX::Writer");
  use_ok("RDF::Simple::Parser");
  
  #
  
  my $vcard = "t/Senzala.vcf";
  ok((-f $vcard),"found $vcard");
  
  #
  
  my $str_xml = "";
  my $writer  = XML::SAX::Writer->new(Output=>\$str_xml);
  isa_ok($writer,"XML::Filter::BufferText");
  
  #
  
  my $parser = XML::Generator::vCard::RDF->new(Handler=>$writer);
  isa_ok($parser,"XML::Generator::vCard::RDF");
  
  #
  
  ok($parser->parse_files($vcard),"parsed $vcard");

  #

  my $rdf_parser = RDF::Simple::Parser->new(base => "");
  isa_ok($rdf_parser,"RDF::Simple::Parser");
  
  my @triples = $rdf_parser->parse_rdf($str_xml); 
  cmp_ok(scalar(@triples),"==",29,"found 29 triples");
}