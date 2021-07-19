import numpy as np
import matplotlib.pyplot as plt
from math import atan2, sin, cos
from mpl_toolkits.mplot3d import Axes3D
from utils.pybullet_tools.utils import get_pose, set_pose, multiply, tform_from_pose, pose_from_tform, matrix_from_quat, \
    get_link_pose, Pose, Point, sample_placement_on_aabb_collision, get_aabb, AABB, remove_body, get_body_name, \
    link_from_name, add_line
import math
from copy import copy
import pybullet as p
from PIL import Image

TOOL_FRAMES = {
    'iiwa14': 'iiwa_link_ee_kuka',  # iiwa_link_ee
    'kuka_lwr': 'link_ee',  # iiwa_link_ee
}

BASE_FRAMES = {
    'iiwa14': 'iiwa_link_0',  # iiwa_link_ee
}

JIANXIN_FRAMES = {
    'iiwa14': 'link_jianxin',  # iiwa_link_ee
}


def get_robot_jianXin_frame(robot):
    """return the shoulder frame (肩心) translated from the robot base frame"""
    base_link = link_from_name(robot, BASE_FRAMES[get_body_name(robot)])
    jianxin_link = link_from_name(robot, JIANXIN_FRAMES[get_body_name(robot)])

    shoulder_pose = get_link_pose(robot, jianxin_link)
    shoulder_tform = tform_from_pose(shoulder_pose)

    base_pose = get_link_pose(robot, base_link)
    jianxin_tform = tform_from_pose(base_pose)

    jianxin_tform[:3, 3] = shoulder_tform[:3, 3]

    return jianxin_tform


def place_objects(list_obj, region, all_bodies):
    neighbor_r = np.array([0.40, 0.40, 0.0])
    aabb0 = get_aabb(region)
    aabb = copy(aabb0)
    list_remove = []
    for obj in list_obj:
        pose = sample_placement_on_aabb_collision(obj, region, aabb, all_bodies)
        if pose is None:
            list_remove.append(obj)
            remove_body(obj)
            continue
        ne_upper = pose[0] + neighbor_r
        ne_lower = pose[0] - neighbor_r
        aabb = AABB(
            [max(ne_lower[0], aabb0.lower[0]), max(ne_lower[1], aabb0.lower[1]), max(ne_lower[2], aabb0.lower[2])],
            [min(ne_upper[0], aabb0.upper[0]), min(ne_upper[1], aabb0.upper[1]), min(ne_upper[2], aabb0.upper[2])])
    return list_remove


def draw_scatter2D(list_points):
    x = np.array([p[0] for p in list_points])
    y = np.array([p[1] for p in list_points])
    plt.scatter(x, y, marker='o')
    plt.axis('equal')
    plt.show()


def draw_scatter3D(list_list_points):
    ax = plt.axes(projection="3d")

    for list_points in list_list_points:
        x = np.array([p[0] for p in list_points])
        y = np.array([p[1] for p in list_points])
        z = np.array([p[2] for p in list_points])

        ax.scatter3D(x, y, z)

    plt.show()


def draw_scatter3D_2(list_points):
    ax = plt.axes(projection="3d")

    x = np.array([p[0] for p in list_points])
    y = np.array([p[1] for p in list_points])
    z = np.array([p[2] for p in list_points])

    ax.scatter3D(x, y, z)

    plt.show()


def draw_scatter3D_3(mat_point):
    ax = plt.axes(projection="3d")

    x = []
    y = []
    z = []

    for row in mat_point:
        for p in row:
            x.append(p[0])
            y.append(p[1])
            z.append(p[2])

    ax.scatter3D(x, y, z)
    plt.show()


def draw_arrows3D(list_from, list_to):
    ax = plt.axes(projection="3d")

    x = np.array([p[0] for p in list_from])
    y = np.array([p[1] for p in list_from])
    z = np.array([p[2] for p in list_from])

    ax.scatter3D(x, y, z)

    plt.show()


def sample_points_ellipse(a0, b0, n, v=0.3, N=500):
    assert 0 <= v <= 1

    if b0 > a0:
        a = b0
        b = a0
    else:
        a = a0
        b = b0

    assert a >= b
    c = np.sqrt(a ** 2 - b ** 2)
    c_pos = np.array([-c, 0])

    cur_pos = np.array([a, 0])

    inv_a = 1 / a

    a2 = a ** 2
    a4 = a ** 4
    b2 = b ** 2
    b4 = b ** 4

    dt = np.pi * np.sqrt(a ** 3) * (np.pi * a + 2 * c) / (2 * np.pi * a) / N

    list_points = []

    while cur_pos[0] >= 0:
        x0 = cur_pos[0]
        y0 = cur_pos[1]
        vec = np.array([-a2 * y0, b2 * x0]) / np.sqrt(a4 * y0 ** 2 + b4 * x0 ** 2)
        speed = np.sqrt(2 / np.linalg.norm(cur_pos - c_pos) - inv_a)
        speed = v * speed + (1 - v) * 0.3
        velocity = vec * speed
        d_pos = velocity * dt
        cur_pos = cur_pos + d_pos
        list_points.append(cur_pos)

    list_points = list_points[:-1]

    if b0 > a0:
        for i, p in enumerate(list_points):
            list_points[i] = np.flip(p)
        list_points.reverse()

    points = subsample_points(list_points, n)
    angles = [atan2(p[1], p[0]) for p in points]

    assert angles[-1] < 1.57
    return points, angles


def subsample_points(points, num_sample):
    """Sample uniformly from input points"""
    num_total = len(points)
    num_sample = int(num_sample)
    assert num_sample <= num_total

    results = []
    step = num_total / num_sample

    cur_idx = 0
    for i in range(num_sample):
        if i == 0:
            cur_idx += step / 2
        else:
            cur_idx += step
        results.append(points[int(np.round(cur_idx))])

    return results


def get_idxes_from_mat(x0, y0, iw):
    tt = iw / 2

    if x0 >= tt and y0 >= tt:
        x = x0 - tt
        y = y0 - tt
        sign_x = 1
        sign_y = 1
    elif x0 < tt and y0 >= tt:
        x = tt - x0 - 1
        y = y0 - tt
        sign_x = -1
        sign_y = 1
    elif x0 < tt and y0 < tt:
        x = tt - x0 - 1
        y = tt - y0 - 1
        sign_x = -1
        sign_y = -1
    else:
        x = x0 - tt
        y = tt - y0 - 1
        sign_x = 1
        sign_y = -1

    if y >= x:
        idx1 = y
        idx2 = 2 * y - x
    else:
        idx1 = x
        idx2 = y

    return int(idx1), int(idx2), sign_x, sign_y


def get_ee_pose(robot):
    ee_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])
    return get_link_pose(robot, ee_link)


def draw_ee_frame(robot, life_time=0.5, high_light=False):
    ee_link = link_from_name(robot, TOOL_FRAMES[get_body_name(robot)])
    ee_pose = get_ee_pose(robot)
    ee_tform = tform_from_pose(ee_pose)

    length = 0.2
    width = 3

    po = ee_tform[:3, 3]
    px = ee_tform[:3, 0] * length + po
    py = ee_tform[:3, 1] * length + po
    pz = ee_tform[:3, 2] * length + po

    cx = (1, 0, 0)
    cy = (0, 1, 0)
    cz = (0, 0, 1)

    if high_light:
        cx = (1, 0.7, 0.7)
        cy = (0.7, 1, 0.7)
        cz = (0.7, 0.7, 1)

    add_line(po, px, color=cx, width=width, lifetime=life_time, parent=robot, parent_link=ee_link)
    add_line(po, py, color=cy, width=width, lifetime=life_time, parent=robot, parent_link=ee_link)
    add_line(po, pz, color=cz, width=width, lifetime=life_time, parent=robot, parent_link=ee_link)


def draw_base_frame(robot):
    base_link = link_from_name(robot, BASE_FRAMES[get_body_name(robot)])

    base_pose = get_link_pose(robot, base_link)
    base_tform = tform_from_pose(base_pose)

    length = 0.6
    width = 3
    life_time = None
    po = base_tform[:3, 3]
    px = base_tform[:3, 0] * length + po
    py = base_tform[:3, 1] * length + po
    pz = base_tform[:3, 2] * length + po

    add_line(po, px, color=(1, 0, 0), width=width, lifetime=life_time, parent=robot)
    add_line(po, py, color=(0, 1, 0), width=width, lifetime=life_time, parent=robot)
    add_line(po, pz, color=(0, 0, 1), width=width, lifetime=life_time, parent=robot)


def draw_shouldercenter_frame(robot, life_time=0.5):
    base_tform = get_robot_jianXin_frame(robot)

    length = 0.4
    width = 3

    po = base_tform[:3, 3]
    px = base_tform[:3, 0] * length + po
    py = base_tform[:3, 1] * length + po
    pz = base_tform[:3, 2] * length + po

    add_line(po, px, color=(1, 0, 0), width=width, lifetime=life_time, parent=robot)
    add_line(po, py, color=(0, 1, 0), width=width, lifetime=life_time, parent=robot)
    add_line(po, pz, color=(0, 0, 1), width=width, lifetime=life_time, parent=robot)


def draw_frame(tform, life_time=0.5, high_light=False):
    length = 0.2
    width = 3

    po = tform[:3, 3]
    px = tform[:3, 0] * length + po
    py = tform[:3, 1] * length + po
    pz = tform[:3, 2] * length + po

    cx = (1, 0, 0)
    cy = (0, 1, 0)
    cz = (0, 0, 1)

    if high_light:
        cx = (1, 0.7, 0.7)
        cy = (0.7, 1, 0.7)
        cz = (0.7, 0.7, 1)

    add_line(po, px, color=cx, width=width, lifetime=life_time)
    add_line(po, py, color=cy, width=width, lifetime=life_time)
    add_line(po, pz, color=cz, width=width, lifetime=life_time)


def local_to_world(ht_mat, point):
    p = np.append(point, 1)
    return np.dot(ht_mat, p)[:3]


def get_ellipsoid_frame(target_body, body_info, robot, pose=None):
    obj_extent0, relative_frame_bottom, relative_frame_center = body_info

    if pose is None:
        obj_pose = get_pose(target_body)
    else:
        obj_pose = copy(pose)
    obj_frame = tform_from_pose(obj_pose)

    bottom_frame = np.dot(relative_frame_bottom, obj_frame)
    bottom_pos = bottom_frame[:3, 3]
    center_frame = np.dot(relative_frame_center, obj_frame)
    center_pos = center_frame[:3, 3]

    base_frame = get_robot_jianXin_frame(robot)
    robot_pose = get_pose(robot)

    obj_ori_mat = bottom_frame[:3, :3]
    base_ori_mat = base_frame[:3, :3]

    candidate_ori = np.array([obj_ori_mat.T[0], -obj_ori_mat.T[0],
                              obj_ori_mat.T[1], -obj_ori_mat.T[1]])
    tr_vector = base_frame[:3, 3] - center_pos  # pointing from the body center to the robot base
    candidate_cos = np.dot(candidate_ori, tr_vector)

    idx_rank1 = np.argsort(candidate_cos)

    x_axis = candidate_ori[idx_rank1[-1]]
    z_axis = np.array([0, 0, 1])
    y_axis = np.cross(z_axis, x_axis)

    ellipsoid_frame = copy(bottom_frame)
    ellipsoid_frame[:3, 0] = x_axis
    ellipsoid_frame[:3, 1] = y_axis
    ellipsoid_frame[:3, 2] = z_axis

    obj_extent = [x_axis, y_axis, z_axis] * obj_extent0
    obj_extent = [np.linalg.norm(v) for v in obj_extent]

    list_ext = [obj_extent[0], obj_extent[1], obj_extent[2], obj_extent[0], obj_extent[1]]
    list_face_dir = [x_axis, y_axis, z_axis, -x_axis, -y_axis]
    list_dist = []
    list_dir_jj = []  # angle between the grasping direction and the line connecting surface center with robot base
    list_z_jj = []  # angle between the Z axis of robot base and the line connecting robot base  with surface center
    for f_dir, ext in zip(list_face_dir, list_ext):
        v_tr = tr_vector - f_dir * ext * 0.5
        dist = np.linalg.norm(v_tr)
        v_tr_uni = v_tr / dist
        tr_jj = math.acos(np.dot(f_dir, v_tr_uni))
        list_dist.append(dist)
        list_dir_jj.append(tr_jj)
        rt_jj = math.acos(np.dot(base_ori_mat.T[2], -v_tr_uni))
        list_z_jj.append(rt_jj)

    return ellipsoid_frame, obj_extent, list_dist, list_dir_jj, list_z_jj


def get_raytest_scatter3(target_body, ellipsoid_frame, obj_extent, robot, visualize=False):
    # set_collision_group_mask(target_body, int('0100', 2), int('0100', 2))
    iw = 64
    ray_length = 1.0

    if visualize:
        iw = 32

    """1. generate sample points in the local ellipsoid frame"""

    e_x = obj_extent[0] / 2
    e_y = obj_extent[1] / 2
    e_z = obj_extent[2]

    inv_a2 = 1 / e_x ** 2
    inv_b2 = 1 / e_y ** 2
    inv_c2 = 1 / e_z ** 2

    points_xy, angles_phi = sample_points_ellipse(e_x, e_y, iw - 1, 0.2)

    list_xyz = []

    for p_xy, phi in zip(points_xy, angles_phi):
        r = np.linalg.norm(p_xy)
        points_rz, angles_rz = sample_points_ellipse(r, e_z, iw / 2, 0.2)
        list_theta = [np.deg2rad(90) - a for a in angles_rz]
        list_theta.reverse()
        list_xyz.append(
            [np.array([e_x * sin(theta) * cos(phi), e_y * sin(theta) * sin(phi), e_z * cos(theta)])
             for theta in list_theta])

    num_latitude = len(list_xyz[0])
    num_longitude = len(list_xyz)

    num_sample = 1
    list_point_sample = []
    for la in range(num_latitude):
        points_with_latitude = [list_xyz[lo][la] for lo in range(num_longitude)]
        list_point_sample.append(subsample_points(points_with_latitude, num_sample))
        num_sample += 2

    mat_point = np.zeros((iw, iw), dtype='d,d,d')

    list_from_local = []  # local frame
    list_to_local = []

    for x in range(iw):
        for y in range(iw):
            idx1, idx2, sign_x, sign_y = get_idxes_from_mat(x, y, iw)
            point = list_point_sample[idx1][idx2] * np.array([sign_x, sign_y, 1])
            mat_point[x, y] = tuple(point)
            list_from_local.append(point)
            ray_vector0 = np.array([point[0] * inv_a2, point[1] * inv_b2, point[2] * inv_c2])
            ray_vector = ray_vector0 / np.linalg.norm(ray_vector0) * ray_length
            list_to_local.append(point + ray_vector)

    """2. transform the sample points into the world frame"""
    list_from = []  # global
    list_to = []

    for f, t in zip(list_from_local, list_to_local):
        list_from.append(local_to_world(ellipsoid_frame, f))
        list_to.append(local_to_world(ellipsoid_frame, t))

    """3. Do rayTest"""

    # Temporarily move away the objects that are not involved in rayTest
    obj_pose = get_pose(target_body)
    robot_pose = get_pose(robot)
    temp_obj_pose = multiply(Pose(Point(0, 0, -5)), obj_pose)
    set_pose(target_body, temp_obj_pose)
    temp_obj_pose = multiply(Pose(Point(0, 0, -5)), robot_pose)
    set_pose(robot, temp_obj_pose)

    # rayTest
    list_rayr = p.rayTestBatch(list_from, list_to)

    # Set back those objects
    set_pose(target_body, obj_pose)
    set_pose(robot, robot_pose)

    mat_ray_bdy = np.zeros((iw, iw))
    mat_ray_dist = np.zeros((iw, iw))
    idx = 0
    for x in range(iw):
        for y in range(iw):
            object_id = list_rayr[idx][0]
            hit_fraction = list_rayr[idx][2]
            mat_ray_bdy[x, y] = object_id
            mat_ray_dist[x, y] = hit_fraction
            """Visualize the rays"""
            if visualize:
                p_from = list_from[idx]
                p_to = list_to[idx]
                p.addUserDebugLine(p_from, p_from + (p_to - p_from) * hit_fraction, [1, 0, 0])
            idx += 1

    mat_image = mat_ray_dist / ray_length  # positiveX: downward, positiveY: right

    return mat_image


if __name__ == "__main__":
    L = 0.8
    W = 0.2
    H = 0.2
