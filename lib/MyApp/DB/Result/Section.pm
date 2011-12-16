use utf8;
package MyApp::DB::Result::Section;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::DB::Result::Section

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

=head1 TABLE: C<section>

=cut

__PACKAGE__->table("section");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
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
  { "foreign.section_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07014 @ 2011-12-16 10:57:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PdHn1TA0qAYApFHgDQWQsg

__PACKAGE__->many_to_many( articles => "article_sections", "article" );

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
