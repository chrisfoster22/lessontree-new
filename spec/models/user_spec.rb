require 'rails_helper'

describe User do
  describe 'associations' do
    it { should have_many(:plans) }
    it { should have_many(:lessons) }
    it { should have_many(:grade_levels).through(:lessons) }
  end

  describe '#to_s' do
    let(:subject) { described_class.new(name: "Bob") }

    it 'returns true if name equals to_s' do
      expect(subject.to_s).to eq(subject.name)
    end

    it 'returns the given name' do
      expect(subject.to_s).to eq("Bob")
    end
  end
end
