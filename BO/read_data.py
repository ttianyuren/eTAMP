import pickle as pk

with open('data.pk', 'rb') as f:
    data = pk.load(f)

g_b, g_a = data[0:2]

for point in g_a:
    x_1, x_2, x_3, x_4, y = point

    print(
        (f'x_1: {x_1} ' if x_1 else '') + (f' x_2: {x_2} ' if x_2 else '') + (f' x_3: {x_3} ' if x_3 else '') + (
            f' x_4: {x_4} ' if x_4 else '') + f' y: {y}')
