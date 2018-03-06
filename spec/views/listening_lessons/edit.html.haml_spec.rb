require 'rails_helper'

RSpec.describe "listening_lessons/edit", type: :view do
  before(:each) do
    @listening_lesson = assign(:listening_lesson, ListeningLesson.create!(
      :name => "MyString",
      :link => "MyString",
      :script => "MyText"
    ))
  end

  it "renders the edit listening_lesson form" do
    render

    assert_select "form[action=?][method=?]", listening_lesson_path(@listening_lesson), "post" do

      assert_select "input[name=?]", "listening_lesson[name]"

      assert_select "input[name=?]", "listening_lesson[link]"

      assert_select "textarea[name=?]", "listening_lesson[script]"
    end
  end
end
