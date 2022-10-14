result = ['{']
for i in range(32):
    if i != 31:
        result.append('in[i][0], ')
    else:
        result.append('in[i][0]}')
print(''.join(result))
