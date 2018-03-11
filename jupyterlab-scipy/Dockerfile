FROM jupyter/scipy-notebook:89e87a41678a
MAINTAINER Simon Li "spli@dundee.ac.uk"

# https://blog.jupyter.org/a-diagram-editor-for-jupyterlab-a254121ff919
# https://github.com/QuantStack/jupyterlab-drawio
RUN jupyter labextension install jupyterlab-drawio
# https://github.com/jupyterlab/jupyterlab-github
RUN jupyter labextension install @jupyterlab/github
#https://github.com/jupyterlab/jupyter-renderers/tree/master/packages/geojson-extension
RUN jupyter labextension install @jupyterlab/geojson-extension
