module Gitlab
  module System
    macro define_group_event(name)
      class {{name}} < Event
        timestamps
        property name : String
        property path : String
        property full_path : String
        property group_id : Int32
        property owner_name : String?
        property owner_email : String?
        property old_path : String?
        property old_full_path : String?
      end
    end

    macro define_key_event(name)
      class {{name}} < Event
        timestamps
        property key : String
        property id : Int32
        property username : String
      end
    end

    macro define_project_event(name)
      class {{name}} < Event
        timestamps
        property name : String
        property path : String
        property path_with_namespace : String
        property project_id : Int32
        property owner_name : String
        property owner_email : String
        property project_visibility : String
        property old_path_with_namespace : String?
      end
    end

    macro define_user_group_event(name)
      class {{name}} < Event
        timestamps
        property group_name : String
        property group_path : String
        property group_plan : String?
        property group_id : Int32
        property user_username : String
        property user_name : String
        property user_email : String
        property user_id : Int32
        property group_access : String
      end
    end

    macro define_user_team_event(name)
      class {{name}} < Event
        timestamps
        property access_level : String?
        property project_id : Int32
        property project_access : String?
        property project_name : String
        property project_path : String
        property project_path_with_namespace : String
        property user_email : String
        property user_name : String
        property user_username : String
        property user_id : Int32
        property project_visibility : String
      end
    end

    macro define_user_event(name)
      class {{name}} < Event
        timestamps
        property email : String
        property name : String
        property username : String
        property user_id : Int32
      end
    end

    define_project_event ProjectUpdate
    define_project_event ProjectDestroy
    define_project_event ProjectTransfer
    define_project_event ProjectCreate
    define_user_event UserDestroy
    define_user_event UserCreate
    define_user_group_event UserRemoveFromGroup
    define_user_group_event UserAddToGroup
    define_user_team_event UserAddToTeam
    define_user_team_event UserRemoveFromTeam
    define_group_event GroupRename
    define_group_event GroupDestroy
    define_group_event GroupCreate
    define_key_event KeyCreate
    define_key_event KeyDestroy

    class UserRename < UserCreate
      property old_username : String
    end

    # `user_failed_login` is sent whenever
    # a blocked user attempts to login and denied access.
    class UserFailedLogin < UserCreate
      property state : String
    end

    class RepositoryUpdate < Event
      property user_id : Int32
      property user_name : String
      property user_email : String
      property user_avatar : String
      property project_id : Int32
      property project : Project
      property changes : Array(Change)
      property refs : Array(String)
    end
  end
end
