import numpy as np

thick = 0.005
x_bottom = 0.12
y_bottom = 0.12
height = 0.18

origin_bottom_plate = [0, 0, 0]
box_bottom_plate = [x_bottom, y_bottom, thick]
print('bottom')
print(origin_bottom_plate)
print(box_bottom_plate)

origin_left_plate = [0, -0.5 * thick - 0.5 * y_bottom, 0.5 * height - 0.5 * y_bottom]
box_left_plate = [x_bottom, thick, height]
print('left')
print(origin_left_plate)
print(box_left_plate)

origin_right_plate = [0, 0.5 * thick + 0.5 * y_bottom, 0.5 * height - 0.5 * y_bottom]
box_right_plate = [x_bottom, thick, height]
print('right')
print(origin_right_plate)
print(box_right_plate)

origin_back_plate = [-0.5 * thick - 0.5 * x_bottom, 0, 0.5 * height - 0.5 * y_bottom]
box_back_plate = [thick, y_bottom + 2 * thick, height]
print('back')
print(origin_back_plate)
print(box_back_plate)

origin_front_plate = [0.5 * thick + 0.5 * x_bottom, 0, 0.5 * height - 0.5 * y_bottom]
box_front_plate = [thick, y_bottom + 2 * thick, height]
print('front')
print(origin_front_plate)
print(box_front_plate)
