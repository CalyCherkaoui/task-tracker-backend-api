require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create_user }
  let(:routine) { create_routine }
  let(:task) { create_task(user, routine) }

  # let(:task) {FactoryBot.create(:task)}

  it 'is valid with valid attributes' do
    expect(task).to be_valid
  end

  describe 'Task Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:routine) }
  end

  describe 'Task: name validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
  end

  describe 'Task: priority validations' do
    it { should validate_presence_of(:priority) }
  end

  describe 'Task: goal validations' do
    it { should validate_presence_of(:goal) }
  end

  describe 'Task: unit validations' do
    it { should validate_presence_of(:unit) }
  end
end
