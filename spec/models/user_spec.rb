require 'rails_helper'

RSpec.describe User, type: :model do
    describe "check password security" do
        it "has a secure password" do
            user = User.create!(email: 'honey2@gmail.com', password: 'test123', password_confirmation: 'test123')
            expect(user).to_not have_attribute(:password)  
            expect(user).to_not have_attribute(:password_confirmation)
            expect(user.password_digest).to_not eq('test123')        
        end
    end
end