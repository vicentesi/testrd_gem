require 'spec_helper'

describe TestrdGem do
  it 'has a version number' do
    expect(TestrdGem::VERSION).not_to be nil
  end

#  it 'does something useful' do
#    expect(false).to eq(true)
#  end

  it 'has a lead' do
    expect(TestrdGem::Lead.new("","","","","","","")).not_to be nil
  end
end
