
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "qa_at_migration/version"

Gem::Specification.new do |spec|
  spec.name          = "qa_at_migration"
  spec.version       = QaAtMigration::VERSION
  spec.date             = "2017-01-18"
  spec.authors       = ["Dennis Huillca"]
  spec.email         = ["dennisbot@gmail.com"]

  spec.summary       = %q{tool to make migration of AT files (*.md) easy}
  spec.description   = %q{this tool is used to make an easy migration of AT files (*.md) from the github repository of AT}
  spec.homepage      = "https://github.com/dennisbot/qa_at_migration/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f)}
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
