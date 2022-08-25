# Input variable definitions

variable "gcp_project_id" {
  type = string
}

variable "teams_config" {
  description = "teams configurations"
  type = list(object({
      name        = string
      namespace   = string
      users_admin       = list(string)
      users_developer   = list(string)
      cpu         = string
      memory      = string
    }))
  default     = [
  {
    name       = "team-a",
    namespace  = "team-a",
    users_admin      = ["xxx@gmail.com","xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","xxx@gmail.com"]
    cpu        = "1000"
    memory     = "200Gi"
  },
  {
    name       = "team-b",
    namespace  = "team-b",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","xxx@gmail.com"]
    cpu        = "100"
    memory     = "20Gi"
  },
  {
    name       = "team-c",
    namespace  = "team-c",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","xxx@gmail.com"]
    cpu        = "10"
    memory     = "200Gi"
  },
  {
    name       = "team-d",
    namespace  = "team-d",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","xxx@gmail.com"]
    cpu        = "10"
    memory     = "20Gi"
  },
  {
    name       = "team-e",
    namespace  = "team-e",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","xxx@gmail.com"]
    cpu        = "100"
    memory     = "200Gi"
  }
  ]
}