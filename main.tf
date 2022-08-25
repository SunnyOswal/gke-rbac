module "rbac" {
  source = "./modules/rbac"

  gcp_project_id = ""
  teams_config = [
  {
    name       = "team-a",
    namespace  = "team-a",
    users_admin      = ["xxx@gmail.com","yyy@gmail.com"]
    users_developer  = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "1000"
    memory     = "2Gi"
  },
  {
    name       = "team-b",
    namespace  = "team-b",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "100"
    memory     = "2Gi"
  },
  {
    name       = "team-c",
    namespace  = "team-c",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "10"
    memory     = "2Gi"
  },
  {
    name       = "team-d",
    namespace  = "team-d",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "10"
    memory     = "2Gi"
  },
  {
    name       = "team-e",
    namespace  = "team-e",
    users_admin      = ["xxx@gmail.com"]
    users_developer  = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "100"
    memory     = "2Gi"
  }
  ]
}