use 5.010;
package Autologout::Result::Site;
use parent qw/DBIx::Class::Core/;

use strict;
use warnings;
use utf8;

__PACKAGE__->table('al_site');
__PACKAGE__->add_columns(qw/
    id
    site_name
    site_url
    logout_url
    protected
    approved
    votes_yes
    votes_no
/);
__PACKAGE__->set_primary_key('id');


1;
