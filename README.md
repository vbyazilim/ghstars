[![Gem Version](https://badge.fury.io/rb/ghstars.svg)](https://badge.fury.io/rb/ghstars)

# Ghstars

This little command-line tool helps you to shows your **public** GitHub
repositories stars count.

## Installation

```bash
$ gem install ghstars
```

or;

```bash
$ gem install ghstars --version "0.1.2" --source "https://rubygems.pkg.github.com/vbyazilim"
```

## Usage

You need to create a [GitHub token](https://github.com/settings/tokens/new) or 
use existing token of yours. Set your environment variable as: `GITHUB_TOKEN`:

```bash
export GITHUB_TOKEN=your-token-here
```

Then,

```bash
$ ghstars

Commands:
  ghstars help [COMMAND]  # Describe available commands or one specific command
  ghstars list [AMOUNT]   # List your public repositories total star count in detail
  ghstars show            # Shows your public repositories total star count
  ghstars version         # Version information

Options:
  [--verbose], [--no-verbose]  
```

If you need only the sum of stars, run: `ghstars show`. Use `ghstars list` for
detailed information. Other examples:

```bash
$ ghstars list                  # all of your repos
$ ghstars list 5                # top 5
$ ghstars show                  # just sum of stars
$ ghstars show --verbose
$ ghstars list --verbose
$ ghstars list 5 --verbose
```

Example output for **vigo** user: `ghstars list 10`

    +----+-----------------------------------------+------+
    | #  | Name of Repository                      | Star |
    +----+-----------------------------------------+------+
    | 1  | vigo/git-puf-noktalari                  |  244 |
    | 2  | vigo/kommit                             |  198 |
    | 3  | vigo/ruby101-kitap                      |  170 |
    | 4  | vigo/dinozorus                          |   88 |
    | 5  | vigo/turk-scene-tarihi                  |   78 |
    | 6  | vigo/lyk-2017                           |   40 |
    | 7  | vigo/django2-project-template           |   32 |
    | 8  | vigo/textmate-twitterbootstrap.tmbundle |   31 |
    | 9  | vigo/textmate-octopress.tmbundle        |   30 |
    | 10 | vigo/gh-issues                          |   18 |
    +----+-----------------------------------------+------+
    |    | Total count of selection                |  929 |
    +----+-----------------------------------------+------+

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `bundle exec rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/vbyazilim/ghstars. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ghstars project’s codebases, issue trackers, chat
rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/vigo/ghstars/blob/master/CODE_OF_CONDUCT.md).
