#!/usr/bin/env bash

set -xe

git clone https://github.com/ansible/ansible ansible
git clone https://github.com/ansible/ansible ansible-stable

cd ansible-stable
 git checkout stable-2.5
 git submodule update --init --recursive
cd -

export ANSIBLE_DIR=ansible/
export ARGSPEC_PATH=ansible-stable/test/sanity/validate-modules/module_args.py
./generate.sh

cd validator/
yarn install
node index.js
