require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should have_many(:posts) }
  it { should have_many(:articles) }
  it { should have_many(:comments) }
end
