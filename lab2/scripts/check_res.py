import csv
import numpy as np

def read_matrix_from_csv(filename, A_rows=None, inner_dim=None, B_cols=None):
    """Read matrix from CSV file in row major order.
    First A_rows belong to matrix A (shape: A_rows x inner_dim).
    Following inner_dim rows belong to matrix B (shape: inner_dim x B_cols).
    Supports both decimal integers and hexadecimal values (e.g. 0xa9).
    """
    def parse_value(v):
        v = v.strip()
        if v.startswith('0x') or v.startswith('0X'):
            return int(v, 16)
        return int(v, 0)

    with open(filename, 'r') as f:
        reader = csv.reader(f)
        data = [list(map(parse_value, row)) for row in reader]

    if A_rows is not None and inner_dim is not None and B_cols is not None:
        A = np.array(data[:A_rows])
        B = np.array(data[A_rows:A_rows + inner_dim])
        assert A.shape == (A_rows, inner_dim), f"A shape mismatch: got {A.shape}, expected ({A_rows}, {inner_dim})"
        assert B.shape == (inner_dim, B_cols), f"B shape mismatch: got {B.shape}, expected ({inner_dim}, {B_cols})"
        return A, B
    else:
        return np.array(data)


def main():
    A_ROWS = 64
    INNER_DIM = 8
    B_COLS = 1

    A, B = read_matrix_from_csv('AB.csv', A_rows=A_ROWS, inner_dim=INNER_DIM, B_cols=B_COLS)

    expected_result = np.matmul(A, B)
    expected_result = expected_result >> 8

    # Read hex result from RES.csv
    result = read_matrix_from_csv('RES.csv')
    result = result.reshape(A_ROWS, B_COLS)

    if np.array_equal(expected_result, result): 
        print("SUCCESS: expected_result of ps_matmul matches expected result")
    else:
        print("FAILURE: Results do not match!")
        print("\nCalculated result:")
        print(expected_result)
        print("\nExpected result from RES.csv:")
        print(result)


if __name__ == "__main__":
    main()