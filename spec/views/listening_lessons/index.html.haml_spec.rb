require 'rails_helper'

RSpec.describe "listening_lessons/index", type: :view do
  before(:each) do
    assign(:listening_lessons, [
      ListeningLesson.create!(
        :name => "Name",
        :link => "Link",
        :script => "MyText"
      ),
      ListeningLesson.create!(
        :name => "Name",
        :link => "Link",
        :script => "MyText"
      )
    ])
  end

  it "renders a list of listening_lessons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
