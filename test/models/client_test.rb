require "test_helper"

describe Client do
  let(:product_review_center) { clients(:product_review_center) }

  it "must be valid" do
    value(product_review_center).must_be :valid?
  end
end
