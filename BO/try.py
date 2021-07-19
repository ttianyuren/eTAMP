import numpy as np

a = np.ones((66,))*5
b = np.ones((66,2))

b[:,0]=a
# print(b)

f=tuple(np.random.uniform(0, 1, 1))

i=0
g=tuple(np.array([i]).astype(float).flatten())

# print(g)

a=[]

a.append((1,2,3))
a.append(np.array([5,6,7]))
a=np.array(a)

print(a)

p=['aaa','aaa','aaa','aaa']

pp='_'.join(p)

print(pp)




