Topic.delete_all
a = Topic.create( :title => "Somersaults", 
                  :body => "A Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::LINKABLE | Topic::ROOT
                )
b = Topic.create( :title => "Twisting Somersaults", 
                  :body => "Somersaults with twisting components can be forward or back ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::LINKABLE
                )
c = Topic.create( :title => "Non Twisting Somersaults", 
                  :body => "Somersaults with no twisting. These are normally backwards ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN | Topic::LINKABLE
                )
d = Topic.create( :title => "Front Somersault", 
                  :body => "A Front Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN | Topic::LINKABLE
                )
e = Topic.create( :title => "Back Somersault", 
                  :body => "A Back Somersault involes a performer ...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN | Topic::LINKABLE
                )        
f = Topic.create( :title => "Tips", 
                  :body => "! do this, 2 do this...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN
                )
g = Topic.create( :title => "Progressions", 
                  :body => "! do this, 2 do this...", 
                  :display_options => Topic::VISIBLE | Topic::ACTIVE | Topic::FULL_SCREEN
                )

a.children << [b, c]
c.children << [d, e]
e.children << [f, g]