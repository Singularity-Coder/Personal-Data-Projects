class Q8 {

    fun main() {
        val nrows = 10
        val ncols = 15
        val matrix: Array<IntArray> = randomMatrix(nrows, ncols, -10, 10)
        printMatrix(matrix)
        setZeros(matrix)
        println()
        printMatrix(matrix)
    }
    fun setAllZeros() {
        val matrix = arrayOf(
            intArrayOf(7, 7, 3, -8, 10, -7, 10, -8, 10, 3, 6, -8, 7, -4, 0),
            intArrayOf(6, 5, 9, 2, -2, -3, 8, 6, -6, -4, -4, -10, -8, 8, -1),
            intArrayOf(6, -4, -1, 2, -10, 3, -10, -3, -6, -5, -6, 4, 10, -7, -2),
            intArrayOf(-7, -6, 4, -4, -7, -8, -10, -8, -6, -1, 1, 3, 4, -5, 5),
            intArrayOf(-8, 7, -9, -9, 3, -5, -1, 9, 0, 4, 7, 1, -6, -4, 10),
            intArrayOf(1, -7, -1, 10, -5, -2, 7, -5, -2, -6, -8, -2, -10, -2, -2),
            intArrayOf(-10, 3, -1, -5, 9, 10, 0, 5, -3, -7, -5, 1, 0, 10, 5),
            intArrayOf(3, 7, 1, -1, -1, -5, 1, 4, -5, 1, 1, -2, -7, -4, 8),
            intArrayOf(-4, -3, -5, 0, -6, -8, -5, 6, -7, 0, -2, -4, 1, 5, 1),
            intArrayOf(2, -2, 5, 4, -1, -1, 0, 4, -7, 8, -6, -4, -2, 6, 4),
        )
        matrix.forEach {
            println(it.contentToString())
        }

        // store the row column positions of the 0 values in a bool arr
        val rows = Array<Boolean>(matrix.size) { false }
        val columns = Array<Boolean>(matrix[0].size) { false }

        // If matrix element value 0 then mark approp row and col arrays to true
        for (i in rows.indices) {
            for (j in columns.indices) {
                if (matrix[i][j] == 0) {
                    rows[i] = true
                    columns[j] = true
                }
            }
        }

        // Based on the booleans mark all the original matrix row and col values to 0
        for (row in rows.indices) {
            for (i in matrix.first().indices) {
                if (rows[row]) {
                    matrix[row][i] = 0
                }
            }
        }

        for (i in matrix.indices) {
            for (col in columns.indices) {
                if (columns[col]) {
                    matrix[i][col] = 0
                }
            }
        }

        println()
        matrix.forEach {
            println(it.contentToString())
        }
    }

    fun randomMatrix(
        M: Int,
        N: Int,
        min: Int,
        max: Int
    ): Array<IntArray> {
        // array of size 3 with inital value of 0 value arrays
        /*
        [0, 0, 0]
        [0, 0, 0]
        [0, 0, 0]
        * */
//    val matrix = Array(M) { IntArray(N) }
//    for (i in 0 until M) {
//        for (j in 0 until N) {
//            matrix[i][j] = randomIntInRange(min, max)
////            matrix[i][j] = randomInt(max)
//        }
//    }

        return arrayOf(
            intArrayOf(7, 7, 3, -8, 10, -7, 10, -8, 10, 3, 6, -8, 7, -4, 0),
            intArrayOf(6, 5, 9, 2, -2, -3, 8, 6, -6, -4, -4, -10, -8, 8, -1),
            intArrayOf(6, -4, -1, 2, -10, 3, -10, -3, -6, -5, -6, 4, 10, -7, -2),
            intArrayOf(-7, -6, 4, -4, -7, -8, -10, -8, -6, -1, 1, 3, 4, -5, 5),
            intArrayOf(-8, 7, -9, -9, 3, -5, -1, 9, 0, 4, 7, 1, -6, -4, 10),
            intArrayOf(1, -7, -1, 10, -5, -2, 7, -5, -2, -6, -8, -2, -10, -2, -2),
            intArrayOf(-10, 3, -1, -5, 9, 10, 0, 5, -3, -7, -5, 1, 0, 10, 5),
            intArrayOf(3, 7, 1, -1, -1, -5, 1, 4, -5, 1, 1, -2, -7, -4, 8),
            intArrayOf(-4, -3, -5, 0, -6, -8, -5, 6, -7, 0, -2, -4, 1, 5, 1),
            intArrayOf(2, -2, 5, 4, -1, -1, 0, 4, -7, 8, -6, -4, -2, 6, 4),
        )
    }

    fun randomIntInRange(min: Int, max: Int): Int = randomInt(max + 1 - min) + min

    fun randomInt(n: Int): Int = (Math.random() * n).toInt()

    fun printMatrix(matrix: Array<IntArray>) {
        for (i in matrix.indices) {
            for (j in matrix[i].indices) {
                if (matrix[i][j] in -10..10) {
                    print(" ")
                }
                if (matrix[i][j] in -100..100) {
                    print(" ")
                }
                if (matrix[i][j] >= 0) {
                    print(" ")
                }
                // The above conditions are for space control when prinitng the matrix if the numbers are big. If 2 digit number add 1 space, if 3 digit number add 2 spaces. This is to make the matrix look nice
                // Else this print is enough
                print(" " + matrix[i][j])
            }
            println()
        }
    }

    fun nullifyRow(matrix: Array<IntArray>, row: Int) {
        for (j in matrix[0].indices) { // matrix[0] is considered as all are same size
            matrix[row][j] = 0
        }
    }

    fun nullifyColumn(matrix: Array<IntArray>, col: Int) {
        for (i in matrix.indices) {
            matrix[i][col] = 0
        }
    }

    // If there is a 0 in any row or column then make that entire row and column 0
    fun setZeros(matrix: Array<IntArray>) {
        val row = BooleanArray(matrix.size)
        val column = BooleanArray(matrix[0].size)

        // Store the row and column index with value 0
        for (i in matrix.indices) {
            for (j in matrix[0].indices) {
                if (matrix[i][j] == 0) {
                    row[i] = true
                    column[j] = true
                }
            }
        }

        println(row.contentToString())
        println(column.contentToString())

        // Nullify rows
        for (i in row.indices) {
            if (row[i]) {
                nullifyRow(matrix, i)
            }
        }

        // Nullify columns
        for (j in column.indices) {
            if (column[j]) {
                nullifyColumn(matrix, j)
            }
        }
    }

    fun matricesAreEqual(m1: Array<IntArray>, m2: Array<IntArray>): Boolean {
        if (m1.size != m2.size || m1[0].size != m2[0].size) {
            return false
        }
        for (k in m1.indices) {
            for (j in m1[0].indices) {
                if (m1[k][j] != m2[k][j]) {
                    return false
                }
            }
        }
        return true
    }

    fun cloneMatrix(matrix: Array<IntArray>): Array<IntArray> {
        val c = Array(matrix.size) { IntArray(matrix[0].size) }
        for (i in matrix.indices) {
            for (j in matrix[0].indices) {
                c[i][j] = matrix[i][j]
            }
        }
        return c
    }
}

class Q82 {
    fun main() {
        val nrows = 10
        val ncols = 15
        val matrix = arrayOf(
            intArrayOf(7, 7, 3, -8, 10, -7, 10, -8, 10, 3, 6, -8, 7, -4, 0),
            intArrayOf(6, 5, 9, 2, -2, -3, 8, 6, -6, -4, -4, -10, -8, 8, -1),
            intArrayOf(6, -4, -1, 2, -10, 3, -10, -3, -6, -5, -6, 4, 10, -7, -2),
            intArrayOf(-7, -6, 4, -4, -7, -8, -10, -8, -6, -1, 1, 3, 4, -5, 5),
            intArrayOf(-8, 7, -9, -9, 3, -5, -1, 9, 0, 4, 7, 1, -6, -4, 10),
            intArrayOf(1, -7, -1, 10, -5, -2, 7, -5, -2, -6, -8, -2, -10, -2, -2),
            intArrayOf(-10, 3, -1, -5, 9, 10, 0, 5, -3, -7, -5, 1, 0, 10, 5),
            intArrayOf(3, 7, 1, -1, -1, -5, 1, 4, -5, 1, 1, -2, -7, -4, 8),
            intArrayOf(-4, -3, -5, 0, -6, -8, -5, 6, -7, 0, -2, -4, 1, 5, 1),
            intArrayOf(2, -2, 5, 4, -1, -1, 0, 4, -7, 8, -6, -4, -2, 6, 4),
        )
        matrix.forEach {
            println(it.contentToString())
        }
        setZeros(matrix)
        println()
        matrix.forEach {
            println(it.contentToString())
        }
    }


    fun nullifyRow(matrix: Array<IntArray>, row: Int) {
        for (j in matrix[0].indices) {
            matrix[row][j] = 0
        }
    }

    fun nullifyColumn(matrix: Array<IntArray>, col: Int) {
        for (i in matrix.indices) {
            matrix[i][col] = 0
        }
    }

    fun setZeros(matrix: Array<IntArray>) {
        var rowHasZero = false
        var colHasZero = false

        // Check if first row has a zero
        for (j in matrix[0].indices) {
            if (matrix[0][j] == 0) {
                rowHasZero = true
                break
            }
        }

        // Check if first column has a zero
        for (i in matrix.indices) {
            if (matrix[i][0] == 0) {
                colHasZero = true
                break
            }
        }

        // Check for zeros in the rest of the array
        for (i in 1 until matrix.size) {
            for (j in 1 until matrix[0].size) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }

        // Nullify rows based on values in first column
        for (i in 1 until matrix.size) {
            if (matrix[i][0] == 0) {
                nullifyRow(matrix, i)
            }
        }

        // Nullify columns based on values in first row
        for (j in 1 until matrix[0].size) {
            if (matrix[0][j] == 0) {
                nullifyColumn(matrix, j)
            }
        }

        // Nullify first row
        if (rowHasZero) {
            nullifyRow(matrix, 0)
        }

        // Nullify first column
        if (colHasZero) {
            nullifyColumn(matrix, 0)
        }
    }

    fun matricesAreEqual(m1: Array<IntArray>, m2: Array<IntArray>): Boolean {
        if (m1.size != m2.size || m1[0].size != m2[0].size) {
            return false
        }
        for (k in m1.indices) {
            for (j in m1[0].indices) {
                if (m1[k][j] != m2[k][j]) {
                    return false
                }
            }
        }
        return true
    }

    fun cloneMatrix(matrix: Array<IntArray>): Array<IntArray> {
        val c = Array(matrix.size) { IntArray(matrix[0].size) }
        for (i in matrix.indices) {
            for (j in matrix[0].indices) {
                c[i][j] = matrix[i][j]
            }
        }
        return c
    }
}