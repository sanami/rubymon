require 'rails_helper'

RSpec.describe Team, type: :model do
  subject do
    create :team
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end
end
