use strict;
use warnings;

use TestApp;

my $app = TestApp->apply_default_middlewares(TestApp->psgi_app);
$app;

