# frozen_string_literal: true

require "rails_helper"

describe API::Private::V1::TargetGroups::Index, type: :request do
  describe "GET /api/private/v1/target_groups" do
    let(:params) { {} }

    subject { get "/api/private/v1/target_groups", params: params, headers: headers }

    context "when authenticated" do
      include_context "authenticated"

      context "when valid params" do
        let(:params) { { country_code: "PL" } }

        it "responds with success status" do
          subject
          expect(response).to have_http_status(:ok)
        end

        it "invokes GetTargetGroupByCountryCodeQuery" do
          allow_any_instance_of(GetTargetGroupByCountryCodeQuery).to receive(:call).and_return(true)
          expect_any_instance_of(GetTargetGroupByCountryCodeQuery).to receive(:call)
          subject
        end
      end

      context "when invalid params" do
        let(:params) { {} }

        it "responds with bad request status" do
          subject
          expect(response).to have_http_status(:bad_request)
        end

        it "does not invoke GetTargetGroupByCountryCodeQuery" do
          expect_any_instance_of(GetTargetGroupByCountryCodeQuery).to_not receive(:call)
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
