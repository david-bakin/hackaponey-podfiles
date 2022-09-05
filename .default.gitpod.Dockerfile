# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:latest

# Install custom tools, runtime, etc.
RUN sudo apt-get update

# Install apt-transport-https
RUN sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common curl --yes

# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# RUN unzip awscliv2.zip
# RUN sudo ./aws/install

# Add the gcloud CLI distribution URI as a package source
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key.
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Install the gcloud CLI
RUN sudo apt-get update && sudo apt-get install google-cloud-cli

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN sudo apt-get update && sudo apt-get install terraform
