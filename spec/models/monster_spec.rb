require 'rails_helper'

RSpec.describe Monster, type: :model do
  subject do
    create :monster
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end
end