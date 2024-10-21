{{/*
Expand the name of the chart.
*/}}
{{- define "myApp.name" -}}
{{- if .Values.myApp }}
{{- default .Values.myApp.nameOverride .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "myApp.fullname" -}}
{{- if .Values.myApp }}
  {{- if .Values.myApp.fullnameOverride }}
    {{- .Values.myApp.fullnameOverride | lower | trunc 63 | trimSuffix "-" }}
  {{- else }}
    {{- $name := include "myApp.name" . | lower }}
    {{- if hasSuffix .Release.Name $name }}
      {{- .Release.Name | lower | trunc 63 | trimSuffix "-" }}
    {{- else }}
      {{- printf "%s-%s" .Release.Name $name | lower | trunc 63 | trimSuffix "-" }}
    {{- end }}
  {{- end }}
{{- else }}
  {{- .Release.Name | lower | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "myApp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "myApp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "myApp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "myApp.labels" -}}
helm.sh/chart: {{ include "myApp.chart" . }}
{{ include "myApp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | lower | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | lower }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "myApp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myApp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

