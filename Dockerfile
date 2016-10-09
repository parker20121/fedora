FROM tpires/alpine-jboss-wildfly:10.0.0.Final

MAINTAINER Matt Parker <matt.parker@endoxa-us.com>

USER root
RUN apk add wget

WORKDIR /opt/
RUN wget -nv https://github.com/fcrepo4-exts/fcrepo-webapp-plus/releases/download/fcrepo-webapp-plus-4.6.0/fcrepo-webapp-plus-webac-audit-4.6.0.war

RUN ls -la /opt/
RUN chmod 755 /opt/fcrepo-webapp-plus-webac-audit-4.6.0.war
RUN chown jboss:jboss /opt/fcrepo-webapp-plus-webac-audit-4.6.0.war
RUN ls -la $JBOSS_HOME
RUN cp /opt/fcrepo-webapp-plus-webac-audit-4.6.0.war $JBOSS_HOME/standalone/deployments/fedora.war
RUN touch $JBOSS_HOME/standalone/deployments/fedora.war.dodeploy

