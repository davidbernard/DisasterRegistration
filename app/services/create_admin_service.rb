class CreateAdminService
    def call
        user = User.create(email: Rails.application.secrets.admin_email) do |user|
            user.password = Rails.application.secrets.admin_password
            user.password_confirmation = Rails.application.secrets.admin_password
            user.roles = [:system_admin]
        end
    end
end
