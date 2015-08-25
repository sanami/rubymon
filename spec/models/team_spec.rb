require 'rails_helper'

RSpec.describe Team, type: :model do
  subject do
    create :team
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end

  it 'limits per user' do
    u1 = create :user
    3.times do |i|
      t1 = create :team, user: u1
      expect(t1).to be_persisted
    end

    t2 = build :team, user: u1
    expect(t2).to be_invalid
  end
end
