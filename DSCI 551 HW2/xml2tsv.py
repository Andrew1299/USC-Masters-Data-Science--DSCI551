from lxml import etree
import datetime
from helper import printf
import sys

xml2bconverted=sys.argv[1]
tsvname=sys.argv[2]
data1 = etree.parse(open(xml2bconverted))
#printf(data1)

# Constructing inode dictionary
list_of_inodes = data1.xpath('/fsimage/INodeSection/inode')
id_to_inode = {}
for inode in list_of_inodes:
  #print("inode.id: " + inode.id.contents[0])
  id = inode.find('id').text
  id_to_inode[id] = inode
#print(f"id_to_inode: {id_to_inode}")

# Construct directory tree dictionary
list_of_directories = data1.xpath('/fsimage/INodeDirectorySection/directory')
directory_tree = {}
for directory in list_of_directories:
  #print(f"directory: {directory}")
  parent = directory.find("parent").text
  directory_tree[parent] = []
  #print(f"parent: {parent}")
  #print(f"directory_tree: {directory_tree}")
  for child_node in directory.findall('child'):
    child = child_node.text
    directory_tree[parent].append(child)
#print(directory_tree)

#Find root
def find_root(id_to_inode):
#iterate thru id_to_inode to find empty name field
  for id in id_to_inode:
    name = id_to_inode[id].find("name").text
    print(f"inode name: {name}")
    if name is None:
      root = id
      return root
root = find_root(id_to_inode)
#print(f"root: {root}")

#Get Modification Time
def get_modification_time(inode):
  datestamp = int(inode.find("mtime").text)
  #print(f"datestame: {datestamp}")
  modification_time = datetime.datetime.fromtimestamp(datestamp/1000)
  return modification_time

#Get blocks and filesize
def get_blocks_count_and_filesize(inode):
  blocks = inode.find("blocks")
  #print(blocks)
  if blocks is None:
    return 0, 0
  allblocks = blocks.findall("block")
  filesize = 0
  for block in allblocks:
    numbytes = int(block.find("numBytes").text)
    filesize = filesize+numbytes
  return len(allblocks), filesize

#Get permissions
def get_permission(inode):
  permission = inode.find("permission").text
  return permission
  print(permission)





# create recursive function to map to tsv
column_labels = ("Path" + "\t" + "Modification Time" + "\t" + "BlocksCount" + "\t"+ "Filesize" + "\t" + "Permission" + "\n")
#print(column_labels)
print("outputting to tsv")
print("check your ls. you should have " + str(tsvname))

root = find_root(id_to_inode)

def make_tsv(id, prefix, file):
  # Print the column labels

  inode = id_to_inode[id]
  name = inode.find("name").text

  # Print the inode name

  file.write(prefix)
  #print(prefix, end="")

  if name is None:
    file.write("")
    print()
  else:
    file.write(name)
    #print(name)

    prefix += name + "/"


  # modification time

  modification_time = get_modification_time(inode)
  file.write("\t" + str(modification_time))
  #print("\t" + str(modification_time))
  # Blocks count and file size

  block_count, file_size = get_blocks_count_and_filesize(inode)
  file.write("\t" + str(block_count) + "\t" + str(file_size))

  # permissions

  permissions = get_permission(inode)
  file.write("\t" + str(permissions))
  #print(permissions)




  # and print a newline

  file.write("\n")

  # Recursion, descend into the tree

  if id not in directory_tree:
    return

  #print("Doing children")
  #print("\t" + str(modification_time) + "\t" + str(block_count) + "\t" + str(file_size) + "\t" + str(permissions))

  for child_id in directory_tree[id]:
    make_tsv(child_id, prefix, file)

filename = tsvname
with open(filename, "w") as file:
  file.write(column_labels)
  make_tsv(root, "/", file)
