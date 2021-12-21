#!/bin/bash

# Configure collection
namespace=startxfr
collection=client
version=0.0.2
output_dir=.output
test_dir=/tmp/test-client

# Build the client collection
ansible-galaxy collection build --output-path ${output_dir}

# Test the client collection
mkdir -p ${test_dir}
cp -r tests/* ${test_dir}/
ansible-galaxy collection install ${output_dir}/${namespace}-${collection}-${version}.tar.gz -p ${test_dir}/collections
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
export ANSIBLE_CONFIG=$(pwd)/ansible-private.cfg

# Publish the client collection
ansible-galaxy collection publish ${output_dir}/${namespace}-${collection}-${version}.tar.gz