Gem::Specification.new do |s|

  s.name     = 'crstruct'
  s.version  = '1.0.221218'

  s.homepage = 'https://github.com/carlosjhr64/crstruct'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2022-12-18'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.

The "CR" in `CRStruct` is for "Create and Read"...
No "Update"...
No "Delete".
DESCRIPTION

  s.summary = <<SUMMARY
Ruby gem for an extremely lite OpenStruct like class with
attributes that can only be set once, and then read thereafter.
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
README.md
lib/crstruct.rb
  )

  s.requirements << 'ruby: ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]'

end
