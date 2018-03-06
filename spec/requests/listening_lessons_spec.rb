require 'rails_helper'

RSpec.describe "ListeningLessons", type: :request do
  describe "GET /listening_lessons" do
    it "works! (now write some real specs)" do
      get listening_lessons_path
      expect(response).to have_http_status(200)
    end
  end
end
