pip install gitpython

pull_and_build() {
    docker pull meetmangukiya/corobo-answers:latest
    docker build -t meetmangukiya/corobo-answers answers/
}

if [[ $BRANCH_NAME != "master" && $SEMAPHORE_REPO_SLUG != "coala/corobo" ]]
then
    .ci/check_docker.py
    if [[ $? == 1 ]]
    then pull_and_build
    fi
else
    pull_and_build
fi
