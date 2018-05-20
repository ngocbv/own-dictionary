require 'rails_helper'

RSpec.describe ListeningLessonsController, type: :controller do
  let(:user) { create :user }

  before do
    sign_in user
  end

  describe "GET #index" do
    let!(:listening_lessons) { create_list :listening_lesson, 3 }

    it "returns a success response" do
      get :index
      expect(assigns(:listening_lessons).length).to eq 3
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    let!(:listening_lesson) { create :listening_lesson }

    it "returns a success response" do
      get :show, params: { id: listening_lesson.id }
      expect(assigns(:listening_lesson)).to eql listening_lesson
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(assigns(:listening_lesson)).to be_a ListeningLesson
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let!(:listening_lesson) { create :listening_lesson }

    it "returns a success response" do
      get :edit, params: { id: listening_lesson.id }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:lesson_params) { build(:listening_lesson).attributes }

      it "creates a new ListeningLesson" do
        expect {
          post :create, params: { listening_lesson: lesson_params }
        }.to change(ListeningLesson, :count).by(1)
      end

      it "redirects to the created listening_lesson" do
        post :create, params: { listening_lesson: lesson_params }
        expect(response).to redirect_to(ListeningLesson.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        expect {
          post :create, params: { listening_lesson: { abc: 1 } }
        }.not_to change { ListeningLesson.count }
        expect(response).to render_template :new
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let(:listening_lesson) { create :listening_lesson }

    before do
      put :update, params: { id: listening_lesson.id, listening_lesson: new_attributes}
    end

    context "with valid params" do
      let(:new_attributes) { { name: 'New listening lesson name' } }

      it "updates the requested listening_lesson" do

        listening_lesson.reload
        expect(listening_lesson.name).to eq 'New listening lesson name'
        expect(response).to redirect_to(listening_lesson)
      end
    end

    context "with invalid params" do
      let(:new_attributes) { { name: '' } }

      it "fail to update listening lesson" do
        expect(response).to render_template :edit
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:listening_lesson) { create :listening_lesson }

    it "destroys the requested listening_lesson" do
      expect {
        delete :destroy, params: { id: listening_lesson.id }
      }.to change(ListeningLesson, :count).by(-1)
      expect(response).to redirect_to listening_lessons_url
    end
  end
end
