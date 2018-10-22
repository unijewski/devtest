shared_context "authenticated" do
  before { allow(Rails.application.credentials).to receive(:api_access_token).and_return("123") }
  let(:headers) { { "Authorization" => "123" } }
end

shared_context "not authenticated" do
  let(:headers) { {} }
end
