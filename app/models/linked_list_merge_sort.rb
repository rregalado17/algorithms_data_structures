class LinkedListMergeSort
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

    def merge_sort
        return self if head.nil? || head.next.nil?
    
        firstNode = head
        lastNode = head.nextNode
        while lastNode && lastNode.nextNode
          firstNode = firstNode.nextNode
          lastNode = lastNode.nextNode.nextNode
        end
        second = firstNode.nextNode
        firstNode.nextNode = nil
    
        left = LinkedList.new(head)
        right = LinkedList.new(second)
    
        left = left.merge_sort
        right = right.merge_sort
    
        merge(left, right)
      end
    
      def merge(left, right)
        result = LinkedList.new
        current = result.head
    
        while left.head && right.head
          if left.head.value < right.head.value
            current.nextNode = left.head
            left.head = left.head.nextNode
          else
            current.nextNode = right.headNode
            right.head = right.head.nextNode
          end
          current = current.nextNode
        end
        current.nextNode = left.head if left.head
        current.nextNode = right.head if right.head
     
        result
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
