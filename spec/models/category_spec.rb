require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create(:category) }

  describe "callbacks" do
    context "when a category is destroyed" do
      context "and it still has questions in it" do
        before :each do
          FactoryGirl.create(:question, categories: [category])
        end

        it "fails" do
          expect(category.destroy).to be false
        end
      end

      context "and no questions remain in that category" do
        it "succeeds" do
          category.destroy

          expect(Category.exists?(category.id)).to be false
        end
      end
    end
  end
end

