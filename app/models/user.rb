require 'role_model'

class User
    include MongoMapper::Document
    
    extend Enumerize
 
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

    timestamps!
    
    # Attributes ::::::::::::::::::::::::::::::::::::::::::::::::::::::
    key :email,String
    key :username,String
    key :comment_count, Integer
    key :encrypted_password, String
    key :password_salt, String
    key :reset_password_token, String
    key :remember_token, String
    key :remember_created_at, Time
    key :sign_in_count, Integer
    key :current_sign_in_at, Time
    key :current_sign_in_ip, String
    key :last_sign_in_at, Time
    key :last_sign_in_ip, String
    key :failed_attempts, Integer
    key :locked_at, Time
    key :unlock_token, String
    
    one :service_provider, class: ServiceProvider

    # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::
    RegEmailName = '[\w\.%\+\-]+'
    RegDomainHead= '(?:[A-Z0-9\-]+\.)+'
    RegDomainTLD = '(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
    RegEmailOk = /\A#{RegEmailName}@#{RegDomainHead}#{RegDomainTLD}\z/i
    
    validates_length_of :email, :within => 6..100, :allow_blank => true
    validates_format_of :email, :with => RegEmailOk, :allow_blank => true
    
    include RoleModel
    
    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :roles_mask, :roles
    
    key :roles_mask, Integer
    roles_attribute :roles_mask
    
    # declare the valid roles -- do not change the order if you add more
    # roles later, always append them at the end!
    roles :system_admin, :service_provider_admin, :service_provider_helper, :guest

    def admin?
        Rails.logger.info "#{email} role admin #{has_role?(:system_admin)}"
        has_role? :system_admin
    end
    

   end
