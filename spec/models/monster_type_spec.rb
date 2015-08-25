require 'rails_helper'

RSpec.describe MonsterType, type: :model do
  subject do
    create :monster_type
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end
end
