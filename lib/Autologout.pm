package Autologout;
use parent qw/DBIx::Class::Schema/;
our @EXPORT_OK = qw/schema/;
use Exporter qw/import/;
use File::Slurp qw/slurp/;
__PACKAGE__->load_namespaces;

use DBI;
use JSON::XS;
sub dbh {
    my $conf = JSON::XS::decode_json(slurp 'autologout.json');
    my $dbh  = DBI->connect($conf->{connectstring},
                 $conf->{username}, $conf->{password},
                 { RaiseError => 1, AutoCommit => 1});
    return $dbh;
}

my $schema = __PACKAGE__->connect(\&dbh);
sub schema { $schema };

1;

