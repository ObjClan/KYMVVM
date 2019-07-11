#!/usr/bin/python  
#coding:utf8  
import os
import re
import sys
import commands

#类名前缀
prefix = 'KYTemplate'
#脚本所在目录
scriptPath = os.path.split(os.path.realpath(__file__))[0]
#下载到本地的模板文件所在目录
classPath = ''
#脚本所在目录的上级目录
scriptLastDirPath = os.path.abspath(os.path.join(os.getcwd(), ".."))
#替换某目录下所有文件中的字符串，包括文件名和内容
def dirlist(path, allfile,oldStr,newStr):  
    filelist =  os.listdir(path)  
    for filename in filelist:  
        filepath = os.path.join(path, filename)  
        if os.path.isdir(filepath):  
            dirlist(filepath, allfile,oldStr,newStr)
        else:  
            allfile.append(filepath)
            fopen = open(path + '/' +  filename,'r')
            w_str = ''
            for line in fopen:
                if re.search(oldStr,line):
                    line=re.sub(oldStr,newStr,line)
                    w_str+=line
                else:
                    w_str+=line
            wopen=open(path + '/' + filename,'w')
            wopen.write(w_str)
            fopen.close()
            wopen.close()
        if oldStr in filename:
            strinfo = re.compile(oldStr)
            newname = strinfo.sub(newStr,filename)
            print path + '/' +  newname
            os.rename(path + '/' + filename,path + '/' +  newname)
        
    return allfile
#path：xcode中放入模板文件的目录， newPrefix：新类名前缀， isTable：1为tableView，否则为collectionView
def start(path,newPrefix,isTable):
    oldPrefix = prefix + ('Table' if isTable == '1' else 'Collection')
    classDirName = oldPrefix + '/'
    classPath = scriptPath + '/' + classDirName + '/'
    copyDirCommand = 'cp -fR ' + classPath + ' ' + path
    print commands.getstatusoutput(copyDirCommand)
    dirlist(path, [],oldPrefix,newPrefix)
    print oldPrefix
start(sys.argv[1], sys.argv[2], sys.argv[3])

