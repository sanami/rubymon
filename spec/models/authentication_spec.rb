require 'rails_helper'

RSpec.describe Authentication, type: :model do
  subject do
    create :authentication
  end

  it 'subject' do
    expect(subject).to be_a described_class
    ap subject
  end
end
