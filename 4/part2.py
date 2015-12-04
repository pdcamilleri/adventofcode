import hashlib
# Also no magic here. 
# Brute forcing still produces the solution very quickly.

def md5(str):
  hash = hashlib.md5()
  hash.update(str)
  return hash.hexdigest()

f = open('input', 'r')
key = f.readline().rstrip()
count = 0

while True:
  sum = md5(key + str(count))
  if sum[:6] == "000000":
    break
  count += 1

print count
  
