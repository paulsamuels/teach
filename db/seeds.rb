# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Topic.delete_all
a = Topic.create( :title => "Somersaults", 
                  :body => "A Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::LINKABLE | Topic::ROOT
                )
b = Topic.create( :title => "Front Somersault", 
                  :body => "A Front Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN | Topic::LINKABLE
                )
c = Topic.create( :title => "Back Somersault", 
                  :body => "A Back Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN | Topic::LINKABLE
                )        
d = Topic.create( :title => "Tips", 
                  :body => "! do this, 2 do this...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN
                )
e = Topic.create( :title => "Progressions", 
                  :body => "! do this, 2 do this...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN
                )

a.children << b
a.children << c
c.children << d
c.children << e