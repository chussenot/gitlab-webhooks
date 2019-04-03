require "json"
require "inflector/core_ext"

# Example code that deserializes and serializes the Gitlab Hooks:
# https://crystal-lang.org/api/0.26.1/JSON/Serializable.html
# https://gitlab.com/gitlab-org/gitlab-ce/blob/master/app/helpers/hooks_helper.rb
# List of the system hooks
# https://docs.gitlab.com/ee/system_hooks/system_hooks.html
# https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/api/system_hooks.md
# List of project project hooks
# https://docs.gitlab.com/ee/api/projects.html#list-project-hooks

module Gitlab
  Events = {} of String => Gitlab::Event.class

  @[JSON::Serializable::Options(emit_nulls: true)]
  abstract class Event
    include JSON::Serializable
    property event_name : String?
    property object_kind : String?
    property event_type : String?

    macro timestamps
      # https://github.com/crystal-lang/crystal/blob/master/src/json/from_json.cr#L233
      property created_at : Time
      property updated_at : Time
    end

    # Save a reference of all subclasses
    macro inherited
      key = Inflector.underscore("{{@type.name}}".split("::").last.to_s)
      Events[key] = {{@type}}
    end
  end

  # Factory method to build events from JSON payloads
  def self.event_from(json : String) : Event
    payload = JSON.parse(json)
    event_name = payload["event_name"]? || payload["event_type"]? || payload["object_kind"]
    Events[event_name].from_json(json)
  end
end

require "./common"
require "./system"
require "./project"
