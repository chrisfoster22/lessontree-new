require 'rails_helper'

describe User do
  describe 'associations' do
    it { should have_many(:plans) }
    it { should have_many(:lessons) }
  end
end
