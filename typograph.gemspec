# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{typograph}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yury Korolev"]
  s.date = %q{2009-08-17}
  s.description = %q{apply some basic typography rules to text}
  s.email = %q{yury.korolev@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION",
     "lib/typograph.rb",
     "lib/typograph/rules.rb",
     "lib/typograph/rules/dash_rules.rb",
     "lib/typograph/rules/etc_rules.rb",
     "lib/typograph/rules/math_rules.rb",
     "lib/typograph/rules/punchmark_rules.rb",
     "lib/typograph/rules/quote_rules.rb",
     "lib/typograph/string_sub_each.rb",
     "test/typograph_test.rb"
  ]
  s.homepage = %q{http://github.com/yury/typograph}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{ruby html typograph}
  s.test_files = [
    "test/typograph_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
