#!/bin/bash
# Copyright (c) 2019, WSO2 Inc. (http://wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -o errexit
set -o pipefail
set -o nounset

trap propagate_cleanup_properties EXIT

setup_deployment_env() {
    local parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
    local grand_parent_path=$(dirname ${parent_path})
    . ${grand_parent_path}/util/common_utils.sh
    . ${grand_parent_path}/util/deployment_utils.sh

    work_dir=$(pwd)
    declare -g -A infra_config
    read_property_file "${input_dir}/infrastructure.properties" infra_config

    readonly docker_user=${infra_config["dockerhub_ballerina_scenarios_username"]}
    readonly docker_password=${infra_config["dockerhub_ballerina_scenarios_password"]}

    # Create a custom random namespace
    custom_namespace=$(generate_random_namespace)
    kubectl create namespace ${custom_namespace}
    # Enforce the created namespace for future kubectl usages
    kubectl config set-context $(kubectl config current-context) --namespace=${custom_namespace}

    local ballerina_version=${infra_config["BallerinaVersion"]}
    # Install ballerina
    install_ballerina ${ballerina_version}

    echo "TestGroup=${infra_config["TestGroup"]}" >> ${output_dir}/deployment.properties
}

propagate_cleanup_properties() {
    # Store namespace to be cleaned up at the end
    echo "NamespacesToCleanup=${custom_namespace}" >> ${output_dir}/infrastructure-cleanup.properties
}

if setup_deployment_env; then
    echo "Deployment set up successful"
else
    exit 1
fi
