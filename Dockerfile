# Usando a imagem oficial do WildFly
FROM jboss/wildfly:latest

# Copiando a aplicação para o servidor WildFly
COPY ear/target/weblogic-ear-1.0.0-SNAPSHOT.ear /opt/jboss/wildfly/standalone/deployments/

# Expondo a porta padrão do WildFly
EXPOSE 8080

# Comando para iniciar o servidor WildFly
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
