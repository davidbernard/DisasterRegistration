
class Administrator
    include MongoMapper::Document
    
    key :first_name, String
    key :last_name, String
    
    one :authenticable, :class_name => "Authenticable", :as => :authenticable_object
    timestamps!
    
    def name
        "#{last_name}, #{first_name}"
    end

end
