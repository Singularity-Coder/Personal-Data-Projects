class Q7 {

    fun main() {
        val matrix: Array<IntArray> = randomMatrix(M = 3, N = 3, min = 0, max = 9)
//    printMatrix(matrix)
//    matrix.forEach { println(it.contentToString()) }
//    rotateImage90degreesInPlace(matrix)
//    println()
//    printMatrix(matrix)
//    matrix.forEach { println(it.contentToString()) }
        rotateMatrix90Deg(matrix)
    }

    fun rotateMatrix90Deg(matrix: Array<IntArray>): Boolean {
        // check if matrix has same width n height - square matrix
        if (matrix.isEmpty() || matrix.size != matrix[0].size) return false

        for (i in 0..matrix.lastIndex) {
            val last = matrix.lastIndex - i
            // i1 = 3 - 0
            // i2 = 3 - 1
            // i3 = 3 - 2
            // i4 = 3 - 3
            for (j in 0..matrix[i].lastIndex) {
                // a11 will be a13
                // a21 will be a12
                // a31 will be a11
                val offset = j - i
                // 0 - 0  |  0 - 1  |  0 - 2  |  0 - 3
                // 1 - 0  |  1 - 1  |  1 - 2  |  1 - 3
                // 2 - 0  |  2 - 1  |  2 - 2  |  2 - 3
                // 3 - 0  |  3 - 1  |  3 - 2  |  3 - 3
                val top = matrix[i][j]
                matrix[i][j] = matrix[last - offset][i]
                // Trace the path of traversal. Dont focus on individual values

                matrix.forEach { println(it.contentToString()) }
                println()
            }
        }

        return false
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
        val matrix = Array(M) { IntArray(N) }
//    for (i in 0 until M) {
//        for (j in 0 until N) {
//            matrix[i][j] = randomIntInRange(min, max)
////            matrix[i][j] = randomInt(max)
//        }
//    }

        return arrayOf(
            intArrayOf(9, 5, 3),
            intArrayOf(8, 8, 3),
            intArrayOf(5, 3, 6),
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

    // The idea is to shift the positions across arrays
// u should know if its left or right rotation
// How many rotations
// All rows become columns
// all nested arrays u have to set nested loops - outer loop controls the outer array and each outer iteration will execute the complete inner iteration
// to change an element in every array, u need all iterations of outer array. 1 rotation requires modification in all inner arrays
    fun rotateImage90degreesInPlace(matrix: Array<IntArray>): Boolean {
        if (matrix.size == 0 || matrix.size != matrix[0].size) return false // Not a square

        matrix.forEach { println(it.contentToString()) }
        println()

        // Why matrix.size / 2
        for (i in 0 until matrix.size / 2) { // if matrix size is 3 then it goes for 1 iteration
            val last = matrix.lastIndex - i // Descending pointer - Get the last item in each layer. Layer is just the list of arrays. Each layer is a list. Decresing counter
//        println("last: $last")

            // row becomes column from bottom. last row becomes first column
            for (j in i until last) {
                val offset = j - i // counter - if
//            println("offset: $offset")

                val top = matrix[i][j] // save top - first column last value will be the top if u rotate to the right
//            println("top: $top")

                // Shift elements as per the rotation. Its easier when u have visuals

                // left -> top - here left is bottom left, top is top left
//            println("matrix[last - offset][layer]: ${matrix[last - offset][i]}")
                matrix[i][j] = matrix[last - offset][i]

                // bottom -> left
//            println("matrix[last][last - offset]: ${matrix[last][last - offset]}")
                matrix[last - offset][i] = matrix[last][last - offset]

                // right -> bottom
//            println("matrix[i][last]: ${matrix[j][last]}")
                matrix[last][last - offset] = matrix[j][last]

                // top -> right
//            println("new top: $top")
                matrix[j][last] = top // right <- saved top

                matrix.forEach { println(it.contentToString()) }
                println()
            }
        }
        return true
    }

}
