""" Math helper functions
"""

from decimal import Decimal


def cube_root(n: float) -> Decimal:

    root: Decimal = Decimal(n ** (1.0 / 3.0))
    root_rounded: Decimal = Decimal(round(root) ** 3)

    if root_rounded == n:
        root = root_rounded

    return root


def list_cube_roots(number_of_roots_to_list: int):

    roots_counter: int = 0
    current_number = 0

    while roots_counter < number_of_roots_to_list:

        current_number += 1
        root = cube_root(current_number)

        if root == int(root):
            roots_counter += 1
            print(f"{roots_counter} is a perfect cube of {root} " +
                  f"({roots_counter}^3 = {roots_counter} x " +
                  f"{roots_counter} x {roots_counter})")


list_cube_roots(50)
