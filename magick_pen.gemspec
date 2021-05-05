require_relative "lib/magick_pen/version"

Gem::Specification.new do |spec|
  spec.name        = "magick_pen"
  spec.version     = MagickPen::VERSION
  spec.authors     = ["Kazuo Matsunaga"]
  spec.email       = ["kazuomatz@lifecode.jp"]
  spec.homepage    = "https://github.com/kazuomatz/magick_pen"
  spec.summary     = "Plug-in that allows you to edit a Web page to direct."
  spec.description = "The part of the erb file enclosed in <vue-magick-pen> tags can be edited."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'rails', '>= 6.0', '<6.2'
  spec.add_dependency 'paper_trail'
end
