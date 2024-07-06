mkdir MC

cd MC

sudo apt update (to update things needed to make server)

sudo apt install open-jdk-11-jre (to run MC Server, use latest vesion if possible)

wget (url of latest minecraft server build, example: paper, fabric, vanilla server.jar link) (if your server installer file name is not "server.jar" then rename it to "server.jar", directly downloadable link)

java -Xmx14G -Xms12G -jar server.jar nogui

(
edit eula.txt file and replace flase with true in it

install playit.gg plugin in it to get ip and also dont forget to set it up (https://playit.gg/download/plugins)

codespace machine should be 16gb RAM 32 gb storage
)

to download playit.gg plugin:

cd MC

cd plugins

wget https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-minecraft-plugin.jar

...

server starter cmd:

java -Xmx14G -Xms12G -jar server.jar nogui
