require "spec_helper"
require 'json'

describe Lita::Handlers::Grafana, lita_handler: true do

  let(:response) {double("Faraday::Response")}
  let(:token) { "mytokentokentoken" }
  let(:robot) { Lita::Robot.new(registry) }
  subject { described_class.new(robot) }

  it { is_expected.to route_command('graf list').to(:grafana) }
  it { is_expected.to route_command('graf db graphite-carbon-metrics').to(:grafana) }
  it { is_expected.to route_command('graf db graphite-carbon-metrics now-12hr').to(:grafana) }
  it { is_expected.to route_command('graf list production').to(:grafana) }
  it { is_expected.to route_command('graf search elb').to(:grafana) }

  describe "plugin should search dashboards" do
    before do
      subject.config.api_token = token
      stub_request(:get, "https://google.com")
        .with(headers: {"Authorization" => "Bearer #{token}"})
        .to_return(body: JSON.dump([{id: 1, title: "", url: "", type: ""}]))
    end

    it "should find a list of dashboards" do
      # Arrange
      carl = Lita::User.create(123, name: "Carl")
      allow(response).to receive(:status).and_return(200)
      # Act
      send_message("graf search", as: carl)
      # Assert/Expect
      expect(JSON.load(replies.last).last).to include({"id" => 1})
    end
  end
end
