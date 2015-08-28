require File.expand_path '../app.rb', __FILE__

Sass::Plugin.options[:style] = :compressed

use Sass::Plugin::Rack

run Sinatra::Application
