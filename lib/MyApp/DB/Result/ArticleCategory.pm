use utf8;
package MyApp::DB::Result::ArticleCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::DB::Result::ArticleCategory

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<article_category>

=cut

__PACKAGE__->table("article_category");

=head1 ACCESSORS

=head2 article_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "article_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</article_id>

=item * L</category_id>

=back

=cut

__PACKAGE__->set_primary_key("article_id", "category_id");

=head1 RELATIONS

=head2 article

Type: belongs_to

Related object: L<MyApp::DB::Result::Article>

=cut

__PACKAGE__->belongs_to(
  "article",
  "MyApp::DB::Result::Article",
  { id => "article_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 category

Type: belongs_to

Related object: L<MyApp::DB::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "MyApp::DB::Result::Category",
  { id => "category_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07014 @ 2011-12-16 13:35:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OEhMppSOTPL2yv75JLHIPg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
