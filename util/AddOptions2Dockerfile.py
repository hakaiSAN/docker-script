#coding: UTF-8 
import sys
import re
import os


def optionList():
  dir_path='/home/VMs/ks/options'
  files = [path for path in os.listdir(dir_path) if path.endswith('.ks')]
  return files

def exactLine(lines, text):
  line = [i for i, line in enumerate(lines) if text in line]
  return line[0] if bool(line) else -1

args = sys.argv
argc = len(args)

if argc != 4 :
  print('Usage :: AddOptions2Ks.py <file> <Options> <search words>')
  sys.exit()

resfile=args[1]
dstfile=args[1]
option=args[2]+'.ks'
endWord=args[3]
if option not in optionList() :
  print('ERROR ::: The '+args[2]+' Option doesn\'t Exists')
  sys.exit()

with open(resfile) as f:
  lines = f.readlines()
  #delete '\n'
  dstlines = [line.strip() for line in lines]
  insertBeforeLine=exactLine(lines,endWord)
  if insertBeforeLine == -1 :
    print('ERROR:: Insert Line doesn\'t Exist, Please Check'+resfile)
    sys.exit()
  with open(('/home/VMs/ks/options/'+option)) as fo:
    oplines = fo.readlines()
    oplines = [opline.strip() for opline in oplines]
    for i in range(len(oplines)) :
      oplines[i] = 'RUN ' + oplines[i]
    insertBeforeLine = insertBeforeLine -1
    oplines.insert(0,'')
    oplines.insert(1,'###############################################################################################')
    oplines.insert(1,'#Automately Added by'+ os.path.basename(__file__))
    oplines.insert(1,'###############################################################################################')
    dstlines[insertBeforeLine+1:insertBeforeLine+1]=oplines
    dstlines="\n".join(dstlines)
    
with open(dstfile, 'w') as f :
  f.writelines(dstlines)
