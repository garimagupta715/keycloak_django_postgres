FROM jboss/keycloak:latest

# Keycloak User
ENV KEYCLOAK_ADMIN_USER admin
ENV KEYCLOAK_ADMIN_PASSWORD admin

# configure for postgres
COPY standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml

COPY init.sh .

#COPY acorn-theme /opt/jboss/keycloak/themes/acorn-theme

USER root

ENTRYPOINT [ "bash",  "./init.sh" ]

#ENTRYPOINT [ "/opt/jboss/keycloak/bin/standalone.sh" ]

#CMD ["-b", "0.0.0.0"]
