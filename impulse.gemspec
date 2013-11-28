# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "impulse"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bharanee Rathna"]
  s.date = "2013-11-28"
  s.description = "Pulseaudio visualizer for Ruby"
  s.email = ["deepfryed@gmail.com"]
  s.extensions = ["ext/impulse/extconf.rb"]
  s.files = ["ext/impulse/Impulse.c", "ext/impulse/impulse.c", "ext/impulse/Impulse.h", "ext/impulse/extconf.rb", "README.md", "CHANGELOG"]
  s.homepage = "http://github.com/deepfryed/impulse"
  s.require_paths = ["lib", "ext"]
  s.rubygems_version = "1.8.23"
  s.summary = "Pulseaudio visualizer"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
