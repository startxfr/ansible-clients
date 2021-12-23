version= 0.0.3
collection=client
# Generic actions (default is local)
# all action
all: build test clean
# build action
build: build-local
# test action
test: test-local
# clean action
clean: clean-local
# mrproper action
mrproper: clean-local

# Local actions
# all local actions
all-local: build-local test-local clean-local
# build local action
build-local: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionBuild
# test local action
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionTest
# clean local action
clean-local: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionClean

# Gitlab actions
# all gitlab actions
all-gitlab: build-gitlab test-gitlab publish-gitlab
# build local action
build-gitlab: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionBuild
# test local action
test-gitlab: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionTest
# clean local action
publish-gitlab: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionPublish
# clean local action
clean-gitlab: 
    source .gitlab/ci/startx-ansible-library.sh
	ExecCollectionClean
