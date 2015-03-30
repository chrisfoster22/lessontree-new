require 'rails_helper'

describe LessonGradeLevel do
  describe 'associations' do
    it { should belong_to(:lesson) }
    it { should belong_to(:grade_level) }
  end

  describe 'validations' do
    it { should validate_presence_of(:lesson) }
    it { should validate_presence_of(:grade_level) }
  end
end
