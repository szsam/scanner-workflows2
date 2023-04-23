# scanner-workflows
Workflows that run CodeQL on embedded SDKs/libraries/RTOSes/applications and automatically push results to https://github.com/purs3lab/OSSEmbeddedResults.

## Folder structure
For each repository, create a workflow file in `.github/workflows/` and a build script in `.github/build-scripts/` that compiles the repository.

E.g., for [Azure/azure-iot-sdk-c](https://github.com/Azure/azure-iot-sdk-c), there is a workflow file
[.github/workflows/Azure_azure-iot-sdk-c.yml](https://github.com/purs3lab/scanner-workflows/blob/main/.github/workflows/Azure_azure-iot-sdk-c.yml) and a build script [.github/build-scripts/Azure_azure-iot-sdk-c.sh](https://github.com/purs3lab/scanner-workflows/blob/main/.github/build-scripts/Azure_azure-iot-sdk-c.sh).

Every workflow that scans a repository calls the reusable workflow [codeql-cli.yml](https://github.com/purs3lab/scanner-workflows/blob/main/.github/workflows/codeql-cli.yml).

## Automatic generation of workflows and build scripts
``` bash
./gen-workflow.sh owner/repo
```
This creates a workflow with default settings and an empty build script.

E.g., `./gen-workflow.sh Azure/azure-iot-sdk-c` automatically creates the following workflow:
``` yml
name: "CodeQL: Azure/azure-iot-sdk-c"

on:
  workflow_dispatch:
    inputs:
      repository:
        description: 'Repository to run CodeQL on. Format: owner/repo.'
        required: true
        type: string
        default: Azure/azure-iot-sdk-c
      ref:
        description: 'The branch, tag or SHA to checkout. Default: default branch.'
        required: false
        type: string

jobs:
  call_codeql_workflow:
    uses: ./.github/workflows/codeql-cli.yml
    secrets: inherit
    with:
      repository: ${{ inputs.repository || 'Azure/azure-iot-sdk-c' }}
      ref: ${{ inputs.ref }}
      build_script: Azure_azure-iot-sdk-c.sh
      install_arm-none-eabi-gcc: false
```
If arm-none-eabi-gcc is needed in the build script, change that last line to `install_arm-none-eabi-gcc: true`.

## Run workflows
See https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow?tool=webui.
