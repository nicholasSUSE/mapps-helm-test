terraform {
    required_providers {
      rancher2 = {
        source = "rancher/rancher2"
        version = "~> 1.10.6"
      }
    }
}
# wIUuGvz0YLFv8HzF
provider "rancher2" {
    api_url = "https://localhost:8443/v3"
    access_key =  "token-9hmc4"
    secret_key =  "k256l97l2bz6z5wk4w69s2skb5tqkx4bz24kcc486j9jmkjhl6brmz"
    insecure = true
}

data "rancher2_cluster" "local" {
  name = "local"
}

data "rancher2_cluster" "workload1" {
    name = "workload1"
}

data "rancher2_cluster" "workload2" {
    name = "workload2"
}

# Helm Repos
resource "rancher2_catalog_v2" "mapps-helm-git-local" {
  depends_on = [ data.rancher2_cluster.local ]
  cluster_id = data.rancher2_cluster.local.id
  name = "test-repo"
  git_repo = "https://github.com/nicholasSUSE/mapps-helm-test"
  git_branch = "master"
}

resource "rancher2_catalog_v2" "mapps-helm-git-workload1" {
  depends_on = [ data.rancher2_cluster.workload1, rancher2_catalog_v2.mapps-helm-git-local ]
  cluster_id = data.rancher2_cluster.workload1.id
  name = "test-repo"
  git_repo = "https://github.com/nicholasSUSE/mapps-helm-test"
  git_branch = "master"
}

resource "rancher2_catalog_v2" "mapps-helm-git-workload2" {
  depends_on = [ data.rancher2_cluster.workload2, rancher2_catalog_v2.mapps-helm-git-workload1 ]
  cluster_id = data.rancher2_cluster.workload2.id
  name = "test-repo"
  git_repo = "https://github.com/nicholasSUSE/mapps-helm-test"
  git_branch = "master"
}

variable "charts-default" {
  description = "List of chart names"
  type        = list(string)
  default     = [
    "ch1", "ch2", "ch3", "ch4", "ch5", "ch6", "ch7", "ch8", "ch9"]
}

variable "charts-project" {
  description = "List of chart names"
  type        = list(string)
  default     = ["ch10", "ch11", "ch12", "ch13", "ch14", "ch15", "ch16", "ch17", "ch18", "ch19",
      "ch20", "ch21", "ch22", "ch23", "ch24", "ch25", "ch26", "ch27", "ch28", "ch29",
      "ch30", "ch31", "ch32", "ch33", "ch34", "ch35", "ch36", "ch37", "ch38", "ch39"]
}
#-----------------------------------------------------------------------------------------------------------
resource "rancher2_app_v2" "installed-apps-local-default" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-local ]

  for_each = toset(var.charts-default)

  cluster_id = data.rancher2_cluster.local.id
  name       = "test-chart-${each.key}"
  namespace  = "default"
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}

resource "rancher2_app_v2" "installed-apps-local-project" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-local ]

  for_each = toset(var.charts-project)

  cluster_id = data.rancher2_cluster.local.id
  name       = "test-chart-${each.key}"
  namespace  = rancher2_namespace.namespace-local.name
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}
#-----------------------------------------------------------------------------------------------------------
resource "rancher2_app_v2" "installed-apps-workload1-default" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-workload1 ]

  for_each = toset(var.charts-default)

  cluster_id = data.rancher2_cluster.workload1.id
  name       = "test-chart-${each.key}"
  namespace  = "default"
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}

resource "rancher2_app_v2" "installed-apps-workload1-project" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-workload1 ]

  for_each = toset(var.charts-project)

  cluster_id = data.rancher2_cluster.workload1.id
  name       = "test-chart-${each.key}"
  namespace  = rancher2_namespace.namespace-wd1.name
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}

#-----------------------------------------------------------------------------------------------------------
resource "rancher2_app_v2" "installed-apps-workload2-default" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-workload2 ]

  for_each = toset(var.charts-default)

  cluster_id = data.rancher2_cluster.workload2.id
  name       = "test-chart-${each.key}"
  namespace  = "default"
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}

resource "rancher2_app_v2" "installed-apps-workload2-project" {
  depends_on = [ rancher2_catalog_v2.mapps-helm-git-workload2 ]

  for_each = toset(var.charts-project)

  cluster_id = data.rancher2_cluster.workload2.id
  name       = "test-chart-${each.key}"
  namespace  = rancher2_namespace.namespace-wd2.name
  repo_name  = "test-repo"
  chart_name = each.key
  chart_version = "1.0.0"
  # wait = true

  timeouts {
    create = "15m"
  }
}