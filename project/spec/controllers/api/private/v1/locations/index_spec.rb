require "rails_helper"

describe API::Private::V1::Locations::Index, type: :request do
  describe "GET /api/private/v1/locations" do
    let(:params) { {} }

    subject { get "/api/private/v1/locations", params: params, headers: headers }

    context "when authenticated" do
      include_context "authenticated"

      context "when valid params" do
        let(:params) { { country_code: "PL" } }

        it "responds with success status" do
          subject
          expect(response).to have_http_status(:ok)
        end

        it "invokes GetLocationByCountryCodeQuery" do
          expect_any_instance_of(GetLocationByCountryCodeQuery).to receive(:call).and_call_original
          subject
        end
      end

      context "when invalid params" do
        it "responds with bad request status" do
          subject
          expect(response).to have_http_status(:bad_request)
        end

        it "does not invoke GetLocationByCountryCodeQuery" do
          expect_any_instance_of(GetLocationByCountryCodeQuery).to_not receive(:call)
          subject
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
