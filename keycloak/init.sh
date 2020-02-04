#!/bin/bash

sed -i -e "s/XXX-KEYCLOAK-POSTGRES-USER-XXX/${KC_PG_USER}/" \
    $JBOSS_HOME/standalone/configuration/standalone.xml

sed -i -e "s/XXX-KEYCLOAK-POSTGRES-PASSWORD-XXX/${KC_PG_PASSWORD}/" \
    $JBOSS_HOME/standalone/configuration/standalone.xml

sed -i -e "s/XXX-KEYCLOAK-POSTGRES-HOST-XXX/${KC_PG_HOST}/" \
    $JBOSS_HOME/standalone/configuration/standalone.xml

/opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0 -Djboss.socket.binding.port-offset=1010
