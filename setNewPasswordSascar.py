#!/usr/bin/python3

"""
created by :
Nityananda Gohain 
School of Engineering, Tezpur University
27/10/17
"""


# run it as sudo


"""
Three files will be modified
1) /etc/apt/apt.conf
2) /etc/environment
3) /etc/bash.bashrc
"""

# This files takes the location as input and writes the proxy authentication

import getpass  # for taking password input
import shutil  # for copying file
import sys
import os
import os.path  # for checking if file is present or not
import subprocess # to execute bash commands #Rodrigo

apt_ = r'/etc/apt/apt.conf'
apt_backup = r'./.backup_proxy/apt.txt'
bash_ = r'/etc/bash.bashrc'
bash_backup = r'./.backup_proxy/bash.txt'
env_ = r'/etc/environment'
env_backup = r'./.backup_proxy/env.txt'
vscode_ = r'/home/rodfelix/.config/Code/User/settings.json' #Rodrigo
vscode_backup = r'/home/rodfelix/.config/Code/User/settings_bak.json' #Rodrigo


# This function directly writes to the apt.conf file
def writeToApt(proxy, port, username, password, flag):
    filepointer = open(apt_, "w")
    if not flag:
        filepointer.write(
            'Acquire::http::proxy "http://{0}:{1}@{2}:{3}/";\n'.format(username, password, proxy, port))
        filepointer.write(
            'Acquire::https::proxy  "https://{0}:{1}@{2}:{3}/";\n'.format(username, password, proxy, port))
        filepointer.write(
            'Acquire::ftp::proxy  "ftp://{0}:{1}@{2}:{3}/";\n'.format(username, password, proxy, port))
        filepointer.write(
            'Acquire::socks::proxy  "socks://{0}:{1}@{2}:{3}/";\n'.format(username, password, proxy, port))
    filepointer.close()


# This function writes to the environment file
# Fist deletes the lines containng http:// , https://, ftp://
def writeToEnv(proxy, port, username, password, flag):
    # find and delete line containing http://, https://, ftp://
    with open(env_, "r+") as opened_file:
        lines = opened_file.readlines()
        opened_file.seek(0)  # moves the file pointer to the beginning
        for line in lines:
            if r"http://" not in line and r"https://" not in line and r"ftp://" not in line and r"socks://" not in line:
                opened_file.write(line)
        opened_file.truncate()

    # writing starts
    if not flag:
        filepointer = open(env_, "a")
        filepointer.write(
            'http_proxy="http://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'https_proxy="https://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'ftp_proxy="ftp://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'socks_proxy="socks://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.close()


# This function will write to the
def writeToBashrc(proxy, port, username, password, flag):
    # find and delete http:// , https://, ftp://
    with open(bash_, "r+") as opened_file:
        lines = opened_file.readlines()
        opened_file.seek(0)
        for line in lines:
            if r"http://" not in line and r'"https://' not in line and r"ftp://" not in line and r"socks://" not in line:
                opened_file.write(line)
        opened_file.truncate()

    # writing starts
    if not flag:
        filepointer = open(bash_, "a")
        filepointer.write(
            'export http_proxy="http://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'export https_proxy="https://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'export ftp_proxy="ftp://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.write(
            'export socks_proxy="socks://{0}:{1}@{2}:{3}/"\n'.format(username, password, proxy, port))
        filepointer.close()

# Write in ubuntu system enviroment #Rodrigo
def writeToGSettins(proxy, port, username, password, flag):
    # writing starts
    if not flag:
        subprocess.check_output(["gsettings", "set", "org.gnome.system.proxy.http", "host", "'http://{0}:{1}@{2}'".format(username, password, proxy)])
        subprocess.check_output(["gsettings", "set", "org.gnome.system.proxy.http", "port", "{0}".format(port)])
        subprocess.check_output(["gsettings", "set", "org.gnome.system.proxy.https", "host", "'https://{0}:{1}@{2}'".format(username, password, proxy)])
        subprocess.check_output(["gsettings", "set", "org.gnome.system.proxy.https", "port", "{0}".format(port)])

# Write proxy config in vscode #Rodrigo
def writeToVSCode(proxy, port, username, password, flag):
    # find and delete line containing http://, https://, ftp://
    with open(vscode_, "r+") as opened_file:
        lines = opened_file.readlines()
        opened_file.seek(0)  # moves the file pointer to the beginning
        for line in lines:
            if r"http://" not in line and r"https://" not in line and r"ftp://" not in line and r"socks://" not in line and "}" != line and "}\n" != line:
                opened_file.write(line)
        opened_file.truncate()

    # writing starts
    if not flag:
        filepointer = open(vscode_, "a")
        filepointer.write(
            '\t"http.proxy": "http://{0}:{1}@{2}",\n'.format(username, password, proxy))
        filepointer.write(
            '\t"https.proxy": "https://{0}:{1}@{2}"\n'.format(username, password, proxy))
        filepointer.write("}")
        filepointer.close()

# Write into .dbeaver-data-sources.xml the new password #Rodrigo
def writeToDbeaver(proxy, port, username, password, flag):
    # writing starts
    if not flag:
        subprocess.check_output(["java", 
                                 "-jar", 
                                 "/home/rodfelix/scripts/dbeaver_encrypter.jar", 
                                 "-r", 
                                 "/home/rodfelix/.dbeaver4/General/.dbeaver-data-sources.xml", 
                                 "{0}".format(username), 
                                 "{0}".format(password)])


def set_proxy(flag):
    proxy, port, username, password = "", "", "", ""
    if not flag:
        proxy = "proxy-gvt" #input("Enter proxy : ") #Rodrigo
        port = "8080" #input("Enter port : ") #Rodrigo
        username = "rodrigo.felix.ext" #input("Enter username : ") #Rodrigo
        password = getpass.getpass("Enter password : ")
    writeToApt(proxy, port, username, password, flag)
    writeToEnv(proxy, port, username, password, flag)
    writeToBashrc(proxy, port, username, password, flag)
    writeToGSettins(proxy, port, username, password, flag) #Rodrigo
    writeToVSCode(proxy, port, username, password, flag) #Rodrigo
    writeToDbeaver(proxy, port, username, password, flag) #Rodrigo


def view_proxy():
    # finds the size of apt file
    size = os.path.getsize(apt_)
    if size:
        filepointer = open(apt_, "r")
        string = filepointer.readline()
        print('\nHTTP Proxy: ' + string[string.rfind('@')+1 : string.rfind(':')])
        print('Port: ' + string[string.rfind(':')+1 : string.rfind('/')])
        print('Username: ' + string.split('://')[1].split(':')[0])
        print(string[string.rfind(':',0,string.rfind('@'))+1 : string.rfind('@')]) #Rodrigo
        #print('Password: ' + '*' * len(string[string.rfind(':',0,string.rfind('@'))+1 : string.rfind('@')])) #Rodrigo
        filepointer.close()
    else:
        print("No proxy is set")

def restore_default():
    # copy from backup to main
    shutil.copy(apt_backup, apt_)
    shutil.copy(env_backup, env_)
    shutil.copy(bash_backup, bash_)


# The main Function Starts


if __name__ == "__main__":

    # create backup	if not present
    if not os.path.isdir("./.backup_proxy"):
        os.makedirs("./.backup_proxy")
        if os.path.isfile(apt_):
            shutil.copyfile(apt_, apt_backup)
        shutil.copyfile(env_, env_backup)
        shutil.copyfile(bash_, bash_backup)

    print("Setting password configuration\n") #Rodrigo
    set_proxy(flag=0) #Rodrigo
    view_proxy() #Rodrigo
    print("DONE!") #Rodrigo
    sys.exit() #Rodrigo

    # choice
    print("Please run this program as Super user(sudo)\n")
    print("1:) Set Proxy")
    print("2:) Remove Proxy")
    print("3:) View Current Proxy")
    print("4:) Restore Default")
    print("5:) Exit")
    choice = int(input("\nChoice (1/2/3/4/5) : "))

    if(choice == 1):
        set_proxy(flag=0)
    elif(choice == 2):
        set_proxy(flag=1)
    elif(choice == 3):
        view_proxy()
    elif(choice == 4):
        restore_default()
    else:
        sys.exit()

    print("DONE!")
