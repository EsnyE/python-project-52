#!/usr/bin/env bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
apt-get update && apt-get install -y make || true
make install && make collectstatic && make migrate