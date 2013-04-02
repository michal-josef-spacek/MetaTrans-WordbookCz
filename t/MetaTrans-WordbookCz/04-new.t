# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::WordbookCz;
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::WordbookCz->new;
isa_ok($obj, 'MetaTrans::WordbookCz');

# Test.
my $ret = $obj->host_server;
is($ret, 'www.wordbook.cz', 'URI of web service.');

# Test.
my @ret = $obj->get_all_src_lang_codes;
is_deeply(
	\@ret,
	[
		'cze',
		'eng',
		'fre',
		'ger',
		'spa',
	],
	'Translation languages.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	['eng', 'fre', 'ger', 'spa'],
	'Translation direction cze -> eng, fre, ger, spa.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('eng');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction eng -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('fre');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction fre -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('ger');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction ger -> cze.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('spa');
is_deeply(
	\@ret,
	['cze'],
	'Translation direction spa -> cze.',
);
