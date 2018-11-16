require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(email: "test@test.gov", password: "password")
  user.save
  user = User.find(1)

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "::find_by_credentials" do
    it "verifies a user's login information before creating new session" do
      expect(User.find_by_credentials("test@test.gov", "password")).to eq(user)
    end

    it "detects erroneous input" do
      expect(User.find_by_credentials("test@test.gov", "BADPASS")).to_not eq(user)
    end
  end

  describe "#is_password?" do
    it "detects a correct password" do
      expect(user.is_password?("password")).to be true
    end

    it "detects an incorrect password" do
      expect(user.is_password?("BADPASS")).to be false
    end

  end

  describe "#reset_session_token" do
    it "resets the current users session_token" do
      old_pass = user.session_token
      user.reset_session_token
      expect(user.session_token).to_not eq(old_pass)
    end
  end

end
