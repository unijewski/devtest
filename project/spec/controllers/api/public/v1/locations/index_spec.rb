# frozen_string_literal: true

require "rails_helper"

describe API::Public::V1::Locations::Index, type: :request do
  describe "GET /api/public/v1/locations" do
    subject { get "/api/public/v1/locations", params: params }

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
      let(:params) { {} }

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
end
