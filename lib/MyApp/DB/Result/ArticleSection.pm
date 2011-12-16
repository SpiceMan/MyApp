use utf8;
package MyApp::DB::Result::ArticleSection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::DB::Result::ArticleSection

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

=head1 TABLE: C<article_sections>

=cut

__PACKAGE__->table("article_sections");

=head1 ACCESSORS

=head2 article_id

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 section_id

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 text

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "article_id",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "section_id",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "text",
  { data_type => "text", is_nullable => 1 },
);

=head1 RELATIONS

=head2 article

Type: belongs_to

Related object: L<MyApp::DB::Result::Article>

=cut

__PACKAGE__->belongs_to(
  "article",
  "MyApp::DB::Result::Article",
  { id => "article_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 section

Type: belongs_to

Related object: L<MyApp::DB::Result::Section>

=cut

__PACKAGE__->belongs_to(
  "section",
  "MyApp::DB::Result::Section",
  { id => "section_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07014 @ 2011-12-16 10:22:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:esHUekq2d/UAoo6fwehXYw

__PACKAGE__->set_primary_key(qw/article_id section_id/);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
