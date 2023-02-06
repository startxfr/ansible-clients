#!/bin/bash

# 
# startx gitlab library version 0.0.1-container
# 

# shellcheck source=/dev/null
source "$(pwd)"/.gitlab/ci/startx-library.sh

# local variables
source_dir=.
output_dir=.output
test_dir=~/.ansible


# Display the requirements checks
function DisplayCheckRequirementsAnsible {
    echo "======== CHECK REQUIREMENTS"
    DoCheckCheckRequirementsFileExist README.md
    DoCheckCheckRequirementsDirectoryExist docs
    DoCheckCheckRequirementsFileExist docs/index.md
    DoCheckCheckRequirementsFileExist .gitlab/ci/startx-library.sh
    DoCheckCheckRequirementsFileExist .gitlab/ci/startx-ansible-library.sh
    DoCheckCheckRequirementsFileExist galaxy.yml
    DoCheckCheckRequirementsDirectoryExist roles
    DoCheckCheckRequirementsDirectoryExist meta
    DoCheckCheckRequirementsFileExist meta/runtime.yml
    DoCheckCheckRequirementsFileExist plugins/README.md
    DoCheckCheckRequirementsDirectoryExist tests
    DoCheckCheckRequirementsFileExist tests/gitlab/test.yml
}


# read galaxy manifest
function galaxyManifestGetKey {
    if [[ "" != "$1" && -r ${source_dir}/galaxy.yml ]]; then
        # shellcheck disable=SC2002,SC2046,SC2005,SC2086,SC2181
        echo $(cat ${source_dir}/galaxy.yml | yq $1 - | tr -d \")
    else
        echo ""
    fi
}

# Display the markdown checks
function DisplayCheckMarkdownAnsible {
    echo "======== CHECK MARKDOWN SYNTAX"
    DoCheckMarkdown "*.md"
    DoCheckMarkdown "docs/*.md"
    DoCheckMarkdown "docs/*/*.md"
}

# Display the shellcheck checks
function DisplayCheckShellcheckAnsible {
    echo "======== CHECK SHELL SYNTAX"
    shellcheck .gitlab/ci/startx-ansible-library.sh
    shellcheck .gitlab/ci/startx-library.sh
}

# Display the yaml checks
function DisplayCheckYamlAnsible {
    local context
    context=${1:-local}
    echo "======== CHECK YAML SYNTAX"
    ansible-lint "${source_dir}"/tests/"${context}"/test.yml
}

# read galaxy collection namespace
function galaxyGetCollectionNamespace {
    galaxyManifestGetKey ".namespace"
}

# read galaxy collection name
function galaxyGetCollectionName {
    galaxyManifestGetKey ".name"
}

# read galaxy collection version
function galaxyGetCollectionVersion {
    galaxyManifestGetKey ".version"
}

# Build the collection
function ExecCollectionBuild {
    local context namespace collection version
    context=${1:-local}
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== BUILD THE ${namespace}-${collection}-${version} COLLECTION in ${context} context"
    ansible-galaxy collection build --force --output-path ${output_dir}
}

# Test the collection
function ExecCollectionTest {
    local context namespace collection version
    context=${1:-local}
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== TEST THE ${namespace}-${collection}-${version} COLLECTION in ${context} context"
    mkdir -p ${test_dir}
    cp -r tests/"${context}"/* ${test_dir}/
    ansible-galaxy collection install ${output_dir}/"${namespace}"-"${collection}"-"${version}".tar.gz -p ${test_dir}/collections
    cd ${test_dir} || exit
    export ANSIBLE_CONFIG=${test_dir}/ansible.cfg
    ansible-playbook test.yml
    # shellcheck disable=SC2181
    if [[ "$?" == "0" ]]; then
        echo "========= TEST SUCCEED"
    else
        echo "========= TEST FAILED"
    fi
    cd - || exit
    rm -rf ${test_dir}
    # shellcheck disable=SC2155
    export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
}

# Publish the collection
function ExecCollectionPrePublish {
    addGalaxyServerToConfig ansible.cfg "${ANSIBLE_GALAXY_TOKEN:-xxxxxxxx} release_galaxy https://galaxy.ansible.com"
}

# Publish the collection
function ExecCollectionPublish {
    local context namespace collection version
    context=${1:-local}
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== PUBLISH THE ${namespace}-${collection}-${version} COLLECTION in ${context} context"
    # Publish the collection
    ansible-galaxy collection publish "${output_dir}/${namespace}-${collection}-${version}.tar.gz" --api-key "$ANSIBLE_GALAXY_TOKEN"
}

# Clean the collection temparary resources
function ExecCollectionClean {
    local context namespace collection version
    context=${1:-local}
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== CLEAN THE ${namespace}-${collection}-${version} COLLECTION in ${context} context"
    rm -rf ${test_dir}
    rm -rf "${output_dir:?}/*"
}

# Add galaxy section to the ansible config file
function addGalaxyServerToConfig {
    local name url token
    file=${1:-ansible.cfg}
    name=${3:-release_galaxy}
    token=${2:-xxxxxxxxxxxxxxx}
    url=${4:-"https://galaxy.ansible.com"}
    echo "======== ADD GALAXY REPOSITORY ${name} into the ${file} file"
    # shellcheck disable=SC2129
    echo "" >> "${file}"
    echo "[galaxy]" >> "${file}"
    echo "server_list = " "${name}" >> "${file}"
    echo "" >> "${file}"
    echo "[galaxy_server.${name}]" >> "${file}"
    echo "url = " "${url}" >> "${file}"
    echo "token = " "${token}" >> "${file}"
}