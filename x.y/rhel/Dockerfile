FROM rhel7

LABEL MAINTAINER ...

LABEL  summary="Postfix is a Mail Transport Agent (MTA)." \
       com.redhat.component="$NAME" \
       version="$VERSION" \
       release="$RELEASE.$DISTTAG" \
       architecture="$ARCH" \
       usage="docker run -p 9000:9000 f26/mycontainer" \
       help="Runs mycontainer, which listens on port 9000 and tells you how awesome it is. No dependencies." \
       description="Postfix is mail transfer agent that routes and delivers mail." \
       io.k8s.description="Postfix is mail transfer agent that routes and delivers mail." \
       io.k8s.display-name="Postfix 3.1" \
       io.openshift.expose-services="10025:postfix" \
       io.openshift.tags="postfix,mail,mta"

# add help file
COPY root /

CMD ["true"]
