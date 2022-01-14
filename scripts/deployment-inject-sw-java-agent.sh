#!/usr/bin/env bash
#
# https://kubernetes.io/zh/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/
# COMMAND ENTRYPOINT command args
# 未指定commadn和args,使用image默认值
# 提供command未提供args,仅使用command
# 仅提供args,使用ENTRYPOINT且覆盖COMMAND
# 提供command和args,覆盖ENTRYPOINT和COMMAND
#
set -o errexit
set -o nounset
set -o pipefail

# 应用所在命名空间
NAMESPACE=yangj
# 应用Deployment名称
DEPLOYMENT_NAME="java-app"
# 应用镜像名称
DEPLOYMENT_IMAGE="java-app:latest"
# 镜像jar路径
IMAGE_JAR_PATH="/java-app.jar"

# 应用名称,如果不指定,使用deployment名称
SW_AGENT_NAME="agent-name"

# SkyWalking oap service grpc 服务地址
SW_AGENT_COLLECTOR_BACKEND_SERVICES=""

readonly JAVA_OPTIONS="-javaagent:/skywalking/agent/skywalking-agent.jar"

#kubectl patch deployment ${DEPLOYMENT_NAME} -n ${NAMESPACE} --patch 
echo "$(cat <<EOF
spec:
  template:
    spec:
      volumes:
      - name: skywalking-agent
        emptyDir: {}
      initContainers:
      - name: agent-container
        image: apache/skywalking-java-agent:8.8.0-alpine
        volumeMounts:
          - name: skywalking-agent
            mountPath: /agent
        command: [ "/bin/sh" ]
        args: ["-c", "cp -R /skywalking/agent /agent/"]
      containers:
      - name: ${DEPLOYMENT_NAME}
        image: ${DEPLOYMENT_IMAGE}
        command: [ "/bin/sh" ]
        args: ["-c", "exec java -jar ${JAVA_OPTIONS} -jar ${IMAGE_JAR_PATH}"]
        volumeMounts:
        - name: skywalking-agent
          mountPath: /skywalking
        env:
        - name: SW_AGENT_NAME
          value: ${SW_AGENT_NAME:- ${AGENT_NAME}}
        - name: SW_AGENT_COLLECTOR_BACKEND_SERVICES
          value: ${SW_AGENT_COLLECTOR_BACKEND_SERVICES:- skywalking-oap.skywalking:11800}
        - name: SW_AGENT_INSTANCE_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name   
EOF
)"
