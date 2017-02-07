% TEMPLATE(1) Container Image Pages
% <YOUR_NAME>
% DATE

# NAME
<container_name> - The container image name and a few word description

# DESCRIPTION
A longer description of the container's purpose.

# USAGE
This is a free-form section that describes how the container image is used.
Depending on how the container image was designed,
it could describe how to use it with docker, oc, atomic, runc or other commands.

To get the <container_name> container image on your local system, run the following:

    docker pull <registry_address>/<container_name>

   
# ENVIRONMENT VARIABLES
Includes examples of environment variables that are stored in the
image and that affect how the container runs
(and can typically be changed on the docker run command line with the -e option).

DOCKER_VARIABLE1=<SOME_VALUE>
    Description of the variable 1.
    
DOCKER_VARIABLE2=<SOME_VALUE>
    Description of the variable 2.
    
# SECURITY IMPLICATIONS
Lists of security-related attributes that are opened to the host.

-p <host_port>:<container_port>
    Opens container port <container_port> and maps it to the same port on the host.

-v <host_directory>:<container_directory>
    Makes the <container_directory> available from the same directory on the host.
    
# TROUBLESHOOTING
Optional section on how to access logs and deal with typical problems you might encounter.

# SEE ALSO
Optional section with pointers to supporting or related documentation.
Shouldn’t be more than 3 links maximum.

# AUTHORS
