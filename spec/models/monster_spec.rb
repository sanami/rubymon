require 'rails_helper'

RSpec.describe Monster, type: :model do
  subject do
    create :monster
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end

  describe 'limits' do
    it 'per user' do
      u1 = create :user
      20.times do |i|
        m1 = create :monster, user: u1
        expect(m1).to be_persisted
      end

      m2 = build :monster, user: u1
      expect(m2).to be_invalid
    end

    it 'per team' do
      u1 = create :user
      t1 = create :team, user: u1
      3.times do |i|
        m1 = create :monster, user: u1, team: t1
        expect(m1).to be_persisted
      end

      m2 = build :monster, user: u1, team: t1
      expect(m2).to be_invalid
    end
  end
end
