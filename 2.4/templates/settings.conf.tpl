#
# This configuration file reflects default settings for Apache HTTP Server.
#
# You may change these, but chances are that you may not need to.
#

#
# Timeout: The number of seconds before receives and sends time out.
#
Timeout {{ getenv "APACHE_TIMEOUT" "60" }}

#
# KeepAlive: Whether or not to allow persistent connections (more than
# one request per connection). Set to "Off" to deactivate.
#
KeepAlive {{ getenv "APACHE_KEEP_ALIVE" "On" }}

#
# MaxKeepAliveRequests: The maximum number of requests to allow
# during a persistent connection. Set to 0 to allow an unlimited amount.
# We recommend you leave this number high, for maximum performance.
#
MaxKeepAliveRequests {{ getenv "APACHE_MAX_KEEP_ALIVE_REQUESTS" "100" }}

#
# KeepAliveTimeout: Number of seconds to wait for the next request from the
# same client on the same connection.
#
KeepAliveTimeout {{ getenv "APACHE_KEEP_ALIVE_TIMEOUT" "5" }}

#
# UseCanonicalName: Determines how Apache constructs self-referencing
# URLs and the SERVER_NAME and SERVER_PORT variables.
# When set "Off", Apache will use the Hostname and Port supplied
# by the client.  When set "On", Apache will use the value of the
# ServerName directive.
#
UseCanonicalName {{ getenv "APACHE_USE_CANONICAL_NAME" "Off" }}

#
# AccessFileName: The name of the file to look for in each directory
# for additional configuration directives.  See also the AllowOverride
# directive.
#
AccessFileName {{ getenv "APACHE_ACCESS_FILE_NAME" ".htaccess" }}

#
# ServerTokens
# This directive configures what you return as the Server HTTP response
# Header. The default is 'Full' which sends information about the OS-Type
# and compiled in modules.
# Set to one of:  Full | OS | Minor | Minimal | Major | Prod
# where Full conveys the most information, and Prod the least.
#
ServerTokens {{ getenv "APACHE_SERVER_TOKENS" "Full" }}

#
# Optionally add a line containing the server version and virtual host
# name to server-generated pages (internal error documents, FTP directory
# listings, mod_status and mod_info output etc., but not CGI generated
# documents or custom error documents).
# Set to "EMail" to also include a mailto: link to the ServerAdmin.
# Set to one of:  On | Off | EMail
#
ServerSignature {{ getenv "APACHE_SERVER_SIGNATURE" "Off" }}

#
# HostnameLookups: Log the names of clients or just their IP addresses
# e.g., www.apache.org (on) or 204.62.129.132 (off).
# The default is off because it'd be overall better for the net if people
# had to knowingly turn this feature on, since enabling it means that
# each client request will result in AT LEAST one lookup request to the
# nameserver.
#
HostnameLookups {{ getenv "APACHE_HOSTNAME_LOOKUPS" "Off" }}

#
# Set a timeout for how long the client may take to send the request header
# and body.
# The default for the headers is header=20-40,MinRate=500, which means wait
# for the first byte of headers for 20 seconds. If some data arrives,
# increase the timeout corresponding to a data rate of 500 bytes/s, but not
# above 40 seconds.
# The default for the request body is body=20,MinRate=500, which is the same
# but has no upper limit for the timeout.
# To disable, set to header=0 body=0
#
<IfModule reqtimeout_module>
  RequestReadTimeout {{ getenv "APACHE_REQUEST_READ_TIMEOUT" "header=20-40,MinRate=500 body=20,MinRate=500" }}
</IfModule>

<IfModule event.c>
ServerLimit           {{ getenv "APACHE_MPM_EVENT_SERVER_LIMIT" "16" }}
MaxClients            {{ getenv "APACHE_MPM_EVENT_MAX_CLIENTS" "400" }}
StartServers          {{ getenv "APACHE_MPM_EVENT_START_SERVERS" "3" }}
ThreadsPerChild       {{ getenv "APACHE_MPM_EVENT_THREADS_PER_CHILD" "25" }}
ThreadLimit           {{ getenv "APACHE_MPM_EVENT_THREAD_LIMIT" "64" }}
</IfModule>