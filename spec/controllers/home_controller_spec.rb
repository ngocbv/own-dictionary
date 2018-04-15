require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context "with params q" do
      let(:keyword) { Faker::Lorem.word }

      before do
        get :index, params: { q: keyword }
      end

      context "had a word is updated" do
        let!(:word) { create :word, name: keyword, updated: false }

        it "call Oxford API to translate" do
          expect_any_instance_of(OxfordDictionariesService).to receive(:search).with(keyword)
        end
      end

      context "does not have the word with that keyword" do
        it "did not call OxfordDictionariesService API to translate" do
          expect_any_instance_of(OxfordDictionariesService).not_to receive(:search)
        end
      end

      context "had a keyword with that name but it's updated" do
        let(:word) { create :word, name: keyword, updated: true }

        it "did not call OxfordDictionariesService API to translate" do
          expect_any_instance_of(OxfordDictionariesService).not_to receive(:search)
        end
      end
    end

    context "without params q" do
      it "did not call Oxford API to translate" do
        get :index
        expect_any_instance_of(OxfordDictionariesService).not_to receive(:search)
      end
    end
  end
end
