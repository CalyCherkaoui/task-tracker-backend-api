require 'rails_helper'

RSpec.describe Routine, type: :model do
  let(:routine) { create_routine }

  it 'is valid with a name, an icon and priority' do
    expect(routine).to be_valid
  end

  describe 'Routine Associations' do
    it { should have_many(:tasks) }
  end

  describe 'Routine: name validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
  end

  describe 'Routine: priority validations' do
    it { should validate_presence_of(:priority) }
  end
end
