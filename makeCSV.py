
f = open('datos.txt', 'r')
r = open('datosCSV.csv', 'w')
csv_numbers = ""
csv_format = ""

cont = 1

for line in f:
    line = line.strip('\n')
    line = line.translate(None, ',')
    line = line.replace(" ", ",")
    csv_format = csv_format + line + ','

for _ in range(196):
    csv_numbers = csv_numbers + str(cont) + ','
    cont = cont + 1

r.write(csv_numbers+'\n')
r.write(csv_format)

#print csv_numbers
#print csv_format

f.close()
r.close()


