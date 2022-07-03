module "rbac" {
  source = "./modules/rbac"

  gcp_project_id = ""
  teams_config = [
  {
    name       = "team-a",
    namespace  = "team-a",
    users      = ["xxx@gmail.com","yyy@gmail.com"]
    cpu        = "1000"
    memory     = "2Gi"
  },
  {
    name       = "team-b",
    namespace  = "team-b",
    users      = ["xxx@gmail.com"]
    cpu        = "100"
    memory     = "2Gi"
  },
  {
    name       = "team-c",
    namespace  = "team-c",
    users      = ["xxx@gmail.com"]
    cpu        = "10"
    memory     = "2Gi"
  },
  {
    name       = "team-d",
    namespace  = "team-d",
    users      = ["xxx@gmail.com"]
    cpu        = "10"
    memory     = "2Gi"
  },
  {
    name       = "team-e",
    namespace  = "team-e",
    users      = ["xxx@gmail.com"]
    cpu        = "100"
    memory     = "2Gi"
  }
  ]
}