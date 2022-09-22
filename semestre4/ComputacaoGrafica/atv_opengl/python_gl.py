import math

import OpenGL
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import consts
from math import *

# r, g, b, dec r, dec g, dec b
tri_color = [0.5, 0.0, 0.0, True, False, False]
tri_rot = [0.0, 0.0, 0.0]
tri_pos = [0.0, 0.0, 0.0]
mouse_pos = [0.0, 0.0]
window_size = [consts.ORTHO, consts.ORTHO]
frame_counter = 0


def convert_pixel_to_real(_x, _y, win_width, win_height):
    temp = [_x / win_width - 0.5, _y / win_height - 0.5]
    temp[0] *= consts.ORTHO2
    temp[1] = consts.ORTHO2 * -temp[1]
    return temp


def point(_x, _y, _z):
    glBegin(GL_POINTS)
    glVertex3f(_x, _y, _z)
    glEnd()


def mouse_pool(_x, _y):
    global mouse_pos
    mouse_pos[0] = _x
    mouse_pos[1] = _y


def draw_cursor():
    global mouse_pos
    global window_size
    glColor3f(1, 1, 0)
    mpos = convert_pixel_to_real(mouse_pos[0], mouse_pos[1], window_size[0], window_size[1])
    cur_size = 20

    glBegin(GL_LINES)
    glVertex2f(mpos[0] - cur_size, mpos[1])
    glVertex2f(mpos[0] + cur_size, mpos[1])

    glVertex2f(mpos[0], mpos[1] - cur_size)
    glVertex2f(mpos[0], mpos[1] + cur_size)
    glEnd()


def draw_demo(pos, rot):
    global tri_color
    r, g, b = tri_color[:3]
    glBegin(GL_LINES)
    glColor3f(1, 1, 1)
    glVertex3f(-consts.ORTHO, 0, 0)
    glVertex3f(consts.ORTHO, 0, 0)

    glVertex3f(0, -consts.ORTHO, 0)
    glVertex3f(0, consts.ORTHO, 0)
    glEnd()

    glPushMatrix()

    glTranslatef(0, 0, 0)
    glRotatef(rot[0], rot[1], rot[2], 1)
    glTranslatef(pos[0], pos[1], pos[2])
    glBegin(GL_TRIANGLES)
    glColor3f(r + 0.5, g, b)
    glVertex3f(-consts.HORTHO, -consts.HORTHO, 0)
    glColor3f(r, g + 0.5, b)
    glVertex3f(consts.HORTHO, -consts.HORTHO, 0)
    glColor3f(r, g, b + 0.5)
    glVertex3f(0, consts.HORTHO, 0)
    glEnd()

    glPopMatrix()


def init():
    global window_size
    glutInit()
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE)
    glutInitWindowSize(window_size[0], window_size[1])
    context = glutCreateWindow("CG GL")
    # glutMouseFunc(mouse_pool)
    glutPassiveMotionFunc(mouse_pool)
    glutDisplayFunc(display)
    glutIdleFunc(display)
    glutSetCursor(GLUT_CURSOR_NONE)
    glClearColor(0, 0, 0, 0)

    glViewport(0, 0, consts.ORTHO, consts.ORTHO)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(-consts.ORTHO, consts.ORTHO, -consts.ORTHO, consts.ORTHO, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    glutMainLoop()


def display():
    global tri_color
    global tri_rot
    global tri_pos
    global mouse_pos
    global frame_counter
    step = 0.0005
    cur_deg = math.radians((frame_counter / 50) % 360)

    tri_rot[0] += step * 16
    tri_pos[1] = cos(cur_deg) * consts.HORTHO
    tri_pos[0] = sin(cur_deg) * consts.HORTHO

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    # glPointSize(20.0)
    # glColor3f(1.0, 0.5, 0.0)
    # point(0.0, 0.0, 0.0)
    if tri_color[3] is True:
        tri_color[1] += step
        tri_color[0] -= step
        if tri_color[0] - step <= 0:
            tri_color[0] = 0.0
            tri_color[3] = False
            tri_color[4] = True
    elif tri_color[4] is True:
        tri_color[2] += step
        tri_color[1] -= step
        if tri_color[1] - step <= 0:
            tri_color[1] = 0.0
            tri_color[4] = False
            tri_color[5] = True
    elif tri_color[5] is True:
        tri_color[0] += step
        tri_color[2] -= step
        if tri_color[2] - step <= 0:
            tri_color[2] = 0.0
            tri_color[5] = False
            tri_color[3] = True
    # t = coord_pixelToReal(mouse_pos[0], mouse_pos[1], window_size[0], window_size[1])
    # [t[0], t[1], 0]
    draw_demo(tri_pos[:3], tri_rot[:3])
    draw_cursor()
    glutSwapBuffers()
    frame_counter += 1


if __name__ == "__main__":
    init()
