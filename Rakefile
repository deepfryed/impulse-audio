require 'date'
require 'pathname'
require 'rake'

$rootdir = Pathname.new(__FILE__).dirname
$gemspec = Gem::Specification.new do |s|
  s.name              = 'impulse'
  s.version           = '0.1.0'
  s.date              = Date.today    
  s.authors           = ['Bharanee Rathna']
  s.email             = ['deepfryed@gmail.com']
  s.summary           = 'Pulseaudio visualizer'
  s.description       = 'Pulseaudio visualizer for Ruby'
  s.homepage          = 'http://github.com/deepfryed/impulse'
  s.files             = Dir['ext/**/*.{c,h}'] + Dir['{ext,test,lib}/**/*.rb'] + %w(README.md CHANGELOG) 
  s.extensions        = %w(ext/impulse/extconf.rb)
  s.require_paths     = %w(lib ext)

  s.add_development_dependency('rake')
end

desc 'Generate impulse gemspec'
task :gemspec do 
  $gemspec.date = Date.today
  File.open('impulse.gemspec', 'w') {|fh| fh.write($gemspec.to_ruby)}
end

desc 'compile extension'
task :compile do
  Dir.chdir('ext/impulse') do
    system('ruby extconf.rb && make clean && make -j2') or raise 'unable to compile impulse'
  end
end

task default: :compile
