FROM jupyter/scipy-notebook

USER root

RUN pip install -U pip

RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y curl \
    && apt-get install -y sudo

RUN jupyter serverextension enable --py jupyterlab

RUN jupyter labextension install @lckr/jupyterlab_variableinspector
RUN jupyter labextension install @jupyterlab/toc

RUN pip install autopep8 \
    && pip install jupyterlab_code_formatter \
    && jupyter labextension install @ryantam626/jupyterlab_code_formatter \
    && jupyter serverextension enable --py jupyterlab_code_formatter

RUN pip install ipywidgets \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter nbextension enable --py --sys-prefix widgetsnbextension

