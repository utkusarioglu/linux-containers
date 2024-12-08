ARG OS_TAG

FROM ubuntu:${OS_TAG}

ARG YQ_VERSION
ARG NVIM_VERSION
ARG USERNAME
ARG GROUP
ARG ROOT_PASS

RUN echo "root:$ROOT_PASS" | chpasswd

COPY packages.sh /bootstrap/
RUN /bootstrap/packages.sh ${YQ_VERSION} ${NVIM_VERSION}

USER ${USERNAME}

COPY gists.sh /bootstrap/
RUN /bootstrap/gists.sh

ENV EDITOR=nvim
