# README

Steps to reproduce the issue:

- `bundle`
- `rails db:create db:migrate`
- `rspec spec/models/cat_spec.rb:16` (which should throw a `stack level too deep` error)
