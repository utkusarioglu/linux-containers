ARG OS_TAG

FROM ubuntu:${OS_TAG}

ARG YQ_VERSION
ARG NVIM_VERSION
ARG USERNAME
ARG USER_ID
ARG GROUP_ID
ARG ROOT_PASS

WORKDIR ${HOME}/bootstrap

COPY bootstrap-scripts/*.sh .

RUN users.sh ${ROOT_PASS} ${USERNAME}
RUN packages.sh ${YQ_VERSION} ${NVIM_VERSION}

USER ${USERNAME}

RUN gists.sh

ENV EDITOR=nvim

ENTRYPOINT ["/bin/bash"]
