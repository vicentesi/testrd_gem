require_relative 'spec_helper'

describe TestrdGem do

  describe 'Lead' do
    it 'has a version number' do
      expect(TestrdGem::VERSION).not_to be nil
    end

    it 'has empty array of leads' do
      expect(TestrdGem::Lead.all).to be_empty
    end

    it 'has no leads' do
      expect(TestrdGem::Lead.count).to be 0
    end

    it 'deletes inexistent lead' do
      expect(TestrdGem::Lead.delete(0)).to be nil
    end

    it 'has a lead' do
      expect(TestrdGem::Lead.count).to be 0
      TestrdGem::Lead.new("","","","","","","")
      expect(TestrdGem::Lead.count).to be 1
    end

    it 'returns a lead' do
      expect(TestrdGem::Lead.new("","","","","","","")).not_to be nil
    end

    it 'descrease the lead counter' do
      TestrdGem::Lead.new("","","","","","","")
      old_count = TestrdGem::Lead.count
      TestrdGem::Lead.delete(0)
      new_count = TestrdGem::Lead.count

      expect(new_count.to_i).to be < old_count.to_i
    end

    it 'return a set of leads' do
      expect(TestrdGem::Lead.all).not_to be_empty
    end

    it 'should return exception (invalid login)' do
      expect{TestrdGem::Lead.integrate("","","")}.to raise_error(RuntimeError)
    end

  end
end
