class LinkedList
    attr_accessor :head 

    def initialize
        self.head = nil
    end

    def add(value)
        if self.head.nil?
            self.head = Node.new(value, nil)
        else
            lastNode = self.head 
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
            end
            #we are at the end of the list
            lastNode.nextNode = Node.new(value, nil)
        end

    end

    def find(value)
        node = self.head
        while(!node.nil?)
            if(node.value == value)
                return true
            end
            node = node.nextNode
        end
        false
    end

    private
    class Node
        attr_accessor :value, :nextNode

        def initialize(value, nextNode)
            self.value = value
            self.nextNode = nextNode
        end
    end


end

ll = LinkedList.new
ll.add(10)
ll.add(20)
puts ll.head.value
puts ll.head.nextNode.value
puts ll.find(10)
puts ll.find(70)
puts ll.find(20)