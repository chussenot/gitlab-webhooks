[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)
[![Build
Status](https://travis-ci.org/chussenot/gitlab-webhooks.svg?branch=master)](https://travis-ci.org/chussenot/gitlab-webhooks.cr)
[![Release](https://img.shields.io/github/tag/chussenot/gitlab-webhooks.svg)](https://github.com/chussenot/gitlab-webhooks/releases)
[![Licence](https://img.shields.io/github/license/chussenot/gitlab-webhooks.svg)](https://github.com/chussenot/gitlab-webhooks/blob/master/LICENSE)

# gitlab-webhooks.cr

GitLab can trigger events with well configured [webhooks](https://docs.gitlab.com/ee/user/project/integrations/webhooks.html).
When that event occurs, the source app makes an HTTP request to the URI
configured for the webhook, you can use the Crystal HTTP class to manage that.
The action taken may be anything... Common uses are to trigger builds
with continuous integration systems or to notify deployments.

Docs Generated in latest commit.

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  gitlab-webhooks:
    github: chussenot/gitlab-webhooks
    version: 0.3.3
```

2. Run `shards install`

## Usage

You just have to require the lib.

```crystal
require "gitlab-webhooks"
```

The Crystal is new ... Crystal has downsides just like every other languages.
To relay the catched Gitlab events on hundreds of Ruby, Python libraries made
by thousands of open source contributors over the last decade or monitoring
systems like Prometheus. You can contribute and add your example in the
`examples` folder.

### HTTP requests

This Crystal example show you how to implement where all endpoints can catch
some events, parse them and print the values of some attributes.

```
require "json"
require "http/server"
require "gitlab-webhooks"

server = HTTP::Server.new do |context|
  if body = context.request.body
    event : Gitlab::Event = Gitlab.event_from(JSON.parse(body).to_json.to_s)
    puts event.commit.message
    context.response.content_type = "text/plain"
    context.response.print "Hello world!"
  else
    context.response.print "You didn't POST any data :("
  end
end

server.bind_tcp 8080
puts "Listening on http://0.0.0.0:8080"
server.listen
```

Then you can curl the server with a sample file

`
curl -X POST --data @data.json http://localhost:8080/
`

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
