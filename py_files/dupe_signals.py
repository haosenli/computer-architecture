import os

filename = 'pipelined_cpu.sv'
filepath = os.path.join(os.getcwd(), 'pipelined_cpu', filename)

with open(filepath, 'r') as f:
    lines = f.readlines()

logics = [line.strip() for line in lines[16:35]]

for ext in ['_if', '_id', '_ex', '_mem', '_wb']:
    new_logics = []
    for logic in logics:
        if '// ' in logic:
            new_logics.append(logic)
            continue
        temp = []
        for l in logic[:-1].split(','):
            temp.append(l + ext)
        new_logics.append(','.join(temp) + ';')
    print('\n'.join(new_logics))
    print()