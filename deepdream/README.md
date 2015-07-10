deepdream
=========

This is a Centos 7 image for building [deepdream](https://github.com/google/deepdream), including the python module.

Build: `docker built -t deepdream .`
Run: `docker run -it -v $HOME/deepdream:deepdream deepdream`
Once you have a shell in the container you can run `ipython`


Warning
-------

This Dockerfile is incomplete, and contains only a root user.

