#!/usr/bin/env bash

if [ ! -d "omnisharp-roslyn" ]; then
    mkdir -p omnisharp-roslyn

    PACKAGE_VERSION=v1.22.0
    PACKAGE=omnisharp-mono.tar.gz
    PACKAGE_URL=https://github.com/OmniSharp/omnisharp-roslyn/releases/download/$PACKAGE_VERSION/$PACKAGE

    cd omnisharp-roslyn
    wget $PACKAGE_URL
    tar xzf $PACKAGE

    PWD=$(pwd)

    if [ ! -x "OmniSharp" ]; then
        echo "#!/usr/bin/env bash" > OmniSharp
        echo "mono $PWD/OmniSharp.exe \$@" >> OmniSharp
        chmod +x OmniSharp
    fi
fi
