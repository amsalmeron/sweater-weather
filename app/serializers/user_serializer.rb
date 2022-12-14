class UserSerializer
    include JSONAPI::Serializer
    def self.user_data(user)
        { 
            data: {
                type: "users",
                id: user.id,
                attributes: {
                    email: user.email,
                    api_key: user.auth_token
                }
            }
        }
    end
end