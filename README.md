What does this example do

Install mapfish-print inside a tomcat7 servlet container on a host with chef + knife solo.

Instructions

bundle install
librarian-chef install
knife solo bootstrap example_user@example_host -N mfp_example

You should then have a functioning MFP server which you can visit at
http://example_host:8080/mfp

OPTIONS:
If you want to use your own built version of MFP instead of the included CaerusGeo fork (built from 2.0  + s3_support - https://github.com/snkashis/mapfish-print/tree/s3_support), change the source in the remote_file block of
*/site-cookbooks/mapfishprint/recipes/default.rb*

If you want to change the MFP config.yaml in this deployment process, modify the config.yaml in 
*/site-cookbooks/mapfishprint/files/config.yaml*

This guide was adapted from
http://leopard.in.ua/2013/01/04/chef-solo-getting-started-part-1/

NOTE1:
The default spec sample on the example page has been not functioning well due to issues connecting with
http://labs.metacarta.com/wms/vmap0.

if you see something like
"2013-06-12 19:27:14,283 [http-bio-8080-exec-6] INFO  .httpclient.HttpMethodDirector - I/O exception (java.net.ConnectException) caught when processing request: Connection timed out"
in your /tmp/logs/mapfish-print.log...you may be seeing this behavior.
Try another spec example from https://github.com/mapfish/mapfish-print/tree/master/samples
Remember you may need to add another allowed hosts in your config.yaml to support using a spec with another server involved.

NOTE2:
If you are on a network where certain high ports are blocked (like the State of Maps at UCSF),
you will need to drop down a lower port.
See guide for that here
http://www.rescarta.com/index.php/rcsoft/rcfaqssec/13-rcwebfaq/35-tomcatport.html
The file in question(server.xml) is at /var/lib/tomcat7/conf/server.xml
