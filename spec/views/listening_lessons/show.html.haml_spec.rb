require 'rails_helper'

RSpec.describe "listening_lessons/show", type: :view do
  before(:each) do
    @listening_lesson = assign(:listening_lesson, ListeningLesson.create!(
      :name => "Name",
      :link => "Link",
      :script => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/MyText/)
  end
end
