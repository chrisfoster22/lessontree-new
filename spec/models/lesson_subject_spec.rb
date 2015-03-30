require 'rails_helper'

describe LessonSubject do
  describe 'associations' do
    it { should belong_to(:lesson) }
    it { should belong_to(:subject) }
  end

  describe 'validations' do
    it { should validate_presence_of(:lesson) }
    it { should validate_presence_of(:subject) }
  end
end
