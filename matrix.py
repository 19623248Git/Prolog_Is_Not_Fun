def generate_matrix(n):
    # Initialize an empty matrix with zeros
    matrix = [[0 for _ in range(n)] for _ in range(n)]
    
    # Fill the matrix
    for i in range(n):
        for j in range(n):
            # Calculate the layer number for each cell
            print(i, j)
            layer = min(i, j, n - 1 - i, n - 1 - j) + 1
            matrix[i][j] = layer
    
    # Print the matrix
    for row in matrix:
        print(" ".join(map(str, row)))

# Test cases
generate_matrix(5)
print()  # Empty line between test cases
generate_matrix(6)
print()
generate_matrix(1)

# for i in range(6):
#     print(i)
