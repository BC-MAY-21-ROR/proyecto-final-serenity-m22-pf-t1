require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      dni: "MyString",
      full_name: "MyString",
      telephone: "MyString",
      birthday: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[dni]"

      assert_select "input[name=?]", "customer[full_name]"

      assert_select "input[name=?]", "customer[telephone]"

      assert_select "input[name=?]", "customer[birthday]"

      assert_select "input[name=?]", "customer[email]"
    end
  end
end