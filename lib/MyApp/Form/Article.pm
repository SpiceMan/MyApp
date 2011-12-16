package MyApp::Form::Article;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';


has '+item_class' => ( default => 'Article' );

has_field 'categories' => ( type => 'Select', multiple => 1, required => 1, sort_column => "id" );
has_field 'title' => ( type => 'Text', required => 1 );
has_field 'some_date' => ( type => 'Date', required => 1 );
has_field 'article_sections' => ( type => 'Repeatable', num_when_empty => 2);
has_field 'article_sections.section' => ( type => 'Select', required => 1, sort_column => 'id', empty_select => "--SELECT--" );
has_field 'article_sections.section_id' => ( type => 'PrimaryKey' );
has_field 'article_sections.text' => ( type => 'TextArea', required => 1 );
has_field 'submit' => ( type => 'Submit' );


1;
