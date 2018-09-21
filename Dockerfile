FROM ansibleplaybookbundle/apb-base:v3.9

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGRiYWFzLW1hcmlhZGItYXBiCmRlc2NyaXB0aW9uOiBNYXJpYURC\
IGFzIGEgU2VydmljZSAobG9jYWwpCmJpbmRhYmxlOiBUcnVlCmFzeW5jOiBvcHRpb25hbAptZXRh\
ZGF0YToKICBkaXNwbGF5TmFtZTogREJhYVMgLSBNYXJpYURCIChsb2NhbCBBUEIpCiAgZGVwZW5k\
ZW5jaWVzOiBbXQogIHByb3ZpZGVyRGlzcGxheU5hbWU6IEFQUFVpTwogIGltYWdlVXJsOiA+LQog\
ICAgaHR0cHM6Ly9hcHB1aW8uY2gvaW1hZ2VzL2FwcHVpb19sb2dvLWY4MTYwOGYxLnN2ZwpwbGFu\
czoKICAtIG5hbWU6IGRlZmF1bHQKICAgIGRlc2NyaXB0aW9uOiBUaGlzIGRlZmF1bHQgcGxhbiBj\
cmVhdGVzIGEgREIgdXNlciBhbmQgc2NoZW1hCiAgICBmcmVlOiBUcnVlCiAgICBtZXRhZGF0YTog\
e30KICAgIHBhcmFtZXRlcnM6IFtdCg=="



COPY playbooks /opt/apb/actions
COPY . /opt/ansible/roles/dbaas-mariadb-apb
RUN chmod -R g=u /opt/{ansible,apb} \
 && yum -y install MySQL-python python-mysqldb mysql && yum clean all

ENV BUNDLE_DEBUG=true

USER apb
