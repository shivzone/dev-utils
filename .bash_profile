#General
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export LOG_DIR=/Users/manis2/work/logs
export PID_DIR=/Users/manis2/work/pid
export WORK_ROOT=/Users/manis2/work
alias pstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ll='ls -lG'

#Hadoop
export HADOOP_HOME=/Users/manis2/work/hadoop
export YARN_HOME=$HADOOP_HOME
export PXF_LIB=/Users/manis2/git/main/pxf/build
export USS_ROOT=/Users/manis2/git/uss
alias format='$HADOOP_HOME/bin/hadoop namenode -format'
alias start='$HADOOP_HOME/sbin/start-all.sh'
alias stop='$HADOOP_HOME/sbin/stop-all.sh'
alias hadoop='$HADOOP_HOME/bin/hadoop'
alias httpfsstart='$HADOOP_HOME/sbin/httpfs.sh start'
alias httpfsstop='$HADOOP_HOME/sbin/httpfs.sh stop'

#USS
alias uss='/Users/manis2/git/uss/uss_catalog/src/main/bin/uss'
alias ussstart='source /Users/manis2/git/uss/uss/src/main/scripts/uss;java -Dproc_ussnamenode -Duss.log.dir=$USS_CATALOG_LOG_DIR -Duss.log.file=$USS_CATALOG_LOG_FILE -Duss.root.logger=ERROR,console -classpath $USS_HOME/lib/*:$USS_HOME/*:$USS_CONF_DIR:$HADOOP_HOME/lib/*:$HADOOP_HOME/* com.greenplum.hd.uss.server.USSNameNode $USS_HOME/lib/*:$USS_HOME/*:$USS_CONF_DIR:$HADOOP_HOME/lib/*:$HADOOP_HOME/* com.greenplum.hd.uss.server.USSNameNode &'
alias ussstop='gkill usssocket;gkill RemoteFilesystem;gkill USSNameNode'
alias ussrestart='ussstop && ussstart'

#Perforce
alias p4=/Users/manis2/Downloads/p4
export P4CONFIG=/Users/manis2/.p4config

#Allinall
alias allinit='rm -rf /tmp/.s.*;source /Users/manis2/.allsys;/Users/manis2/work/allinall/init-cluster.sh'
alias allconfig='source /Users/manis2/.allinall'
alias allstart='allconfig;$PHD_ROOT/bin/start-gphd.sh && $GPHOME/bin/gpstart -a;'
alias allstop='allconfig;$GPHOME/bin/gpstop;$PHD_ROOT/bin/stop-gphd.sh;unset DYLD_LIBRARY_PATH'
alias allrestart='allconfig;$GPHOME/bin/gpstop;$PHD_ROOT/bin/stop-gphd.sh;$PHD_ROOT/bin/start-gphd.sh && $GPHOME/bin/gpstart -a'
alias allsql='allconfig;$GPHOME/bin/psql -p 10432 postgres'

#Docker
export DOCKER_HOST=tcp://127.0.0.1:4243


function gkill(){
   kill -9 `ps -ef | grep $1 | grep -v grep | awk '{print $2}'`
}
