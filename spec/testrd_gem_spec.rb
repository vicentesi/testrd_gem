require_relative 'spec_helper'

describe TestrdGem do

  describe 'LeadStorage' do
    it 'has a version number' do
      expect(TestrdGem::VERSION).not_to be nil
    end

    it 'has empty array of leads' do
      expect(TestrdGem::LeadStorage.all).to be_empty
    end

    it 'has no leads' do
      expect(TestrdGem::LeadStorage.count).to be 0
    end

    it 'deletes inexistent lead' do
      expect(TestrdGem::LeadStorage.delete(0)).to be nil
    end

    it 'has a lead' do
      expect(TestrdGem::LeadStorage.count).to be 0
      TestrdGem::LeadStorage.new("","","","","","","")
      expect(TestrdGem::LeadStorage.count).to be 1
    end

    it 'returns a lead' do
      expect(TestrdGem::LeadStorage.new("","","","","","","")).not_to be nil
    end

    it 'descrease the lead counter' do
      TestrdGem::LeadStorage.new("","","","","","","")
      old_count = TestrdGem::LeadStorage.count
      TestrdGem::LeadStorage.delete(0)
      new_count = TestrdGem::LeadStorage.count

      expect(new_count.to_i).to be < old_count.to_i
    end

    it 'return a set of leads' do
      expect(TestrdGem::LeadStorage.all).not_to be_empty
    end

    it 'should return exception (invalid login)' do
      expect{TestrdGem::LeadStorage.integrate("","","")}.to raise_error(RuntimeError)
    end

  end
end
