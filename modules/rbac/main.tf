# Terraform configuration

resource "google_project_iam_custom_role" "iam-role" {
  project = var.gcp_project_id
  role_id     = "leastpriv"
  title       = "cluster least privelege"
  description = "Minimal set of permissions on GCP IAM to connect to cluster"
  permissions = ["container.apiServices.get","container.apiServices.list","container.clusters.get","container.clusters.getCredentials"]
}

resource "google_project_iam_binding" "iam-binding" {
  project = var.gcp_project_id
  role    = google_project_iam_custom_role.iam-role.id

  members = formatlist("user:%s", flatten([ for x in var.teams_config: x.users ]))
}

resource "kubernetes_namespace" "namespace" {
  for_each = { for x in var.teams_config: x.name => x }
  metadata {
    name = each.value.namespace
  }
}

resource "kubernetes_role" "role" {
  for_each = { for x in var.teams_config: x.name => x }
  metadata {
    name = each.value.name
    }

  rule {
    api_groups     = ["*"]
    resources      = ["*"]
    verbs          = ["*"]
  }
}

resource "kubernetes_role_binding" "role-binding" {
  for_each = { for x in var.teams_config: x.name => x }
  metadata {
    name      = each.value.name
    namespace = each.value.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = each.value.name
  }
  dynamic "subject" {
    for_each = each.value.users
    content {
      kind      = "User"
      name      = subject.value
      api_group = "rbac.authorization.k8s.io"
    }
  }

  depends_on = [
    kubernetes_role.role
  ]
}

resource "kubernetes_resource_quota" "quota" {
  for_each = { for x in var.teams_config: x.name => x }
  metadata {
    name = each.value.name
  }
  spec {
    hard = {
      cpu = each.value.cpu
      memory = each.value.memory
    }
    scope_selector {
      match_expression {
        scope_name = "PriorityClass"
        operator   = "In"
        values     = ["low"]
      }
    }
  }
}