class Q9 {

    fun main() {
        val pairs = arrayOf(
            arrayOf("apple", "pleap"),
            arrayOf("waterbottle", "erbottlewat"),
            arrayOf("camera", "macera")
        )
        for (pair in pairs) {
            val word1 = pair[0]
            val word2 = pair[1]
            val isRotation = isRotation(word1, word2)
            println("$word1, $word2: $isRotation")
        }
//    println("pleappleap".indexOf("apple"))
    }

    fun isSubstring(big: String, small: String?): Boolean {
        return if (big.indexOf(small!!) >= 0) {
            true
        } else {
            false
        }
    }

    fun isRotation(s1: String, s2: String): Boolean {
        /* check that s1 and s2 are equal length and not empty */
        if (s1.length == s2.length && s1.length > 0) {
            /* concatenate s1 and s1 within new buffer */
            val s1s1 = s1 + s1
            return isSubstring(s1s1, s2)
        }
        return false
    }

}