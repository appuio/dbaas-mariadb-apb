FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGRiYWFzLW1hcmlhZGItYXBiCmRlc2NyaXB0aW9uOiBNYXJpYURC\
IGFzIGEgU2VydmljZQpiaW5kYWJsZTogVHJ1ZQphc3luYzogb3B0aW9uYWwKbWV0YWRhdGE6CiAg\
ZGlzcGxheU5hbWU6IERCYWFTIC0gTWFyaWFEQiAoQVBCKQogIGRlcGVuZGVuY2llczogW10KICBw\
cm92aWRlckRpc3BsYXlOYW1lOiBBUFBVaU8KICBpbWFnZVVybDogPi0KICAgIGh0dHBzOi8vYXBw\
dWlvLmNoL2ltYWdlcy9hcHB1aW9fbG9nby1mODE2MDhmMS5zdmcKcGxhbnM6CiAgLSBuYW1lOiBk\
ZWZhdWx0CiAgICBkZXNjcmlwdGlvbjogVGhpcyBkZWZhdWx0IHBsYW4gY3JlYXRlcyBhIERCIHVz\
ZXIgYW5kIHNjaGVtYQogICAgZnJlZTogVHJ1ZQogICAgbWV0YWRhdGE6IHt9CiAgICBwYXJhbWV0\
ZXJzOiBbXQo="



COPY playbooks /opt/apb/actions
COPY . /opt/ansible/roles/dbaas-mariadb-apb
RUN chmod -R g=u /opt/{ansible,apb} \
 && yum -y install MySQL-python python-mysqldb mysql && yum clean all

#ENV BUNDLE_DEBUG=true

USER apb
