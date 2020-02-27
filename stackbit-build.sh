#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5835796faf9c0019b85c1e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5835796faf9c0019b85c1e
curl -s -X POST https://api.stackbit.com/project/5e5835796faf9c0019b85c1e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5835796faf9c0019b85c1e/webhook/build/publish > /dev/null
