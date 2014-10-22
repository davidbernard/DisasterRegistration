require File.dirname(__FILE__) + "/../../app/models/authenticable"
require File.dirname(__FILE__) + "/../../app/models/administrator"
class AddAdministratorObject < Exodus::Migration
    self.migration_number = 1
    
    def initialize(args = {})
        super(args)
        self.status_complete = 1
        self.description = 'Add default admin user'
    end
    
    def up
        step("Create default admin administrator", 1) do
            user = Administrator.new( :first_name => 'admin', :last_name => 'admin', :authenticable => {:id => '1', :username => 'admin', :password => 'admin' })
            user.save
        end
        self.status.message = "Migration Executed!"
    end

    def down
        step("Remove default admin administrator", 0) do
             admin = Administrator.find_by_first_name( 'admin' )
             if admin != nil
                admin.destroy
             end
        end
        self.status.message = "Migration Executed!"
    end

end