# container-image-template

This is a template of a git repository which is a source for building container images.


There are two templates within this repository on two different branches:

 1. `master` — template for images with multiple versions

 2. `single` — image with only one single version


## Description

 * `LICENSE` — pick the right license
 * `Makefile` — so it's easy to build, run, test
 * `openshift-template.yml` - general OpenShift template
  * update it. It includes several commands what to update
 * `README.md` — global documentation for the whole service
  * what is it, how to build, how to use
 * `run_test.sh` — run tests of all images with a single script

### Image specific files and directories

 * `Dockerfile` — default Dockerfile, should be based on Fedora now (will likely change in future)
 * `Dockerfile.$distro` — Dockerfile for other distro, should be also built by Makefile
 * `examples/` — directory with examples that demonstrate the image functionality:
   * these examples should be ideally present in a form of documentation
   * code samples are welcome too
 * `files/` — this is the place where you should store configuration, helper scripts, etc.
 * `README.md` — version specific documentation
 * `test/` — these tests should verify that the image works

