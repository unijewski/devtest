require "rails_helper"

describe API::Private::V1::EvaluateTarget::Create, type: :request do
  describe "POST /api/private/v1/evaluate_target" do
    let(:params) { {} }

    subject { post "/api/private/v1/evaluate_target", params: params, headers: headers }

    around(:example) { |example| VCR.use_cassette("time_com", &example) }

    context "when authenticated" do
      include_context "authenticated"

      context "when valid params" do
        let!(:country) { create(:country) }
        let(:params) do
          {
            country_code: country.code,
            target_group_id: 1,
            locations: [{ id: 1, panel_size: 200 }]
          }
        end

        it "responds with created status" do
          subject
          expect(response).to have_http_status(:created)
        end

        it "invokes EvaluationServices::CalculatePrice" do
          allow_any_instance_of(EvaluationServices::CalculatePrice).to receive(:call).and_return(10)
          expect_any_instance_of(EvaluationServices::CalculatePrice).to receive(:call)
          subject
        end
      end

      context "when invalid params" do
        it "responds with bad request status" do
          subject
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    context "when not authenticated" do
      include_context "not authenticated"

      it "responds with unauthorized status" do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
