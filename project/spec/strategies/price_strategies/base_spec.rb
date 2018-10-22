require "rails_helper"

describe PriceStrategies::Base do
  describe "#call" do
    subject { dummy_class.new.call }

    before { allow(Net::HTTP).to receive(:get) }

    shared_examples "raises an error" do
      it "raises an error" do
        expect { subject }.to raise_error NotImplementedError
      end
    end

    context "when #calculate_value method does not exist" do
      let(:dummy_class) do
        class DummyPriceStrategyWithoutCalculateValue < described_class
          self
        end
      end

      it_behaves_like "raises an error"
    end

    context "when #url method does not exist" do
      let(:dummy_class) do
        class DummyPriceStrategyWithoutUrl < described_class
          def calculate_value
            response
          end

          self
        end
      end

      it_behaves_like "raises an error"
    end

    context "when both methods exist" do
      let(:dummy_class) do
        class DummyPriceStrategy < described_class
          def calculate_value
            response
          end

          def url
            "http://example.com"
          end

          self
        end
      end

      it "does not raise any error" do
        expect { subject }.to_not raise_error
      end
    end
  end
end
