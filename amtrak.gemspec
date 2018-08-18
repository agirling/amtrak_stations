lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "amtrak/version"

Gem::Specification.new do |spec|
  spec.name = "amtrak"
  spec.version = Amtrak::VERSION
  spec.authors = ["Andrew Girling"]
  spec.email = ["agirling@bavservices.com"]

  spec.summary = "Access data on Amtrak stations"
  spec.description = "Access data on Amtrak stations"
  spec.homepage = "https://github.com/agirling/amtrak"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.2"

  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.8.0"
  spec.add_development_dependency "rspec-its", "~> 1.2.0"
  spec.add_development_dependency "timezone", "~> 1.0"
end
