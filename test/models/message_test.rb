require 'test_helper'

describe Message do
  let(:one) { messages(:one) }
  let(:two) { messages(:two) }
  let(:three) { messages(:three) }
  let(:four) { messages(:four) }
  let(:five) { messages(:five) }


  describe 'validations' do
    it 'must be valid' do
      expect(one).must_be :valid?
    end

    it 'must be invalid - lack of originator' do
      expect(two).must_be :invalid?
      expect(two.errors[:originator]).must_include "can't be blank"
    end

    it 'must be invalid - lack of recipient' do
      expect(three).must_be :invalid?
      expect(three.errors[:recipient]).must_include "can't be blank"
    end

    it 'must be invalid - lack of both originator and recipient' do
      expect(four).must_be :invalid?
      expect(four.errors[:originator]).must_include "can't be blank"
      expect(four.errors[:recipient]).must_include "can't be blank"
    end

    it 'must be invalid - content message exceeds 256 characters limit' do
      expect(five).must_be :invalid?
      expect(five.errors[:content]).must_include 'is too long (maximum is 256 characters)'
    end
  end
end
