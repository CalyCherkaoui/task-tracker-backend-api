require 'rails_helper'

RSpec.describe Mesurement, type: :model do
  let(:user) { create_user }
  let(:routine) { create_routine }
  let(:task) { create_task(user, routine) }
  let(:mesurement) { create_mesurement(task) }


  it 'is valid with valid attributes' do
    expect(mesurement).to be_valid
  end

  describe 'Mesurement Associations' do
    it { should belong_to(:task) }
  end

  describe 'Mesurement: quantity validations' do
    it { should validate_presence_of(:quantity) }
  end
end
