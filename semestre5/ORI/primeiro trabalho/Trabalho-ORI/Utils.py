def contains(list, filter):
  index = 0
  for x in list:
    if filter(x):
        return index

    index += 1
  return -1

  
def clearText(text):
  return text.replace(",", "").replace(".", "").replace("!", "").replace("?", "")