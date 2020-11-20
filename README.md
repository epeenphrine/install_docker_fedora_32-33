# install_docker_fedora_32-33
script for getting docker up and running quick in fedora
# SElinux fix with bind volume in Docker .. 
-v yourdir:/containerdir:z or -v yourdir:/containerdir:Z

The z option indicates that the bind mount content is shared among multiple containers. The Z option indicates that the bind mount content is private and unshared. Use extreme caution with these options. Bind-mounting a system directory such as /home or /usr with the Z option renders your host machine inoperable and you may need to relabel the host machine files by hand.
