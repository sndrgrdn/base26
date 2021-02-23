# frozen_string_literal: true

require_relative 'lib/base26/version'

Gem::Specification.new do |spec|
  spec.name          = 'base26'
  spec.version       = Base26::VERSION
  spec.authors       = ['Sander Tuin']
  spec.email         = ['git@sander.garden']

  spec.summary       = 'Base26 converts integer to and from base26'
  spec.description   = 'Base26 converts integer to and from base26'
  spec.homepage      = 'https://github.com/sndrgrdn/base26'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/sndrgrdn/base26'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
