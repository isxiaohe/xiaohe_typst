#import "xiaohe.typ": *

#show: project.with(
  title: "Rethink Matrix",
  author: "xiaohe",
  language: "en"
)

#outline(indent: auto) 

= Matrix as Linear Map: Motivation behind Matrix-Vector Multiplication
The concept of matrix is closely related to linear maps between vector spaces -- actually, they are two sides of the same coin. In this chapter, we will explore this relationship in detail.

Let's first think about a linear map $cal(T)$ from a m-dimensional vector space $V$ to an n-dimensional vector space $W$. We can choose a basis ${v_1, v_2, ..., v_m}$ for $V$ and a basis ${w_1, w_2, ..., w_n}$ for $W$. For each basis vector $v_j$ in $V$, the image under the linear map $cal(T)$ can be expressed as a linear combination of the basis vectors in $W$:
  $ cal(T) v_j = sum_(i=0)^(n) A_(i, j) w_i $

Once all the $m^2$ coeffficients $A_(i, j)$ are given, we have the full information of the linear map $cal(T)$ since any vector $v in V$ can be expressed as a linear combination of the basis vectors thus its image $cal(T) v$ can be computed accordingly. Now we randomly pick a vector $v in V$:
  $ v = sum_(j=0)^(m) x_j v_j $
where $x_j$ are the #strong("coordinates") of the vector $v$ in the basis ${v_1, v_2, ..., v_m}$. Now we can compute the image of $v$ under the linear map $cal(T)$:
  $ cal(T) v = cal(T) (sum_(j=0)^(m) x_j v_j) = sum_(j=0)^(m) x_j cal(T) v_j = sum_(j=0)^(m) x_j (sum_(i=0)^(n) A_(i, j) w_i) = sum_(i=0)^(n) (sum_(j=0)^(m) A_(i, j) x_j) w_i $

Wait... What the heck is "coordinate"? Let's take a step back. Rethink how we define coordinate of 2- and 3-dimensional vectors in high-school level math. We pick three perpendicular axes $x$, $y$ and $z$ in the 3D space. Then any vector $v$ in this 3D space can be represented as a combination of these three axes:
  $ v = v_x hat(i) + v_y hat(j) + v_z hat(k) $
where $hat(i)$, $hat(j)$ and $hat(k)$ are unit vectors along the $x$, $y$ and $z$ axes respectively. The coefficients $v_x$, $v_y$ and $v_z$ are called the coordinates of the vector $v$ in this coordinate system. Similarly, in the general vector space $V$, we pick a set of basis vectors ${v_1, v_2, ..., v_m}$ to define a coordinate system. Any vector $v in V$ can be represented as a linear combination of these basis vectors, and the coefficients in this linear combination are called the coordinates of the vector $v$ in this basis. Therefore, the coordinates $x_j$ in the expression $v = sum_(j=0)^(m) x_j v_j$ are the coordinates of the vector $v$ in the basis ${v_1, v_2, ..., v_m}$.

Similarly, $(sum_(j=0)^(m) A_(i, j) x_j)$ are the coordinates of the image vector $cal(T) v$ in the basis ${w_1, w_2, ..., w_n}$ of the vector space $W$.

Now we can see the motivation behind the matrix-vector multiplication. Let's consider the $n times m$ matrix $M(cal(T))$ *corresponding* (we don't actually see why they are *corresponding* up to this point) to the linear map $cal(T)$:
  $ M(cal(T)) = mat(
    delim:"[",
    A_(1, 1), A_(1, 2), dots, A_(1, m);
    A_(2, 1), A_(2, 2), dots, A_(2, m);
    dots.v, dots.v, dots.down, dots.v;
    A_(n, 1), A_(n, 2), dots, A_(n, m);
  ) . $

When we multiply this matrix $M(cal(T))$ with the coordinates of $v$ in the basis ${v_1, v_2, ..., v_m}$, we get:
  $ M(cal(T))  mat(
    x_1;
    x_2;
    dots;
    x_m;
  ) = mat(
    sum_(j=0)^(m) A_(1, j) x_j;
    sum_(j=0)^(m) A_(2, j) x_j;
    dots;
    sum_(j=0)^(m) A_(n, j) x_j;
  ) . $

The left side is exactly the coordinates of the image vector $cal(T) v$ in the basis ${w_1, w_2, ..., w_n}$ of the vector space $W$. Therefore, we can conclude that multiplying the matrix $M(cal(T))$ with the coordinates of a vector $v$ in the basis ${v_1, v_2, ..., v_m}$ gives us the coordinates of the image vector $cal(T) v$ in the basis ${w_1, w_2, ..., w_n}$. So matrix-vector multiplication is actually a way to compute the image of a vector under a linear map when we know the matrix corresponding to that linear map and the coordinates of the vector in a chosen basis. 

This insight gives us a powerful tool to think about linear equation systems, transformations in geometry, and many other applications in various fields such as physics, computer science, and economics. Take homogeneous linear equation systems as an example. A homogeneous linear equation system can be represented as:
  $ A v = 0 $
where $A$ is a $m times n$ matrix and $v$ is a n-dimensional vector. Once we view the matrix $A$ as corresponding matrix to a linear map $cal(A)$ from $RR^n$ to $RR^m$, under standard basis, this equation can be reinterpreted as finding the kernel (or null space) of the linear map $cal(A)$. The system has non-zero solutions iff the kernel of $cal(A)$ is non-trivial. And we know that linear maps from a higher-dimensional space to a lower-dimensional space (i.e., $n > m$) must have a non-trivial kernel. Thus, we can conclude 
#theorem[
  A homogeneous linear equation system $A v = 0$ has non-zero solutions iff the number of equations is less than the number of unknowns (i.e., the number of rows of $A$ is less than the number of columns of $A$).
]

= Matrix as Linear Combination: Motivation behind Matrix-Matrix Multiplication