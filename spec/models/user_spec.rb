require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "validate the password" do
      @user = User.new(:first_name => "Syrym",:last_name =>"He",:email => "a@a.com",:password => "12345",:password_confirmation => "12345")
      @user.save

      expect(@user).to be_valid

    end
    it "validate the password and be invalid when password does not match " do
      @user1 = User.new(:first_name => "Syrym",:last_name =>"He",:email => "b@b.com",:password => "12345",:password_confirmation => "123456")
      @user1.save

      expect(@user1).to_not be_valid

    end

    it "validate the email " do
      @user2 = User.new(:first_name => "Syrym",:last_name =>"He",:email => "c@c.com",:password => "12345",:password_confirmation => "12345")
      @user2.save
      @user2_5 = User.new(:first_name => "Syrym",:last_name =>"He",:email => "C@C.com",:password => "12345",:password_confirmation => "12345")
      @user2_5.save

      expect(@user2_5).to_not be_valid

    end
    it "validate the first_name " do
      @user3 = User.new(:last_name =>"He",:email => "d@d.com",:password => "12345",:password_confirmation => "12345")
      @user3.save

      expect(@user3).to_not be_valid

    end
    it "validate the first_name " do
      @user4 = User.new(:first_name => "Syrym",:email => "e@e.com",:password => "12345",:password_confirmation => "12345")
      @user4.save

      expect(@user4).to_not be_valid

    end
    it "validate the eamil to presense " do
      @user5 = User.new(:first_name => "Syrym",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
      @user5.save

      expect(@user5).to_not be_valid

    end
    it "validate password's length " do
      @user6 = User.new(:first_name => "Syrym",:email => "f@f.com",:last_name =>"He",:password => "1234",:password_confirmation => "1234")
      @user6.save

      expect(@user6).to_not be_valid

    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'validate the user' do
    @user7 = User.new(:first_name => "Mark",:email => "g@g.com",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
    @user7.save
    user_test = User.authenticate_with_credentials("g@g.com","12345")
    expect(user_test).to eql(@user7)
    end

    it 'expect to be nil when password is incorrect' do
      @user8 = User.new(:first_name => "Mark",:email => "h@h.com",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
    @user8.save
    user_test1 = User.authenticate_with_credentials("h@h.com","1")
    expect(user_test1).to be_nil
    
    end

    it 'expect to be nil when email is incorrect' do
      @user11 = User.new(:first_name => "Mark",:email => "h@h.com",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
    @user11.save
    user_test4 = User.authenticate_with_credentials("x@x.com","12345")
    expect(user_test4).to be_nil
    
    end

    it 'expect to be true when typing space before and after the email' do
      @user9 = User.new(:first_name => "Mark",:email => "i@i.com",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
    @user9.save
    user_test2 = User.authenticate_with_credentials("    i@i.com   ","12345")
    expect(user_test2).to eql(@user9)

    
    end

    it 'expect to be true when typing without caring the case of letter' do
    @user10 = User.new(:first_name => "Mark",:email => "eXample@domain.COM",:last_name =>"He",:password => "12345",:password_confirmation => "12345")
    @user10.save
    user_test3 = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM","12345")
    expect(user_test3).to eql(@user10)

    
    end



  end

end
