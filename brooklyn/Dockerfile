
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM yaronr/openjdk-7-jdk
MAINTAINER yaronr

ENV BROOKLYN_VERSION 0.7.0-M1

# install utilities
RUN apt-get -y install tar && groupadd brooklyn && useradd brooklyn -s /bin/bash -m -g brooklyn -G brooklyn && adduser brooklyn sudo

USER brooklyn
WORKDIR /home/brooklyn/
RUN wget -qO brooklyn-dist-${BROOKLYN_VERSION}-dist.tar.gz http://search.maven.org/remotecontent?filepath=io/brooklyn/brooklyn-dist/${BROOKLYN_VERSION}/brooklyn-dist-${BROOKLYN_VERSION}-dist.tar.gz && \
tar -zxf brooklyn-dist-${BROOKLYN_VERSION}-dist.tar.gz && \
rm brooklyn-dist-${BROOKLYN_VERSION}-dist.tar.gz && \
mkdir -p .brooklyn && \
wget -qO .brooklyn/brooklyn.properties http://brooklyncentral.github.io/use/guide/quickstart/brooklyn.properties && \
sed -i.bak 's/^# brooklyn.webconsole.security.provider = brooklyn.rest.security.provider.AnyoneSecurityProvider/brooklyn.webconsole.security.provider = brooklyn.rest.security.provider.AnyoneSecurityProvider/' .brooklyn/brooklyn.properties && \
wget -qO .brooklyn/catalog.xml http://brooklyncentral.github.io/use/guide/quickstart/catalog.xml

# expose the brooklyn port
EXPOSE 8081

# launch brooklyn
CMD brooklyn-$BROOKLYN_VERSION/bin/brooklyn launch
