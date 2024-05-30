require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new product" do
      expect {
        post :create, params: { product: { name: "New Product", price: 20 } }
      }.to change(Product, :count).by(1)
    end
  end
end