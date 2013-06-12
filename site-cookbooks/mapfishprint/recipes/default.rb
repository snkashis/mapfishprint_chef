remote_file "/var/lib/tomcat7/webapps/mfp.war" do
  source "http://s3.amazonaws.com/co_war_backup/mfp_withs3.war"
  mode 644
  action :create_if_missing
  notifies :restart, "service[tomcat]"
end

cookbook_file "/var/lib/tomcat7/webapps/mfp/config.yaml" do
  action :delete
end
cookbook_file "/var/lib/tomcat7/webapps/mfp/config.yaml" do
  source 'config.yaml'
  mode 644
  action :create
end
