use utf8;
package MyApp::DB::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::DB::Result::Category

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

=head1 TABLE: C<category>

=cut

__PACKAGE__->table("category");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 article_categories

Type: has_many

Related object: L<MyApp::DB::Result::ArticleCategory>

=cut

__PACKAGE__->has_many(
  "article_categories",
  "MyApp::DB::Result::ArticleCategory",
  { "foreign.category_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07014 @ 2011-12-16 13:35:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SUcJAC+enTeL/rlpUsEEZw

__PACKAGE__->many_to_many(qw/articles article_categories article/);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
