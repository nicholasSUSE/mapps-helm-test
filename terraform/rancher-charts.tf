
#------------------------
# RANCHER CHARTS
# resource "rancher2_app_v2" "rancher-cis-benchmark-local" {
#   cluster_id = data.rancher2_cluster.local.id
#   name = "rancher-cis-benchmark"
#   namespace = "cis-operator-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-cis-benchmark"
# }

# resource "rancher2_app_v2" "rancher-cis-benchmark-downstream" {
#   cluster_id = data.rancher2_cluster.downstream.id
#   name = "rancher-cis-benchmark"
#   namespace = "cis-operator-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-cis-benchmark"
# }

# resource "rancher2_app_v2" "rancher-logging-local" {
#   cluster_id = data.rancher2_cluster.local.id
#   name = "rancher-logging"
#   namespace = "cattle-logging-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-logging"
# }

# resource "rancher2_app_v2" "rancher-logging-downstream" {
#   cluster_id = data.rancher2_cluster.downstream.id
#   name = "rancher-logging"
#   namespace = "cattle-logging-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-logging"
# }

# resource "rancher2_app_v2" "longhorn-local" {
#   cluster_id = data.rancher2_cluster.local.id
#   name = "rancher-longhorn"
#   namespace = "longhorn-system"
#   repo_name = "rancher-charts"
#   chart_name = "longhorn"
# }

# resource "rancher2_app_v2" "longhorn-downstream" {
#   cluster_id = data.rancher2_cluster.downstream.id
#   name = "rancher-longhorn"
#   namespace = "longhorn-system"
#   repo_name = "rancher-charts"
#   chart_name = "longhorn"
# }

# resource "rancher2_app_v2" "rancher-gatekeeper-local" {
#   cluster_id = data.rancher2_cluster.local.id
#   name = "rancher-gatekeeper"
#   namespace = "cattle-gatekeeper-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-gatekeeper"
# }

# resource "rancher2_app_v2" "rancher-gatekeeper-downstream" {
#   cluster_id = data.rancher2_cluster.downstream.id
#   name = "rancher-gatekeeper"
#   namespace = "cattle-gatekeeper-system"
#   repo_name = "rancher-charts"
#   chart_name = "rancher-gatekeeper"
# }


# Create a new Rancher2 App V2 using
# resource "rancher2_app_v2" "t1" {
#   cluster_id = data.rancher2_cluster.downstream.id
#   name = "t1"
#   namespace = "default"
#   repo_name = "test-repo"
#   chart_name = "ch1"
#   chart_version = "1.0.0"
# }

    # "ch30", "ch31", "ch32", "ch33", "ch34", "ch35", "ch36", "ch37", "ch38", "ch39"]
    # "ch40", "ch41", "ch42", "ch43", "ch44", "ch45", "ch46", "ch47", "ch48", "ch49",
    # "ch50", "ch51", "ch52", "ch53", "ch54", "ch55", "ch56", "ch57", "ch58", "ch59"]
    # "ch20", "ch21", "ch22", "ch23", "ch24", "ch25", "ch26", "ch27", "ch28", "ch29"