ARG OS_TAG
ARG YQ_VERSION
ARG NVIM_VERSION
ARG USERNAME
ARG GROUP
ARG ROOT_PASS

RUN "YQ_VERSION: $YQ_VERSION"

FROM ubuntu:${OS_TAG}
# RUN echo "root:$ROOT_PASS" | chpasswd

COPY packages.sh /bootstrap/
RUN /bootstrap/packages.sh ${YQ_VERSION} ${NVIM_VERSION}

USER ${USERNAME}

COPY gists.sh /bootstrap/
RUN /bootstrap/gists.sh

ENV EDITOR=nvim
