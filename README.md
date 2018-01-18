## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qa_at_migration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qa_at_migration

## Usage

This gem was created to handle migration of files from the `*.md` (markdown version) to a whole unique `*.csv` file.

You will need to have a `config.yml` file in the root level of your project with an ignore key entry listing the `<filename>.md` files (without the `*.md` extension) you want to ignore throughout the migration process.

### config.xml sample structure

``` yml
ignore:
  - Readme
  - test_template
  - CODE_OF_CONDUCT
  - README
```

After installing the gem, run:

    $ qa_at_migration help generate_csv

And follow the instructions.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dennisbot/qa_at_migration. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the QaAtMigration project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dennisbot/qa_at_migration/blob/master/CODE_OF_CONDUCT.md).
