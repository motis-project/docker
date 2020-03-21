Build Example:

    docker run \
        -v "$PWD:/repo" \
        -e "CXXFLAGS=-static" \
        --rm docker.pkg.github.com/motis-project/docker/motis-build:latest \
        bash -c "cmake -GNinja /repo && ninja TARGET && cp BINARY /repo"
    ./BINARY
