require "spec_helper"

describe Lita::Handlers::Grafana, lita_handler: true do
  it { is_expected.to route_command('graf list').to(:grafana) }
  it { is_expected.to route_command('graf db graphite-carbon-metrics').to(:grafana) }
  it { is_expected.to route_command('graf db graphite-carbon-metrics now-12hr').to(:grafana) }
  it { is_expected.to route_command('graf list production').to(:grafana) }
  it { is_expected.to route_command('graf search elb').to(:grafana) }
end
