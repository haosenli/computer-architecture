import os

# CHANGE THIS
filename = 'reg_mem_wb.sv'
filepath = os.path.join(os.getcwd(), 'pipelined_cpu', filename)

with open(filepath, 'r') as f:
    lines = f.readlines()

# CHANGE THIS
input_extension = 'mem'
output_extension = 'wb'

input_logics = []
output_logics = []

we_are_not_in = True
we_are_not_out = True

system_out_println = []

for line in lines:
    if 'input' in line and 'logic' in line:
        if we_are_not_in:
            system_out_println.append('// DFF inputs')
            we_are_not_in = False
        if '[' in line and ']' in line:
            start_index = line.index(']') + 1
            signal_width = line[line.index('['): start_index]
            sw = signal_width[1:-1].split(':')[0]
            sw = int(sw) + 1
        else:
            start_index = line.index('logic') + len('logic') + 1
            signal_width = ''
            sw = 1
        logics = line[start_index:].strip()[:-1].split(', ')
        for i in range(len(logics)):
            logics[i] = f'{logics[i]}_{input_extension}'
        temp = [(logic, sw) for logic in logics]
        input_logics += temp
        logics = ', '.join(logics)
        if signal_width == '':
            result = f'input  logic {logics},'
        else:
            result = f'input  logic {signal_width} {logics},'
        system_out_println.append(result)
    
    if 'output' in line and 'logic' in line:
        if we_are_not_out:
            system_out_println.append('// DFF outputs')
            we_are_not_out = False
        if '[' in line and ']' in line:
            start_index = line.index(']') + 1
            signal_width = line[line.index('['): start_index]
            sw = signal_width[1:-1].split(':')[0]
            sw = int(sw) + 1
        else:
            start_index = line.index('logic') + len('logic') + 1
            signal_width = ''
            sw = 1
        logics = line[start_index:].strip()[:-1].split(', ')
        for i in range(len(logics)):
            logics[i] = f'{logics[i]}_{output_extension}'
        temp = [(logic, sw) for logic in logics]
        output_logics += temp
        logics = ', '.join(logics)
        if signal_width == '':
            result = f'output logic {logics},'
        else:
            result = f'output logic {signal_width} {logics},'
        system_out_println.append(result)

input_logics.remove((f'clk_{input_extension}', 1))
input_logics.remove((f'reset_{input_extension}', 1))

print('\n'.join(system_out_println))

system_out_println_dff = []
for num, input_logic, output_logic in zip(range(len(input_logics)), input_logics, output_logics):
    i, j = input_logic
    k, l = output_logic
    result = f'n_dff #({j}) dff{num} (.in({i}), .out({k}), .*);'
    system_out_println_dff.append(result)

print('\n'.join(system_out_println_dff))