fun main() {
    var first = LinkedListNode(0, null, null) //AssortedMethods.randomLinkedList(1000, 0, 2);
    val head: LinkedListNode = first
    var second: LinkedListNode = first
    for (i in 1..7) {
        second = LinkedListNode(i % 2, null, null)
        first.setNext(second)
        second.setPrevious(first)
        first = second
    }
    System.out.println(head.printForward())
    deleteDups(head)
    System.out.println(head.printForward())
}

fun deleteDups(n: LinkedListNode?) {
    var n: LinkedListNode? = n
    val set = HashSet<Int>()
    var previous: LinkedListNode? = null
    while (n != null) {
        if (set.contains(n.data)) {
            previous?.next = n.next
        } else {
            set.add(n.data)
            previous = n
        }
        n = n.next
    }
}

class LinkedListNode {
    var next: LinkedListNode? = null
    var prev: LinkedListNode? = null
    var last: LinkedListNode? = null
    var data = 0

    constructor(d: Int, n: LinkedListNode?, p: LinkedListNode?) {
        data = d
        setNext(n!!)
        setPrevious(p)
    }

    constructor(d: Int) {
        data = d
    }

    constructor()

    fun setNext(n: LinkedListNode) {
        next = n
        if (this === last) {
            last = n
        }
        if (n != null && n.prev !== this) {
            n.setPrevious(this)
        }
    }

    fun setPrevious(p: LinkedListNode?) {
        prev = p
        if (p != null && p.next !== this) {
            p.setNext(this)
        }
    }

    fun printForward(): String {
        return if (next != null) {
            data.toString() + "->" + next!!.printForward()
        } else {
            data.toString()
        }
    }

    fun clone(): LinkedListNode {
        var next2: LinkedListNode? = null
        if (next != null) {
            next2 = next!!.clone()
        }
        return LinkedListNode(data, next2, null)
    }
}
