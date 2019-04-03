module Gitlab
  module Projects
    macro define_push_event(name)
      class {{name}} < Event
        property before : String
        property after : String
        property ref : String
        property checkout_sha : String?
        property message : String?
        property user_id : Int32
        property user_name : String
        property user_username : String
        property user_email : String
        property user_avatar : String
        property project_id : Int32
        property project : Project
        property commits : Array(Commit)
        property total_commits_count : Int32
        property repository : Repository
      end
    end

    define_push_event Push
    define_push_event TagPush

    class Issue < Event
      property user : User
      property project : Project
      property object_attributes : IssueObjectAttributes
      property labels : Array(JSON::Any?)
      property changes : IssueChanges
      property repository : Repository
      property assignees : Array(User)
    end

    class MergeRequest < Event
      property user : User
      property project : Project
      property object_attributes : MergeRequestObjectAttributes
      property labels : Array(Label)
      property changes : Changes
      property repository : Repository
      property assignee : User?
    end

    class Note < Event
      property user : User
      property project_id : Int32
      property project : Project
      property object_attributes : PurpleObjectAttributes
      property repository : Repository
      property issue : IssueObjectAttributes
    end

    class Pipeline < Event
      property object_attributes : PipelineObjectAttributes
      property user : User
      property project : Project
      property commit : Commit
      property builds : Array(BuildElement)
    end

    class Build < Event
      property ref : String
      property tag : Bool
      property before_sha : String
      property sha : String
      property build_id : Int32
      property build_name : String
      property build_stage : String
      property build_status : String
      property build_started_at : String?
      property build_finished_at : String?
      property build_duration : Float64?
      property build_allow_failure : Bool
      property project_id : Int64
      property project_name : String
      property user : User
      property commit : BuildCommit
      property repository : Repository
    end
  end
end
