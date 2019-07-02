#!/usr/bin/env bash

function api()
{
    ansible-playbook -i ansible/hosts.yml ansible/local.yml;
}

function setup_all()
{
    ansible-playbook -i ansible/hosts.yml --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags setup;
}

function setup_crab()
{
    ansible-playbook -i ansible/hosts.yml --limit crab --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags setup;
}

function setup_squid()
{
    ansible-playbook -i ansible/hosts.yml --limit squid --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags setup;
}

function teardown_all()
{
    ansible-playbook -i ansible/hosts.yml --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags teardown;
}

function teardown_crab()
{
    ansible-playbook -i ansible/hosts.yml --limit crab --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags teardown;
}

function teardown_squid()
{
    ansible-playbook -i ansible/hosts.yml --limit squid --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags teardown;
}

function run_tests()
{
    ansible-playbook -i ansible/hosts.yml --ask-vault-pass --extra-vars '@ansible/keys/devops_pub.yml' ansible/remote.yml --tags test;
}