
# Create a new rancher2 Project enabling and customizing monitoring
resource "rancher2_project" "project-local" {
  name = "project-local"
  cluster_id = data.rancher2_cluster.local.id
  enable_project_monitoring = true
  project_monitoring_input {
    answers = {
      "exporter-kubelets.https" = true
      "exporter-node.enabled" = true
      "exporter-node.ports.metrics.port" = 9796
      "exporter-node.resources.limits.cpu" = "200m"
      "exporter-node.resources.limits.memory" = "200Mi"
      "grafana.persistence.enabled" = false
      "grafana.persistence.size" = "10Gi"
      "grafana.persistence.storageClass" = "default"
      "operator.resources.limits.memory" = "500Mi"
      "prometheus.persistence.enabled" = "false"
      "prometheus.persistence.size" = "50Gi"
      "prometheus.persistence.storageClass" = "default"
      "prometheus.persistent.useReleaseName" = "true"
      "prometheus.resources.core.limits.cpu" = "1000m",
      "prometheus.resources.core.limits.memory" = "1500Mi"
      "prometheus.resources.core.requests.cpu" = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention" = "12h"
    }
  }
}

resource "rancher2_project" "project-wd1" {
  name = "project-wd1"
  cluster_id = data.rancher2_cluster.workload1.id
  enable_project_monitoring = true
  project_monitoring_input {
    answers = {
      "exporter-kubelets.https" = true
      "exporter-node.enabled" = true
      "exporter-node.ports.metrics.port" = 9796
      "exporter-node.resources.limits.cpu" = "200m"
      "exporter-node.resources.limits.memory" = "200Mi"
      "grafana.persistence.enabled" = false
      "grafana.persistence.size" = "10Gi"
      "grafana.persistence.storageClass" = "default"
      "operator.resources.limits.memory" = "500Mi"
      "prometheus.persistence.enabled" = "false"
      "prometheus.persistence.size" = "50Gi"
      "prometheus.persistence.storageClass" = "default"
      "prometheus.persistent.useReleaseName" = "true"
      "prometheus.resources.core.limits.cpu" = "1000m",
      "prometheus.resources.core.limits.memory" = "1500Mi"
      "prometheus.resources.core.requests.cpu" = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention" = "12h"
    }
  }
}

resource "rancher2_project" "project-wd2" {
  name = "project-wd2"
  cluster_id = data.rancher2_cluster.workload2.id
  enable_project_monitoring = true
  project_monitoring_input {
    answers = {
      "exporter-kubelets.https" = true
      "exporter-node.enabled" = true
      "exporter-node.ports.metrics.port" = 9796
      "exporter-node.resources.limits.cpu" = "200m"
      "exporter-node.resources.limits.memory" = "200Mi"
      "grafana.persistence.enabled" = false
      "grafana.persistence.size" = "10Gi"
      "grafana.persistence.storageClass" = "default"
      "operator.resources.limits.memory" = "500Mi"
      "prometheus.persistence.enabled" = "false"
      "prometheus.persistence.size" = "50Gi"
      "prometheus.persistence.storageClass" = "default"
      "prometheus.persistent.useReleaseName" = "true"
      "prometheus.resources.core.limits.cpu" = "1000m",
      "prometheus.resources.core.limits.memory" = "1500Mi"
      "prometheus.resources.core.requests.cpu" = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention" = "12h"
    }
  }
}

#----------------------------------------------------------------------------
# NAMESPACES
resource "rancher2_namespace" "namespace-local" {
  name = "namespace-local"
  project_id = rancher2_project.project-local.id
  description = "local user namespace"
}

resource "rancher2_namespace" "namespace-wd1" {
  name = "namespace-wd1"
  project_id = rancher2_project.project-wd1.id
  description = "namespace workload1"
}

resource "rancher2_namespace" "namespace-wd2" {
  name = "namespace-wd2"
  project_id = rancher2_project.project-wd2.id
  description = "namespace workload2"
}

#------------------------------------------------------------------------------------------------
# ROLE TEMPLATES
resource "rancher2_role_template" "project-contributor" {
  name = "project-contributor"
  context = "project"
  default_role = false
  description = "Project Contributor - (Create,Delete,Get,List,Patch,Watch) apps-operations"
  rules {
    api_groups = ["catalog.cattle.io"]
    resources = ["apps", "operations", "clusterrepos", "releases"]
    verbs = ["get", "list", "watch"]
  }
}

resource "rancher2_role_template" "cluster-user" {
  name = "cluster-user"
  context = "cluster"
  default_role = false
  description = "Project Contributor - (Create,Delete,Get,List,Patch,Watch) apps-operations"
  rules {
    api_groups = ["catalog.cattle.io"]
    resources = ["apps"]
    verbs = ["get"]
  }
}

#----------------------------------------------------------------------------------
# USER
resource "rancher2_user" "user-1" {
  name = "user-1"
  username = "user-1"
  password = "142857.Estevao"
  enabled = true
}

#------------------------------------------------------------------------------------------------------
# Role Template Bindings
# PROJECT LEVEL
#   > WORKLOAD1
resource "rancher2_project_role_template_binding" "project-binding-wd1" {
  name = "project-binding-wd1"
  project_id = rancher2_project.project-wd1.id
  role_template_id = rancher2_role_template.project-contributor.id
  user_id = rancher2_user.user-1.id
}
#   > WORKLOAD2
resource "rancher2_project_role_template_binding" "project-binding-wd2" {
  name = "project-binding-wd2"
  project_id = rancher2_project.project-wd2.id
  role_template_id = rancher2_role_template.project-contributor.id
  user_id = rancher2_user.user-1.id
}
# CLUSTER LEVEL
#   > WORKLOAD 1
resource "rancher2_cluster_role_template_binding" "role-cluster-binding-wd1" {
  name = "role-cluster-binding-wd1"
  cluster_id = data.rancher2_cluster.workload1.id
  role_template_id = rancher2_role_template.cluster-user.id
  user_id = rancher2_user.user-1.id
}
#   > WORKLOAD 2
resource "rancher2_cluster_role_template_binding" "role-cluster-binding-wd2" {
  name = "role-cluster-binding-wd2"
  cluster_id = data.rancher2_cluster.workload2.id
  role_template_id = rancher2_role_template.cluster-user.id
  user_id = rancher2_user.user-1.id
}