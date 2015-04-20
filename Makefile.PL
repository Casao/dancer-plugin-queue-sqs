

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Dancer::Plugin::Queue::SQS',
    VERSION_FROM => 'lib/Dancer/Plugin/Queue/SQS.pm', # finds \$VERSION
    AUTHOR       => 'Colin Ewen (colin@draecas.com)',
    ABSTRACT     => 'SQS Adapter for Dancer::Plugin::Queue',
    LICENSE          => 'artistic_2',
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Dancer' => 0,
        'Amazon::SQS::Simple' => '2.03',
        'Moo' => '2.000001'
    },
    TEST_REQUIRES => {
        'YAML' => 0,
        'JSON' => 0
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Dancer-Plugin-Queue-SQS-*' },
);

