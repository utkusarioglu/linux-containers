ARG OS_TAG

FROM ubuntu:${OS_TAG}

ARG YQ_VERSION
ARG NVIM_VERSION
ARG USERNAME
ARG GROUP_NAME
ARG USER_ID
ARG GROUP_ID
ARG ROOT_PASS

ARG HOME_ABSPATH=/home/${USERNAME}
ARG SCRIPTS_ABSPATH=${HOME_ABSPATH}/scripts
ARG BOOTSTRAP_ABSPATH=${SCRIPTS_ABSPATH}/bootstrap

WORKDIR ${HOME_ABSPATH}

COPY home .

RUN ls -al ${HOME_ABSPATH}

RUN ${BOOTSTRAP_ABSPATH}/permissions.sh \
  ${USER_ID} \
  ${GROUP_ID} \
  ${HOME_ABSPATH}

RUN ${BOOTSTRAP_ABSPATH}/users.sh \
  ${ROOT_PASS} \
  ${USERNAME} \
  ${GROUP_NAME} \
  ${USER_ID} \
  ${GROUP_ID} \
  ${HOME_ABSPATH}

RUN ${BOOTSTRAP_ABSPATH}/apt-packages.sh

RUN ${BOOTSTRAP_ABSPATH}/manual-packages.sh \
  ${YQ_VERSION} \
  ${NVIM_VERSION}

RUN ${BOOTSTRAP_ABSPATH}/folders.sh \
  ${USER_ID} \
  ${GROUP_ID} \
  ${HOME_ABSPATH}

USER ${USERNAME}

RUN ${BOOTSTRAP_ABSPATH}/tools.sh ${HOME_ABSPATH}

ENV EDITOR=nvim
ENTRYPOINT ["bash"]
