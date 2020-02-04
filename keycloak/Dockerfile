FROM jboss/keycloak:latest

# Keycloak User
ENV KEYCLOAK_ADMIN_USER admin
ENV KEYCLOAK_ADMIN_PASSWORD admin

#ENV KEYCLOAK_CONTEXT_PATH u/auth

#COPY docker-entrypoint.sh /opt/jboss 

#COPY docker-entrypoint.sh /opt/jboss/tools
#COPY profile.properties /opt/jboss/keycloak/standalone/configuration

#CMD ["--server-config", "standalone-ha.xml"]
#CMD ["--server-config", "standalone-ha.xml"]

# configure for postgres
COPY standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

COPY init.sh .

#COPY acorn-theme /opt/jboss/keycloak/themes/acorn-theme

USER root

ENTRYPOINT [ "bash",  "./init.sh" ]

#ENTRYPOINT [ "/opt/jboss/keycloak/bin/standalone.sh" ]

#CMD ["-b", "0.0.0.0"]
