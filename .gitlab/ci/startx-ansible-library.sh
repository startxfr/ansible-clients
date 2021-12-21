#!/bin/bash

# 
# startx gitlab library version 0.0.1-container
# 

# shellcheck source=/dev/null
source startx-library.sh
# local variables
source_dir=.
output_dir=.output
test_dir=/tmp/test-ansible-collection


# Display the requirements checks
function DisplayCheckRequirementsAnsible {
    echo "======== CHECK REQUIREMENTS"
    DoCheckCheckRequirementsFileExist LICENSE
    DoCheckCheckRequirementsFileExist README.md
    DoCheckCheckRequirementsDirectoryExist docs
    DoCheckCheckRequirementsFileExist docs/index.md
    DoCheckCheckRequirementsFileExecutable podman-helper.sh
    DoCheckCheckRequirementsFileExecutable okd-helper.sh
    DoCheckCheckRequirementsFileExist .gitlab/ci/startx-ansible-library.sh
}


# read galaxy manifest
function galaxyManifestGetKey {
    if [[ "" != "$1" && -r ${source_dir}/galaxy.yml ]]; then
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
    shellcheck podman-helper.sh
    shellcheck okd-helper.sh
    shellcheck .gitlab/ci/startx-ansible-library.sh
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

# Build the client collection
function ExecCollectionBuild {
    local namespace collection version
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== BUILD THE " "${namespace}"-"${collection}"-"${version}" "COLLECTION"
    ansible-galaxy collection build --output-path ${output_dir}
}

# Test the client collection
function ExecCollectionTest {
    local namespace collection version
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== TEST THE " "${namespace}"-"${collection}"-"${version}" "COLLECTION"
    mkdir -p ${test_dir}
    cp -r tests/* ${test_dir}/
    ansible-galaxy collection install ${output_dir}/"${namespace}"-"${collection}"-"${version}".tar.gz -p ${test_dir}/collections
    cd ${test_dir} || exit
    export ANSIBLE_CONFIG=${test_dir}/ansible.cfg
    ansible-playbook test.yml
    if [[ "$?" == "0" ]]; then
        echo "========= TEST SUCCEED"
    else
        echo "========= TEST FAILED"
    fi
    cd - || exit
    rm -rf ${test_dir}
    export ANSIBLE_CONFIG=$(pwd)/ansible.cfg
}

# Test the client collection
function ExecCollectionPublish {
    local namespace collection version
    namespace=$(galaxyGetCollectionNamespace)
    collection=$(galaxyGetCollectionName)
    version=$(galaxyGetCollectionVersion)
    echo "======== PUBLISH THE " "${namespace}"-"${collection}"-"${version}" "COLLECTION"
    # Publish the client collection
    ansible-galaxy collection publish ${output_dir}/"${namespace}"-"${collection}"-"${version}".tar.gz
}
