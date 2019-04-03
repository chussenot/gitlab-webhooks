module Gitlab
  class User
    include JSON::Serializable
    property name : String
    property id : Int32?
    property username : String?
    property avatar_url : String?
    property email : String?
  end

  class Changes
    include JSON::Serializable
    property assignee : UserChange?
    property total_time_spent : IntChange?
    property labels : LabelsChange?
    property updated_at : StringChange?
    property updated_by_id : IntChange?
    property state : StringChange?
    property head_pipeline_id : IntChange?
    property description : StringChange?
    property last_edited_at : StringChange?
    property last_edited_by_id : IntChange?
  end

  class IssueChanges
    include JSON::Serializable
    property assignees : UsersChange
    property total_time_spent : IntChange
  end

  class Change
    include JSON::Serializable
    property before : String
    property after : String
    property ref : String
  end

  class UserChange
    include JSON::Serializable
    property previous : User?
    property current : User?
  end

  class UsersChange
    include JSON::Serializable
    property previous : Array(User?)
    property current : Array(User?)
  end

  class LabelsChange
    include JSON::Serializable
    property previous : Array(Label)?
    property current : Array(Label)?
  end

  class IntChange
    include JSON::Serializable
    property previous : Int32?
    property current : Int32?
  end

  class StringChange
    include JSON::Serializable
    property previous : String?
    property current : String?
  end

  class Label
    include JSON::Serializable
    property id : Int32
    property title : String
    property color : String
    property project_id : Int32?
    property created_at : String
    property updated_at : String
    property template : Bool
    property description : String?
    @[JSON::Field(key: "type")]
    property label_type : String
    property group_id : Int32?
  end

  class MergeParams
    include JSON::Serializable
    property force_remove_source_branch : String?
    property should_remove_source_branch : Bool?
    property commit_message : String?
    property squash : Bool?
  end

  class Project
    include JSON::Serializable
    property id : Int32
    property name : String
    property description : String?
    property web_url : String
    property avatar_url : String?
    property git_ssh_url : String
    property git_http_url : String
    property namespace : String
    property visibility_level : Int32
    property path_with_namespace : String
    property default_branch : String
    property ci_config_path : String?
    property homepage : String?
    property url : String?
    property ssh_url : String?
    property http_url : String?
  end

  class Repository
    include JSON::Serializable
    property name : String
    property url : String
    property description : String?
    property homepage : String
    property git_http_url : String?
    property git_ssh_url : String?
    property visibility_level : Int8?
  end

  class Commit
    include JSON::Serializable
    property id : String
    property message : String
    property timestamp : String
    property url : String
    property author : User
    property added : Array(String)?
    property modified : Array(String)?
    property removed : Array(String)?
  end

  class BuildCommit
    include JSON::Serializable
    property id : Int32
    property sha : String
    property message : String
    property author_name : String
    property author_email : String
    property author_url : String
    property status : String
    property duration : Int32?
    property started_at : String?
    property finished_at : String?
  end

  class BuildElement
    include JSON::Serializable
    property id : Int32
    property stage : String
    property name : String
    property status : String
    property created_at : String
    property started_at : String?
    property finished_at : String?
    @[JSON::Field(key: "when")]
    property build_when : String
    property manual : Bool
    property user : User
    property runner : Runner?
    property artifacts_file : ArtifactsFile
  end

  class ArtifactsFile
    include JSON::Serializable
    property filename : String?
    property size : Int32
  end

  class Runner
    include JSON::Serializable
    property id : Int32
    property description : String
    property active : Bool
    property is_shared : Bool
  end

  class PipelineObjectAttributes
    include JSON::Serializable
    property id : Int32
    property ref : String
    property tag : Bool
    property sha : String
    property before_sha : String
    property status : String
    property detailed_status : String
    property stages : Array(String)
    property created_at : String
    property finished_at : String?
    property duration : Int32?
  end

  class PurpleObjectAttributes
    include JSON::Serializable
    property id : Int32
    property note : String
    property noteable_type : String
    property author_id : Int32
    property created_at : String
    property updated_at : String
    property project_id : Int32
    property attachment : String?
    property line_code : String?
    property commit_id : String?
    property noteable_id : Int32
    property system : Bool
    property st_diff : String?
    property updated_by_id : String?
    @[JSON::Field(key: "type")]
    property object_attributes_type : String?
    property position : String?
    property original_position : String?
    property resolved_at : String?
    property resolved_by_id : String?
    property discussion_id : String
    property change_position : String?
    property resolved_by_push : String?
    property url : String
  end

  class MergeRequestObjectAttributes
    include JSON::Serializable
    property assignee_id : Int32?
    property author_id : Int32?
    property created_at : String
    property description : String
    property head_pipeline_id : Int32?
    property id : Int32
    property iid : Int32
    property last_edited_at : String?
    property last_edited_by_id : Int32?
    property merge_commit_sha : String?
    property merge_error : String?
    property merge_params : MergeParams
    property merge_status : String
    property merge_user_id : Int32?
    property merge_when_pipeline_succeeds : Bool
    property milestone_id : Int32?
    property source_branch : String
    property source_project_id : Int32
    property state : String
    property target_branch : String
    property target_project_id : Int32
    property time_estimate : Int32
    property title : String
    property updated_at : String
    property updated_by_id : Int32?
    property url : String
    property source : Project
    property target : Project
    property last_commit : Commit
    property work_in_progress : Bool
    property total_time_spent : Int32
    property human_total_time_spent : String?
    property human_time_estimate : String?
    property action : String
    property oldrev : String?
  end

  class IssueObjectAttributes
    include JSON::Serializable
    property author_id : Int32
    property closed_at : String?
    property confidential : Bool
    property created_at : String
    property description : String
    property due_date : String?
    property id : Int32
    property iid : Int32
    property last_edited_at : String?
    property last_edited_by_id : String?
    property milestone_id : String?
    property moved_to_id : String?
    property project_id : Int32
    property relative_position : Int32
    property state : String
    property time_estimate : Int32
    property title : String
    property updated_at : String
    property updated_by_id : Int32?
    property url : String
    property total_time_spent : Int32
    property human_total_time_spent : String?
    property human_time_estimate : String?
    property assignee_ids : Array(Int32)
    property assignee_id : Int32
    property action : String?
  end
end
