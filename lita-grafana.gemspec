Gem::Specification.new do |spec|
  spec.name          = "lita-grafana"
  spec.version       = "0.1.0"
  spec.authors       = ["Sophicware"]
  spec.email         = ["jurnell@sophicware.com"]
  spec.description   = "Lita Bot Handler for Grafana"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/sophicware/lita-grafana"
  spec.license       = "Copyright (c) 2015 Sophicware"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "fakeredis"
  spec.add_development_dependency "webmock"
end
