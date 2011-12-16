use utf8;
package MyApp::DB::Result::Article;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::DB::Result::Article

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

=head1 TABLE: C<article>

=cut

__PACKAGE__->table("article");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 some_date

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "some_date",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 article_sections

Type: has_many

Related object: L<MyApp::DB::Result::ArticleSection>

=cut

__PACKAGE__->has_many(
  "article_sections",
  "MyApp::DB::Result::ArticleSection",
  { "foreign.article_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07014 @ 2011-12-16 10:57:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SgMF+llmB5rAGwElLqjbgg

__PACKAGE__->many_to_many( sections => "article_sections", "section" );
__PACKAGE__->add_columns( "some_date" => { data_type => "datetime", is_nullable => 0 },);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
