result = ['{']

for i in range(31, -1, -1):
    result.append(f'in[{i}][i], ')

result.append('}')
print(''.join(result))