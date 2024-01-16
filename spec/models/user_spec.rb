require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    @user1 = build(:user)
  end
  
  it 'has a valid factory' do
    factoryTest = build(:user)
    expect(factoryTest).to be_valid
  end

  it 'is invalid without a name' do
    nilNameUser = build(:user, name: nil)
    expect(nilNameUser).to_not be_valid

    emptyNameUser = build(:user, name: '')
    expect(emptyNameUser).to_not be_valid
  end

  it 'is invalid without an email' do
    nilEmailUser = build(:user, email: nil)
    expect(nilEmailUser).to_not be_valid

    emptyEmailUser = build(:user, email: '')
    expect(emptyEmailUser).to_not be_valid
  end

  it 'is invalid without a password' do
    nilPasswordUser = build(:user, password: nil, password_confirmation: nil)
    expect(nilPasswordUser).to_not be_valid

    emptyPasswordUser = build(:user, password: '', password_confirmation: nil)
    expect(emptyPasswordUser).to_not be_valid
  end

  it 'should have a unique email' do
    @user1.save
    newUser = build(:user)
    expect(newUser).to_not be_valid
  end

  it 'should save the email in all lowercase' do
    user = create(:user, email: 'ALLCAPSEMAIL@test.com')
    expect(user.email).to eq 'allcapsemail@test.com'
  end
end
