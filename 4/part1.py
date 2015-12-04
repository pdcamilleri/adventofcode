import hashlib
# No magic here, just brute forcing.
# It works and it's quick.

def md5(str):
  hash = hashlib.md5()
  hash.update(str)
  return hash.hexdigest()

f = open('input', 'r')
key = f.readline().rstrip()

count = 0

while True:
  sum = md5(key + str(count))
  if sum[:5] == "00000":
    break
  count += 1

print count
