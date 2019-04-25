module AuthorizeHelper
    
    def authorize_user(user)
        if user.authorized
			user.authorized = false
            user.save
            false
		else
			user.authorized = true
			user.save
			true
		end
    end
end