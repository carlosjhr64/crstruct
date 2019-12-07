Gem::Specification.new do |s|

  s.name     = 'crstruct'
  s.version  = '0.1.191207'

  s.homepage = 'https://github.com/carlosjhr64/crstruct'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2019-12-07'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.

The "CR" in `CRStruct` is for "Create and Read"...
no "Update"...
no "Delete".
DESCRIPTION

  s.summary = <<SUMMARY
Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
README.md
lib/crstruct.rb
lib/crstruct/open.rb
lib/crstruct/registered.rb
  )

  s.requirements << 'ruby: ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]'

end
