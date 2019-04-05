[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)
[![Build
Status](https://travis-ci.org/chussenot/gitlab-webhooks.svg?branch=master)](https://travis-ci.org/chussenot/gitlab-webhooks.cr)
[![Release](https://img.shields.io/github/tag/chussenot/gitlab-webhooks.svg)](https://github.com/chussenot/gitlab-webhooks/releases)

# gitlab-webhooks.cr

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  gitlab-webhooks:
    github: chussenot/gitlab-webhooks
    version: 0.3.2
```

2. Run `shards install`

## Usage

```crystal
require "gitlab-webhooks"
```

## References

* [How to add a GitLab project hook documentation](https://docs.gitlab.com/ee/api/projects.html#add-project-hook)
* [The Rake task to add a project hooks](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/tasks/gitlab/web_hook.rake#L2)
* [The Grape API endpoint implementation](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/api/project_hooks.rb)

## Contributing

1. Fork it (<https://github.com/chussenot/gitlab-webhooks.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Clement](https://github.com/chussenot) - creator and maintainer
