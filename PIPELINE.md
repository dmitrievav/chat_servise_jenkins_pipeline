# Common

1. Adopt hardcoded settings to use config files or environments variables
2. Setup Jenkins
3. Connect Jenkins' agent with docker in docker capability
4. Make nginx container
5. Make message queue container

# Setup CI project for both Java apps

1. Checkout
2. Validate
3. Compile
4. Test
5. Package

# Setup DEPLOY-STAGING-LIVE PIPELINE for both Java apps

1. Checkout (specific branches or tags)
2. Validate
3. Compile
4. Test
5. Package
6. Upload artifacts to some registry
6. Deploy to TEST ENV
7. QA TEST ENV
8. Deploy to LIVE ENV (manual triger)
9. QA LIVE ENV
10. Send status notification to some Slack/Hipchat chanel

# Logging

1. Setup ELK cluster
2. Make apps to write logs to specific plase
3. Make contatiner with log-courier
4. Make contatiner with logrotate

# Monitoring (nagios/zabbix)

1. Show health dashboard
2. Send notification

# Some Grafana

1. Show usage statistics like users/messages/errors


# Notes

Exception in thread "main" java.lang.NoClassDefFoundError: javax/servlet/ServletContextListener

http://stackoverflow.com/questions/17973970/how-to-solve-java-lang-noclassdeffounderror

https://en.wikipedia.org/wiki/Classpath_%28Java%29

http://stackoverflow.com/questions/11758594/how-do-i-put-all-required-jar-files-in-a-library-folder-inside-the-final-jar-fil

http://javarevisited.blogspot.de/2012/03/how-to-create-and-execute-jar-file-in.html

http://stackoverflow.com/questions/18451052/how-to-include-jars-in-lib-into-project-jar-file-in-netbeans/26815335#26815335

