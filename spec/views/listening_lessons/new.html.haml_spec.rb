require 'rails_helper'

RSpec.describe "listening_lessons/new", type: :view do
  before(:each) do
    assign(:listening_lesson, ListeningLesson.new(
      :name => "MyString",
      :link => "MyString",
      :script => "MyText"
    ))
  end

  it "renders new listening_lesson form" do
    render

    assert_select "form[action=?][method=?]", listening_lessons_path, "post" do

      assert_select "input[name=?]", "listening_lesson[name]"

      assert_select "input[name=?]", "listening_lesson[link]"

      assert_select "textarea[name=?]", "listening_lesson[script]"
    end
  end
end
