FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGRiYWFzLW1hcmlhZGItYXBiCmRlc2NyaXB0aW9uOiBNYXJpYURC\
IGFzIGEgU2VydmljZQpiaW5kYWJsZTogVHJ1ZQphc3luYzogb3B0aW9uYWwKbWV0YWRhdGE6CiAg\
ZGlzcGxheU5hbWU6IERCYWFTIC0gTWFyaWFEQiAoQVBCKQogIGRlcGVuZGVuY2llczogW10KICBw\
cm92aWRlckRpc3BsYXlOYW1lOiBBUFBVaU8KcGxhbnM6CiAgLSBuYW1lOiBkZWZhdWx0CiAgICBk\
ZXNjcmlwdGlvbjogVGhpcyBkZWZhdWx0IHBsYW4gY3JlYXRlcyBhIERCIHVzZXIgYW5kIHNjaGVt\
YQogICAgZnJlZTogVHJ1ZQogICAgbWV0YWRhdGE6IHt9CiAgICBwYXJhbWV0ZXJzOiBbXQo="



COPY playbooks /opt/apb/actions
COPY . /opt/ansible/roles/dbaas-mariadb-apb
RUN chmod -R g=u /opt/{ansible,apb} \
 && yum -y install MySQL-python python-mysqldb mysql && yum clean all

USER apb
