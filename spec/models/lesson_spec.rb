require 'rails_helper'

describe Lesson do
  describe 'associations' do
    it { should have_many(:stars) }
    it { should have_many(:lesson_grade_levels) }
    it { should have_many(:grade_levels).through(:lesson_grade_levels) }
    it { should have_many(:lesson_subjects) }
    it { should have_many(:subjects).through(:lesson_subjects) }
    it { should have_many(:documents) }
  end
end
