[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)
[![Build
Status](https://travis-ci.org/chussenot/gitlab-webhooks.cr.svg?branch=master)](https://travis-ci.org/chussenot/gitlab-webhooks.cr)

# gitlab-webhooks.cr

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     gitlab-webhooks.cr:
       github: chussenot/gitlab-webhooks.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "gitlab-webhooks.cr"
```

## References

* [How to add a project hook?](https://docs.gitlab.com/ee/api/projects.html#add-project-hook)
* [Rake task to add a project hook](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/tasks/gitlab/web_hook.rake#L2)
* [API endpoint](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/api/project_hooks.rb)

## Contributing

1. Fork it (<https://github.com/chussenot/gitlab-webhooks.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Clement](https://github.com/chussenot) - creator and maintainer
