{{/*
Test name
*/}}
{{- define "ch.connection-test" -}}
name: "{{ .Chart.Name }}-connection-test-v.{{ .Chart.Version }}"
{{- end }}

{{/*
Deployment name
*/}}
{{- define "ch.deployment" -}}
name: "{{ .Chart.Name }}-deployment-v.{{ .Chart.Version }}"
{{- end }}

{{/*
ConfigMap name
*/}}
{{- define "ch.configmap" -}}
name: "{{ .Chart.Name }}-configmap-v.{{ .Chart.Version }}"
{{- end }}

{{/*
NGINX name
*/}}
{{- define "ch.nginx" -}}
name: "{{ .Chart.Name }}-nginx-v.{{ .Chart.Version }}"
{{- end }}

{{/*
Ingress name
*/}}
{{- define "ch.ingress" -}}
name: "{{ .Chart.Name }}-ingress-v.{{ .Chart.Version }}"
{{- end }}

{{/*
Service name
*/}}
{{- define "ch.service" -}}
name: "{{ .Chart.Name }}-service"
{{- end }}


{{/*
Common labels
*/}}
{{- define "ch.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{ include "ch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ch.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
