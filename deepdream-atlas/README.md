deepdream
=========

This is a Centos 7 image for building [Caffe](http://caffe.berkeleyvision.org/) for use with [deepdream](https://github.com/google/deepdream), including the python module.
Caffe is linked to [ATLAS](http://math-atlas.sourceforge.net/).

Build: `docker built -t deepdream .`
Run: `docker run -it -v $HOME/deepdream:deepdream deepdream`
Once you have a shell in the container you can run `ipython`

See https://github.com/google/deepdream/blob/master/dream.ipynb for example usage.

Warning
-------

This Dockerfile is incomplete, and contains only a root user.

