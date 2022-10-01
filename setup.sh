#!/bin/bash
# This script is used to setup the environment for the project
ORIG_DIR=`pwd`

if ! command -v git &> /dev/null
then
    echo "git must be available to continue"
    exit
fi

if ! command -v docker &> /dev/null
then
    echo "docker must be available to continue"
    exit
fi

mkdir ../invasion
cp docker-compose.yml ../invasion
cd ../invasion
git clone https://github.com/altintx/glowing-fiesta.git
cd glowing-fiesta
docker run --rm -v $(pwd):/app node:16 sh -c "cd /app && yarn install"
cd ../
git clone https://github.com/altintx/urban-memory.git
cd urban-memory
docker run --rm -v $(pwd):/app node:16 sh -c "cd /app && yarn install"
cd $ORIG_DIR
echo "done!"
echo "cd ../invasion and then "
echo "run 'docker compose up' to start the project"
