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
            while(!lastNode.next.nil?)
                lastNode = lastNode.next
            end
            #we are at the end of the list
            lastNode.next = Node.new(value, nil)
        end
    end

    def merge_sort
        return self if head.nil? || head.next.nil?
    
        slow = head
        fast = head.next
        while fast && fast.next
          slow = slow.next
          fast = fast.next.next
        end
        second = slow.next
        slow.next = nil
    
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
            current.next = left.head
            left.head = left.head.next
          else
            current.next = right.head
            right.head = right.head.next
          end
          current = current.next
        end
    
        current.next = left.head if left.head
        current.next = right.head if right.head
    
        result
      end

    private
    class Node
        attr_accessor :value, :nextNode

        def initialize(value, nextNode)
            self.value = value
            self.next = next
        end
    end
end
