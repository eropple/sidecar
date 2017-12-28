#! /usr/bin/env bash

ROOT=$(dirname $0)
NODES_DIR="$ROOT/build/nodes"
COOKBOOK_DIR="$ROOT/build/cookbooks"
mkdir -p "$NODES_DIR"
mkdir -p "$COOKBOOK_DIR"
berks vendor "$COOKBOOK_DIR"
