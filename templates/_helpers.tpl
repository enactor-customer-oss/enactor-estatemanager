{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "estatemanager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "estatemanager.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "estatemanager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "estatemanager.labels" -}}
helm.sh/chart: {{ include "estatemanager.chart" . }}
{{ include "estatemanager.selectorLabels" . }}
{{- if .Values.enactorVersion }}
#app.kubernetes.io/version: {{ .Values.enactorVersion | quote }}
{{- else if .Chart.AppVersion }}
#app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "estatemanager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "estatemanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "estatemanager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "estatemanager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create unified labels for enactor components
*/}}
{{- define "common.matchLabels" -}}
app.kubernetes.io/name: {{ include "estatemanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Values.enactorVersion }}
#app.kubernetes.io/version: {{ .Values.enactorVersion | quote }}
{{- else if .Chart.AppVersion }}
#app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}

{{- define "common.metaLabels" -}}
helm.sh/chart: {{ include "estatemanager.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
#app.kubernetes.io/part-of: "enactor-em"
{{- end -}}

###### EMA
{{- define "ema.labels" -}}
{{ include "ema.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "ema.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.ema.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### EMR
{{- define "emr.labels" -}}
{{ include "emr.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "emr.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.emr.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}


###### EMP
{{- define "emp.labels" -}}
{{ include "emp.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "emp.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.emp.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### EMS
{{- define "ems.labels" -}}
{{ include "ems.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "ems.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.ems.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### EMC
{{- define "emc.labels" -}}
{{ include "emc.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "emc.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.emc.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### TMS
{{- define "tms.labels" -}}
{{ include "tms.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "tms.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.tms.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### AIS
{{- define "ais.labels" -}}
{{ include "ais.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "ais.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.ais.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### ConfigBackup
{{- define "configbackup.labels" -}}
{{ include "configbackup.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "configbackup.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.configbackup.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### TransactionArchive
{{- define "transactionArchive.labels" -}}
{{ include "transactionArchive.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "transactionArchive.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.transactionArchive.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}

###### mariadb
{{- define "mariadb.labels" -}}
{{ include "mariadb.matchLabels" . }}
{{ include "common.metaLabels" . }}
{{- end -}}

{{- define "mariadb.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.mariadb.name }}
environment: {{ .Values.env }}
{{ include "common.matchLabels" . }}
{{- end -}}