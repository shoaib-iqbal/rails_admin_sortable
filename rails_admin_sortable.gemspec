$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_sortable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_sortable"
  s.version     = RailsAdminSortable::VERSION
  s.authors     = ["KOVACS Nicolas"]
  s.email       = ["perso.nkovacs@gmail.com"]
  s.homepage    = "https://github.com/rollincode/rails_admin_sortable"
  s.summary     = "RailsAdminSortable."
  s.description = "RailsAdminSortable collection action. Easy drag and drog sortable model."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 6.1.7.10"
end
