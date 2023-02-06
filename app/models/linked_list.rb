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

    def insert(value, position)
        new_node = Node.new(value, position)
        current = @head 
        current_position = 0

        while current_position < position - 1
            current = current.nextNode 
            current_position += 1
        end

        new_node.nextNode = current.nextNode
        current.nextNode = new_node

    end

    def prepend(value)
        if head.nil?
            self.head = Node.new(value, nil)
        else
            old_head = head 
            self.head = Node.new(value, old_head)
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

    def remove(value)
        current = @head
        if current.value == value 
            @head = current.nextNode 

        else
            while current.nextNode
                if current.nextNode.value == value 
                    current.nextNode = current.nextNode.nextNode
                    break
                end
                current = current.nextNode
            end
        end
        puts current.value
    end


    def print_list 
        current = @head 
        
        while current 
            puts current.value 
            current = current.nextNode
        end
    end

    def to_array
        current = @head 
        values = []
        while current 
            values << current.value
            current = current.nextNode
        end
        values
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
ll.add(30)
ll.insert(50, 2)
ll.remove(30)
values = ll.to_array
puts values

