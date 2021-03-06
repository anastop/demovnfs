FROM debian:bullseye

RUN apt-get update \
 && apt-get -y install git golang make gcc bzr libvirt-dev linux-headers-amd64 libbpfcc libbpfcc-dev bpfcc-tools python3 swig python3-numpy protobuf-compiler curl gnupg

# Install bazel
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg \
 && mv bazel.gpg /etc/apt/trusted.gpg.d/ \
 && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
 && apt -y update && apt -y install bazel

# Install tensorflow C libs
RUN mkdir -p /tensorflow \
 && curl -fsLo /tensorflow/libtensorflow-cpu-linux-x86_64-2.4.0.tar.gz  https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.4.0.tar.gz \
 && cd /tensorflow && tar -C /usr/local/ -xzf libtensorflow-cpu-linux-x86_64-2.4.0.tar.gz && ldconfig

# Replicate paths from golang image
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
