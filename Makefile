

version=0.0.9
collection=client

# Generic actions (default is local)
# all action
.PHONY: all
all: build test clean
# build action
.PHONY: build
build: build-local
# test action
.PHONY: test
test: test-local
# clean action
.PHONY: clean
clean: clean-local
# mrproper action
mrproper: clean-local 

# Local actions
# all local actions
all-local: build-local test-local clean-local
# build local action
# build-local: SHELL:=/bin/bash
build-local: 
	@echo "======== BUILD LOCAL"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionBuild local"
# test local action
test-local: 
	@echo "======== TEST LOCAL"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionTest local"
# clean local action
clean-local: 
	@echo "======== CLEAN LOCAL"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionClean local"

# Gitlab actions
# all gitlab actions
all-gitlab: build-gitlab test-gitlab publish-gitlab
# build local action
build-gitlab: 
	@echo "======== BUILD GITLAB"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionBuild gitlab"
# test local action
test-gitlab: 
	@echo "======== TEST GITLAB"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionTest gitlab"
# clean local action
publish-gitlab: 
	@echo "======== PUBLISH GITLAB"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionPublish gitlab"
# clean local action
clean-gitlab: 
	@echo "======== CLEAN GITLAB"
	@bash -c "source .gitlab/ci/startx-ansible-library.sh && ExecCollectionClean gitlab"
