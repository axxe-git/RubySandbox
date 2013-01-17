class BinaryTree
  class Node
    @value=-1;
    @parentNode=Node.new;
    @leftChild=Node.new;
    @rightChild=Node.new;
    
    def initialize(val,parent,lChild,rChild)
      @value=val;
      @parentNode=parent;
      @leftChild=lChild;
      @rightChild=rChild;
    end
    
    def DisplayNode()
      puts "Node <@value, @parentNode, @leftChild, @rightChild>";
    end
  end
  
  @tree=Array.new();
  @numberOfNodes=0;
  @currentPointer=Node.new();
  @root="";
  
  def AddNode(val)
    if (root == "")
      root=Node.new(val,"","","");
      @tree[@numberOfNodes]=root;
    end
  end
end